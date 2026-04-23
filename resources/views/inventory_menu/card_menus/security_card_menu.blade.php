<div class="card" style="background:linear-gradient(135deg,#065f46,#059669);color:#fff;border:none;margin-bottom:16px">
    <div style="display:flex;align-items:center;justify-content:space-between">
        <div>
            <h2 style="font-size:20px;font-weight:700">Security Center</h2>
            <p style="font-size:13px;opacity:.85;margin-top:2px">Monitor sessions, manage access, and review activity.</p>
        </div>
        <div style="display:flex;gap:12px">
            <div style="background:rgba(255,255,255,.15);border-radius:8px;padding:10px 16px;text-align:center">
                <div style="font-size:11px;opacity:.8;text-transform:uppercase;letter-spacing:.05em">Active Sessions</div>
                <div style="font-size:22px;font-weight:700;margin-top:2px">{{ count($activeSessions) }}</div>
            </div>
            <div style="background:rgba(255,255,255,.15);border-radius:8px;padding:10px 16px;text-align:center">
                <div style="font-size:11px;opacity:.8;text-transform:uppercase;letter-spacing:.05em">Log Events</div>
                <div style="font-size:22px;font-weight:700;margin-top:2px">{{ $activityLogs->count() }}</div>
            </div>
        </div>
    </div>
</div>

<div style="display:grid;grid-template-columns:1fr 1fr;gap:16px;margin-bottom:16px">
    <!-- Active Sessions -->
    <div class="card">
        <div class="section-title">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" style="margin-right:4px"><path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4zm0 10.99h7c-.53 4.12-3.28 7.79-7 8.94V12H5V6.3l7-3.11v8.8z"/></svg>
            Active Sessions
        </div>
        <div style="overflow-x:auto">
        <table>
            <thead><tr><th>User</th><th>Role</th><th>IP</th><th>Last Active</th><th>Actions</th></tr></thead>
            <tbody>
                @forelse($activeSessions as $s)
                <tr>
                    <td>{{ $s->name ?? 'Guest' }}</td>
                    <td>@if($s->role)<span class="badge {{ $s->role==='admin'?'badge-blue':'badge-green' }}">{{ $s->role }}</span>@endif</td>
                    <td style="font-size:12px">{{ $s->ip_address }}</td>
                    <td style="font-size:12px">{{ \Carbon\Carbon::createFromTimestamp($s->last_activity)->diffForHumans() }}</td>
                    <td>
                        @if($s->user_id && $s->user_id !== Auth::id())
                        <form method="GET" action="{{ route('inventory') }}" style="display:inline">
                            <input type="hidden" name="action" value="send_warning">
                            <input type="hidden" name="panel" value="security">
                            <input type="hidden" name="sid" value="{{ $s->id }}">
                            <input type="text" name="message" placeholder="Warning msg" class="form-input" style="width:120px;display:inline;padding:4px 8px;font-size:12px">
                            <button type="submit" class="btn btn-yellow btn-sm" style="background:#fef3c7;color:#92400e;border-color:#fde68a">Send</button>
                        </form>
                        @if($s->role !== 'blocked')
                        <a href="{{ route('inventory', ['action'=>'block_user','id'=>$s->user_id,'panel'=>'security']) }}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Block this user?')">Block</a>
                        @endif
                        @endif
                    </td>
                </tr>
                @empty
                <tr><td colspan="5" style="text-align:center;color:#9ca3af;padding:16px">No active sessions.</td></tr>
                @endforelse
            </tbody>
        </table>
        </div>
    </div>

    <!-- Blocked Users -->
    <div class="card">
        <div class="section-title">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" style="margin-right:4px"><path d="M10 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/></svg>
            Blocked Users
        </div>
        @forelse($blockedUsers as $u)
        <div style="display:flex;align-items:center;justify-content:space-between;padding:8px 0;border-bottom:1px solid #f3f4f6">
            <div>
                <div style="font-size:13px;font-weight:600">{{ $u->name }}</div>
                <div style="font-size:12px;color:#6b7280">{{ $u->email }}</div>
            </div>
            <a href="{{ route('inventory', ['action'=>'unblock_user','id'=>$u->id,'panel'=>'security']) }}"
               class="btn btn-primary btn-sm">Unblock</a>
        </div>
        @empty
        <p style="color:#9ca3af;font-size:13px;text-align:center;padding:20px">No blocked users.</p>
        @endforelse
    </div>
</div>

