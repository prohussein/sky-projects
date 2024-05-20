<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    protected $fillable = ['name', 'code', 'customer_id', 'start_date', 'end_date', 'customer_cost', 'estimated_cost', 'manager_id'];

    public function getNameAttribute($value){
        return ucfirst($value);
    }// end of getNameAttribute

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }

    public function subcontractors()
    {
        return $this->hasMany(ProjectSubcontractor::class);
    }

    public function expenses()
    {
        return $this->hasMany(Expense::class);
    }

    public function items()
    {
        return $this->hasMany(ProjectItem::class);
    }

    public function revenues()
    {
        return $this->hasMany(Revenue::class);
    }



    public function users()
    {
        return $this->belongsToMany(User::class, 'project_users');
    }



}
