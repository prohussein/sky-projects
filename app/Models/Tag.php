<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
     protected $fillable = ['name_en', 'name_ar'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

    public function products(){
        return $this->belongsToMany(Product::class , 'tags_products');
    }
}
