<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Revenue extends Model
{
    protected $fillable = ['project_id', 'code', 'customer_id', 'safe_id',
     'date', 'total_amount', 'tax_type', 'tax_amount', 'net_amount','file'];

    protected static function boot()
    {
        parent::boot();

        static::created(function ($model) {

            $netAmount = floatval($model->total_amount)  - floatval($model->tax_amount);
            $model->net_amount = $netAmount;
            $model->save();

            $safeBalance              = Safe::where('id', $model->safe_id)->first()->balance;
            $safeBalanceAfterTransfer = $safeBalance + $model->net_amount;
            Safe::where('id', $model->safe_id)->update([
                'balance' => $safeBalanceAfterTransfer
            ]);


        });

        
    }
    // handle attribue value
    // public function getTotalAmountAttribute($value){
    //     $value = number_format($value);
    //     return $value;
    // }
    // public function getTaxAmountAttribute($value)
    // {
    //     $value = number_format($value);
    //     return $value;
    // }
    // public function getNetAmountAttribute($value)
    // {
    //     $value = number_format($value);
    //     return $value;
    // }

    //handle relation
    public function customer(){

        return $this->belongsTo(Customer::class, 'customer_id');
    }

    public function project(){
        return $this->belongsTo(Project::class, 'project_id');
    }

    public function safe()
    {
        return $this->belongsTo(Safe::class, 'safe_id');
    }


}
