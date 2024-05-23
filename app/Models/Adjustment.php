<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Adjustment extends Model
{
    protected $fillable = ['safe_id', 'receiver_safe_id', 'user_id', 'total_expenses', 'safe_balance', 'total_transfares', 'notes'];

    public function user()
    {
        return $this->belongsTo(User::class , 'user_id');
    }
    public function receiverSafe()
    {
        return $this->belongsTo(Safe::class, 'receiver_safe_id');
    }
    public function safe()
    {
        return $this->belongsTo(Safe::class, 'safe_id');
    }
}