<!-- Admin Code Management -->
<div class="card" style="margin-bottom:16px">
    <div class="section-title">
        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" style="margin-right:4px"><path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z"/></svg>
        Admin Registration Code
    </div>
    <form method="GET" action="{{ route('inventory') }}" style="display:flex;gap:10px;align-items:end">
        <input type="hidden" name="action" value="save_confirmation_code">
        <input type="hidden" name="panel" value="security">
        <input type="hidden" name="role" value="admin">
        <input type="hidden" name="id" value="{{ \DB::table('confirmation_codes')->where('role','admin')->value('id') }}">
        <div class="form-group" style="margin:0;flex:1">
            <label class="form-label">Current Admin Code</label>
            <div style="position:relative;display:flex;align-items:center">
                <input type="password" name="code" id="adminCodeInput" class="form-input" value="{{ $adminCode }}" required style="padding-right:40px">
                <button type="button" onclick="const i=document.getElementById('adminCodeInput');const isHidden=i.type==='password';i.type=isHidden?'text':'password';this.style.color=isHidden?'#059669':'#9ca3af'" style="position:absolute;right:10px;background:none;border:none;cursor:pointer;color:#9ca3af;padding:0;display:flex;align-items:center" title="Show/hide code">
                    <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                </button>
            </div>
        </div>
        <input type="hidden" name="is_active" value="1">
        <button type="submit" class="btn btn-primary btn-sm" style="margin-bottom:1px">Update Code</button>
    </form>
</div>

<!-- Database Backup -->
<div class="card" style="margin-bottom:16px">
    <div class="section-title">
        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" style="margin-right:4px"><path d="M20 6h-2.18c.07-.44.18-.88.18-1.36C18 2.06 15.96 0 13.36 0c-1.28 0-2.44.5-3.3 1.3L9 2.36 7.94 1.3C7.08.5 5.92 0 4.64 0 2.04 0 0 2.06 0 4.64c0 .48.11.92.18 1.36H0v2h20V6zm-9.5-3.5c.55-.55 1.3-.86 2.1-.86 1.65 0 2.9 1.25 2.9 2.9 0 .48-.11.92-.3 1.32L12 8.5V2.5zm-5.5-.36c.8 0 1.55.31 2.1.86V8.5L4.4 6.46C4.21 6.06 4.1 5.62 4.1 5.14c0-1.65 1.25-2.9 2.9-2.9zM0 20c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V10H0v10zm14-7.5c0-.83.67-1.5 1.5-1.5s1.5.67 1.5 1.5-.67 1.5-1.5 1.5-1.5-.67-1.5-1.5z"/></svg>
        Database Backup & Restore
    </div>

    <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:12px;margin-top:8px">

        {{-- Backup Now --}}
        <div style="background:#f0fdf4;border:1px solid #bbf7d0;border-radius:8px;padding:14px">
            <div style="font-size:13px;font-weight:600;color:#065f46;margin-bottom:6px">
                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="#059669" style="margin-right:4px;vertical-align:middle"><path d="M19 12v7H5v-7H3v7c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2v-7h-2zm-6 .67l2.59-2.58L17 11.5l-5 5-5-5 1.41-1.41L11 12.67V3h2z"/></svg>
                Backup Database
            </div>
            <p style="font-size:12px;color:#6b7280;margin-bottom:10px">Create a full SQL backup of <strong>{{ config('database.connections.mysql.database') }}</strong> and save it to the backup folder.</p>
            <a href="{{ route('inventory', ['action'=>'db_backup','panel'=>'security']) }}"
               class="btn btn-primary btn-sm"
               style="background:#059669;border-color:#059669;width:100%;text-align:center;display:block"
               onclick="return confirm('Create a new database backup now?')">
               Backup Now
            </a>
        </div>

        {{-- Export / Download --}}
        <div style="background:#eff6ff;border:1px solid #bfdbfe;border-radius:8px;padding:14px">
            <div style="font-size:13px;font-weight:600;color:#1e40af;margin-bottom:6px">
                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="#3b82f6" style="margin-right:4px;vertical-align:middle"><path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/></svg>
                Export / Download
            </div>
            <p style="font-size:12px;color:#6b7280;margin-bottom:10px">Download an existing backup file directly to your browser.</p>
            @php
                $backupDir = 'D:\\xampp8.2\\htdocs\\SupplyOfficeInventorySystem v2.0\\backup_database';
                $backupFiles = [];
                if (is_dir($backupDir)) {
                    $backupFiles = array_reverse(glob($backupDir . DIRECTORY_SEPARATOR . '*.sql') ?: []);
                }
            @endphp
            @if(count($backupFiles))
            <select id="exportFileSelect" class="form-input" style="font-size:12px;margin-bottom:8px">
                @foreach($backupFiles as $bf)
                <option value="{{ basename($bf) }}">{{ basename($bf) }}</option>
                @endforeach
            </select>
            <a id="exportDownloadBtn"
               href="{{ route('inventory', ['action'=>'db_export','panel'=>'security','file'=>basename($backupFiles[0])]) }}"
               class="btn btn-sm"
               style="background:#3b82f6;color:#fff;border-color:#3b82f6;width:100%;text-align:center;display:block">
               Download
            </a>
            <script>
            document.getElementById('exportFileSelect').addEventListener('change', function() {
                const btn = document.getElementById('exportDownloadBtn');
                const base = btn.href.split('&file=')[0];
                btn.href = base + '&file=' + encodeURIComponent(this.value);
            });
            </script>
            @else
            <p style="font-size:12px;color:#9ca3af;text-align:center;padding:8px 0">No backup files found.</p>
            @endif
        </div>

        {{-- Import / Restore --}}
        <div style="background:#fff7ed;border:1px solid #fed7aa;border-radius:8px;padding:14px">
            <div style="font-size:13px;font-weight:600;color:#9a3412;margin-bottom:6px">
                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="#f97316" style="margin-right:4px;vertical-align:middle"><path d="M19 12v7H5v-7H3v7c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2v-7h-2zm-6-6.83L10.41 6.76 9 5.34 12 2.34l3 3-1.41 1.42L12 5.17zM11 3v9h2V3h-2z"/></svg>
                Import / Restore
            </div>
            <p style="font-size:12px;color:#6b7280;margin-bottom:10px">Upload a <code>.sql</code> file to restore the database. This will overwrite existing data.</p>
            <form method="POST" action="{{ route('inventory.db_import') }}" enctype="multipart/form-data"
                  onsubmit="return confirm('WARNING: This will overwrite the current database. Are you sure?')">
                @csrf
                <input type="hidden" name="panel" value="security">
                <input type="file" name="sql_file" accept=".sql" required class="form-input" style="font-size:12px;margin-bottom:8px">
                <button type="submit" class="btn btn-sm"
                        style="background:#f97316;color:#fff;border-color:#f97316;width:100%;text-align:center">
                    Restore Database
                </button>
            </form>
        </div>

    </div>

    {{-- Existing Backups List --}}
    @if(count($backupFiles ?? []))
    <div style="margin-top:14px">
        <div style="font-size:12px;font-weight:600;color:#374151;margin-bottom:6px">Saved Backups ({{ count($backupFiles) }})</div>
        <div style="overflow-x:auto">
        <table style="font-size:12px">
            <thead><tr><th>Filename</th><th>Size</th><th>Created</th><th>Actions</th></tr></thead>
            <tbody>
                @foreach($backupFiles as $bf)
                <tr>
                    <td>{{ basename($bf) }}</td>
                    <td>{{ round(filesize($bf)/1024, 1) }} KB</td>
                    <td>{{ date('M d, Y H:i', filemtime($bf)) }}</td>
                    <td style="display:flex;gap:6px">
                        <a href="{{ route('inventory', ['action'=>'db_export','panel'=>'security','file'=>basename($bf)]) }}"
                           class="btn btn-primary btn-sm" style="font-size:11px">Download</a>
                        <a href="{{ route('inventory', ['action'=>'db_delete_backup','panel'=>'security','file'=>basename($bf)]) }}"
                           class="btn btn-danger btn-sm" style="font-size:11px"
                           onclick="return confirm('Delete this backup file?')">Delete</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        </div>
    </div>
    @endif
