<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Offer extends Model
{ 
    protected $fillable = ['name_en', 'name_ar','cat_id','price_befoer_discount','',
     'price_after_discount','price','desc_ar','desc_en','color','style','in_stock','start','end',
     'type','model_name','meta_keywords', 'meta_des', 'photo','photo1','photo2','photo3','photo4'
      
    ];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute


    protected $dates = ['end'];
    // start relation 
 
    public function cats(){
        return $this->belongsTo(Category::class, 'cat_id');
    }
     

     
}
