<?php
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

class RegisterController extends Controller
{
    public function create() { return view('auth.sign_up_menu'); }

    public function store(Request $request)
    {
        $request->validate([
            'name'              => 'required|string|max:255',
            'email'             => 'required|email|unique:users',
            'password'          => ['required', 'confirmed', Rules\Password::defaults()],
            'role'              => 'required|in:admin,staff',
            'confirmation_code' => 'required_if:role,admin|nullable|string',
            'profile_picture'   => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // Validate admin confirmation code
        if ($request->role === 'admin') {
            $validCode = DB::table('confirmation_codes')
                ->where('role', 'admin')->where('is_active', 1)->value('code');
            if (!$validCode || $request->confirmation_code !== $validCode) {
                return back()->withInput()->withErrors(['confirmation_code' => 'Invalid admin confirmation code.']);
            }
        }

        $profilePath = null;
        if ($request->hasFile('profile_picture') && $request->file('profile_picture')->isValid()) {
            $file = $request->file('profile_picture');
            $filename = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('profiles'), $filename);
            $profilePath = 'profiles/' . $filename;
        }

        $user = User::create([
            'name'            => $request->name,
            'email'           => $request->email,
            'password'        => Hash::make($request->password),
            'role'            => $request->role,
            'profile_picture' => $profilePath,
        ]);

        Auth::login($user);
        return redirect()->route('inventory');
    }
}
