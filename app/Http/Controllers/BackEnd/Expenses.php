<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;
use App\Models\ExpenseCategory;
use App\Models\Expense;
use Carbon\Carbon;

class Expenses extends BackEndController
{
    public function __construct(Expense $model)
    {
        $this->middleware('permission:read_expenses')->only(['index']);
        $this->middleware('permission:create_expenses')->only(['create','store']);
        $this->middleware('permission:update_expenses')->only(['edit', 'store']);
        $this->middleware('permission:delete_expenses')->only(['destroy']);
        parent::__construct($model);
    }//end of construct

    protected function append(){


        $cats     = ExpenseCategory::get();

        return ['cats'=>$cats] ;
     }// to add paremater in controller

    public function store(Request $request)
    {
        $request->validate([
            'date'       => 'required',
            'cat_id'     => 'exists:expense_categories,id' ,
            'amount'     => 'required',
        ]);


        $requestArray = $request->all() ;
           //dd($requestArray);
        $row =  $this->model->create($requestArray);


        return redirect()->route('dashboard.expenses.index')->with(isCreated());;
    }// end of store

    public function update(Request $request, Expense $expens)
    {
         // dd($request->id);
         $request->validate([
            'date'       => 'required',
            'cat_id'     => 'exists:expense_categories,id' ,
            'amount'     => 'required',

        ]);

            $requestArray = $request->all();
            $row =  $this->model->FindOrFail($request->id);
            $row->update($requestArray);


        return redirect()->route('dashboard.expenses.index')->with(isUpdated());

    }// end of update

}
