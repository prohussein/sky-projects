<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    protected $fillable = ['name_en', 'name_ar'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

    public function cats(){
        return $this->hasMany(Category::class, 'brand_id');
    }

    public function products(){
        return $this->hasMany(Producr::class, 'brand_id');
    }
}
