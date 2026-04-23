@php
$itemsCatalog = $items->map(fn($it) => ['id'=>$it->id,'name'=>$it->item_name,'stock_number'=>$it->stock_number,'unit'=>$it->unit,'quantity'=>(int)$it->quantity,'price'=>(float)$it->price])->values()->toJson();
$clientsJson = $clients->map(fn($c) => ['id'=>$c->id,'name'=>$c->name,'workplace'=>$c->workplace])->toJson();
$logoDataUrl = file_exists(public_path('images/cpsu_logo.png')) ? 'data:image/png;base64,'.base64_encode(file_get_contents(public_path('images/cpsu_logo.png'))) : '';
@endphp

<div class="card">
    <div class="section-title">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M9 16h6v-6h4l-7-7-7 7h4v6zm-4 2h14v2H5v-2z"/></svg>
        Record Stock Out
    </div>

    <form method="GET" action="{{ route('inventory') }}" id="stockOutForm">
        <input type="hidden" name="action" value="stock_out">
        <input type="hidden" name="panel" value="stock_out">

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:14px;margin-bottom:14px">
            <div class="form-group" style="margin:0">
                <label class="form-label">Client / Person</label>
                <div class="rel">
                    <input type="text" id="soClientSearch" class="form-input" placeholder="Search client..." autocomplete="off" oninput="soFilterClients(this.value)" onfocus="soShowClientDd()" required>
                    <div class="dd-list" id="soClientDd"></div>
                </div>
                <input type="hidden" name="person_name" id="soPersonName">
            </div>
            <div class="form-group" style="margin:0">
                <label class="form-label">Workplace</label>
                <input type="text" name="workplace" id="soWorkplace" class="form-input" required>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Purpose / Remarks</label>
            <textarea name="remarks" class="form-input" rows="2" placeholder="Enter purpose..."></textarea>
        </div>

        <div id="soRows">
            <div class="so-row" style="border:1px solid #e5e7eb;border-radius:8px;padding:12px;margin-bottom:10px">
                <div style="display:grid;grid-template-columns:3fr 1fr;gap:12px;align-items:end">
                    <div class="form-group" style="margin:0">
                        <label class="form-label">Item</label>
                        <div class="rel">
                            <input type="text" class="form-input so-item-search" placeholder="Search item..." autocomplete="off" oninput="soFilterItems(this,0)" onfocus="soShowItemDd(this,0)">
                            <div class="dd-list so-item-dd" id="soItemDd0"></div>
                        </div>
                        <input type="hidden" name="items[0][id]" class="so-item-id">
                        <input type="hidden" name="items[0][name]" class="so-item-name-h">
                        <div class="so-avail-msg" style="font-size:12px;color:#dc2626;margin-top:3px;display:none"></div>
                    </div>
                    <div class="form-group" style="margin:0">
                        <label class="form-label">Qty</label>
                        <input type="number" name="items[0][qty]" class="form-input so-qty" min="1" value="1" required>
                    </div>
                </div>
            </div>
        </div>

        <div style="display:flex;gap:10px;margin-top:4px">
            <button type="button" onclick="addSoRow()" class="btn btn-secondary btn-sm">+ Add Item</button>
            <button type="submit" class="btn btn-primary btn-sm">Record Stock Out</button>
        </div>
    </form>
</div>

