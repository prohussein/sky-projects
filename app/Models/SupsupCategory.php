<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SupsupCategory extends Model
{
    protected $tabl = 'sup_sup_categories';
    protected $fillable = ['name_en', 'name_ar','sub_category','category'];

      public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

    public function supcategory(){
        return $this->belongsTo(SupCategory::class, 'sub_category');
    }

    public function cat(){
        return $this->belongsTo(Category::class, 'category');
    }
}
