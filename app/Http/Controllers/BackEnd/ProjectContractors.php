<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Expense;
use App\Models\ProjectSubcontractor;
use App\Models\Safe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProjectContractors extends Controller
{
    public function store(Request $request){
        //dd($request->all());
        $request->validate([
            'amount'         => 'required',
            'project_id' => 'required',
            'start_date' => 'required',
            'subcontractor_id' => 'required',
        ]);
        $fileName = '';
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/subcontractors/projects'), $fileName);
        }

        // Check if a record with the same values already exists
        $existingRecord = ProjectSubcontractor::where([['project_id',$request->project_id],['subcontractor_id', $request->subcontractor_id]])->first();



        if (!$existingRecord) {
        ProjectSubcontractor::create([
            'subcontractor_id'   => $request->subcontractor_id,
            'amount'             => $request->amount,
            'project_id'         => $request->project_id,
            'notes'              => $request->notes,
            'start_date'         => $request->start_date,
            'file'               => $fileName,
            'end_date'           => $request->end_date,
        ]);

        return redirect()->back()->with(isCreated());
        } else {
            // Record already exists isExsit
            return redirect()->back()->with(isExsit());

        }


    }
    public function update(Request $request , $id){

        $request->validate([
            'amount'           => 'required',
            'start_date'       => 'required',
            'subcontractor_id' => 'required',

        ]);
        $requestArray = $request->all();

        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/subcontractors/projects'), $fileName);
            $requestArray = ['file' => $fileName] + $request->all();

        }

        $row =  ProjectSubcontractor::FindOrFail($id);
        $row->update($requestArray);


        return redirect()->back()->with(isUpdated());
    }
    public function destroy($id){
        //dd($id);
        ProjectSubcontractor::FindOrFail($id)->delete();
        return redirect()->back()->with(isDeleted());
    }

    /// handle revenus

    public function storeRevenu(Request $request)
    {
        //dd($request->all());
        $request->validate([
            'date'              => 'required',
            'amount'            => 'required',
            'subcontractor_id'  => 'required',
            'safe_id'           => 'required',
        ]);
        $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;

        // handle safes
        if ($safeBalance >= $request->amount) {

            $safeBalanceAfter = $safeBalance - $request->amount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfter
            ]);
        }else {
            return back()->with(isOverAmount());
        }

        $fileName = '';
        if ($request->has('file')) {
           // dd('d');
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/projects/contractorrevenu'), $fileName);
        }
        //dd($fileName);
        Expense::create([
            'date'            => $request->date,
            'amount'          => $request->amount,
            'reference'       => $request->reference,
            'user_id'         => Auth::id(),
            'project_id'      => $request->project_id,
            'safe_id'         => $request->safe_id,
            'subcontractor_id'=> $request->subcontractor_id,
            'type'            => 'subcontractor',
            'file'            => $fileName
        ]);

        return redirect()->back()->with(isCreated());
    }

    public function updateRevenue(Request $request, $id)
    {

        $request->validate([
            'date'              => 'required',
            'amount'            => 'required',
            'subcontractor_id'  => 'required',
        ]);

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

            $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance + $row->amount;

            if ($safeBalance > $request->amount) {

                Safe::where('id', $row->safe_id)->update([
                    'balance' => Safe::where('id', $row->safe_id)->first()->balance + $row->amount
                ]);

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
    public function destroyRevenue($id)
    {
        $row =   Expense::FindOrFail($id);
        Safe::where('id', $row->safe_id)->update([
            'balance' => Safe::where('id', $row->safe_id)->first()->balance + $row->amount
        ]);
        $row->delete();
        return redirect()->back()->with(isDeleted());
    }
}
