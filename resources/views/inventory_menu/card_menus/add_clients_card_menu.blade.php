<div class="card">
    <div class="section-title">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M8 10H5V7H3v3H0v2h3v3h2v-3h3v-2zm10 1c1.66 0 2.99-1.34 2.99-3S19.66 5 18 5c-.32 0-.63.05-.91.14.57.81.9 1.79.9 2.86s-.34 2.04-.9 2.86c.28.09.59.14.91.14zm-5 0c1.66 0 2.99-1.34 2.99-3S14.66 5 13 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm6.62 2.16c.83.73 1.38 1.66 1.38 2.84v2h3v-2c0-1.54-2.37-2.49-4.38-2.84zM13 14c-2 0-6 1-6 3v2h12v-2c0-2-4-3-6-3z"/></svg>
        <span style="flex:1">Client Management</span>
        <button onclick="document.getElementById('addClientForm').style.display=document.getElementById('addClientForm').style.display==='none'?'block':'none'" class="btn btn-sm" style="background:rgba(255,255,255,.2);color:#fff;border-color:rgba(255,255,255,.3)">+ Add Client</button>
    </div>

    <div id="addClientForm" style="display:none;border:1px solid #e5e7eb;border-radius:8px;padding:16px;margin-bottom:16px;background:#f9fafb">
        <form method="GET" action="{{ route('inventory') }}">
            <input type="hidden" name="action" value="add_client">
            <input type="hidden" name="panel" value="add_clients">
            <div style="display:grid;grid-template-columns:1fr 1fr auto;gap:10px;align-items:end">
                <div class="form-group" style="margin:0"><label class="form-label">Name</label><input type="text" name="name" class="form-input" required></div>
                <div class="form-group" style="margin:0"><label class="form-label">Workplace</label><input type="text" name="workplace" class="form-input" required></div>
                <button type="submit" class="btn btn-primary btn-sm" style="margin-bottom:1px">Add</button>
            </div>
        </form>
    </div>

    <input type="text" class="search-box" placeholder="Search clients..." oninput="filterTable(this,'clientsTable')">
    <div style="overflow-x:auto">
    <table id="clientsTable">
        <thead><tr><th>Name</th><th>Workplace</th><th>Registered</th><th>Actions</th></tr></thead>
        <tbody>
            @forelse($clients as $c)
            <tr>
                <td>{{ $c->name }}</td>
                <td>{{ $c->workplace }}</td>
                <td>{{ optional($c->created_at)->format('M d, Y') }}</td>
                <td>
                    <button onclick="openEditClient({{ $c->id }})" class="btn btn-secondary btn-sm">Edit</button>
                    <a href="{{ route('inventory', ['action'=>'delete_client','id'=>$c->id,'panel'=>'add_clients']) }}"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Delete {{ addslashes($c->name) }}?')">Delete</a>
                </td>
            </tr>
            @empty
            <tr><td colspan="4" style="text-align:center;color:#9ca3af;padding:20px">No clients yet.</td></tr>
            @endforelse
        </tbody>
    </table>
    </div>
</div>

<!-- Edit Client Modal -->
<div id="editClientModal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,.5);z-index:200;align-items:center;justify-content:center">
    <div style="background:#fff;border-radius:12px;padding:24px;width:100%;max-width:380px">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px">
            <h3 style="font-size:16px;font-weight:700;color:#065f46">Edit Client</h3>
            <button onclick="document.getElementById('editClientModal').style.display='none'" style="background:none;border:none;font-size:20px;cursor:pointer;color:#6b7280">✕</button>
        </div>
        <form method="GET" action="{{ route('inventory') }}">
            <input type="hidden" name="action" value="update_client">
            <input type="hidden" name="panel" value="add_clients">
            <input type="hidden" name="id" id="editClientId">
            <div class="form-group"><label class="form-label">Name</label><input type="text" name="name" id="editClientName" class="form-input" required></div>
            <div class="form-group"><label class="form-label">Workplace</label><input type="text" name="workplace" id="editClientWorkplace" class="form-input" required></div>
            <div style="display:flex;gap:10px;justify-content:flex-end;margin-top:8px">
                <button type="button" onclick="document.getElementById('editClientModal').style.display='none'" class="btn btn-secondary">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>
</div>

@php $clientsJson = $clients->map(fn($c)=>['id'=>$c->id,'name'=>$c->name,'workplace'=>$c->workplace])->keyBy('id'); @endphp
<script>
const CLIENTS_MAP = {!! $clientsJson->toJson() !!};
function openEditClient(id) {
    const c = CLIENTS_MAP[id]; if(!c) return;
    document.getElementById('editClientId').value = id;
    document.getElementById('editClientName').value = c.name||'';
    document.getElementById('editClientWorkplace').value = c.workplace||'';
    document.getElementById('editClientModal').style.display='flex';
}
function filterTable(input, tableId) {
    const q = input.value.toLowerCase();
    document.querySelectorAll('#'+tableId+' tbody tr').forEach(tr => {
        tr.style.display = tr.textContent.toLowerCase().includes(q) ? '' : 'none';
    });
}
</script>
