@php
$itemsCatalog = $items->map(fn($it) => ['id'=>$it->id,'name'=>$it->item_name,'stock_number'=>$it->stock_number,'unit'=>$it->unit,'quantity'=>(int)$it->quantity,'price'=>(float)$it->price])->values()->toJson();
$clientsJson = $clients->map(fn($c) => ['id'=>$c->id,'name'=>$c->name,'workplace'=>$c->workplace])->toJson();
@endphp

<div class="card">
    <div class="section-title">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/></svg>
        Record Stock In
    </div>

    <form method="GET" action="{{ route('inventory') }}" id="stockInForm">
        <input type="hidden" name="action" value="stock_in">
        <input type="hidden" name="panel" value="stock_in">

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:14px;margin-bottom:14px">
            <div class="form-group" style="margin:0">
                <label class="form-label">Supplier / Person</label>
                <div class="rel">
                    <input type="text" id="clientSearch" class="form-input" placeholder="Search client..." autocomplete="off" oninput="filterClients(this.value)" onfocus="showClientDd()" required>
                    <div class="dd-list" id="clientDd"></div>
                </div>
                <input type="hidden" name="person_name" id="personName">
            </div>
            <div class="form-group" style="margin:0">
                <label class="form-label">Workplace</label>
                <input type="text" name="workplace" id="workplaceInput" class="form-input" required>
            </div>
        </div>

        <div id="siRows">
            <div class="si-row" style="border:1px solid #e5e7eb;border-radius:8px;padding:12px;margin-bottom:10px">
                <div style="display:grid;grid-template-columns:3fr 1fr 1fr;gap:12px;align-items:end">
                    <div class="form-group" style="margin:0">
                        <label class="form-label">Item</label>
                        <div class="rel">
                            <input type="text" class="form-input item-search" placeholder="Search item..." autocomplete="off" oninput="filterItems(this,0)" onfocus="showItemDd(this,0)">
                            <div class="dd-list item-dd" id="itemDd0"></div>
                        </div>
                        <input type="hidden" name="items[0][id]" class="item-id">
                        <input type="hidden" name="items[0][name]" class="item-name-hidden">
                    </div>
                    <div class="form-group" style="margin:0">
                        <label class="form-label">Qty</label>
                        <input type="number" name="items[0][qty]" class="form-input" min="1" value="1" required>
                    </div>
                    <div class="form-group" style="margin:0">
                        <label class="form-label">Unit Price</label>
                        <input type="number" name="items[0][price]" class="form-input" min="0" step="0.01" value="0">
                    </div>
                </div>
            </div>
        </div>

        <div style="display:flex;gap:10px;margin-top:4px">
            <button type="button" onclick="addSiRow()" class="btn btn-secondary btn-sm">+ Add Item</button>
            <button type="submit" class="btn btn-primary btn-sm">Record Stock In</button>
        </div>
    </form>
</div>

<!-- History -->
<div class="card">
    <div class="section-title">Stock In History</div>
    <input type="text" class="search-box" placeholder="Search history..." oninput="filterTable(this,'siHistTable')">
    <div style="overflow-x:auto">
    <table id="siHistTable">
        <thead><tr><th>Date</th><th>Person</th><th>Workplace</th><th>Item</th><th>Qty</th><th>Price</th></tr></thead>
        <tbody>
            @forelse($stockIns as $s)
            <tr>
                <td>{{ optional($s->created_at)->format('M d, Y') }}</td>
                <td>{{ $s->person_name }}</td>
                <td>{{ $s->workplace }}</td>
                <td>{{ optional($s->item)->item_name }}</td>
                <td>{{ $s->quantity }}</td>
                <td>₱{{ number_format($s->price ?? 0, 2) }}</td>
            </tr>
            @empty
            <tr><td colspan="6" style="text-align:center;color:#9ca3af;padding:20px">No stock-in records yet.</td></tr>
            @endforelse
        </tbody>
    </table>
    </div>
</div>

<script>
const ITEMS = {!! $itemsCatalog !!};
const CLIENTS = {!! $clientsJson !!};
let siRowCount = 1;