<!-- History -->
<div class="card">
    <div class="section-title">Stock Out History</div>
    <div style="display:flex;gap:6px;margin-bottom:6px;align-items:center;flex-wrap:wrap">
        <input type="text" class="search-box" style="margin:0;flex:1;min-width:160px" placeholder="Search by person..." oninput="filterSoHistory(this.value)">
        <input type="date" id="soDateFrom" class="form-input" style="width:140px" title="From" onchange="soQuickActive(null);filterSoHistory(document.querySelector('.search-box').value)">
        <span style="font-size:13px;color:#6b7280;flex-shrink:0">–</span>
        <input type="date" id="soDateTo" class="form-input" style="width:140px" title="To" onchange="soQuickActive(null);filterSoHistory(document.querySelector('.search-box').value)">
        <button type="button" onclick="soClearAll()" class="btn btn-secondary btn-sm">Clear</button>
    </div>
    <div style="display:flex;gap:6px;margin-bottom:12px">
        <button type="button" class="btn btn-secondary btn-sm so-quick" data-range="day"   onclick="soSetRange('day')"  >Today</button>
        <button type="button" class="btn btn-secondary btn-sm so-quick" data-range="week"  onclick="soSetRange('week')" >Week</button>
        <button type="button" class="btn btn-secondary btn-sm so-quick" data-range="month" onclick="soSetRange('month')">Month</button>
        <button type="button" class="btn btn-secondary btn-sm so-quick" data-range="year"  onclick="soSetRange('year')" >Year</button>
    </div>

    @php
        $soByPerson = collect($stockOuts)->groupBy(fn($s) => trim($s->person_name ?: 'Unknown'));
    @endphp

    @forelse($soByPerson as $person => $records)
    <div class="so-person-group" data-person="{{ strtolower($person) }}" style="border:1px solid #e5e7eb;border-radius:8px;margin-bottom:8px;overflow:hidden">
        <div style="display:flex;align-items:center;justify-content:space-between;padding:10px 14px;background:#f9fafb;cursor:pointer" onclick="toggleSoGroup(this)">
            <span style="color:#065f46">{{ $person }}</span>
            <div style="display:flex;gap:8px;align-items:center">
                <button type="button" class="btn btn-blue btn-sm" onclick="event.stopPropagation();printRIS('{{ addslashes($person) }}',soGetRange())">Print RIS</button>
                @auth @if(Auth::user()->role === 'admin')
                <a href="{{ route('inventory', ['action'=>'delete_stock_out_history','panel'=>'stock_out','person_name'=>$person]) }}"
                   class="btn btn-danger btn-sm"
                   onclick="event.stopPropagation();return confirm('Delete all stock-out history for {{ addslashes($person) }}?')">Delete</a>
                @endif @endauth
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" stroke="#6b7280" stroke-width="2" viewBox="0 0 24 24" class="chevron"><path d="M19 9l-7 7-7-7"/></svg>
            </div>
        </div>
        <div class="so-group-body" style="display:none;padding:12px 14px">
            @php
                $byDate = $records->groupBy(fn($r) => optional($r->created_at)->toDateString());
            @endphp
                @foreach($byDate as $date => $dateRecs)
                <div class="so-date-group" data-date="{{ $date }}" style="margin-bottom:10px">
                    <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:4px">
                        <div style="display:flex;align-items:center;gap:10px">
                            <span style="font-size:13px;color:#374151">{{ \Carbon\Carbon::parse($date)->format('F j, Y') }}</span>
                            @php $sharedRemarks = $dateRecs->first(fn($r) => !empty($r->remarks))?->remarks; @endphp
                            @if($sharedRemarks)
                                <span style="font-size:12px;color:#6b7280;background:#f3f4f6;border-radius:4px;padding:1px 7px"><strong>Purpose:</strong> {{ $sharedRemarks }}</span>
                            @endif
                        </div>
                        <button type="button" class="btn btn-blue btn-sm" onclick="printRISDate('{{ addslashes($person) }}','{{ $date }}',{{ json_encode($dateRecs->map(fn($r)=>['name'=>optional($r->item)->item_name,'unit'=>optional($r->item)->unit,'qty'=>$r->quantity,'price'=>(float)optional($r->item)->price,'remarks'=>$r->remarks,'workplace'=>$r->workplace])->values()) }})">Print</button>
                    </div>
                    @foreach($dateRecs as $r)
                    <div style="font-size:13px;color:#374151;padding:2px 0 2px 8px">
                        OUT <strong>{{ $r->quantity }}</strong> {{ optional($r->item)->unit }} of <strong>{{ optional($r->item)->item_name }}</strong>
                    </div>
                    @endforeach
                </div>
                @endforeach
        </div>
    </div>
    @empty
    <p style="color:#9ca3af;font-size:13px;text-align:center;padding:20px">No stock-out records yet.</p>
    @endforelse
