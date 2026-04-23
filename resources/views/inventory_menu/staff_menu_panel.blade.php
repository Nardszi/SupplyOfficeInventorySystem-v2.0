<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Staff Panel – CPSU Supply Office</title>
<style>
*{box-sizing:border-box;margin:0;padding:0}
html,body{height:100%;font-family:'Segoe UI',Arial,sans-serif;background:#f0fdf4;-webkit-font-smoothing:antialiased}
.page{height:100%;display:flex;flex-direction:column}
.header{background:linear-gradient(135deg,#064e3b 0%,#059669 100%);color:#fff;display:flex;align-items:center;justify-content:space-between;padding:0 22px;height:58px;flex-shrink:0;box-shadow:0 3px 12px rgba(0,0,0,.22);z-index:10;border-bottom:3px solid #fbbf24}
.header-left{display:flex;align-items:center;gap:12px}
.header-title{font-size:14px;font-weight:700;letter-spacing:.02em;text-shadow:0 1px 2px rgba(0,0,0,.2)}
.header-right{display:flex;align-items:center;gap:10px;position:relative}
.account-info{text-align:right;font-size:12px;line-height:1.4}
.account-name{font-weight:700;font-size:13px}
.profile-btn{width:36px;height:36px;border-radius:50%;background:rgba(255,255,255,.18);border:2px solid rgba(255,255,255,.45);color:#fff;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:13px;cursor:pointer;overflow:hidden;transition:border-color .2s}
.profile-btn:hover{border-color:rgba(255,255,255,.8)}
.profile-btn img{width:100%;height:100%;object-fit:cover;border-radius:50%}
.dropdown{position:absolute;right:0;top:calc(100% + 10px);background:#fff;color:#111;border-radius:12px;box-shadow:0 12px 32px rgba(0,0,0,.16),0 2px 8px rgba(0,0,0,.08);min-width:210px;padding:6px 0;z-index:100;display:none;border:1px solid #e5e7eb}
.dropdown.open{display:block;animation:fadeDown .15s ease}
@keyframes fadeDown{from{opacity:0;transform:translateY(-6px)}to{opacity:1;transform:translateY(0)}}
.dropdown-item{padding:10px 16px;font-size:13px;cursor:pointer;display:flex;align-items:center;gap:8px;color:#374151;transition:background .1s}
.dropdown-item:hover{background:#f0fdf4}
.dropdown-item.danger{color:#dc2626}
.dropdown-item.danger:hover{background:#fef2f2}
.dropdown-divider{border-top:1px solid #f3f4f6;margin:4px 0}
.body{display:flex;flex:1;overflow:hidden;min-height:0}
/* Footer */
.footer{background:linear-gradient(135deg,#064e3b,#047857);color:rgba(255,255,255,.8);text-align:center;padding:9px;font-size:11px;flex-shrink:0;letter-spacing:.02em;border-top:2px solid #fbbf24}
/* Sidebar */
.sidebar{width:224px;background:linear-gradient(180deg,#022c22 0%,#064e3b 60%,#065f46 100%);color:#fff;padding:16px 10px 20px;display:flex;flex-direction:column;flex-shrink:0;box-shadow:3px 0 12px rgba(0,0,0,.18);overflow-y:auto}
.sidebar-title{font-size:10px;font-weight:700;letter-spacing:.12em;text-transform:uppercase;color:rgba(255,255,255,.4);padding:0 8px;margin-bottom:10px}
.sidebar-divider{height:1px;background:linear-gradient(90deg,transparent,rgba(251,191,36,.4),transparent);margin-bottom:14px}
.nav-item{position:relative;display:flex;align-items:center;gap:10px;padding:9px 10px 9px 14px;font-size:13px;font-weight:500;color:rgba(255,255,255,.75);cursor:pointer;border-radius:8px;margin-bottom:2px;transition:background .15s,color .15s;overflow:hidden}
.nav-item::before{content:'';position:absolute;left:0;top:15%;height:70%;width:3px;background:#fbbf24;border-radius:0 3px 3px 0;transform:scaleY(0);transition:transform .18s}
.nav-item:hover{background:rgba(255,255,255,.09);color:#fff}
.nav-item.active{background:rgba(255,255,255,.14);color:#fff;font-weight:700}
.nav-item.active::before{transform:scaleY(1)}
.nav-item svg{flex-shrink:0;width:19px;height:19px;opacity:.8}
.nav-item:hover svg,.nav-item.active svg{opacity:1}
.content{flex:1;overflow-y:auto;padding:22px 24px;background:#f3f4f6}
/* Panel cards */
.panel{display:none}.panel.active{display:block;animation:fadeIn .18s ease}
@keyframes fadeIn{from{opacity:0;transform:translateY(5px)}to{opacity:1;transform:translateY(0)}}
.card{background:#fff;border-radius:14px;border:1px solid #e5e7eb;box-shadow:0 2px 12px rgba(0,0,0,.07),0 1px 3px rgba(0,0,0,.04);padding:22px 24px;margin-bottom:18px}
.section-title{font-size:15px;font-weight:700;color:#fff;background:linear-gradient(135deg,#065f46,#059669);margin:-22px -24px 16px;padding:12px 20px;border-radius:14px 14px 0 0;display:flex;align-items:center;gap:8px}
table{width:100%;border-collapse:collapse;font-size:13px}
th{background:linear-gradient(180deg,#f9fafb,#f3f4f6);padding:9px 12px;text-align:left;font-weight:700;color:#374151;border-bottom:2px solid #e5e7eb;font-size:12px;text-transform:uppercase;letter-spacing:.04em}
td{padding:9px 12px;border-bottom:1px solid #f3f4f6;color:#374151;vertical-align:middle}
tr:hover td{background:#f0fdf4}
.btn{display:inline-flex;align-items:center;gap:6px;padding:7px 14px;border-radius:8px;font-size:13px;font-weight:600;cursor:pointer;border:1px solid transparent;transition:all .15s;text-decoration:none;letter-spacing:.01em}
.btn-primary{background:linear-gradient(135deg,#059669,#047857);color:#fff;border-color:#047857;box-shadow:0 1px 4px rgba(5,150,105,.3)}.btn-primary:hover{background:linear-gradient(135deg,#047857,#065f46);box-shadow:0 2px 8px rgba(5,150,105,.4)}
.btn-danger{background:linear-gradient(135deg,#dc2626,#b91c1c);color:#fff;border-color:#b91c1c;box-shadow:0 1px 4px rgba(220,38,38,.25)}.btn-danger:hover{background:linear-gradient(135deg,#b91c1c,#991b1b)}
.btn-secondary{background:#fff;color:#374151;border-color:#d1d5db;box-shadow:0 1px 3px rgba(0,0,0,.06)}.btn-secondary:hover{background:#f9fafb;border-color:#9ca3af}
.btn-blue{background:linear-gradient(135deg,#2563eb,#1d4ed8);color:#fff;border-color:#1d4ed8;box-shadow:0 1px 4px rgba(37,99,235,.3)}.btn-blue:hover{background:linear-gradient(135deg,#1d4ed8,#1e40af)}
.btn-sm{padding:5px 10px;font-size:12px}
.badge{display:inline-block;padding:3px 9px;border-radius:999px;font-size:11px;font-weight:600;letter-spacing:.02em}
.badge-green{background:#d1fae5;color:#065f46}
.badge-blue{background:#dbeafe;color:#1e40af}
.badge-red{background:#fee2e2;color:#991b1b}
.badge-yellow{background:#fef3c7;color:#92400e}
.form-group{margin-bottom:14px}
.form-label{display:block;font-size:12px;font-weight:700;color:#374151;margin-bottom:5px;text-transform:uppercase;letter-spacing:.04em}
.form-input{width:100%;padding:8px 12px;border:1px solid #d1d5db;border-radius:8px;font-size:13px;outline:none;transition:border .2s,box-shadow .2s;background:#fff}
.form-input:focus{border-color:#059669;box-shadow:0 0 0 3px rgba(5,150,105,.12)}
.alert{padding:11px 16px;border-radius:10px;font-size:13px;margin-bottom:16px;display:flex;align-items:center;gap:10px;font-weight:500}
.alert-success{background:#d1fae5;color:#065f46;border:1px solid #a7f3d0}
.alert-error{background:#fee2e2;color:#991b1b;border:1px solid #fecaca}
.stat-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:16px;margin-bottom:20px}
.stat-card{background:#fff;border-radius:12px;border:1px solid #e5e7eb;padding:18px;border-left:4px solid #059669;box-shadow:0 2px 8px rgba(0,0,0,.06);transition:box-shadow .2s}
.stat-card:hover{box-shadow:0 4px 16px rgba(0,0,0,.1)}
.stat-card .label{font-size:10px;font-weight:700;color:#6b7280;text-transform:uppercase;letter-spacing:.07em}
.stat-card .value{font-size:28px;font-weight:700;color:#111827;margin-top:6px}
.stat-card.colored .label{color:rgba(255,255,255,.8)}
.stat-card.colored .value{color:#fff}
.stat-card.colored::after{content:'';position:absolute;top:0;left:0;right:0;height:1px;background:linear-gradient(90deg,transparent,rgba(255,255,255,.5),transparent);pointer-events:none}
.qty-ok{color:#065f46;font-weight:700}
.qty-low{color:#92400e;font-weight:700}
.qty-zero{color:#dc2626;font-weight:700}
.search-box{width:100%;padding:9px 14px;border:1px solid #d1d5db;border-radius:9px;font-size:13px;outline:none;margin-bottom:14px;transition:border .2s,box-shadow .2s;background:#fff}
.search-box:focus{border-color:#059669;box-shadow:0 0 0 3px rgba(5,150,105,.1)}
.rel{position:relative}
.dd-list{position:absolute;z-index:50;width:100%;background:#fff;border:1px solid #d1d5db;border-radius:10px;box-shadow:0 8px 24px rgba(0,0,0,.12);max-height:200px;overflow-y:auto;display:none}
.dd-list.open{display:block}
.dd-item{padding:9px 14px;font-size:13px;cursor:pointer;color:#374151;transition:background .1s}
.dd-item:hover{background:#f0fdf4;color:#065f46}
.rel{position:relative}
.dd-list{position:absolute;z-index:50;width:100%;background:#fff;border:1px solid #d1d5db;border-radius:8px;box-shadow:0 4px 12px rgba(0,0,0,.1);max-height:200px;overflow-y:auto;display:none}
.dd-list.open{display:block}
.dd-item{padding:8px 12px;font-size:13px;cursor:pointer;color:#374151}
.dd-item:hover{background:#f0fdf4}
</style>
</head>
<body>
<div class="page">
    <div class="header">
        <div class="header-left">
            <img src="{{ asset('images/cpsu_logo.png') }}" alt="CPSU Logo" style="height:38px;width:38px;object-fit:contain;filter:drop-shadow(0 1px 3px rgba(0,0,0,.3))">
            <span class="header-title">CPSU VICTORIAS SUPPLY OFFICE INVENTORY SYSTEM</span>
        </div>
        <div class="header-right">
            <div class="account-info">
                <div class="account-name">{{ Auth::user()->name }}</div>
                <div style="font-size:11px;opacity:.8">Staff</div>
            </div>
            <div class="profile-btn" onclick="document.getElementById('profileDd').classList.toggle('open')">
                @if(Auth::user()->profile_picture)
                    <img src="{{ asset(Auth::user()->profile_picture) }}" alt="">
                @else
                    {{ strtoupper(substr(Auth::user()->name,0,1)) }}
                @endif
            </div>
            <div class="dropdown" id="profileDd">
                <div class="dropdown-item" style="font-weight:700;color:#065f46">{{ Auth::user()->name }}</div>
                <div class="dropdown-item" style="font-size:12px;color:#6b7280;padding-top:2px">{{ Auth::user()->email }}</div>
                <div class="dropdown-divider"></div>
                <form action="{{ route('inventory.profile_picture') }}" enctype="multipart/form-data" method="POST" style="padding:8px 16px">
                    @csrf
                    <input type="hidden" name="panel" value="{{ $panel }}">
                    <label style="font-size:12px;font-weight:600;color:#374151;display:block;margin-bottom:4px">Profile Picture</label>
                    <input type="file" name="profile_picture" accept="image/*" style="font-size:12px;width:100%;margin-bottom:6px" onchange="this.form.submit()">
                </form>
                <div class="dropdown-divider"></div>
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button type="submit" class="dropdown-item danger" style="width:100%;background:none;border:none;text-align:left" onclick="return confirm('Are you sure you want to sign out?')">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 01-2-2V5a2 2 0 012-2h4M16 17l5-5-5-5M21 12H9"/></svg>
                        Sign Out
                    </button>
                </form>
            </div>
        </div>
    </div>

    <div class="body">
        <div class="sidebar">
            <div class="sidebar-title">CPSU Inventory</div>
            <div class="sidebar-divider"></div>
            <div class="nav-item" data-panel="dashboard" onclick="showPanel('dashboard')">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M3 13h8V3H3v10zm0 8h8v-6H3v6zm10 0h8V11h-8v10zm0-18v6h8V3h-8z"/></svg>
                Dashboard
            </div>
            <div class="nav-item" data-panel="current_stocks" onclick="showPanel('current_stocks')">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 3H7v2h5V6zm5 4H7v2h10v-2zm0 4H7v2h10v-2z"/></svg>
                Current Stocks
            </div>
            <div class="nav-item" data-panel="stock_in" onclick="showPanel('stock_in')">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/></svg>
                Stock In
            </div>
            <div class="nav-item" data-panel="stock_out" onclick="showPanel('stock_out')">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M9 16h6v-6h4l-7-7-7 7h4v6zm-4 2h14v2H5v-2z"/></svg>
                Stock Out
            </div>
            <div class="nav-item" data-panel="daily_reports" onclick="showPanel('daily_reports')">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M5 9.2h3V19H5V9.2zM10.6 5h2.8v14h-2.8V5zM16.2 13h2.8v6h-2.8v-6z"/></svg>
                Reports
            </div>
        </div>

        <div class="content">
            @if(session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif
            @if(session('error'))
                <div class="alert alert-error">{{ session('error') }}</div>
            @endif

            <div id="panel-dashboard" class="panel">
                @include('inventory_menu.card_menus.dashboard_card_menu')
            </div>
            <div id="panel-current_stocks" class="panel">
                @include('inventory_menu.card_menus.current_stocks_card_menu')
            </div>
            <div id="panel-stock_in" class="panel">
                @include('inventory_menu.card_menus.stock_in_card_menu')
            </div>
            <div id="panel-stock_out" class="panel">
                @include('inventory_menu.card_menus.stock_out_card_menu')
            </div>
            <div id="panel-daily_reports" class="panel">
                @include('inventory_menu.card_menus.daily_reports_card_menu')
            </div>
        </div>
    </div>
    <footer class="footer">&copy; {{ date('Y') }} John Colin D. Generillo / jice303</footer>
</div>
<script src="{{ asset('js/anti-mockery.js') }}" defer></script>
<script>
const INITIAL_PANEL = '{{ $panel }}';

function showPanel(key) {
    document.querySelectorAll('.panel').forEach(p => p.classList.remove('active'));
    document.querySelectorAll('.nav-item').forEach(n => n.classList.remove('active'));
    const panel = document.getElementById('panel-' + key);
    if (panel) panel.classList.add('active');
    const nav = document.querySelector('.nav-item[data-panel="' + key + '"]');
    if (nav) nav.classList.add('active');
    history.replaceState(null, '', '{{ route("inventory") }}?panel=' + key);
}

document.addEventListener('DOMContentLoaded', function () {
    showPanel(INITIAL_PANEL || 'dashboard');
});

document.addEventListener('click', function(e){
    const dd = document.getElementById('profileDd');
    if(dd && !dd.contains(e.target) && !e.target.closest('.profile-btn')) dd.classList.remove('open');
    if(!e.target.closest('.rel')) document.querySelectorAll('.dd-list').forEach(d=>d.classList.remove('open'));
});

(function(){
    const sid = '{{ session()->getId() }}';
    setInterval(function(){
        fetch('{{ route("inventory") }}?action=get_warning&sid='+sid)
            .then(r=>r.json()).then(d=>{ if(d.message) alert('⚠️ Admin Warning:\n\n'+d.message); });
    }, 15000);
})();
</script>
</body>
</html>
