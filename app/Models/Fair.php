<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Fair extends Model
{
    protected $fillable = ['name_en', 'name_ar', 'photo','desc_ar','desc_en'];
      
     

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

     public function attachments(){
        return $this->hasMany(FairAttachment::class , 'fair_id');
    }
}