</div>

<script>
const SO_ITEMS = {!! $itemsCatalog !!};
const SO_CLIENTS = {!! $clientsJson !!};
const RIS_LOGO = "{{ $logoDataUrl }}";
let soRowCount = 1;
const soItemAvail = {};

function soFilterClients(v) {
    const dd = document.getElementById('soClientDd');
    const q = v.toLowerCase();
    const f = SO_CLIENTS.filter(c => c.name.toLowerCase().includes(q)).slice(0,10);
    dd.innerHTML = f.map(c => `<div class="dd-item" onclick="soSelectClient('${c.name.replace(/'/g,"\\'")}','${c.workplace.replace(/'/g,"\\'")}')"><strong>${c.name}</strong> – ${c.workplace}</div>`).join('');
    dd.classList.toggle('open', f.length > 0 && v.length > 0);
}
function soShowClientDd() {
    const v = document.getElementById('soClientSearch').value;
    const dd = document.getElementById('soClientDd');
    const f = v.length > 0
        ? SO_CLIENTS.filter(c => c.name.toLowerCase().includes(v.toLowerCase())).slice(0,10)
        : SO_CLIENTS.slice(0,10);
    dd.innerHTML = f.map(c => `<div class="dd-item" onclick="soSelectClient('${c.name.replace(/'/g,"\\'")}','${c.workplace.replace(/'/g,"\\'")}')"><strong>${c.name}</strong> – ${c.workplace}</div>`).join('');
    dd.classList.toggle('open', f.length > 0);
}
function soSelectClient(name, workplace) {
    document.getElementById('soClientSearch').value = name;
    document.getElementById('soPersonName').value = name;
    document.getElementById('soWorkplace').value = workplace;
    document.getElementById('soClientDd').classList.remove('open');
}

function soFilterItems(input, idx) {
    const dd = document.getElementById('soItemDd'+idx);
    const q = input.value.toLowerCase();
    const f = SO_ITEMS.filter(it => it.name.toLowerCase().includes(q) || (it.stock_number||'').toLowerCase().includes(q)).slice(0,10);
    dd.innerHTML = f.map(it => `<div class="dd-item" onclick="soSelectItem(${idx},${it.id},'${it.name.replace(/'/g,"\\'")}',${it.quantity})">${it.stock_number ? it.stock_number+' – ' : ''}${it.name} <span style="color:${it.quantity===0?'#dc2626':'#9ca3af'}">(${it.unit}, ${it.quantity} left)</span></div>`).join('');
    dd.classList.toggle('open', f.length > 0 && q.length > 0);
}
function soShowItemDd(input, idx) {
    const dd = document.getElementById('soItemDd'+idx);
    const q = input.value.toLowerCase();
    const f = q.length > 0
        ? SO_ITEMS.filter(it => it.name.toLowerCase().includes(q) || (it.stock_number||'').toLowerCase().includes(q)).slice(0,10)
        : SO_ITEMS.slice(0,10);
    dd.innerHTML = f.map(it => `<div class="dd-item" onclick="soSelectItem(${idx},${it.id},'${it.name.replace(/'/g,"\\'")}',${it.quantity})">${it.stock_number ? it.stock_number+' – ' : ''}${it.name} <span style="color:${it.quantity===0?'#dc2626':'#9ca3af'}">(${it.unit}, ${it.quantity} left)</span></div>`).join('');
    dd.classList.toggle('open', f.length > 0);
}
function soSelectItem(idx, id, name, avail) {
    const row = document.querySelectorAll('.so-row')[idx];
    row.querySelector('.so-item-search').value = name;
    row.querySelector('.so-item-id').value = id;
    row.querySelector('.so-item-name-h').value = name;
    soItemAvail[idx] = avail;
    const msg = row.querySelector('.so-avail-msg');
    if(avail === 0) { msg.textContent = 'Cannot stock out: quantity is 0.'; msg.style.display=''; }
    else { msg.style.display='none'; }
    document.getElementById('soItemDd'+idx).classList.remove('open');
}

