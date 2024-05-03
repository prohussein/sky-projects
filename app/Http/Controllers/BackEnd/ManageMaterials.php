<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Expense;
use App\Models\Safe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ManageMaterials extends Controller
{
    public function store(Request $request){
       // dd($request->all());
        $request->validate([
            'material_name'  => 'required',
            'date'           => 'required',
            'material_qty'   => 'required',
            'amount'         => 'required',
            'project_id'     => 'required',
            'safe_id'        => 'required',
        ]);

        // handle safes
        if ($request->safe_id && $request->amount > 0) {

            $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;
            $safeBalanceAfter = $safeBalance - $request->amount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfter
            ]);
        }
        // handle file 

        $fileName = '';
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/projects/materials'), $fileName);
        }
      
        Expense::create([
            'material_name'  => $request->material_name,
            'date'           => $request->date,
            'material_qty'   => $request->material_qty,
            'amount'         => $request->amount,
            'user_id'        => Auth::id(),
            'project_id'     => $request->project_id,
            'note'           => $request->note,
            'type'           => 'materials',
            'safe_id'        => $request->safe_id,
            'file'           => $fileName
        ]);

        return redirect()->back()->with(isCreated());
    }

    public function update(Request $request , $id){

        $request->validate([
            'material_name'  => 'required',
            'date'           => 'required',
            'material_qty'   => 'required',
            'amount'         => 'required',
        ]);

        Expense::where('id',$id)->update([
            'material_name'  => $request->material_name,
            'date'           => $request->date,
            'material_qty'   => $request->material_qty,
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
