<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Partner extends Model
{
     protected $fillable = ['name_en', 'name_ar','content_en', 'content_ar', 'photo', 'active','created_by', 'type'];
}
