<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
     protected $fillable = ['key','name_en', 'name_ar','photo','meta_keywords','meta_description', 'content_en' ,'content_ar'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute
}
