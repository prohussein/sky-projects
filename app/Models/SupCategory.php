<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SupCategory extends Model
{
     protected $fillable = ['name_en', 'name_ar','category_id','photo'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

    public function category(){
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function supsupCategory(){
        return $this->hasMany(SupsupCategory::class, 'sub_category');
    }

     public function products(){
        return $this->hasMany(Product::class , 'sup_category');
    }
}
