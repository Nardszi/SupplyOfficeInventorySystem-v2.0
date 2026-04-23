<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel – CPSU Supply Office</title>
<style>
*{box-sizing:border-box;margin:0;padding:0}
html,body{height:100%;font-family:'Segoe UI',Arial,sans-serif;background:#f0fdf4;-webkit-font-smoothing:antialiased}
.page{height:100%;display:flex;flex-direction:column}
/* Header */
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
/* Footer */
.footer{background:linear-gradient(135deg,#064e3b,#047857);color:rgba(255,255,255,.8);text-align:center;padding:9px;font-size:11px;flex-shrink:0;letter-spacing:.02em;border-top:2px solid #fbbf24}
/* Layout */
.body{display:flex;flex:1;overflow:hidden;min-height:0}
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
/* Content */
.content{flex:1;overflow-y:auto;padding:22px 24px;background:#f3f4f6}
/* Panel cards */
.panel{display:none}.panel.active{display:block;animation:fadeIn .18s ease}
@keyframes fadeIn{from{opacity:0;transform:translateY(5px)}to{opacity:1;transform:translateY(0)}}
/* Cards */
.card{background:#fff;border-radius:14px;border:1px solid #e5e7eb;box-shadow:0 2px 12px rgba(0,0,0,.07),0 1px 3px rgba(0,0,0,.04);padding:22px 24px;margin-bottom:18px}
.section-title{font-size:15px;font-weight:700;color:#fff;background:linear-gradient(135deg,#065f46,#059669);margin:-22px -24px 16px;padding:12px 20px;border-radius:14px 14px 0 0;display:flex;align-items:center;gap:8px}
/* Table */
table{width:100%;border-collapse:collapse;font-size:13px}
th{background:linear-gradient(180deg,#f9fafb,#f3f4f6);padding:9px 12px;text-align:left;font-weight:700;color:#374151;border-bottom:2px solid #e5e7eb;font-size:12px;text-transform:uppercase;letter-spacing:.04em}
td{padding:9px 12px;border-bottom:1px solid #f3f4f6;color:#374151;vertical-align:middle}
tr:hover td{background:#f0fdf4}
/* Buttons */
.btn{display:inline-flex;align-items:center;gap:6px;padding:7px 14px;border-radius:8px;font-size:13px;font-weight:600;cursor:pointer;border:1px solid transparent;transition:all .15s;text-decoration:none;letter-spacing:.01em}
.btn-primary{background:linear-gradient(135deg,#059669,#047857);color:#fff;border-color:#047857;box-shadow:0 1px 4px rgba(5,150,105,.3)}.btn-primary:hover{background:linear-gradient(135deg,#047857,#065f46);box-shadow:0 2px 8px rgba(5,150,105,.4)}
.btn-danger{background:linear-gradient(135deg,#dc2626,#b91c1c);color:#fff;border-color:#b91c1c;box-shadow:0 1px 4px rgba(220,38,38,.25)}.btn-danger:hover{background:linear-gradient(135deg,#b91c1c,#991b1b)}
.btn-secondary{background:#fff;color:#374151;border-color:#d1d5db;box-shadow:0 1px 3px rgba(0,0,0,.06)}.btn-secondary:hover{background:#f9fafb;border-color:#9ca3af}
.btn-blue{background:linear-gradient(135deg,#2563eb,#1d4ed8);color:#fff;border-color:#1d4ed8;box-shadow:0 1px 4px rgba(37,99,235,.3)}.btn-blue:hover{background:linear-gradient(135deg,#1d4ed8,#1e40af)}
.btn-sm{padding:5px 10px;font-size:12px}
/* Badge */
.badge{display:inline-block;padding:3px 9px;border-radius:999px;font-size:11px;font-weight:600;letter-spacing:.02em}
.badge-green{background:#d1fae5;color:#065f46}
.badge-blue{background:#dbeafe;color:#1e40af}
.badge-red{background:#fee2e2;color:#991b1b}
.badge-yellow{background:#fef3c7;color:#92400e}
/* Form */
.form-group{margin-bottom:14px}
.form-label{display:block;font-size:12px;font-weight:700;color:#374151;margin-bottom:5px;text-transform:uppercase;letter-spacing:.04em}
.form-input{width:100%;padding:8px 12px;border:1px solid #d1d5db;border-radius:8px;font-size:13px;outline:none;transition:border .2s,box-shadow .2s;background:#fff}
.form-input:focus{border-color:#059669;box-shadow:0 0 0 3px rgba(5,150,105,.12)}
/* Alert */
.alert{padding:11px 16px;border-radius:10px;font-size:13px;margin-bottom:16px;display:flex;align-items:center;gap:10px;font-weight:500}
.alert-success{background:#d1fae5;color:#065f46;border:1px solid #a7f3d0}
.alert-error{background:#fee2e2;color:#991b1b;border:1px solid #fecaca}
/* Stat cards */
.stat-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:16px;margin-bottom:20px}
.stat-card{background:#fff;border-radius:12px;border:1px solid #e5e7eb;padding:18px;border-left:4px solid #059669;box-shadow:0 2px 8px rgba(0,0,0,.06);transition:box-shadow .2s}
.stat-card:hover{box-shadow:0 4px 16px rgba(0,0,0,.1)}
.stat-card .label{font-size:10px;font-weight:700;color:#6b7280;text-transform:uppercase;letter-spacing:.07em}
.stat-card .value{font-size:28px;font-weight:700;color:#111827;margin-top:6px}
.stat-card.colored .label{color:rgba(255,255,255,.8)}
.stat-card.colored .value{color:#fff}
.stat-card.colored::after{content:'';position:absolute;top:0;left:0;right:0;height:1px;background:linear-gradient(90deg,transparent,rgba(255,255,255,.5),transparent);pointer-events:none}
/* Qty */
.qty-ok{color:#065f46;font-weight:700}
.qty-low{color:#92400e;font-weight:700}
.qty-zero{color:#dc2626;font-weight:700}
/* Search */
.search-box{width:100%;padding:9px 14px;border:1px solid #d1d5db;border-radius:9px;font-size:13px;outline:none;margin-bottom:14px;transition:border .2s,box-shadow .2s;background:#fff}
.search-box:focus{border-color:#059669;box-shadow:0 0 0 3px rgba(5,150,105,.1)}
/* Dropdown search */
.rel{position:relative}
.dd-list{position:absolute;z-index:50;width:100%;background:#fff;border:1px solid #d1d5db;border-radius:10px;box-shadow:0 8px 24px rgba(0,0,0,.12);max-height:200px;overflow-y:auto;display:none}
.dd-list.open{display:block}
.dd-item{padding:9px 14px;font-size:13px;cursor:pointer;color:#374151;transition:background .1s}
.dd-item:hover{background:#f0fdf4;color:#065f46}
</style>
</head>
<body>
<div class="page">
    <!-- Header -->
    <div class="header">
        <div class="header-left">
            <img src="{{ asset('images/cpsu_logo.png') }}" alt="CPSU Logo" style="height:38px;width:38px;object-fit:contain;filter:drop-shadow(0 1px 3px rgba(0,0,0,.3))">
            <span class="header-title">CPSU VICTORIAS SUPPLY OFFICE INVENTORY SYSTEM</span>
        </div>
        <div class="header-right">
            <div class="account-info">
                <div class="account-name">{{ Auth::user()->name }}</div>
                <div style="font-size:11px;opacity:.8">Administrator</div>
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
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-title">CPSU Inventory</div>
            <div class="sidebar-divider"></div>
            <div class="nav-item" data-panel="dashboard" onclick="showPanel('dashboard')">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M3 13h8V3H3v10zm0 8h8v-6H3v6zm10 0h8V11h-8v10zm0-18v6h8V3h-8z"/></svg>
                Dashboard
            </div>
            <div class="nav-item" data-panel="accounts" onclick="showPanel('accounts')">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M10 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v1h11.5a6.5 6.5 0 01-.41-2.27c0-1.04.25-2.02.69-2.89C13.07 14.13 11.54 14 10 14zm7.5-1c-2.49 0-4.5 2.01-4.5 4.5S15.01 22 17.5 22s4.5-2.01 4.5-4.5S19.99 13 17.5 13zm0 1.5c.69 0 1.25.56 1.25 1.25S18.19 17 17.5 17s-1.25-.56-1.25-1.25.56-1.25 1.25-1.25zm0 6.25c-.93 0-1.74-.46-2.24-1.17.5-.36 1.11-.58 1.74-.58h1c.63 0 1.24.22 1.74.58-.5.71-1.31 1.17-2.24 1.17z"/></svg>
                Accounts
            </div>
            <div class="nav-item" data-panel="add_clients" onclick="showPanel('add_clients')">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M8 10H5V7H3v3H0v2h3v3h2v-3h3v-2zm10 1c1.66 0 2.99-1.34 2.99-3S19.66 5 18 5c-.32 0-.63.05-.91.14.57.81.9 1.79.9 2.86s-.34 2.04-.9 2.86c.28.09.59.14.91.14zm-5 0c1.66 0 2.99-1.34 2.99-3S14.66 5 13 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm6.62 2.16c.83.73 1.38 1.66 1.38 2.84v2h3v-2c0-1.54-2.37-2.49-4.38-2.84zM13 14c-2 0-6 1-6 3v2h12v-2c0-2-4-3-6-3z"/></svg>
                Clients
            </div>
            <div class="nav-item" data-panel="add_stocks" onclick="showPanel('add_stocks')">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M19 3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-2 10h-4v4h-2v-4H7v-2h4V7h2v4h4v2z"/></svg>
                Add Stocks
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
            <div class="nav-item" data-panel="security" onclick="showPanel('security')">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4zm0 10.99h7c-.53 4.12-3.28 7.79-7 8.94V12H5V6.3l7-3.11v8.8z"/></svg>
                Security
            </div>
        </div>

        <!-- Main Content -->
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
            <div id="panel-accounts" class="panel">
                @include('inventory_menu.card_menus.accounts_card_menu')
            </div>
            <div id="panel-add_clients" class="panel">
                @include('inventory_menu.card_menus.add_clients_card_menu')
            </div>
            <div id="panel-add_stocks" class="panel">
                @include('inventory_menu.card_menus.add_stocks_card_menu')
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
            <div id="panel-security" class="panel">
                @include('inventory_menu.card_menus.security_card_menu')
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
    // Update URL without reload
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

// Warning polling
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