</div>

<!-- Activity Log -->
<div class="card">
    <div class="section-title">
        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" style="margin-right:4px"><path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 14l-5-5 1.41-1.41L12 14.17l7.59-7.59L21 8l-9 9z"/></svg>
        Activity Log
    </div>
    <input type="text" class="search-box" placeholder="Search activity..." oninput="filterTable(this,'activityTable')">
    <div style="overflow-x:auto">
    <table id="activityTable">
        <thead><tr><th>Time</th><th>User</th><th>Action</th><th>Description</th><th>IP</th></tr></thead>
        <tbody>
            @forelse($activityLogs as $log)
            <tr>
                <td style="font-size:12px;white-space:nowrap">{{ optional($log->created_at)->format('M d, Y H:i') }}</td>
                <td style="font-size:12px">{{ optional($log->user)->name ?? 'System' }}</td>
                <td><span class="badge badge-blue" style="font-size:10px">{{ $log->action }}</span></td>
                <td style="font-size:12px;max-width:300px">{{ $log->description }}</td>
                <td style="font-size:12px">{{ $log->ip_address }}</td>
            </tr>
            @empty
            <tr><td colspan="5" style="text-align:center;color:#9ca3af;padding:20px">No activity logs yet.</td></tr>
            @endforelse
        </tbody>
    </table>
    </div>
</div>

<script>
function filterTable(input, tableId) {
    const q = input.value.toLowerCase();
    document.querySelectorAll('#'+tableId+' tbody tr').forEach(tr => {
        tr.style.display = tr.textContent.toLowerCase().includes(q) ? '' : 'none';
    });
}
</script>