function addSoRow() {
    const i = soRowCount++;
    const html = `
    <div class="so-row" style="border:1px solid #e5e7eb;border-radius:8px;padding:12px;margin-bottom:10px">
        <div style="display:grid;grid-template-columns:3fr 1fr auto;gap:12px;align-items:end">
            <div class="form-group" style="margin:0">
                <label class="form-label">Item</label>
                <div class="rel">
                    <input type="text" class="form-input so-item-search" placeholder="Search item..." autocomplete="off" oninput="soFilterItems(this,${i})" onfocus="soShowItemDd(this,${i})">
                    <div class="dd-list so-item-dd" id="soItemDd${i}"></div>
                </div>
                <input type="hidden" name="items[${i}][id]" class="so-item-id">
                <input type="hidden" name="items[${i}][name]" class="so-item-name-h">
                <div class="so-avail-msg" style="font-size:12px;color:#dc2626;margin-top:3px;display:none"></div>
            </div>
            <div class="form-group" style="margin:0"><label class="form-label">Qty</label><input type="number" name="items[${i}][qty]" class="form-input so-qty" min="1" value="1" required></div>
            <div style="padding-bottom:1px"><button type="button" onclick="this.closest('.so-row').remove()" class="btn btn-danger btn-sm">✕</button></div>
        </div>
    </div>`;
    document.getElementById('soRows').insertAdjacentHTML('beforeend', html);
}

function toggleSoGroup(header) {
    const body = header.nextElementSibling;
    const chevron = header.querySelector('.chevron');
    const open = body.style.display !== 'none';
    body.style.display = open ? 'none' : '';
    chevron.style.transform = open ? '' : 'rotate(180deg)';
}

function soClearAll() {
    document.getElementById('soDateFrom').value = '';
    document.getElementById('soDateTo').value = '';
    document.querySelector('.search-box').value = '';
    soQuickActive(null);
    filterSoHistory('');
}

function soQuickActive(range) {
    document.querySelectorAll('.so-quick').forEach(btn => {
        const on = btn.dataset.range === range;
        btn.dataset.active    = on ? '1' : '';
        btn.style.background  = on ? '#059669' : '';
        btn.style.color       = on ? '#fff'    : '';
        btn.style.borderColor = on ? '#059669' : '';
    });
}

function soGetRange() {
    return {
        from: document.getElementById('soDateFrom').value,
        to:   document.getElementById('soDateTo').value,
    };
}

function soLocalDate(d) {
    return d.getFullYear() + '-' +
        String(d.getMonth()+1).padStart(2,'0') + '-' +
        String(d.getDate()).padStart(2,'0');
}

function soSetRange(range) {
    const active = document.querySelector('.so-quick[data-range="' + range + '"]');
    // Toggle off if already active
    if (active && active.dataset.active === '1') {
        soClearAll();
        return;
    }

    const now = new Date();
    let start, end;
    if (range === 'day') {
        start = end = soLocalDate(now);
    } else if (range === 'week') {
        const day = now.getDay();
        const mon = new Date(now); mon.setDate(now.getDate() - ((day+6)%7));
        const sun = new Date(mon); sun.setDate(mon.getDate() + 6);
        start = soLocalDate(mon);
        end   = soLocalDate(sun);
    } else if (range === 'month') {
        start = soLocalDate(new Date(now.getFullYear(), now.getMonth(), 1));
        end   = soLocalDate(new Date(now.getFullYear(), now.getMonth()+1, 0));
    } else if (range === 'year') {
        start = `${now.getFullYear()}-01-01`;
        end   = `${now.getFullYear()}-12-31`;
    }
    document.getElementById('soDateFrom').value = start;
    document.getElementById('soDateTo').value   = end;
    soQuickActive(range);
    filterSoHistory(document.querySelector('.search-box').value);
}

