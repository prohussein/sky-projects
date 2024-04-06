<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Safe extends Model
{
    protected $fillable = ['name', 'balance', 'type', 'user_id' ,'descripton'];

    public function employee()
    {
        return $this->belongsTo(Employee::class , 'user_id');
    }
    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

}
