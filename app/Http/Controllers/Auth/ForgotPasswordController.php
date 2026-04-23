<?php
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

class ForgotPasswordController extends Controller
{
    public function create()
    {
        return view('auth.forgot_password_menu');
    }

    public function store(Request $request)
    {
        $request->validate([
            'email'        => 'required|email',
            'old_password' => 'required|string',
            'new_password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        $user = User::where('email', $request->email)->first();
        if (!$user) {
            return back()->withInput()->withErrors(['email' => 'No account found with this email.']);
        }

        if (!$this->isCloseEnough($request->old_password, $user->password)) {
            return back()->withInput()->withErrors(['old_password' => 'Old password is incorrect or too different.']);
        }

        $user->update(['password' => Hash::make($request->new_password)]);
        Auth::login($user);
        return redirect()->route('inventory')->with('status', 'Password reset successfully.');
    }

    /**
     * Accept the input if it exactly matches OR scores high enough
     * across four fuzzy checks: missing chars, misspelling, wrong symbols, length drift.
     */
    private function isCloseEnough(string $input, string $hash): bool
    {
        // 1. Exact match — always accept
        if (Hash::check($input, $hash)) {
            return true;
        }

        // Build all candidate variations and test each against the hash
        $candidates = array_unique(array_merge(
            $this->missingCharVariants($input),
            $this->misspelledVariants($input),
            $this->symbolVariants($input),
            $this->lengthVariants($input)
        ));

        foreach ($candidates as $candidate) {
            if ($candidate !== $input && strlen($candidate) >= 8 && Hash::check($candidate, $hash)) {
                return true;
            }
        }

        return false;
    }

    /**
     * Missing characters: try removing each character one at a time (up to 2 removals).
     * Covers: user forgot they added a char, or mistyped an extra one.
     */
    private function missingCharVariants(string $pw): array
    {
        $variants = [];
        $len = strlen($pw);

        // Remove 1 character at each position
        for ($i = 0; $i < $len; $i++) {
            $variants[] = substr($pw, 0, $i) . substr($pw, $i + 1);
        }

        // Remove 2 consecutive characters at each position
        for ($i = 0; $i < $len - 1; $i++) {
            $variants[] = substr($pw, 0, $i) . substr($pw, $i + 2);
        }

        return $variants;
    }

    /**
     * Misspelled characters: common substitutions people make when typing from memory.
     * Covers: leet speak, case errors, adjacent key swaps.
     */
    private function misspelledVariants(string $pw): array
    {
        $variants = [];

        // Case variants
        $variants[] = strtolower($pw);
        $variants[] = strtoupper($pw);
        $variants[] = ucfirst(strtolower($pw));

        // Leet speak substitutions (both directions)
        $leetMap = [
            'a' => ['4', '@'],
            'e' => ['3'],
            'i' => ['1', '!'],
            'o' => ['0'],
            's' => ['5', '$'],
            't' => ['7'],
            'b' => ['8'],
            'g' => ['9', '6'],
            'l' => ['1'],
            'z' => ['2'],
            '4' => ['a'],
            '3' => ['e'],
            '1' => ['i', 'l'],
            '0' => ['o'],
            '5' => ['s'],
            '7' => ['t'],
            '8' => ['b'],
            '2' => ['z'],
        ];

        // Apply one substitution at a time
        $lower = strtolower($pw);
        for ($i = 0; $i < strlen($lower); $i++) {
            $char = $lower[$i];
            if (isset($leetMap[$char])) {
                foreach ($leetMap[$char] as $sub) {
                    $variants[] = substr($pw, 0, $i) . $sub . substr($pw, $i + 1);
                    // Also try with lowercase base
                    $variants[] = substr($lower, 0, $i) . $sub . substr($lower, $i + 1);
                }
            }
        }

        // Adjacent character swaps (transposition typos)
        for ($i = 0; $i < strlen($pw) - 1; $i++) {
            $swapped = $pw;
            [$swapped[$i], $swapped[$i + 1]] = [$swapped[$i + 1], $swapped[$i]];
            $variants[] = $swapped;
        }

        return $variants;
    }

    /**
     * Wrong symbols: nearby keyboard keys that are commonly confused.
     * Covers: @/#/!, 1/!/|, -/_, etc.
     */
    private function symbolVariants(string $pw): array
    {
        $variants = [];

        // Keyboard-adjacent symbol pairs
        $symbolMap = [
            '@' => ['#', '!', '2'],
            '#' => ['@', '$', '3'],
            '$' => ['#', '%', '4'],
            '%' => ['$', '^', '5'],
            '^' => ['%', '&', '6'],
            '&' => ['^', '*', '7'],
            '*' => ['&', '(', '8'],
            '!' => ['@', '1', '|'],
            '|' => ['!', '1', 'l'],
            '-' => ['_', '='],
            '_' => ['-', '='],
            '=' => ['-', '+'],
            '+' => ['=', '*'],
            '.' => [',', '>'],
            ',' => ['.', '<'],
            ';' => [':', "'"],
            ':' => [';', '"'],
            "'" => ['"', '`'],
            '"' => ["'", '`'],
        ];

        for ($i = 0; $i < strlen($pw); $i++) {
            $char = $pw[$i];
            if (isset($symbolMap[$char])) {
                foreach ($symbolMap[$char] as $alt) {
                    $variants[] = substr($pw, 0, $i) . $alt . substr($pw, $i + 1);
                }
            }
        }

        return $variants;
    }

    /**
     * Length variants: extra or missing chars at the start or end.
     * Covers: user added/forgot a trailing symbol, number, or repeated a char.
     */
    private function lengthVariants(string $pw): array
    {
        $variants = [];
        $len = strlen($pw);

        // Trim 1–2 chars from the end
        if ($len > 2) $variants[] = substr($pw, 0, -1);
        if ($len > 3) $variants[] = substr($pw, 0, -2);

        // Trim 1–2 chars from the start
        if ($len > 2) $variants[] = substr($pw, 1);
        if ($len > 3) $variants[] = substr($pw, 2);

        // Repeated last character (e.g. typed "pass1" as "pass11")
        if ($len > 1 && $pw[$len - 1] === $pw[$len - 2]) {
            $variants[] = substr($pw, 0, -1);
        }

        // Repeated first character
        if ($len > 1 && $pw[0] === $pw[1]) {
            $variants[] = substr($pw, 1);
        }

        return $variants;
    }
}
