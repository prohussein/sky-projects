<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectFile extends Model
{

    protected $fillable = ['name','file', 'project_id'];

    public function project()
    {
        return $this->belongsTo(Project::class , 'project_id');
    }

}
