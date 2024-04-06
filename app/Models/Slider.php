<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    protected $fillable = ['title_en','title_ar','photo','description_en','description_ar','url','active','created_by'];
}
