<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $fillable = ['name', 'phone','code','contact_person','address', 'balance'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

    
}
