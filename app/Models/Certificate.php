<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Certificate extends Model
{
    protected $fillable = ['name_en', 'name_ar', 'photo','date'];
      
    

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

}
