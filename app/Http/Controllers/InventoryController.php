<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use App\Models\Item;
use App\Models\StockIn;
use App\Models\StockOut;
use App\Models\User;
use App\Models\Client;
use App\Models\ActivityLog;

class InventoryController extends Controller
{
    protected function log(Request $request, string $action, ?string $desc = null): void
    {
        try {
            ActivityLog::create([
                'user_id'     => Auth::id(),
                'action'      => $action,
                'description' => $desc,
                'ip_address'  => $request->ip(),
                'user_agent'  => $request->userAgent(),
                'url'         => $request->fullUrl(),
                'method'      => $request->method(),
            ]);
        } catch (\Throwable) {}
    }

    public function importDatabase(Request $request)
    {
        if (!Auth::user() || Auth::user()->role !== 'admin') {
            return redirect()->route('inventory', ['panel' => 'security']);
        }
        $request->validate(['sql_file' => 'required|file|mimes:sql,txt|max:51200']);
        $dir  = 'D:\\xampp8.2\\htdocs\\SupplyOfficeInventorySystem v2.0\\backup_database';
        if (!is_dir($dir)) mkdir($dir, 0755, true);
        $file = $request->file('sql_file');
        $name = 'import_' . now()->format('Ymd_His') . '.sql';
        $file->move($dir, $name);
        $path  = $dir . DIRECTORY_SEPARATOR . $name;
        $db    = config('database.connections.mysql.database');
        $host  = config('database.connections.mysql.host');
        $port  = config('database.connections.mysql.port');
        $uname = config('database.connections.mysql.username');
        $pass  = config('database.connections.mysql.password');
        $passArg = $pass ? '-p' . escapeshellarg($pass) : '';
        $cmd = "D:\\xampp8.2\\mysql\\bin\\mysql.exe --host={$host} --port={$port} --user={$uname} {$passArg} {$db} < \"{$path}\" 2>&1";
        exec($cmd, $out, $code);
        if ($code === 0) {
            $this->log($request, 'db_import', "Database restored from: {$name}");
            return redirect()->route('inventory', ['panel' => 'security'])->with('success', 'Database restored successfully from ' . $name);
        }
        return redirect()->route('inventory', ['panel' => 'security'])->with('error', 'Restore failed: ' . implode(' ', $out));
    }

