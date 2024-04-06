<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ExpenseCategory extends Model
{
  

    protected $fillable = ['name'];

    protected static $logAttributes = ['name'];
    protected static $logName       =  'expenseCategory';
    protected static $logOnlyDirty  = true;

}
