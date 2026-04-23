<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // Ensure admin confirmation code exists (safe to run on existing DB)
        DB::table('confirmation_codes')->updateOrInsert(
            ['role' => 'admin'],
            [
                'role'        => 'admin',
                'code'        => 'cpsuadmin@2026',
                'description' => 'Admin registration code',
                'is_active'   => true,
                'created_at'  => now(),
                'updated_at'  => now(),
            ]
        );

        // Remove stale developer confirmation code if present (not used in new system)
        DB::table('confirmation_codes')->where('role', 'developer')->delete();

        // Migrate any legacy 'developer' role users to 'admin'
        DB::table('users')->where('role', 'developer')->update(['role' => 'admin']);
    }
}
