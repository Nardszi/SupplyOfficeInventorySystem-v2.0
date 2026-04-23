<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class StockOut extends Model
{
    use HasFactory;

    protected $fillable = ['item_id','person_name','workplace','quantity','remarks','recorded_by'];

    public function item() { return $this->belongsTo(Item::class); }
    public function user() { return $this->belongsTo(User::class, 'recorded_by'); }

    protected static function booted()
    {
        static::creating(function ($s) {
            if (Auth::check()) $s->recorded_by = Auth::id();
            if ($s->item && $s->quantity > $s->item->quantity)
                throw new \Exception('Not enough stock available.');
        });
        static::created(function ($s) {
            if ($s->item) $s->item->decrement('quantity', $s->quantity);
        });
        static::deleted(function ($s) {
            if ($s->item) $s->item->increment('quantity', $s->quantity);
        });
    }
}
