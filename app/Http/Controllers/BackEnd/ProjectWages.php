<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Expense;
use App\Models\Safe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProjectWages extends Controller
{
    public function store(Request $request){
        //dd($request->all());
        $request->validate([
            'date'           => 'required',
            'amount'         => 'required',
           'employee_id'    => 'required',
            'safe_id'        => 'required',
        ]);

        //handle safes

        if ($request->safe_id && $request->amount > 0) {

            $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;
            $safeBalanceAfter = $safeBalance - $request->amount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfter
            ]);
        }

        $fileName = '';
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/projects/wages'), $fileName);
        }

        Expense::create([
            'date'           => $request->date,
            'amount'         => $request->amount,
            'user_id'        => Auth::id(),
            'project_id'     => $request->project_id,
            'employee_id'    => $request->employee_id,
            'note'           => $request->note,
            'safe_id'        => $request->safe_id,
            'type'           => 'tempwages',
            'file'           => $fileName
        ]);

        return redirect()->back()->with(isCreated());
    }

    public function update(Request $request , $id){

        $request->validate([
            'date'           => 'required',
            'amount'         => 'required',
            'employee_id'    => 'required',
            'safe_id'        => 'required',
        ]);

        //handle safes

        if ($request->safe_id && $request->amount > 0) {

            $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;
            $safeBalanceAfter = $safeBalance - $request->amount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfter
            ]);
        }

        Expense::where('id',$id)->update([
            'date'           => $request->date,
            'amount'         => $request->amount,
            'note'           => $request->note,
            'safe_id'        => $request->safe_id,
            'employee_id'    => $request->employee_id

        ]);

        return redirect()->back()->with(isUpdated());
    }
    public function destroy($id){
        //dd($id);
        Expense::FindOrFail($id)->delete();
        return redirect()->back()->with(isDeleted());
    }
}
