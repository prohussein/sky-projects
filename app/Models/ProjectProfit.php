<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectProfit extends Model
{
    protected $fillable = ['project_id', 'safe_id', 'customer_cost', 'estimate_cost', 'actual_cost', 'profit', 'notes', 'type', 'user_id'];

    public function getNameAttribute($value)
    {
        return ucfirst($value);
    } // end of getNameAttribute


    public function project()
    {
        return $this->belongsTo(Project::class, 'project_id');
    }
    public function safe()
    {
        return $this->belongsTo(Safe::class, 'safe_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
