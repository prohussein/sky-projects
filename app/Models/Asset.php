<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Asset extends Model
{
    protected $fillable = ['name', 'amount', 'type', 'descripton', 'added_by', 'safe_id','file'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

    public function user()
    {
        return $this->belongsTo(User::class , 'added_by');
    }

    public function safe()
    {
        return $this->belongsTo(Safe::class , 'safe_id');
    }

}
