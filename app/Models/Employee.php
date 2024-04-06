<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $fillable = ['name', 'phone','code','notes','address', 'file', 'type','start_date'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute


}
