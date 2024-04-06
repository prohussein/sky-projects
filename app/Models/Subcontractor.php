<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Subcontractor extends Model
{
    protected $fillable = ['name', 'phone','code','contact_person','address', 'balance', 'file'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute


}
