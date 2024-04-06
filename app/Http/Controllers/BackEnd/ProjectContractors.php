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

        Expense::create([
            'date'            => $request->date,
            'amount'          => $request->amount,
            'reference'       => $request->reference,
            'user_id'         => Auth::id(),
            'project_id'      => $request->project_id,
            'safe_id'        => $request->safe_id,
            'subcontractor_id'=> $request->subcontractor_id,
            'type'            => 'subcontractor'
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

        Expense::where('id', $id)->update([
            'date'            => $request->date,
            'amount'          => $request->amount,
            'reference'       => $request->reference,
            'user_id'         => Auth::id(),
            'subcontractor_id'=> $request->subcontractor_id,
        ]);

        return redirect()->back()->with(isUpdated());
    }
    public function destroyRevenue($id)
    {
        //dd($id);
        Expense::FindOrFail($id)->delete();
        return redirect()->back()->with(isDeleted());
    }
}
