<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;
use App\Models\ExpenseCategory;
use App\Models\Expense;
use App\Models\Safe;
use Carbon\Carbon;

class Expenses extends BackEndController
{
    public function __construct(Expense $model)
    {
        // $this->middleware('permission:read_expenses')->only(['index']);
        // $this->middleware('permission:create_expenses')->only(['create','store']);
        // $this->middleware('permission:update_expenses')->only(['edit', 'store']);
        // $this->middleware('permission:delete_expenses')->only(['destroy']);
        parent::__construct($model);
    } //end of construct
    protected function fillter($rows)
    {
        return $rows->where('type', 'general');
    }
    protected function append(){

        $cats     = ExpenseCategory::get();
        $safes    = Safe::where([['type','!=', 'custody'],['project_id',null]])->get();

        return ['cats'=>$cats , 'safes' => $safes] ;
    } // to add paremater in controller

    protected function with()
    {
        return ['safe'];
    }// to add relation in the controller

     public function store(Request $request)
    {
        $request->validate([
            'date'       => 'required',
            'cat_id'     => 'exists:expense_categories,id' ,
            'safe_id'    => 'required|exists:safes,id',
            'amount'     => 'required',
        ]);

        //handle file
        $fileName = '';
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/expenses'), $fileName);
        }
        $requestArray = ['file' => $fileName] + $request->all();

            //handle safes
            $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;
            if($safeBalance < $request->amount){
                return redirect()->back()->with(noMoneyInSafe());
            }
            $safeBalanceAfterTransaction = $safeBalance - $request->amount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfterTransaction
            ]);

            //dd($requestArray);
        $row =  $this->model->create($requestArray);


        return redirect()->route('dashboard.expenses.index')->with(isCreated());
    }// end of store

    public function update(Request $request, Expense $expens)
    {
         // dd($request->id);
         $request->validate([
            'date'       => 'required',
            'cat_id'     => 'exists:expense_categories,id' ,
            'amount'     => 'required',

        ]);
        $row =  $this->model->FindOrFail($request->id);
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/expenses'), $fileName);
        }else{
            $fileName = $row->file ;
        }
        //handle safes
        Safe::where('id', $request->safe_id)->update([
            'balance' => Safe::where('id', $request->safe_id)->first()->balance + $row->amount
        ]);
        $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance ;
        if ($safeBalance < $request->amount) {
            return redirect()->back()->with(noMoneyInSafe());
        }
        $safeBalanceAfterTransaction = $safeBalance - $request->amount;
        Safe::where('id', $request->safe_id)->update([
            'balance' => $safeBalanceAfterTransaction
        ]);

        $requestArray = ['file' => $fileName] + $request->all();
        $row->update($requestArray);


        return redirect()->route('dashboard.expenses.index')->with(isUpdated());

    } // end of update

    public function destroy($id)
    {
        $row =  $this->model->FindOrFail($id);

        if ($row->safe_id != null) {

            $safeBalance              = Safe::where('id', $row->safe_id)->first()->balance;
            $safeBalancBeforUpdate    = $safeBalance + $row->amount;
            Safe::where('id', $row->safe_id)->update([
                'balance' => $safeBalancBeforUpdate
            ]);
        }

        $row->delete();


        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.index')->with(isDeleted());
    }// end of destroy

}
