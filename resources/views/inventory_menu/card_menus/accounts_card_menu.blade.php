<div class="card">
    <div class="section-title">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M10 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v1h11.5a6.5 6.5 0 01-.41-2.27c0-1.04.25-2.02.69-2.89C13.07 14.13 11.54 14 10 14zm7.5-1c-2.49 0-4.5 2.01-4.5 4.5S15.01 22 17.5 22s4.5-2.01 4.5-4.5S19.99 13 17.5 13zm0 1.5c.69 0 1.25.56 1.25 1.25S18.19 17 17.5 17s-1.25-.56-1.25-1.25.56-1.25 1.25-1.25zm0 6.25c-.93 0-1.74-.46-2.24-1.17.5-.36 1.11-.58 1.74-.58h1c.63 0 1.24.22 1.74.58-.5.71-1.31 1.17-2.24 1.17z"/></svg>
        <span style="flex:1">Account Management</span>
        <button onclick="document.getElementById('addUserForm').style.display=document.getElementById('addUserForm').style.display==='none'?'block':'none'" class="btn btn-sm" style="background:rgba(255,255,255,.2);color:#fff;border-color:rgba(255,255,255,.3)">+ Add Account</button>
    </div>

    <!-- Add User Form -->
    <div id="addUserForm" style="display:none;border:1px solid #e5e7eb;border-radius:8px;padding:16px;margin-bottom:16px;background:#f9fafb">
        <h4 style="font-size:14px;font-weight:600;margin-bottom:12px;color:#374151">New Account</h4>
        <form method="GET" action="{{ route('inventory') }}">
            <input type="hidden" name="action" value="add_user">
            <input type="hidden" name="panel" value="accounts">
            <div style="display:grid;grid-template-columns:1fr 1fr 1fr 1fr auto;gap:10px;align-items:end">
                <div class="form-group" style="margin:0"><label class="form-label">Name</label><input type="text" name="name" class="form-input" required></div>
                <div class="form-group" style="margin:0"><label class="form-label">Email</label><input type="email" name="email" class="form-input" required></div>
                <div class="form-group" style="margin:0">
                    <label class="form-label">Role</label>
                    <select name="role" class="form-input">
                        <option value="staff">Staff</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <div class="form-group" style="margin:0"><label class="form-label">Password</label><input type="password" name="password" class="form-input" required></div>
                <button type="submit" class="btn btn-primary btn-sm" style="margin-bottom:1px">Add</button>
            </div>
        </form>
    </div>

    <input type="text" class="search-box" placeholder="Search accounts..." oninput="filterTable(this,'usersTable')">
    <div style="overflow-x:auto">
    <table id="usersTable">
        <thead><tr><th>Name</th><th>Email</th><th>Role</th><th>Joined</th><th>Actions</th></tr></thead>
        <tbody>
            @forelse($users as $u)
            <tr>
                <td>
                    <div style="display:flex;align-items:center;gap:8px">
                        <div style="width:30px;height:30px;border-radius:50%;background:#d1fae5;color:#065f46;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:12px;flex-shrink:0;overflow:hidden">
                            @if($u->profile_picture)<img src="{{ asset($u->profile_picture) }}" style="width:100%;height:100%;object-fit:cover;border-radius:50%">@else{{ strtoupper(substr($u->name,0,1)) }}@endif
                        </div>
                        {{ $u->name }}
                        @if($u->id === Auth::id()) <span class="badge badge-green" style="font-size:10px">You</span>@endif
                    </div>
                </td>
                <td>{{ $u->email }}</td>
                <td>
                    @if($u->role==='admin')<span class="badge badge-blue">Admin</span>
                    @elseif($u->role==='staff')<span class="badge badge-green">Staff</span>
                    @elseif($u->role==='blocked')<span class="badge badge-red">Blocked</span>
                    @else<span class="badge badge-yellow">{{ $u->role }}</span>@endif
                </td>
                <td>{{ optional($u->created_at)->format('M d, Y') }}</td>
                <td>
                    @if($u->id !== Auth::id() && $u->role !== 'admin')
                    <button onclick="openEditUser({{ $u->id }})" class="btn btn-secondary btn-sm">Edit</button>
                    <a href="{{ route('inventory', ['action'=>'delete_user','id'=>$u->id,'panel'=>'accounts']) }}"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Delete {{ addslashes($u->name) }}?')">Delete</a>
                    @elseif($u->id === Auth::id())
                    <button onclick="openEditUser({{ $u->id }})" class="btn btn-secondary btn-sm">Edit</button>
                    @endif
                </td>
            </tr>
            @empty
            <tr><td colspan="5" style="text-align:center;color:#9ca3af;padding:20px">No accounts yet.</td></tr>
            @endforelse
        </tbody>
    </table>
    </div>
</div>

<!-- Edit User Modal -->
<div id="editUserModal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,.5);z-index:200;align-items:center;justify-content:center">
    <div style="background:#fff;border-radius:12px;padding:24px;width:100%;max-width:420px">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px">
            <h3 style="font-size:16px;font-weight:700;color:#065f46">Edit Account</h3>
            <button onclick="document.getElementById('editUserModal').style.display='none'" style="background:none;border:none;font-size:20px;cursor:pointer;color:#6b7280">✕</button>
        </div>
        <form method="GET" action="{{ route('inventory') }}">
            <input type="hidden" name="action" value="update_user">
            <input type="hidden" name="panel" value="accounts">
            <input type="hidden" name="id" id="editUserId">
            <div class="form-group"><label class="form-label">Name</label><input type="text" name="name" id="editUserName" class="form-input"></div>
            <div class="form-group"><label class="form-label">Email</label><input type="email" name="email" id="editUserEmail" class="form-input"></div>
            <div class="form-group">
                <label class="form-label">Role</label>
                <select name="role" id="editUserRole" class="form-input">
                    <option value="staff">Staff</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <div class="form-group"><label class="form-label">New Password <span style="color:#9ca3af;font-weight:400">(leave blank to keep)</span></label><input type="password" name="password" class="form-input"></div>
            <div style="display:flex;gap:10px;justify-content:flex-end;margin-top:8px">
                <button type="button" onclick="document.getElementById('editUserModal').style.display='none'" class="btn btn-secondary">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>
</div>

@php $usersJson = $users->map(fn($u)=>['id'=>$u->id,'name'=>$u->name,'email'=>$u->email,'role'=>$u->role])->keyBy('id'); @endphp
<script>
const USERS_MAP = {!! $usersJson->toJson() !!};
function openEditUser(id) {
    const u = USERS_MAP[id]; if(!u) return;
    document.getElementById('editUserId').value = id;
    document.getElementById('editUserName').value = u.name||'';
    document.getElementById('editUserEmail').value = u.email||'';
    document.getElementById('editUserRole').value = u.role||'staff';
    document.getElementById('editUserModal').style.display='flex';
}
function filterTable(input, tableId) {
    const q = input.value.toLowerCase();
    document.querySelectorAll('#'+tableId+' tbody tr').forEach(tr => {
        tr.style.display = tr.textContent.toLowerCase().includes(q) ? '' : 'none';
    });
}
</script>
