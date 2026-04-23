<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ConfirmationCode extends Model
{
    protected $fillable = ['role', 'code', 'description', 'is_active'];

    protected $casts = ['is_active' => 'boolean'];

    public static function validateCode(string $role, string $code): bool
    {
        return static::where('role', $role)
            ->where('code', $code)
            ->where('is_active', true)
            ->exists();
    }
}