function filterSoHistory(search) {
    const from = document.getElementById('soDateFrom').value;
    const to   = document.getElementById('soDateTo').value;
    const q    = search.toLowerCase();

    document.querySelectorAll('.so-person-group').forEach(g => {
        if (q && !g.dataset.person.includes(q)) { g.style.display = 'none'; return; }
        g.style.display = '';

        let anyVisible = false;
        g.querySelectorAll('.so-date-group').forEach(dg => {
            const d = dg.dataset.date;
            let show = true;
            if (from && to)   show = d >= from && d <= to;
            else if (from)    show = d >= from;
            else if (to)      show = d <= to;
            dg.style.display = show ? '' : 'none';
            if (show) anyVisible = true;
        });

        if ((from || to) && !anyVisible) g.style.display = 'none';
    });
}

// RIS Print
function buildRISHtml(person, records, purpose, printDate, office) {
    const grouped = {};
    records.forEach(r => {
        if(!r.name) return;
        if(!grouped[r.name]) grouped[r.name] = {name:r.name,unit:r.unit||'',qty:0,price:r.price||0};
        grouped[r.name].qty += Number(r.qty)||0;
    });
    const rows = Object.values(grouped);
    let rowsHtml = '';
    rows.forEach((r,i) => {
        rowsHtml += `<tr><td style="text-align:center;padding:0 2px;color:#000;border:1px solid #000">${i+1}</td><td style="text-align:center;padding:0 2px;color:#000;border:1px solid #000">${r.unit}</td><td style="text-align:left;padding:0 2px;color:#000;border:1px solid #000">${r.name}</td><td style="text-align:center;padding:0 2px;color:#000;border:1px solid #000">${r.qty}</td><td style="padding:0 2px;color:#000;border:1px solid #000"></td><td style="padding:0 2px;color:#000;border:1px solid #000"></td></tr>`;
    });
    for(let i=rows.length;i<32;i++) {
        rowsHtml += `<tr style="height:16px;"><td style="padding:0 2px;color:#000;border:1px solid #000">&nbsp;</td><td style="border:1px solid #000">&nbsp;</td><td style="border:1px solid #000">&nbsp;</td><td style="border:1px solid #000">&nbsp;</td><td style="border:1px solid #000">&nbsp;</td><td style="border:1px solid #000">&nbsp;</td></tr>`;
    }
    let readableDate = printDate;
    if(printDate && /^\d{4}-\d{2}-\d{2}$/.test(printDate)) {
        const d = new Date(printDate+'T00:00:00');
        if(!isNaN(d)) readableDate = d.toLocaleDateString('en-US',{year:'numeric',month:'long',day:'numeric'});
    }
    const logoHtml = RIS_LOGO ? `<img src="${RIS_LOGO}" style="height:55px;width:auto">` : '';
    return `<div style="font-size:12px;font-family:Arial,sans-serif;color:#000">
        <div style="display:flex;align-items:center;justify-content:center;margin-bottom:1px">
            ${logoHtml}
            <div style="text-align:center;margin-left:10px;">
                <div style="font-size:12px;font-weight:700">CENTRAL PHILIPPINES STATE UNIVERSITY</div>
                <div style="font-size:9px">Kabankalan City, Negros Occidental</div>
            </div>
        </div>
        <div style="font-size:12px;font-weight:700;text-align:center;margin-bottom:1px;letter-spacing:.05em">REQUISITION AND ISSUE SLIP</div>
        <table style="width:100%;border-collapse:collapse;border:1px solid #000;border-bottom:none">
            <tr>
                <td style="font-size:12px;font-weight:700;border:none;width:50%">Division/Branch/Unit: <span style="font-weight:normal;border-bottom:1px solid #000;display:inline-block;min-width:120px">CPSU Victorias</span></td>
                <td style="font-size:12px;font-weight:700;border:none;width:25%">RIS No.: <span style="font-weight:normal;border-bottom:1px solid #000;display:inline-block;min-width:60px">&nbsp;</span></td>
                <td style="font-size:12px;font-weight:700;border:none;width:25%">Date: <span style="font-weight:normal;border-bottom:1px solid #000;display:inline-block;min-width:80px">${readableDate}</span></td>
            </tr>
            <tr>
                <td style="font-size:12px;font-weight:700;border:none">Office: <span style="font-weight:normal;border-bottom:1px solid #000;display:inline-block;min-width:140px">${office||''}</span></td>
                <td style="font-size:12px;font-weight:700;border:none">SAI No.: <span style="font-weight:normal;border-bottom:1px solid #000;display:inline-block;min-width:60px">&nbsp;</span></td>
                <td style="font-size:12px;font-weight:700;border:none">Date: <span style="font-weight:normal;border-bottom:1px solid #000;display:inline-block;min-width:80px">${readableDate}</span></td>
            </tr>
        </table>
        <table style="width:100%;border-collapse:collapse;border:1px solid #000;border-bottom:none">
            <tr><td style="font-size:12px;font-weight:700;text-align:center;width:78%">REQUISITION</td><td style="font-size:12px;font-weight:700;border-left:1px solid #000;text-align:center;width:20%">ISSUANCE</td></tr>
        </table>
        <table style="width:100%;border-collapse:collapse">
            <thead><tr>
                <td style="font-size:12px;font-weight:700;border:1px solid #000;text-align:center;width:13%">STOCK NO.</td>
                <td style="font-size:12px;font-weight:700;border:1px solid #000;text-align:center;width:10%">UNIT</td>
                <td style="font-size:12px;font-weight:700;border:1px solid #000;text-align:center;width:30%">DESCRIPTION</td>
                <td style="font-size:12px;font-weight:700;border:1px solid #000;text-align:center;width:10%">QTY</td>
                <td style="font-size:12px;font-weight:700;border:1px solid #000;text-align:center;width:15%">UNIT PRICE</td>
                <td style="font-size:12px;font-weight:700;border:1px solid #000;text-align:center;width:20%">TOTAL PRICE</td>
            </tr></thead>
            <tbody>${rowsHtml}</tbody>
        </table>
        <table style="width:100%;border-collapse:collapse;border:1px solid #000;border-top:none;border-bottom:none">
            <tr><td style="font-size:12px;font-weight:700;text-align:left;padding-bottom:16px">Purpose: <span style="font-weight:normal">${purpose||''}</span></td></tr>
        </table>
        <table style="width:100%;border-collapse:collapse">
            <tr>
                <td style="font-size:9px;font-weight:700;border:1px solid #000;text-align:left;width:13%"></td>
                <td style="font-size:9px;font-weight:700;border:1px solid #000;text-align:left;width:20%">Requested By:</td>
                <td style="font-size:9px;font-weight:700;border:1px solid #000;text-align:left;width:20%">Approved By:</td>
                <td style="font-size:9px;font-weight:700;border:1px solid #000;text-align:left;width:25%">Issued:</td>
                <td style="font-size:9px;font-weight:700;border:1px solid #000;text-align:left;width:20%">Received by:</td>
            </tr>
            <tr>
                <td style="font-size:9px;font-weight:normal;border:1px solid #000;padding-top:18px;text-align:left">Signature</td>
                <td style="font-size:9px;border:1px solid #000;border-bottom:none !important"></td>
                <td style="font-size:9px;border:1px solid #000;border-bottom:none !important"></td>
                <td style="font-size:9px;border:1px solid #000;border-bottom:none !important"></td>
                <td style="font-size:9px;border:1px solid #000;border-bottom:none !important"></td>
            </tr>
            <tr>
                <td style="font-size:9px;font-weight:normal;border:1px solid #000;text-align:left">Printed Name</td>
                <td style="font-size:9px;border:1px solid #000;text-align:center;border-top:none">${person}</td>
                <td style="font-size:9px;border:1px solid #000;text-align:center;border-top:none">NOEL B. FORDENETE, DPA</td>
                <td style="font-size:9px;border:1px solid #000;text-align:center;border-top:none">JONEL M. JINSAY, MIT</td>
                <td style="font-size:9px;border:1px solid #000;text-align:center;border-top:none">${person}</td>
            </tr>
            <tr>
                <td style="font-size:9px;font-weight:normal;border:1px solid #000;text-align:left">Designation</td>
                <td style="font-size:9px;border:1px solid #000"></td>
                <td style="font-size:9px;border:1px solid #000;text-align:center">Campus Administrator</td>
                <td style="font-size:9px;border:1px solid #000;text-align:center">Campus Custodian Incharge</td>
                <td style="font-size:9px;border:1px solid #000"></td>
            </tr>
            <tr>
                <td style="font-size:9px;font-weight:normal;border:1px solid #000;text-align:left">Date</td>
                <td style="font-size:9px;border:1px solid #000"></td>
                <td style="font-size:9px;border:1px solid #000"></td>
                <td style="font-size:9px;border:1px solid #000"></td>
                <td style="font-size:9px;border:1px solid #000"></td>
            </tr>
        </table>
        <div style="font-size:9px;margin-top:10px;text-align:center">Doc Control Code: CPSU-VIC-SUP-01 &nbsp; Effective Date: 09/12/2018 &nbsp; Page No.: 1 of 1</div>
    </div>`;
}

