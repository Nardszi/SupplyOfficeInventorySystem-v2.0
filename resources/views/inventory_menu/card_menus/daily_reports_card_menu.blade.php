<script src="{{ asset('js/chart.min.js') }}"></script>

<!-- Stat Cards -->
<div class="stat-grid">
    <div class="stat-card colored" style="background:linear-gradient(135deg,#2563eb,#3b82f6);border-left-color:#1d4ed8;border-color:#2563eb;overflow:hidden;position:relative">
        <div style="position:absolute;top:-18px;right:-18px;width:90px;height:90px;border-radius:50%;background:rgba(255,255,255,.12)"></div>
        <div style="position:absolute;bottom:-24px;left:-10px;width:70px;height:70px;border-radius:50%;background:rgba(255,255,255,.08)"></div>
        <div style="position:absolute;top:10px;right:30px;width:40px;height:40px;border-radius:50%;background:rgba(255,255,255,.07)"></div>
        <div style="position:relative;display:flex;align-items:center;justify-content:space-between">
            <div>
                <div class="label">Total Items</div>
                <div class="value">{{ $totalItems }}</div>
            </div>
            <div style="background:rgba(255,255,255,.2);backdrop-filter:blur(4px);border:1px solid rgba(255,255,255,.3);border-radius:12px;padding:10px">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="#fff"><path d="M20 6h-2.18c.07-.31.18-.62.18-.95C18 3.37 16.63 2 14.95 2c-.96 0-1.77.5-2.28 1.24L12 4l-.67-.77C10.82 2.5 10.01 2 9.05 2 7.37 2 6 3.37 6 5.05c0 .33.11.64.18.95H4c-1.1 0-2 .9-2 2v13c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2zm-5.05-2c.58 0 1.05.47 1.05 1.05 0 .58-.47 1.05-1.05 1.05-.58 0-1.05-.47-1.05-1.05 0-.58.47-1.05 1.05-1.05zM9.05 4c.58 0 1.05.47 1.05 1.05 0 .58-.47 1.05-1.05 1.05C8.47 6.1 8 5.63 8 5.05 8 4.47 8.47 4 9.05 4zM20 19H4V8h16v11z"/></svg>
            </div>
        </div>
        <div style="position:relative;margin-top:8px"><span style="background:rgba(255,255,255,.25);backdrop-filter:blur(4px);color:#fff;font-size:11px;font-weight:600;padding:2px 10px;border-radius:20px;border:1px solid rgba(255,255,255,.3)">{{ $categoriesCount }} categories</span></div>
    </div>
    <div class="stat-card colored" style="background:linear-gradient(135deg,#047857,#059669);border-left-color:#065f46;border-color:#047857;overflow:hidden;position:relative">
        <div style="position:absolute;top:-18px;right:-18px;width:90px;height:90px;border-radius:50%;background:rgba(255,255,255,.12)"></div>
        <div style="position:absolute;bottom:-24px;left:-10px;width:70px;height:70px;border-radius:50%;background:rgba(255,255,255,.08)"></div>
        <div style="position:absolute;top:10px;right:30px;width:40px;height:40px;border-radius:50%;background:rgba(255,255,255,.07)"></div>
        <div style="position:relative;display:flex;align-items:center;justify-content:space-between">
            <div>
                <div class="label">Total Value</div>
                <div class="value" style="font-size:20px">₱{{ number_format($items->sum(fn($i)=>$i->quantity*$i->price),2) }}</div>
            </div>
            <div style="background:rgba(255,255,255,.2);backdrop-filter:blur(4px);border:1px solid rgba(255,255,255,.3);border-radius:12px;padding:10px">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="#fff" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
            </div>
        </div>
        <div style="position:relative;margin-top:8px"><span style="background:rgba(255,255,255,.25);backdrop-filter:blur(4px);color:#fff;font-size:11px;font-weight:600;padding:2px 10px;border-radius:20px;border:1px solid rgba(255,255,255,.3)">{{ $items->where('quantity','<=',5)->count() }} low stock</span></div>
    </div>
    <div class="stat-card colored" style="background:linear-gradient(135deg,#d97706,#f59e0b);border-left-color:#b45309;border-color:#d97706;overflow:hidden;position:relative">
        <div style="position:absolute;top:-18px;right:-18px;width:90px;height:90px;border-radius:50%;background:rgba(255,255,255,.12)"></div>
        <div style="position:absolute;bottom:-24px;left:-10px;width:70px;height:70px;border-radius:50%;background:rgba(255,255,255,.08)"></div>
        <div style="position:absolute;top:10px;right:30px;width:40px;height:40px;border-radius:50%;background:rgba(255,255,255,.07)"></div>
        <div style="position:relative;display:flex;align-items:center;justify-content:space-between">
            <div>
                <div class="label">Total Stock In</div>
                <div class="value">{{ $totalIn }}</div>
            </div>
            <div style="background:rgba(255,255,255,.2);backdrop-filter:blur(4px);border:1px solid rgba(255,255,255,.3);border-radius:12px;padding:10px">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="#fff"><path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/></svg>
            </div>
        </div>
        <div style="position:relative;margin-top:8px"><span style="background:rgba(255,255,255,.25);backdrop-filter:blur(4px);color:#fff;font-size:11px;font-weight:600;padding:2px 10px;border-radius:20px;border:1px solid rgba(255,255,255,.3)">{{ $remaining }} remaining</span></div>
    </div>
    <div class="stat-card colored" style="background:linear-gradient(135deg,#b91c1c,#dc2626);border-left-color:#991b1b;border-color:#b91c1c;overflow:hidden;position:relative">
        <div style="position:absolute;top:-18px;right:-18px;width:90px;height:90px;border-radius:50%;background:rgba(255,255,255,.12)"></div>
        <div style="position:absolute;bottom:-24px;left:-10px;width:70px;height:70px;border-radius:50%;background:rgba(255,255,255,.08)"></div>
        <div style="position:absolute;top:10px;right:30px;width:40px;height:40px;border-radius:50%;background:rgba(255,255,255,.07)"></div>
        <div style="position:relative;display:flex;align-items:center;justify-content:space-between">
            <div>
                <div class="label">Total Stock Out</div>
                <div class="value">{{ $totalOut }}</div>
            </div>
            <div style="background:rgba(255,255,255,.2);backdrop-filter:blur(4px);border:1px solid rgba(255,255,255,.3);border-radius:12px;padding:10px">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="#fff"><path d="M9 16h6v-6h4l-7-7-7 7h4v6zm-4 2h14v2H5v-2z"/></svg>
            </div>
        </div>
        <div style="position:relative;margin-top:8px"><span style="background:rgba(255,255,255,.25);backdrop-filter:blur(4px);color:#fff;font-size:11px;font-weight:600;padding:2px 10px;border-radius:20px;border:1px solid rgba(255,255,255,.3)">{{ $remaining }} remaining</span></div>
    </div>
