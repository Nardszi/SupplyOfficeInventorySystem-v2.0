<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class StockIn extends Model
{
    use HasFactory;

    protected $fillable = ['item_id','person_name','workplace','quantity','price','total_cost','recorded_by'];

    public function item() { return $this->belongsTo(Item::class); }
    public function user() { return $this->belongsTo(User::class, 'recorded_by'); }

    protected static function booted()
    {
        static::creating(function ($s) {
            if (Auth::check()) $s->recorded_by = Auth::id();
        });
        static::saving(function ($s) {
            if ($s->quantity && $s->price) $s->total_cost = $s->quantity * $s->price;
        });
        static::created(function ($s) {
            if ($s->item) $s->item->increment('quantity', $s->quantity);
        });
        static::deleted(function ($s) {
            if ($s->item) $s->item->decrement('quantity', $s->quantity);
        });
    }
}
