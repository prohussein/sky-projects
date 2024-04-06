<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['name','email', 'address','phone','order_desc'];

    public function getNameAttribute($value){return ucfirst($value);}
        
}
