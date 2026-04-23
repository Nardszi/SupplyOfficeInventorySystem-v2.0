<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Item extends Model
{
    use HasFactory;

    protected $fillable = [
        'stock_number','item_name','brand','model','serial_number',
        'category','unit','description','price','quantity','added_by','date_added',
    ];

    public function stockIns() { return $this->hasMany(StockIn::class); }
    public function stockOuts() { return $this->hasMany(StockOut::class); }
    public function user() { return $this->belongsTo(User::class, 'added_by'); }

    protected static function booted()
    {
        static::creating(function ($item) {
            if (!$item->stock_number) {
                $last = static::orderBy('id', 'desc')->first();
                $item->stock_number = 'STK-' . str_pad(($last ? $last->id + 1 : 1), 4, '0', STR_PAD_LEFT);
            }
            if (Auth::check()) $item->added_by = Auth::id();
        });
        static::deleting(function ($item) {
            $item->stockIns()->delete();
            $item->stockOuts()->delete();
        });
    }
}