    public function importItems(Request $request)
    {
        if (!Auth::user() || Auth::user()->role !== 'admin') {
            return redirect()->route('inventory', ['panel' => 'current_stocks']);
        }

        $request->validate(['csv_data' => 'required|string']);
        $csvData = $request->input('csv_data');
        $lines   = array_filter(array_map('trim', explode("\n", $csvData)));

        if (count($lines) < 2) {
            return redirect()->route('inventory', ['panel' => 'current_stocks'])->with('error', 'CSV has no data rows.');
        }

        $validUnits = ['PCS','REAM','BOX','SET','BOTTLE','PACK','LITER','MILLILITER','GALLON','METER','CENTIMETER','KILOGRAM','GRAM','ROLL','CAN','TUBE','BAG','SACK'];
        $catMap = [
            'office supplies'     => 'office_supplies',
            'office'              => 'office_supplies',
            'ict office supplies' => 'ict_office_supplies',
            'ict'                 => 'ict_office_supplies',
            'cleaning supplies'   => 'cleaning_supplies',
            'cleaning'            => 'cleaning_supplies',
            'agronomic supplies'  => 'agronomic_supplies',
            'agronomic'           => 'agronomic_supplies',
        ];

        // Parse headers
        $headers = array_map(fn($h) => strtolower(trim($h, " \t\r\n\"")), str_getcsv(array_shift($lines)));
        $col = fn($name) => array_search($name, $headers);

        $iName   = $col('item name');
        $iBrand  = $col('brand');
        $iModel  = $col('model');
        $iSerial = $col('serial no.');
        $iCat    = $col('category');
        $iUnit   = $col('unit');
        $iDesc   = $col('description');
        $iPrice  = $col('price');
        $iQty    = $col('qty');

        if ($iName === false) {
            return redirect()->route('inventory', ['panel' => 'current_stocks'])->with('error', 'Invalid CSV: missing "Item Name" column.');
        }

        $imported = 0;
        foreach ($lines as $line) {
            $cells = str_getcsv($line);
            $name  = trim($cells[$iName] ?? '');
            if (!$name) continue;

            $rawCat = strtolower(trim($cells[$iCat] ?? ''));
            $cat    = $catMap[$rawCat] ?? 'office_supplies';
            $rawUnit = strtoupper(trim($cells[$iUnit] ?? 'PCS'));
            $unit   = in_array($rawUnit, $validUnits) ? $rawUnit : 'PCS';
            $price  = (float) preg_replace('/[^0-9.]/', '', $cells[$iPrice] ?? '0');
            $qty    = max(0, (int) preg_replace('/[^0-9]/', '', $cells[$iQty] ?? '0'));

            $item = Item::where('item_name', $name)->first();
            if ($item) {
                $item->update([
                    'brand'         => $cells[$iBrand]  ?? $item->brand,
                    'model'         => $cells[$iModel]  ?? $item->model,
                    'serial_number' => $cells[$iSerial] ?? $item->serial_number,
                    'category'      => $cat,
                    'unit'          => $unit,
                    'description'   => $cells[$iDesc]   ?? $item->description,
                    'price'         => $price ?: $item->price,
                    'quantity'      => $qty,
                ]);
            } else {
                Item::create([
                    'item_name'     => $name,
                    'brand'         => $cells[$iBrand]  ?? null,
                    'model'         => $cells[$iModel]  ?? null,
                    'serial_number' => $cells[$iSerial] ?? null,
                    'category'      => $cat,
                    'unit'          => $unit,
                    'description'   => $cells[$iDesc]   ?? null,
                    'price'         => $price,
                    'quantity'      => $qty,
                ]);
            }
            $imported++;
        }

        $this->log($request, 'import_items', "Imported {$imported} item(s) from CSV.");
        return redirect()->route('inventory', ['panel' => 'current_stocks'])->with('success', "Imported {$imported} item(s) successfully.");
    }