</div>

<!-- Export Buttons -->
<div style="display:flex;gap:10px;margin-bottom:16px">
    <a href="{{ route('inventory', ['action'=>'export_csv','scope'=>'category']) }}" class="btn btn-secondary btn-sm">Export by Category</a>
    <a href="{{ route('inventory', ['action'=>'export_csv','scope'=>'monthly']) }}" class="btn btn-secondary btn-sm">Export Monthly</a>
</div>

<!-- Charts -->
<div style="display:grid;grid-template-columns:1fr 1fr;gap:16px;margin-bottom:16px">
    <div class="card" style="margin:0;min-width:0">
        <div class="section-title">Items by Category</div>
        <div style="position:relative;height:280px;width:100%">
            <canvas id="categoryChart"></canvas>
        </div>
    </div>
    <div class="card" style="margin:0;min-width:0">
        <div class="section-title">Most Needed Items</div>
        <div style="position:relative;height:280px;width:100%">
            <canvas id="neededItemsChart"></canvas>
        </div>
    </div>
</div>

<!-- Stock Levels Table -->
<div class="card">
    <div class="section-title">
        <span style="flex:1">Current Stock Levels</span>
        <div style="display:flex;gap:8px">
            <button onclick="sortStockLevels('asc')" class="btn btn-sm" style="background:rgba(255,255,255,.2);color:#fff;border-color:rgba(255,255,255,.3)">A–Z</button>
            <button onclick="sortStockLevels('desc')" class="btn btn-sm" style="background:rgba(255,255,255,.2);color:#fff;border-color:rgba(255,255,255,.3)">Z–A</button>
        </div>
    </div>
    <div style="overflow-y:auto;max-height:380px;border:1px solid #e5e7eb;border-radius:8px">
        <table id="stockLevelsTable">
            <thead><tr><th>Item Name &amp; Quantity</th></tr></thead>
            <tbody>
                @foreach($items->sortBy(fn($it)=>strtolower($it->item_name))->values() as $it)
                <tr data-name="{{ strtolower($it->item_name) }}">
                    <td style="display:flex;align-items:center;justify-content:space-between">
                        <span style="font-weight:500;color:#111827">{{ $it->item_name }}</span>
                        @php $qty = (int)$it->quantity; @endphp
                        <span class="badge {{ $qty<=0?'badge-red':($qty<=5?'badge-yellow':'badge-green') }}">{{ $qty }}</span>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

<script>
(function(){
    const categoryData   = {!! json_encode($categorySummary) !!};
    const mostNeeded     = {!! json_encode($mostNeededItems) !!};

    // Category pie
    const catLabels = categoryData.map(d => d.category.split('_').map(w=>w.charAt(0).toUpperCase()+w.slice(1)).join(' '));
    const catCounts = categoryData.map(d => d.total_items);
    new Chart(document.getElementById('categoryChart'), {
        type: 'pie',
        data: {
            labels: catLabels,
            datasets: [{ data: catCounts, backgroundColor: ['#3B82F6','#10B981','#F59E0B','#EF4444','#8B5CF6','#EC4899'], borderWidth: 1 }]
        },
        options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { position: 'right' } } }
    });

    // Most needed pie
    const top5 = mostNeeded.slice().sort((a,b)=>(b.total_out||0)-(a.total_out||0)).slice(0,5);
    if(top5.length) {
        new Chart(document.getElementById('neededItemsChart'), {
            type: 'pie',
            data: {
                labels: top5.map(d => d.item_name || 'Unknown'),
                datasets: [{ data: top5.map(d => d.total_out), backgroundColor: ['#EF4444','#F59E0B','#3B82F6','#10B981','#8B5CF6'], borderWidth: 1 }]
            },
            options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { position: 'right' } } }
        });
    }
})();

function sortStockLevels(dir) {
    const tbody = document.querySelector('#stockLevelsTable tbody');
    const rows = Array.from(tbody.querySelectorAll('tr'));
    rows.sort((a, b) => {
        const an = a.dataset.name || '';
        const bn = b.dataset.name || '';
        return dir === 'asc' ? an.localeCompare(bn) : bn.localeCompare(an);
    });
    rows.forEach(r => tbody.appendChild(r));
}
</script>
