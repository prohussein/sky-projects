<?php

namespace App\Http\Controllers\BackEnd;
use Illuminate\Http\Request;
use App\Models\ExpenseCategory;

class ExpenseCategories extends BackEndController
{
    public function __construct(ExpenseCategory $model)
    {
        $this->middleware('permission:read_expenses')->only(['index']);
        $this->middleware('permission:create_expenses')->only(['create','store']);
        $this->middleware('permission:update_expenses')->only(['edit', 'store']);
        $this->middleware('permission:delete_expenses')->only(['destroy']);
        parent::__construct($model);
    }//end of construct

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:expense_categories,name',
        ]);


        $requestArray = $request->all() ;
           //dd($requestArray);
        $row =  $this->model->create($requestArray);

        return redirect()->route('dashboard.expensecategories.index')->with(isCreated());;
    }// end of store

    public function update(Request $request, ExpenseCategory $expensCat)
    {
       // dd($request->id);
         $request->validate([
            'name' => 'required|unique:expense_categories,name,' . $request->id,

        ]);

            $requestArray = $request->all();
            $row =  $this->model->FindOrFail($request->id);
            $row->update($requestArray);


        return redirect()->route('dashboard.expensecategories.index')->with(isUpdated());

    }// end of update

}
