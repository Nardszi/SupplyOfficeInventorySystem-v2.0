<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password – CPSU Supply Office</title>
<style>
*{box-sizing:border-box;margin:0;padding:0}
html,body{height:100%;font-family:'Segoe UI',Arial,sans-serif}
body{display:flex;flex-direction:column;min-height:100vh;background:url('{{ asset('images/cpsu_bg.jpg') }}') center/cover no-repeat fixed}
.header{background:linear-gradient(135deg,#065f46,#059669);color:#fff;display:flex;align-items:center;gap:10px;padding:0 24px;height:56px;flex-shrink:0;box-shadow:0 2px 8px rgba(0,0,0,.2);border-bottom:3px solid #fbbf24}
.header img{height:36px;width:36px;object-fit:contain;filter:drop-shadow(0 1px 3px rgba(0,0,0,.3))}
.header-title{font-size:15px;font-weight:700}
.main{flex:1;display:flex;align-items:center;justify-content:center;padding:24px;background:rgba(0,0,0,.52)}
.card{background:#fff;border-radius:14px;box-shadow:0 8px 32px rgba(0,0,0,.18);padding:36px 32px;width:100%;max-width:380px}
.logo{text-align:center;margin-bottom:24px}
.logo img{height:56px;width:auto;margin-bottom:10px;filter:drop-shadow(0 2px 4px rgba(0,0,0,.15))}
.logo h2{font-size:20px;font-weight:700;color:#065f46}
.logo p{font-size:13px;color:#6b7280;margin-top:3px}
label{display:block;font-size:13px;font-weight:600;color:#374151;margin-bottom:4px}
.form-group{margin-bottom:14px}
.pw-wrap{position:relative;display:flex;align-items:center}
.pw-wrap input{flex:1;padding:9px 40px 9px 12px;border:1px solid #d1d5db;border-radius:8px;font-size:14px;outline:none;transition:border .2s;background:#fff}
.pw-wrap input:focus{border-color:#059669;box-shadow:0 0 0 3px rgba(5,150,105,.1)}
input[type="email"]{width:100%;padding:9px 12px;border:1px solid #d1d5db;border-radius:8px;font-size:14px;outline:none;transition:border .2s;background:#fff}
input[type="email"]:focus{border-color:#059669;box-shadow:0 0 0 3px rgba(5,150,105,.1)}
.eye-btn{position:absolute;right:10px;background:none;border:none;cursor:pointer;color:#9ca3af;padding:0;display:flex;align-items:center}
.eye-btn:hover{color:#374151}
.btn{width:100%;padding:10px;background:#059669;color:#fff;border:none;border-radius:8px;font-size:14px;font-weight:600;cursor:pointer;transition:background .2s;margin-top:4px}
.btn:hover{background:#047857}
.alert-error{background:#fef2f2;border:1px solid #fecaca;border-radius:8px;padding:10px 12px;margin-bottom:16px;font-size:13px;color:#dc2626}
.alert-success{background:#d1fae5;border:1px solid #a7f3d0;border-radius:8px;padding:10px 12px;margin-bottom:16px;font-size:13px;color:#065f46}
.links{text-align:center;margin-top:16px;font-size:13px;color:#6b7280}
.links a{color:#059669;text-decoration:none;font-weight:600}
.links a:hover{text-decoration:underline}
.footer{background:linear-gradient(135deg,#065f46,#047857);color:rgba(255,255,255,.85);text-align:center;padding:10px;font-size:12px;flex-shrink:0;border-top:3px solid #fbbf24}
</style>
</head>
<body>
<header class="header">
    <img src="{{ asset('images/cpsu_logo.png') }}" alt="CPSU Logo">
    <span class="header-title">CPSU VICTORIAS SUPPLY OFFICE INVENTORY SYSTEM</span>
</header>

<main class="main">
    <div class="card">
        <div class="logo">
            <img src="{{ asset('images/cpsu_logo.png') }}" alt="CPSU Logo">
            <h2>Reset Password</h2>
            <p>Enter your details to set a new password</p>
        </div>

        @if($errors->any())
            <div class="alert-error">
                @foreach($errors->all() as $e)<div>{{ $e }}</div>@endforeach
            </div>
        @endif

        @if(session('status'))
            <div class="alert-success">{{ session('status') }}</div>
        @endif

        <form method="POST" action="{{ route('password.reset') }}">
            @csrf
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" value="{{ old('email') }}" required autofocus>
            </div>
            <div class="form-group">
                <label>Current Password</label>
                <div class="pw-wrap">
                    <input type="password" name="old_password" id="oldPw" placeholder="••••••••" required>
                    <button type="button" class="eye-btn" onclick="togglePw('oldPw',this)" title="Show/hide password">
                        <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                    </button>
                </div>
            </div>
            <div class="form-group">
                <label>New Password</label>
                <div class="pw-wrap">
                    <input type="password" name="new_password" id="newPw" placeholder="••••••••" required>
                    <button type="button" class="eye-btn" onclick="togglePw('newPw',this)" title="Show/hide password">
                        <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                    </button>
                </div>
            </div>
            <div class="form-group">
                <label>Confirm New Password</label>
                <div class="pw-wrap">
                    <input type="password" name="new_password_confirmation" id="newPwConfirm" placeholder="••••••••" required>
                    <button type="button" class="eye-btn" onclick="togglePw('newPwConfirm',this)" title="Show/hide password">
                        <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                    </button>
                </div>
            </div>
            <button type="submit" class="btn">Reset Password</button>
        </form>

        <div class="links"><a href="{{ route('login') }}">← Back to login</a></div>
    </div>
</main>

<footer class="footer">&copy; {{ date('Y') }} CPSU Victorias. All rights reserved. | John Colin D. Generillo / jice303</footer>
<script>
function togglePw(id, btn) {
    const input = document.getElementById(id);
    const isHidden = input.type === 'password';
    input.type = isHidden ? 'text' : 'password';
    btn.style.color = isHidden ? '#059669' : '#9ca3af';
}
</script>
</body>
</html>
