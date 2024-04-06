<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductPhoto extends Model
{
    protected $fillable = ['name_en', 'name_ar', 'photo', 'product_id'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

    // start relaton
    public function product(){ 
        return $this->belongsTo(Product::class , 'product_id');
    }
}
