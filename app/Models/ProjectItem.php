<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectItem extends Model
{
    protected $fillable = ['project_id', 'code', 'name','item_total', 'qty', 'cat', 'implement_qty', 'total_implement_qty'];

    public function getNameAttribute($value)
    {
        return ucfirst($value);
    } // end of getNameAttribute


    public function project()
    {
        return $this->belongsTo(Project::class, 'project_id');
    }
}
