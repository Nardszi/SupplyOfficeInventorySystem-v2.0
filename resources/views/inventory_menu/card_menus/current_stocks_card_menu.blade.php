<div class="card">
    <div class="section-title">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 3H7v2h5V6zm5 4H7v2h10v-2zm0 4H7v2h10v-2z"/></svg>
        <span style="flex:1">Current Stocks</span>
        <div style="display:flex;gap:8px">
            <button onclick="exportCurrentStocks()" class="btn btn-sm" style="background:#fef3c7;color:#92400e;border-color:#fde68a">Export CSV</button>
            @auth @if(Auth::user()->role === 'admin')
            <label class="btn btn-sm" style="background:#d1fae5;color:#065f46;border-color:#a7f3d0;cursor:pointer;margin:0">
                Import CSV
                <input type="file" id="importCsvInput" accept=".csv" style="display:none" onchange="importCurrentStocks(this)">
            </label>
            @endif @endauth
            <button onclick="printCurrentStocks()" class="btn btn-sm" style="background:rgba(255,255,255,.2);color:#fff;border-color:rgba(255,255,255,.3)">Print</button>
        </div>
    </div>

    <input type="text" class="search-box" placeholder="Search items..." oninput="filterTable(this,'stocksTable')">

    <div style="overflow-x:auto">
    <table id="stocksTable">
        <thead>
            <tr>
                <th>Item Name</th><th>Brand</th><th>Model</th><th>Serial No.</th>
                <th>Category</th><th>Unit</th><th>Description</th><th>Price</th>
                <th>Qty</th><th>Date Added</th><th>Stock In</th><th>Stock Out</th>
                @auth @if(Auth::user()->role === 'admin') <th>Actions</th> @endif @endauth
            </tr>
        </thead>
        <tbody>
            @forelse($items as $item)
            <tr id="row-{{ $item->id }}">
                <td><strong>{{ $item->item_name }}</strong></td>
                <td>{{ $item->brand }}</td>
                <td>{{ $item->model }}</td>
                <td>{{ $item->serial_number }}</td>
                <td><span class="badge badge-blue">{{ str_replace('_',' ',ucfirst($item->category)) }}</span></td>
                <td>{{ $item->unit }}</td>
                <td style="font-size:12px;color:#6b7280">{{ $item->description }}</td>
                <td>₱{{ number_format($item->price, 2) }}</td>
                <td>
                    @if($item->quantity == 0) <span class="qty-zero">0</span>
                    @elseif($item->quantity <= 5) <span class="qty-low">{{ $item->quantity }}</span>
                    @else <span class="qty-ok">{{ $item->quantity }}</span>
                    @endif
                </td>
                <td>{{ optional($item->date_added)->format('M d, Y') ?? optional($item->created_at)->format('M d, Y') }}</td>
                <td>{{ $item->stockIns->sum('quantity') }}</td>
                <td>{{ $item->stockOuts->sum('quantity') }}</td>
                @auth @if(Auth::user()->role === 'admin')
                <td>
                    <button onclick="openEdit({{ $item->id }})" class="btn btn-secondary btn-sm">Edit</button>
                    <a href="{{ route('inventory', ['action'=>'delete_item','id'=>$item->id,'panel'=>'current_stocks']) }}"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Delete {{ addslashes($item->item_name) }}?')">Delete</a>
                </td>
                @endif @endauth
            </tr>
            @empty
            <tr><td colspan="9" style="text-align:center;color:#9ca3af;padding:20px">No items in catalog yet.</td></tr>
            @endforelse
        </tbody>
    </table>
    </div>
</div>

