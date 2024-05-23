<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Expense extends Model
{
    protected $fillable = ['date','reference','amount','note','cat_id', 'safe_id', 'adjustment_id',
                            'material_name', 'material_qty', 'subcontractor_id',
                            'project_id', 'type', 'user_id', 'employee_id','file'];

    protected static $logAttributes =[
        'date', 'reference', 'amount', 'note', 'cat_id', 'safe_id',
        'material_name', 'material_qty', 'subcontractor_id',
        'project_id', 'type', 'user_id', 'employee_id','file'
    ];
    protected static $logName       =  'expense';
    protected static $logOnlyDirty  = true;

    public function project()
    {
        return $this->belongsTo(Project::class, 'project_id');
    }

    public function adjustment()
    {
        return $this->belongsTo(Adjustment::class, 'adjustment_id');
    }
    public function cat()
    {
        return $this->belongsTo(ExpenseCategory::class, 'cat_id');
    }

    public function contactor()
    {
        return $this->belongsTo(Subcontractor::class , 'subcontractor_id');
    }

    public function employee()
    {
        return $this->belongsTo(Employee::class , 'employee_id');
    }

    public function safe()
    {
        return $this->belongsTo(Safe::class, 'safe_id');
    }
}
