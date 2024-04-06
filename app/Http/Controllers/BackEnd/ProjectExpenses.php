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

        if ($request->safe_id && $request->amount > 0) {

            $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;
            $safeBalanceAfter = $safeBalance - $request->amount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfter
            ]);
        }

        Expense::create([
            'date'           => $request->date,
            'amount'         => $request->amount,
            'user_id'        => Auth::id(),
            'project_id'     => $request->project_id,
            'note'           => $request->note,
            'safe_id'        => $request->safe_id ,
            'type'           => 'other'
        ]);

        return redirect()->back()->with(isCreated());
    }

    public function update(Request $request , $id){

        $request->validate([
            'date'           => 'required',
            'amount'         => 'required',
        ]);

        Expense::where('id',$id)->update([
            'date'           => $request->date,
            'amount'         => $request->amount,
            'note'           => $request->note,
        ]);

        return redirect()->back()->with(isUpdated());
    }
    public function destroy($id){
        //dd($id);
        Expense::FindOrFail($id)->delete();
        return redirect()->back()->with(isDeleted());
    }
}
