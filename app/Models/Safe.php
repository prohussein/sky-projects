<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Safe extends Model
{ 
    protected $fillable = ['name', 'balance', 'type', 'user_id' ,'descripton', 'project_id', 'parent_id'];

    public function employee()
    {
        return $this->belongsTo(User::class , 'user_id');
    }
    public function parentSafe()
    {
        return $this->belongsTo(Safe::class, 'parent_id');
    }
    public function project()
    {
        return $this->belongsTo(Project::class, 'project_id');
    }
    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

}
