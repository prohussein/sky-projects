<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
     protected $fillable = ['name_en', 'name_ar','photo'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

   
 
    public function supCategory(){
        return $this->hasMany(SupCategory::class, 'category_id');
    }

    public function products(){
        return $this->hasMany(Product::class, 'cat_id');
    }

   
}
  