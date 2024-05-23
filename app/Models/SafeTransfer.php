<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SafeTransfer extends Model
{
    protected $fillable = ['from_safe','adjustment_id', 'to_safe', 'amount', 'safe_send_blance' , 'safe_receive_blance', 'transfer_date', 'added_by', 'notes'];

    public function user()
    {
        return $this->belongsTo(User::class , 'added_by');
    }

    public function senderSafe()
    {
        return $this->belongsTo(Safe::class, 'from_safe');
    }

    public function receiverSafe()
    {
        return $this->belongsTo(Safe::class, 'to_safe');
    }

    public function adjustment(){
        return $this->belongsTo(Adjustment::class, 'adjustment_id');
    }
}
