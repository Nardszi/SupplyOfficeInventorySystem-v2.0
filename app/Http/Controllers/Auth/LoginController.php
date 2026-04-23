<?php
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\ActivityLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function create() { return view('auth.login_menu'); }

    public function store(Request $request)
    {
        $request->validate([
            'email'    => 'required|email',
            'password' => 'required',
        ]);

        if (!Auth::attempt($request->only('email', 'password'), $request->boolean('remember'))) {
            return back()->withErrors(['email' => 'Invalid credentials.'])->withInput();
        }

        $request->session()->regenerate();

        $authUser = Auth::user();

        if ($authUser->role === 'blocked') {
            Auth::logout();
            return redirect()->route('login')->withErrors(['email' => 'Your account has been blocked.']);
        }

        // Migrate legacy 'developer' role from old system → treat as 'admin'
        if ($authUser->role === 'developer') {
            $authUser->role = 'admin';
            $authUser->save();
        }

        try {
            ActivityLog::create([
                'user_id' => Auth::id(), 'action' => 'login',
                'description' => 'User logged in.',
                'ip_address' => $request->ip(), 'user_agent' => $request->userAgent(),
                'url' => $request->fullUrl(), 'method' => $request->method(),
            ]);
        } catch (\Throwable) {}

        return redirect()->route('inventory');
    }

    public function destroy(Request $request)
    {
        try {
            ActivityLog::create([
                'user_id' => Auth::id(), 'action' => 'logout',
                'description' => 'User logged out.',
                'ip_address' => $request->ip(), 'user_agent' => $request->userAgent(),
                'url' => $request->fullUrl(), 'method' => $request->method(),
            ]);
        } catch (\Throwable) {}

        Auth::guard('web')->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/');
    }
}
