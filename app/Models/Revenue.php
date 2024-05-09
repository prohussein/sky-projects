<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Revenue extends Model
{
    protected $fillable = ['project_id', 'code', 'customer_id', 'safe_id',
     'date', 'total_amount', 'tax_type', 'tax_amount', 'net_amount','file'];

    public function getNameAttribute($value)
    {
        return ucfirst($value);
    } // end of getNameAttribute

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }

    public function project()
    {
        return $this->belongsTo(Project::class, 'project_id');
    }
}
