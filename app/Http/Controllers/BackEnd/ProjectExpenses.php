<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Expense;
use App\Models\Safe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProjectExpenses extends Controller
{

    public function store(Request $request){
        //dd($request->all());
        $request->validate([
            'date'           => 'required',
            'amount'         => 'required',
            'safe_id'        => 'required',
        ]);

        //handle safes
        $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;

        if ($safeBalance >= $request->amount) {

            $safeBalanceAfter = $safeBalance - $request->amount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfter
            ]);
        }else{
            return back()->with(isOverAmount());
        }

        $fileName = '';
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/projects/expenses'), $fileName);
        }

        Expense::create([
            'date'           => $request->date,
            'amount'         => $request->amount,
            'user_id'        => Auth::id(),
            'project_id'     => $request->project_id,
            'note'           => $request->note,
            'safe_id'        => $request->safe_id ,
            'type'           => 'other',
            'file'           => $fileName
        ]);

        return redirect()->back()->with(isCreated());
    }

    public function update(Request $request , $id){

        $request->validate([
            'date'           => 'required',
            'amount'         => 'required',
        ]);

        //handle safes
        $row =  Expense::FindOrFail($id);

        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/projects/materials'), $fileName);
        } else {
            $fileName =  $row->file;
        }

        //handle safes
        if ($request->safe_id == $row->safe_id) {
            //dd('here');

            $checkSafeBalance              = Safe::where('id', $request->safe_id)->first()->balance + $row->amount;


            if ($checkSafeBalance >= $request->amount) {

                Safe::where('id', $row->safe_id)->update([
                    'balance' => Safe::where('id', $row->safe_id)->first()->balance + $row->amount
                ]);

                $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;

                $safeBalanceAfterTransaction = $safeBalance - $request->amount;


                Safe::where('id', $request->safe_id)->update([
                    'balance' => $safeBalanceAfterTransaction
                ]);
            } else {
                return redirect()->back()->with(noMoneyInSafe());
            }
        } elseif ($request->safe_id != $row->safe_id) {

            $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;
            if ($safeBalance < $request->amount) {
                return redirect()->back()->with(noMoneyInSafe());
            }

            Safe::where('id', $row->safe_id)->update([
                'balance' => Safe::where('id', $row->safe_id)->first()->balance + $row->amount
            ]);

            $safeBalanceAfterTransaction = $safeBalance - $request->amount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfterTransaction
            ]);
        }

        $requestAray = ['file' => $fileName] + $request->all();

        $row->update($requestAray);



        return redirect()->back()->with(isUpdated());
    }

    public function destroy($id){
        $row =   Expense::FindOrFail($id);
        Safe::where('id', $row->safe_id)->update([
            'balance' => Safe::where('id', $row->safe_id)->first()->balance + $row->amount
        ]);
        $row->delete();
        return redirect()->back()->with(isDeleted());
    }

}