<!-- Edit Modal -->
@auth @if(Auth::user()->role === 'admin')
<div id="editModal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,.5);z-index:200;align-items:center;justify-content:center">
    <div style="background:#fff;border-radius:12px;padding:24px;width:100%;max-width:560px;max-height:90vh;overflow-y:auto">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px">
            <h3 style="font-size:16px;font-weight:700;color:#065f46">Edit Item</h3>
            <button onclick="closeEdit()" style="background:none;border:none;font-size:20px;cursor:pointer;color:#6b7280">✕</button>
        </div>
        <form method="GET" action="{{ route('inventory') }}">
            <input type="hidden" name="action" value="update_item">
            <input type="hidden" name="panel" value="current_stocks">
            <input type="hidden" name="id" id="editId">
            <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px">
                <div class="form-group"><label class="form-label">Item Name</label><input type="text" name="item_name" id="editName" class="form-input"></div>
                <div class="form-group"><label class="form-label">Brand</label><input type="text" name="brand" id="editBrand" class="form-input"></div>
                <div class="form-group"><label class="form-label">Model</label><input type="text" name="model" id="editModel" class="form-input"></div>
                <div class="form-group"><label class="form-label">Serial No.</label><input type="text" name="serial_number" id="editSerial" class="form-input"></div>
                <div class="form-group">
                    <label class="form-label">Category</label>
                    <select name="category" id="editCat" class="form-input">
                        <option value="office">Office Supplies</option>
                        <option value="ict">ICT Supplies</option>
                        <option value="cleaning">Cleaning Supplies</option>
                        <option value="agronomic">Agronomic Supplies</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Unit</label>
                    <select name="unit" id="editUnit" class="form-input">
                        @foreach(['PCS','REAM','BOX','SET','BOTTLE','PACK','LITER','MILLILITER','GALLON','METER','CENTIMETER','KILOGRAM','GRAM','ROLL','CAN','TUBE','BAG','SACK'] as $u)
                        <option value="{{ $u }}">{{ $u }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group"><label class="form-label">Price</label><input type="number" name="price" id="editPrice" class="form-input" step="0.01" min="0"></div>
                <div class="form-group"><label class="form-label">Quantity</label><input type="number" name="quantity" id="editQty" class="form-input" min="0"></div>
                <div class="form-group" style="grid-column:span 2"><label class="form-label">Description</label><input type="text" name="description" id="editDesc" class="form-input"></div>
            </div>
            <div style="display:flex;gap:10px;justify-content:flex-end;margin-top:8px">
                <button type="button" onclick="closeEdit()" class="btn btn-secondary">Cancel</button>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>
    </div>
</div>

@php
$itemsJson = $items->map(fn($it) => [
    'id'=>$it->id,'item_name'=>$it->item_name,'brand'=>$it->brand,'model'=>$it->model,
    'serial_number'=>$it->serial_number,'category'=>$it->category,'unit'=>$it->unit,
    'price'=>$it->price,'quantity'=>$it->quantity,'description'=>$it->description,
])->keyBy('id');
@endphp
<script>
const ITEMS_MAP = {!! $itemsJson->toJson() !!};
function openEdit(id) {
    const it = ITEMS_MAP[id];
    if(!it) return;
    document.getElementById('editId').value = id;
    document.getElementById('editName').value = it.item_name||'';
    document.getElementById('editBrand').value = it.brand||'';
    document.getElementById('editModel').value = it.model||'';
    document.getElementById('editSerial').value = it.serial_number||'';
    document.getElementById('editPrice').value = it.price||0;
    document.getElementById('editQty').value = it.quantity||0;
    document.getElementById('editDesc').value = it.description||'';
    const catMap = {office_supplies:'office',ict_office_supplies:'ict',cleaning_supplies:'cleaning',agronomic_supplies:'agronomic'};
    document.getElementById('editCat').value = catMap[it.category]||'office';
    document.getElementById('editUnit').value = it.unit||'PCS';
    document.getElementById('editModal').style.display='flex';
}
function closeEdit() { document.getElementById('editModal').style.display='none'; }
</script>
@endif @endauth

<script>
function importCurrentStocks(input) {
    const file = input.files[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = function(e) {
        const csvText = e.target.result;
        const lines = csvText.split('\n').map(l => l.trim()).filter(Boolean);
        if (lines.length < 2) { alert('CSV is empty or has no data rows.'); return; }
        const rowCount = lines.length - 1;
        if (!confirm(`Import ${rowCount} item(s)? Existing items with the same name will be updated, new ones will be added.`)) return;
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '{{ route("inventory.import") }}';
        const csrf = document.createElement('input');
        csrf.type = 'hidden'; csrf.name = '_token';
        csrf.value = '{{ csrf_token() }}';
        form.appendChild(csrf);
        const data = document.createElement('input');
        data.type = 'hidden'; data.name = 'csv_data';
        data.value = csvText;
        form.appendChild(data);
        document.body.appendChild(form);
        form.submit();
    };
    reader.readAsText(file);
    input.value = '';
}

function filterTable(input, tableId) {
    const q = input.value.toLowerCase();
    document.querySelectorAll('#'+tableId+' tbody tr').forEach(tr => {
        tr.style.display = tr.textContent.toLowerCase().includes(q) ? '' : 'none';
    });
}

function exportCurrentStocks() {
    const table = document.getElementById('stocksTable');
    const rows = table.querySelectorAll('tr');
    let csv = '';

    // Headers — all except Actions column
    const headers = Array.from(rows[0].querySelectorAll('th'));
    const lastHeader = headers[headers.length - 1].textContent.trim().toLowerCase();
    const hasActions = lastHeader === 'actions';
    const colCount = hasActions ? headers.length - 1 : headers.length;
    csv += headers.slice(0, colCount).map(th => '"' + th.textContent.trim() + '"').join(',') + '\n';

    // Data rows
    for (let i = 1; i < rows.length; i++) {
        const row = rows[i];
        if (row.style.display === 'none') continue; // skip filtered-out rows
        const cells = Array.from(row.querySelectorAll('td')).slice(0, colCount);
        if (!cells.length) continue;
        const rowData = cells.map((cell, idx) => {
            let text = cell.textContent.trim();
            // Clean price column — remove ₱ and commas
            text = text.replace(/₱/g, '').replace(/,/g, '');
            if (text.includes('"') || text.includes(',') || text.includes('\n')) {
                text = '"' + text.replace(/"/g, '""') + '"';
            }
            return text;
        });
        csv += rowData.join(',') + '\n';
    }

    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'current_stocks_' + new Date().toISOString().split('T')[0] + '.csv';
    link.style.display = 'none';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

function printCurrentStocks() {
    const table = document.getElementById('stocksTable');
    const rows = table.querySelectorAll('tr');

    // Determine columns to include — exclude Actions, but keep Stock In & Stock Out
    const headers = Array.from(rows[0].querySelectorAll('th'));
    const lastHeader = headers[headers.length - 1].textContent.trim().toLowerCase();
    const hasActions = lastHeader === 'actions';
    const colCount = hasActions ? headers.length - 1 : headers.length;

    let thead = '<tr>';
    headers.slice(0, colCount).forEach(th => {
        thead += '<th>' + th.textContent.trim() + '</th>';
    });
    thead += '</tr>';

    let tbody = '';
    let dataRows = 0;
    for (let i = 1; i < rows.length; i++) {
        const row = rows[i];
        if (row.style.display === 'none') continue;
        const cells = Array.from(row.querySelectorAll('td')).slice(0, colCount);
        if (!cells.length) continue;
        tbody += '<tr>';
        cells.forEach(cell => {
            tbody += '<td>' + cell.textContent.trim() + '</td>';
        });
        tbody += '</tr>';
        dataRows++;
    }

    // Pad to 32 rows
    const pad = Math.max(0, 32 - dataRows);
    for (let i = 0; i < pad; i++) {
        tbody += '<tr>' + '<td>&nbsp;</td>'.repeat(colCount) + '</tr>';
    }

    const html = `<!DOCTYPE html><html><head><title>Current Stocks Report</title>
    <style>
        @page { size: A4 landscape; margin: 10mm 12mm; }
        body { font-family: Arial, sans-serif; font-size: 9px; margin: 0; }
        .header { display: flex; align-items: center; justify-content: center; margin-bottom: 4px; }
        .header img { height: 44px; width: auto; margin-right: 10px; }
        .header-text { text-align: center; line-height: 1.3; }
        .header-text .uni { font-size: 12px; font-weight: 700; }
        .header-text .addr { font-size: 9px; }
        .report-title { text-align: center; font-size: 12px; font-weight: 700; margin: 4px 0 2px; }
        .report-date { text-align: right; font-size: 9px; font-weight: 600; margin-bottom: 4px; }
        table { width: 100%; border-collapse: collapse; font-size: 9px; }
        th { background: #f0f0f0; font-weight: 700; border: 1px solid #000; padding: 2px 3px; text-align: left; font-size: 9px; }
        td { border: 1px solid #000; padding: 2px 3px; vertical-align: middle; font-size: 9px; }
    </style></head><body>
    <div class="header">
        <img src="/images/cpsu_logo.png" alt="CPSU Logo">
        <div class="header-text">
            <div class="uni">CENTRAL PHILIPPINE STATE UNIVERSITY</div>
            <div class="addr">Victorias City Campus, Victorias City, Negros Occidental</div>
        </div>
    </div>
    <div class="report-title">CURRENT STOCKS REPORT</div>
    <div class="report-date">Date: ${new Date().toLocaleDateString('en-US',{year:'numeric',month:'long',day:'numeric'})}</div>
    <table><thead>${thead}</thead><tbody>${tbody}</tbody></table>
    </body></html>`;

    const iframe = document.createElement('iframe');
    iframe.style.cssText = 'position:absolute;left:-9999px;top:-9999px;width:1px;height:1px;border:none';
    document.body.appendChild(iframe);
    const doc = iframe.contentDocument || iframe.contentWindow.document;
    doc.open(); doc.write(html); doc.close();
    const img = doc.querySelector('img');
    const doPrint = () => { iframe.contentWindow.focus(); iframe.contentWindow.print(); setTimeout(() => document.body.removeChild(iframe), 1000); };
    if (img && !img.complete) { img.onload = doPrint; img.onerror = doPrint; } else setTimeout(doPrint, 150);
}
</script>
