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
        //dd($request->all());
        $request->validate([
            'material_name'  => 'required',
            'date'           => 'required',
            'material_qty'   => 'required',
            'amount'         => 'required',
            'project_id'     => 'required',
            'safe_id'        => 'required',
        ]);
        $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;
        // handle safes
        if ($safeBalance >= $request->amount ) {
            $safeBalanceAfter = $safeBalance - $request->amount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfter
            ]);
        }else{
            return back()->with(isOverAmount());
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
        $row =  Expense::FindOrFail($id) ;

        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/projects/materials'), $fileName);
        }else{
            $fileName =  $row->file ;
        }

        //handle safes

        if ($request->safe_id == $row->safe_id) {

            $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance + $row->amount;

            if ($safeBalance >= $request->amount) {

                Safe::where('id', $row->safe_id)->update([
                    'balance' => Safe::where('id', $row->safe_id)->first()->balance + $row->amount
                ]);

                $safeBalanceAfterTransaction = $safeBalance - $request->amount;
                Safe::where('id', $request->safe_id)->update([
                    'balance' => $safeBalanceAfterTransaction
                ]);
            }else {
                return redirect()->back()->with(noMoneyInSafe());
            }

        }elseif ($request->safe_id != $row->safe_id) {

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

        $row->update($requestAray) ;


        return redirect()->back()->with(isUpdated());
    }
    public function destroy($id){


        $row =   Expense::FindOrFail($id);
        $safeBalance = Safe::where('id', $row->safe_id)->first()->balance ;
        $total = $safeBalance +  $row->amount ;
        
        Safe::where('id', $row->safe_id)->update([
            'balance' =>   $total
        ]);
        $row->delete();
        return redirect()->back()->with(isDeleted());
    }

    protected function updateSafeAmount($request,$row){

        if($request->safe_id == $row->safe_id){
            //dd('1');
            Safe::where('id', $row->safe_id)->update([
                'balance' => Safe::where('id', $row->safe_id)->first()->balance + $row->amount
            ]);

            $safeBalance              = Safe::where('id', $row->safe_id)->first()->balance;

            //dd('safe = '. $safeBalance . 'request Amount = '. $request->amount);

           if($safeBalance > $request->amount){
                $safeBalanceAfterTransaction = $safeBalance - $request->amount;
                Safe::where('id', $request->safe_id)->update([
                    'balance' => $safeBalanceAfterTransaction
                ]);
            }else{
                return redirect()->back()->with(noMoneyInSafe());
            }



        }elseif($request->safe_id != $row->safe_id){

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
    }

    public function getProjectSafes(Request $request)
    {
        if (!$request->project_id) {
            $html = '<option value=""> اختر الخزنة </option>';
        } else {
            $html = '';
            $safes = Safe::where([['user_id', Auth::user()->id], ['project_id', $request->project_id]])->get();
            foreach ($safes as $safe) {
                $html .= '<option value="' . $safe->id . '">' . $safe->name . ' [ ' . $safe->balance . ' ]' . '</option>';
            }
        }



        return response()->json(['html' => $html]);
    }
}