    public function uploadProfilePicture(Request $request)    {
        $request->validate(['profile_picture' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048']);
        $user = Auth::user();
        if ($request->hasFile('profile_picture') && $request->file('profile_picture')->isValid()) {
            // Delete old picture
            if ($user->profile_picture && file_exists(public_path($user->profile_picture))) {
                unlink(public_path($user->profile_picture));
            }
            $file = $request->file('profile_picture');
            $filename = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('profiles'), $filename);
            $user->profile_picture = 'profiles/' . $filename;
            $user->save();
        }
        return redirect()->route('inventory', ['panel' => $request->input('panel', 'dashboard')]);
    }

    public function index(Request $request)
    {
        $user = Auth::user();

        if ($user && $user->role === 'blocked') {
            Auth::logout();
            return redirect()->route('login')->withErrors(['email' => 'Your account has been blocked.']);
        }

        // Migrate legacy 'developer' role from old system → treat as 'admin'
        if ($user && $user->role === 'developer') {
            $user->role = 'admin';
            $user->save();
        }

        $action = $request->query('action');

        // ── ADD ITEM ──────────────────────────────────────────────────────────
        if ($action === 'add_item') {
            foreach ($request->query('items', []) as $row) {
                if (empty($row['item_name'])) continue;
                $cat = match($row['category'] ?? '') {
                    'office'    => 'office_supplies',
                    'ict'       => 'ict_office_supplies',
                    'cleaning'  => 'cleaning_supplies',
                    'agronomic' => 'agronomic_supplies',
                    default     => 'office_supplies',
                };
                $validUnits = ['PCS','REAM','BOX','SET','BOTTLE','PACK','LITER','MILLILITER','GALLON','METER','CENTIMETER','KILOGRAM','GRAM','ROLL','CAN','TUBE','BAG','SACK'];
                $unit = in_array(strtoupper($row['unit'] ?? ''), $validUnits) ? strtoupper($row['unit']) : 'PCS';
                Item::create([
                    'item_name'     => $row['item_name'],
                    'brand'         => $row['brand'] ?? null,
                    'model'         => $row['model'] ?? null,
                    'serial_number' => $row['serial_number'] ?? null,
                    'category'      => $cat,
                    'unit'          => $unit,
                    'description'   => $row['description'] ?? null,
                    'price'         => 0,
                    'quantity'      => 0,
                ]);
            }
            $this->log($request, 'add_item', 'Added items to catalog.');
            return redirect()->route('inventory', ['panel' => 'current_stocks']);
        }

        // ── STOCK IN ──────────────────────────────────────────────────────────
        if ($action === 'stock_in') {
            $person    = $request->query('person_name');
            $workplace = $request->query('workplace');
            foreach ($request->query('items', []) as $row) {
                $item = Item::find((int)($row['id'] ?? 0));
                $qty  = (int)($row['qty'] ?? 0);
                if (!$item || $qty <= 0) continue;
                $price = (float)($row['price'] ?? 0);
                StockIn::create(['item_id' => $item->id, 'person_name' => $person, 'workplace' => $workplace, 'quantity' => $qty, 'price' => $price]);
                if ($price > 0) { $item->price = $price; $item->save(); }
            }
            $this->log($request, 'stock_in', "Stock In by {$person} at {$workplace}.");
            return redirect()->route('inventory', ['panel' => 'current_stocks']);
        }

        // ── STOCK OUT ─────────────────────────────────────────────────────────
        if ($action === 'stock_out') {
            $person    = $request->query('person_name');
            $workplace = $request->query('workplace');
            $remarks   = $request->query('remarks');
            foreach ($request->query('items', []) as $row) {
                $item = Item::find((int)($row['id'] ?? 0));
                $qty  = (int)($row['qty'] ?? 0);
                if (!$item || $qty <= 0) continue;
                try {
                    StockOut::create(['item_id' => $item->id, 'person_name' => $person, 'workplace' => $workplace, 'quantity' => $qty, 'remarks' => $remarks]);
                } catch (\Exception) {}
            }
            $this->log($request, 'stock_out', "Stock Out by {$person} at {$workplace}.");
            return redirect()->route('inventory', ['panel' => 'current_stocks']);
        }

        // ── DELETE STOCK OUT HISTORY ──────────────────────────────────────────
        if ($action === 'delete_stock_out_history' && $user && $user->role === 'admin') {
            $person = trim((string)$request->query('person_name'));
            $date   = trim((string)$request->query('date'));
            $q = DB::table('stock_outs');
            if ($person) $q->where('person_name', $person);
            if ($date)   $q->whereDate('created_at', $date);
            $q->delete();
            $this->log($request, 'delete_stock_out_history', "Deleted stock-out history for {$person}.");
            return redirect()->route('inventory', ['panel' => 'stock_out']);
        }

        // ── DELETE STOCK IN HISTORY ───────────────────────────────────────────
        if ($action === 'delete_stock_in_history' && $user && $user->role === 'admin') {
            $person = trim((string)$request->query('person_name'));
            $date   = trim((string)$request->query('date'));
            $q = DB::table('stock_ins');
            if ($person) $q->where('person_name', $person);
            if ($date)   $q->whereDate('created_at', $date);
            $q->delete();
            $this->log($request, 'delete_stock_in_history', "Deleted stock-in history for {$person}.");
            return redirect()->route('inventory', ['panel' => 'stock_in']);
        }

        // ── DELETE ITEM ───────────────────────────────────────────────────────
        if ($action === 'delete_item') {
            $item = Item::find((int)$request->query('id'));
            if ($item) { $name = $item->item_name; $item->delete(); $this->log($request, 'delete_item', "Deleted item: {$name}."); }
            return redirect()->route('inventory', ['panel' => 'current_stocks']);
        }

        // ── UPDATE ITEM ───────────────────────────────────────────────────────
        if ($action === 'update_item') {
            $item = Item::find((int)$request->query('id'));
            if ($item) {
                $validUnits = ['PCS','REAM','BOX','SET','BOTTLE','PACK','LITER','MILLILITER','GALLON','METER','CENTIMETER','KILOGRAM','GRAM','ROLL','CAN','TUBE','BAG','SACK'];
                $unit = strtoupper((string)$request->query('unit'));
                $cat  = match($request->query('category')) {
                    'office'    => 'office_supplies',
                    'ict'       => 'ict_office_supplies',
                    'cleaning'  => 'cleaning_supplies',
                    'agronomic' => 'agronomic_supplies',
                    default     => $item->category,
                };
                $item->fill([
                    'item_name'     => $request->query('item_name') ?: $item->item_name,
                    'brand'         => $request->query('brand'),
                    'model'         => $request->query('model'),
                    'serial_number' => $request->query('serial_number'),
                    'description'   => $request->query('description'),
                    'category'      => $cat,
                    'unit'          => in_array($unit, $validUnits) ? $unit : $item->unit,
                ]);
                if ($request->query('price') !== null) $item->price = (float)$request->query('price');
                if ($request->query('quantity') !== null) $item->quantity = max(0, (int)$request->query('quantity'));
                $item->save();
                $this->log($request, 'update_item', "Updated item: {$item->item_name}.");
            }
            return redirect()->route('inventory', ['panel' => 'current_stocks']);
        }

        // ── USER MANAGEMENT ───────────────────────────────────────────────────
        if ($action === 'add_user' && $user && $user->role === 'admin') {
            $name  = trim((string)$request->query('name'));
            $email = trim((string)$request->query('email'));
            $pass  = (string)$request->query('password');
            $role  = in_array($request->query('role'), ['admin','staff']) ? $request->query('role') : 'staff';
            if ($name && filter_var($email, FILTER_VALIDATE_EMAIL) && strlen($pass) >= 6) {
                try { User::create(['name' => $name, 'email' => $email, 'password' => bcrypt($pass), 'role' => $role]); } catch (\Exception) {}
            }
            return redirect()->route('inventory', ['panel' => 'accounts']);
        }

        if ($action === 'update_user' && $user && $user->role === 'admin') {
            $target = User::find((int)$request->query('id'));
            if ($target) {
                if ($target->role === 'admin' && $target->id !== Auth::id()) {
                    return redirect()->route('inventory', ['panel' => 'accounts'])->with('error', 'Admins cannot edit other admin accounts.');
                }
                if ($request->query('name'))  $target->name  = $request->query('name');
                if ($request->query('email')) $target->email = $request->query('email');
                if ($request->query('password')) $target->password = bcrypt($request->query('password'));
                $target->role = in_array($request->query('role'), ['admin','staff']) ? $request->query('role') : $target->role;
                $target->save();
                $this->log($request, 'update_user', "Updated user: {$target->email}.");
            }
            return redirect()->route('inventory', ['panel' => 'accounts']);
        }

        if ($action === 'delete_user' && $user && $user->role === 'admin') {
            $id = (int)$request->query('id');
            if ($id === Auth::id()) return redirect()->route('inventory', ['panel' => 'accounts'])->with('error', 'Cannot delete your own account.');
            $target = User::find($id);
            if ($target) {
                if ($target->role === 'admin') return redirect()->route('inventory', ['panel' => 'accounts'])->with('error', 'Admins cannot delete other admin accounts.');
                $target->delete();
                $this->log($request, 'delete_user', "Deleted user: {$target->email}.");
            }
            return redirect()->route('inventory', ['panel' => 'accounts'])->with('success', 'User deleted.');
        }

        // ── CLIENT MANAGEMENT ─────────────────────────────────────────────────
        if ($action === 'add_client') {
            Client::create(['name' => $request->query('name'), 'workplace' => $request->query('workplace')]);
            $this->log($request, 'add_client', "Added client: {$request->query('name')}.");
            return redirect()->route('inventory', ['panel' => 'add_clients']);
        }

        if ($action === 'update_client') {
            $client = Client::find($request->query('id'));
            if ($client) { $client->update(['name' => $request->query('name'), 'workplace' => $request->query('workplace')]); }
            return redirect()->route('inventory', ['panel' => 'add_clients']);
        }

        if ($action === 'delete_client') {
            $client = Client::find($request->query('id'));
            if ($client) { $client->delete(); $this->log($request, 'delete_client', "Deleted client: {$client->name}."); }
            return redirect()->route('inventory', ['panel' => 'add_clients']);
        }

        // ── SAVE CONFIRMATION CODE ────────────────────────────────────────────
        if ($action === 'save_confirmation_code' && $user && $user->role === 'admin') {
            $role = $request->query('role', 'admin');
            $code = trim((string)$request->query('code'));
            if ($role === 'admin' && $code) {
                DB::table('confirmation_codes')->updateOrInsert(
                    ['role' => 'admin'],
                    ['code' => $code, 'is_active' => true, 'updated_at' => now()]
                );
                $this->log($request, 'save_confirmation_code', "Updated admin confirmation code.");
            }
            return redirect()->route('inventory', ['panel' => 'security'])->with('success', 'Admin code updated.');
        }

        // ── BLOCK / UNBLOCK ───────────────────────────────────────────────────
        if ($action === 'block_user' && $user && $user->role === 'admin') {
            $target = User::find((int)$request->query('id'));
            if ($target && $target->id !== Auth::id()) {
                $target->update(['role' => 'blocked']);
                DB::table('sessions')->where('user_id', $target->id)->delete();
                $this->log($request, 'block_user', "Blocked user: {$target->email}.");
            }
            return redirect()->route('inventory', ['panel' => 'security']);
        }

        if ($action === 'unblock_user' && $user && $user->role === 'admin') {
            $target = User::find((int)$request->query('id'));
            if ($target && $target->role === 'blocked') {
                $target->update(['role' => 'staff']);
                $this->log($request, 'unblock_user', "Unblocked user: {$target->email}.");
            }
            return redirect()->route('inventory', ['panel' => 'security']);
        }

        // ── DATABASE BACKUP ───────────────────────────────────────────────────
        if ($action === 'db_backup' && $user && $user->role === 'admin') {
            $dir = 'D:\\xampp8.2\\htdocs\\SupplyOfficeInventorySystem v2.0\\backup_database';
            if (!is_dir($dir)) mkdir($dir, 0755, true);
            $db   = config('database.connections.mysql.database');
            $host = config('database.connections.mysql.host');
            $port = config('database.connections.mysql.port');
            $uname = config('database.connections.mysql.username');
            $pass = config('database.connections.mysql.password');
            $file = $dir . DIRECTORY_SEPARATOR . $db . '_' . now()->format('Ymd_His') . '.sql';
            $passArg = $pass ? '-p' . escapeshellarg($pass) : '';
            $cmd = "D:\\xampp8.2\\mysql\\bin\\mysqldump.exe --host={$host} --port={$port} --user={$uname} {$passArg} {$db} > \"{$file}\" 2>&1";
            exec($cmd, $out, $code);
            if ($code === 0 && file_exists($file) && filesize($file) > 0) {
                $this->log($request, 'db_backup', "Database backup created: " . basename($file));
                return redirect()->route('inventory', ['panel' => 'security'])->with('success', 'Backup created: ' . basename($file));
            }
            return redirect()->route('inventory', ['panel' => 'security'])->with('error', 'Backup failed. Check mysqldump path and permissions.');
        }

        // ── DATABASE EXPORT (download) ────────────────────────────────────────
        if ($action === 'db_export' && $user && $user->role === 'admin') {
            $dir  = 'D:\\xampp8.2\\htdocs\\SupplyOfficeInventorySystem v2.0\\backup_database';
            $name = basename((string)$request->query('file'));
            $path = $dir . DIRECTORY_SEPARATOR . $name;
            if (!$name || !file_exists($path) || pathinfo($path, PATHINFO_EXTENSION) !== 'sql') {
                return redirect()->route('inventory', ['panel' => 'security'])->with('error', 'File not found.');
            }
            $this->log($request, 'db_export', "Downloaded backup: {$name}");
            return response()->download($path, $name, ['Content-Type' => 'application/sql']);
        }

        // ── DATABASE DELETE BACKUP ────────────────────────────────────────────
        if ($action === 'db_delete_backup' && $user && $user->role === 'admin') {
            $dir  = 'D:\\xampp8.2\\htdocs\\SupplyOfficeInventorySystem v2.0\\backup_database';
            $name = basename((string)$request->query('file'));
            $path = $dir . DIRECTORY_SEPARATOR . $name;
            if ($name && file_exists($path) && pathinfo($path, PATHINFO_EXTENSION) === 'sql') {
                unlink($path);
                $this->log($request, 'db_delete_backup', "Deleted backup: {$name}");
                return redirect()->route('inventory', ['panel' => 'security'])->with('success', 'Backup deleted.');
            }
            return redirect()->route('inventory', ['panel' => 'security'])->with('error', 'File not found.');
        }

        // ── SEND WARNING ──────────────────────────────────────────────────────
        if ($action === 'send_warning') {
            $sid = $request->query('sid');
            $msg = trim((string)$request->query('message'));
            if ($sid && $msg) Cache::put('warning_' . $sid, $msg, now()->addMinutes(5));
            return redirect()->route('inventory', ['panel' => 'security']);
        }

        if ($action === 'get_warning') {
            $sid = $request->query('sid');
            return response()->json(['message' => $sid ? Cache::pull('warning_' . $sid) : null]);
        }

        // ── UPLOAD PROFILE PICTURE — handled by uploadProfilePicture() ───────

        // ── EXPORT CSV ────────────────────────────────────────────────────────
        if ($action === 'export_csv') {
            $scope    = $request->query('scope', 'category');
            $itemsAll = Item::orderBy('id')->get();
            $insAll   = StockIn::with('item')->orderBy('created_at')->get();
            $outsAll  = StockOut::with('item')->orderBy('created_at')->get();
            $rows = [];
            if ($scope === 'monthly') {
                $start = now()->startOfMonth(); $end = now()->endOfMonth();
                $detail = [];
                foreach ($insAll->filter(fn($s) => $s->created_at >= $start && $s->created_at <= $end) as $s) {
                    $k = $s->created_at->toDateString() . '|' . optional($s->item)->item_name;
                    $detail[$k] = $detail[$k] ?? ['date' => $s->created_at->toDateString(), 'item' => optional($s->item)->item_name, 'category' => optional($s->item)->category, 'in' => 0, 'out' => 0, 'remaining' => optional($s->item)->quantity];
                    $detail[$k]['in'] += $s->quantity;
                }
                foreach ($outsAll->filter(fn($s) => $s->created_at >= $start && $s->created_at <= $end) as $s) {
                    $k = $s->created_at->toDateString() . '|' . optional($s->item)->item_name;
                    $detail[$k] = $detail[$k] ?? ['date' => $s->created_at->toDateString(), 'item' => optional($s->item)->item_name, 'category' => optional($s->item)->category, 'in' => 0, 'out' => 0, 'remaining' => optional($s->item)->quantity];
                    $detail[$k]['out'] += $s->quantity;
                }
                $rows[] = ['Date','Item','Category','Stock In','Stock Out','Remaining'];
                foreach (collect($detail)->sortBy('date') as $r) $rows[] = [$r['date'],$r['item'],$r['category'],$r['in'],$r['out'],$r['remaining']];
            } else {
                $rows[] = ['Category','Total Items','Total Stock In','Total Stock Out','Remaining'];
                foreach ($itemsAll->groupBy('category') as $cat => $list) {
                    $ids = $list->pluck('id')->all();
                    $rows[] = [$cat, $list->count(), $insAll->whereIn('item_id',$ids)->sum('quantity'), $outsAll->whereIn('item_id',$ids)->sum('quantity'), $list->sum('quantity')];
                }
            }
            $this->log($request, 'export_csv', "Exported CSV ({$scope}).");
            return response()->stream(function() use ($rows) {
                $out = fopen('php://output', 'w');
                foreach ($rows as $row) fputcsv($out, $row);
                fclose($out);
            }, 200, ['Content-Type' => 'text/csv', 'Content-Disposition' => 'attachment; filename="report_' . $scope . '_' . now()->format('Ymd') . '.csv"']);
        }

        // ── IMPORT ITEMS — handled by importItems() ───────────────────────────
        $panel = $request->query('panel', 'dashboard');

        // Load all data once — single-page layout renders all panels at once
        $items     = Item::with('stockIns', 'stockOuts')->orderBy('id')->get();
        $users     = User::orderBy('created_at', 'desc')->get();
        $clients   = Client::orderBy('name')->get();
        $stockIns  = StockIn::with('item')->orderBy('created_at', 'desc')->get();
        $stockOuts = StockOut::with('item')->orderBy('created_at', 'desc')->get();

        $totalItems = $items->count();
        $totalIn    = (int)$stockIns->sum('quantity');
        $totalOut   = (int)$stockOuts->sum('quantity');
        $remaining  = (int)$items->sum('quantity');

        $outByItem = $stockOuts->groupBy('item_id')->map->sum('quantity');
        $mostNeededItems = $outByItem->sortDesc()->take(5)->map(fn($qty, $id) => [
            'item_name' => optional($items->firstWhere('id', $id))->item_name,
            'total_out' => (int)$qty,
        ])->values();

        $categorySummary = $items->groupBy('category')->map(fn($list) => [
            'category'    => $list->first()->category,
            'total_items' => $list->count(),
            'total_in'    => (int)$stockIns->whereIn('item_id', $list->pluck('id')->all())->sum('quantity'),
            'total_out'   => (int)$stockOuts->whereIn('item_id', $list->pluck('id')->all())->sum('quantity'),
            'remaining'   => (int)$list->sum('quantity'),
        ])->values();

        $categoriesCount = $items->pluck('category')->unique()->count();

        $stockOutByPerson = [];
        foreach ($stockOuts as $out) {
            $key = trim($out->person_name ?: 'Unknown');
            $item = $out->item;
            if ($item) {
                $stockOutByPerson[$key][] = [
                    'stock_no' => $item->stock_number,
                    'unit'     => $item->unit,
                    'name'     => $item->item_name,
                    'qty'      => (int)$out->quantity,
                    'price'    => (float)$item->price,
                    'date'     => optional($out->created_at)->toDateString(),
                    'remarks'  => $out->remarks,
                    'workplace'=> $out->workplace,
                ];
            }
        }

        $activityLogs  = ActivityLog::with('user')->orderBy('created_at', 'desc')->limit(200)->get();
        $blockedUsers  = User::where('role', 'blocked')->orderBy('updated_at', 'desc')->get();
        $activeSessions = DB::table('sessions')
            ->leftJoin('users', 'sessions.user_id', '=', 'users.id')
            ->select('sessions.id','sessions.user_id','sessions.ip_address','sessions.user_agent','sessions.last_activity','users.name','users.email','users.role')
            ->orderBy('sessions.last_activity', 'desc')->get();
        $adminCode = DB::table('confirmation_codes')->where('role', 'admin')->value('code') ?? 'cpsuadmin@2026';

        $data = compact(
            'items','users','clients','stockIns','stockOuts','stockOutByPerson','panel',
            'totalItems','totalIn','totalOut','remaining','mostNeededItems',
            'categorySummary','categoriesCount',
            'activityLogs','blockedUsers','activeSessions','adminCode'
        );

        if ($user && $user->role === 'admin') {
            return view('inventory_menu.admin_menu_panel', $data);
        }

        return view('inventory_menu.staff_menu_panel', $data);
    }
}
