<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ['name_en', 'name_ar','cat_id','desc_ar','desc_en','meta_keywords', 'meta_des',
    'photo','active','brand_id','sup_category','supsup_category','pdf' ,'featured'];




    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

    // start relation

    public function cats(){
        return $this->belongsTo(Category::class, 'cat_id');
    }
    public function supcats(){
        return $this->belongsTo(SupCategory::class, 'sup_category');
    }
    public function supsupcats(){
        return $this->belongsTo(SupsupCategory::class, 'supsup_category');
    }

    public function brands(){
        return $this->belongsTo(Brand::class, 'brand_id');
    }

     public function types(){
        return $this->belongsTo(Type::class, 'type_id');
    }
      // start relaton
    public function photos(){
        return $this->hasMany(ProductPhoto::class , 'product_id');
    }

    public function tags(){
        return $this->belongsToMany(Tag::class , 'tags_products');
    }
}