function filterClients(v) {
    const dd = document.getElementById('clientDd');
    const q = v.toLowerCase();
    const filtered = CLIENTS.filter(c => c.name.toLowerCase().includes(q)).slice(0,10);
    dd.innerHTML = filtered.map(c => `<div class="dd-item" onclick="selectClient(${c.id},'${c.name.replace(/'/g,"\\'")}','${c.workplace.replace(/'/g,"\\'")}')"><strong>${c.name}</strong> – ${c.workplace}</div>`).join('');
    dd.classList.toggle('open', filtered.length > 0 && v.length > 0);
}
function showClientDd() {
    const v = document.getElementById('clientSearch').value;
    const dd = document.getElementById('clientDd');
    const filtered = v.length > 0
        ? CLIENTS.filter(c => c.name.toLowerCase().includes(v.toLowerCase())).slice(0,10)
        : CLIENTS.slice(0,10);
    dd.innerHTML = filtered.map(c => `<div class="dd-item" onclick="selectClient(${c.id},'${c.name.replace(/'/g,"\\'")}','${c.workplace.replace(/'/g,"\\'")}')"><strong>${c.name}</strong> – ${c.workplace}</div>`).join('');
    dd.classList.toggle('open', filtered.length > 0);
}
function selectClient(id, name, workplace) {
    document.getElementById('clientSearch').value = name;
    document.getElementById('personName').value = name;
    document.getElementById('workplaceInput').value = workplace;
    document.getElementById('clientDd').classList.remove('open');
}

function filterItems(input, idx) {
    const dd = document.getElementById('itemDd'+idx);
    const q = input.value.toLowerCase();
    const filtered = ITEMS.filter(it => it.name.toLowerCase().includes(q) || (it.stock_number||'').toLowerCase().includes(q)).slice(0,10);
    dd.innerHTML = filtered.map(it => `<div class="dd-item" onclick="selectItem(${idx},${it.id},'${it.name.replace(/'/g,"\\'")}','${it.unit}',${it.price})">${it.stock_number ? it.stock_number+' – ' : ''}${it.name} <span style="color:#9ca3af">(${it.unit}, ${it.quantity} left)</span></div>`).join('');
    dd.classList.toggle('open', filtered.length > 0 && q.length > 0);
}
function showItemDd(input, idx) {
    const dd = document.getElementById('itemDd'+idx);
    const q = input.value.toLowerCase();
    const filtered = q.length > 0
        ? ITEMS.filter(it => it.name.toLowerCase().includes(q) || (it.stock_number||'').toLowerCase().includes(q)).slice(0,10)
        : ITEMS.slice(0,10);
    dd.innerHTML = filtered.map(it => `<div class="dd-item" onclick="selectItem(${idx},${it.id},'${it.name.replace(/'/g,"\\'")}','${it.unit}',${it.price})">${it.stock_number ? it.stock_number+' – ' : ''}${it.name} <span style="color:#9ca3af">(${it.unit}, ${it.quantity} left)</span></div>`).join('');
    dd.classList.toggle('open', filtered.length > 0);
}
function selectItem(idx, id, name, unit, price) {
    const row = document.querySelectorAll('.si-row')[idx];
    row.querySelector('.item-search').value = name;
    row.querySelector('.item-id').value = id;
    row.querySelector('.item-name-hidden').value = name;
    const priceInput = row.querySelector('input[name*="[price]"]');
    if(priceInput && price > 0) priceInput.value = price;
    document.getElementById('itemDd'+idx).classList.remove('open');
}

function addSiRow() {
    const i = siRowCount++;
    const html = `
    <div class="si-row" style="border:1px solid #e5e7eb;border-radius:8px;padding:12px;margin-bottom:10px">
        <div style="display:grid;grid-template-columns:3fr 1fr 1fr auto;gap:12px;align-items:end">
            <div class="form-group" style="margin:0">
                <label class="form-label">Item</label>
                <div class="rel">
                    <input type="text" class="form-input item-search" placeholder="Search item..." autocomplete="off" oninput="filterItems(this,${i})" onfocus="showItemDd(this,${i})">
                    <div class="dd-list item-dd" id="itemDd${i}"></div>
                </div>
                <input type="hidden" name="items[${i}][id]" class="item-id">
                <input type="hidden" name="items[${i}][name]" class="item-name-hidden">
            </div>
            <div class="form-group" style="margin:0"><label class="form-label">Qty</label><input type="number" name="items[${i}][qty]" class="form-input" min="1" value="1" required></div>
            <div class="form-group" style="margin:0"><label class="form-label">Unit Price</label><input type="number" name="items[${i}][price]" class="form-input" min="0" step="0.01" value="0"></div>
            <div style="padding-bottom:1px"><button type="button" onclick="this.closest('.si-row').remove()" class="btn btn-danger btn-sm">✕</button></div>
        </div>
    </div>`;
    document.getElementById('siRows').insertAdjacentHTML('beforeend', html);
}

function filterTable(input, tableId) {
    const q = input.value.toLowerCase();
    document.querySelectorAll('#'+tableId+' tbody tr').forEach(tr => {
        tr.style.display = tr.textContent.toLowerCase().includes(q) ? '' : 'none';
    });
}

document.addEventListener('click', function(e) {
    if(!e.target.closest('.rel')) {
        document.querySelectorAll('.dd-list').forEach(d => d.classList.remove('open'));
    }
});
</script>