function printViaIframe(html) {
    const iframe = document.createElement('iframe');
    iframe.style.cssText = 'position:absolute;left:-9999px;top:-9999px;width:1px;height:1px;border:none';
    document.body.appendChild(iframe);
    const doc = iframe.contentDocument || iframe.contentWindow.document;
    doc.open();
    doc.write(`<!DOCTYPE html><html><head><title>RIS</title><style>@page{size:A4 portrait;margin:8mm 20mm}*{box-sizing:border-box;margin-top:1px;margin-bottom:1px}body{font-family:Arial,sans-serif;color:#000;font-size:9px;font-weight:normal;margin:0;padding:0}tr{height:20px}td,th{font-weight:normal;padding:1px 2px;font-size:9px;height:20px;vertical-align:middle}</style></head><body>${html}</body></html>`);
    doc.close();
    const img = doc.querySelector('img');
    const doPrint = () => { iframe.contentWindow.focus(); iframe.contentWindow.print(); setTimeout(()=>document.body.removeChild(iframe),1000); };
    if(img && !img.complete) { img.onload=doPrint; img.onerror=doPrint; } else setTimeout(doPrint,100);
}

const SO_BY_PERSON = {!! json_encode($stockOutByPerson) !!};

function printRIS(person, range) {
    let records = SO_BY_PERSON[person] || [];
    const from = range.from || '';
    const to   = range.to   || '';
    if (from || to) {
        records = records.filter(r => {
            const d = (r.date||'').substring(0,10);
            if (from && to)  return d >= from && d <= to;
            if (from)        return d >= from;
            if (to)          return d <= to;
            return true;
        });
    }
    const purpose = (records.find(r => (r.remarks||'').trim())||{}).remarks || '';
    const office  = (records.find(r => (r.workplace||'').trim())||{}).workplace || '';
    const date    = from || (records.length ? records[0].date : '');
    printViaIframe(buildRISHtml(person, records, purpose, date, office));
}

function printRISDate(person, date, records) {
    const purpose = (records.find(r => (r.remarks||'').trim())||{}).remarks || '';
    const office = (records.find(r => (r.workplace||'').trim())||{}).workplace || '';
    printViaIframe(buildRISHtml(person, records, purpose, date, office));
}

document.addEventListener('click', function(e) {
    if(!e.target.closest('.rel')) document.querySelectorAll('.dd-list').forEach(d=>d.classList.remove('open'));
});
</script>
