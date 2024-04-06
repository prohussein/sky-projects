<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectSubcontractor extends Model
{
    protected $fillable = ['project_id', 'subcontractor_id', 'start_date', 'end_date', 'amount', 'file', 'notes'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

    public function contractor()
    {
        return $this->belongsTo(Subcontractor::class, 'subcontractor_id');
    }

    public function project()
    {
        return $this->belongsTo(Project::class, 'project_id');
    }

}
