<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FairAttachment extends Model
{
    protected $fillable = ['type', 'link', 'fair_id'];
      
    

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

     public function fair(){ 
        return $this->belongsTo(Fair::class , 'fair_id');
    }
}
