<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;
use App\Models\Asset;
use App\Models\Safe;
use Carbon\Carbon;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\AssetsExport;


use Illuminate\Support\Facades\Auth;

class Assets extends BackEndController
{
    public function __construct(Asset $model)
    {
        $this->middleware('permission:read_assets')->only(['index']);
        $this->middleware('permission:create_assets')->only(['create', 'store']);
        $this->middleware('permission:update_assets')->only(['edit', 'store']);
        $this->middleware('permission:delete_assets')->only(['destroy']);
        parent::__construct($model);
    } //end of construct

    public function index(Request $request)
    {

        $rows  = $this->model;
        $rows  = $this->fillter($rows);
        $with  = $this->with();
        if (!empty($with)) {
            $rows = $rows->with($with);
        }
        if($request->type){
            $rows = $rows->where('type',$request->type);
        }


        $rows = $rows->orderBy('id', 'desc')->get();
        //dd($rows);

        $routeName = $this->getClassNameFromModel();
        return view('backend.' . $routeName . '.index', compact('rows', 'routeName','request'));
    }// end of index
    protected function append()
    {

        $array =  [
            'safes' => Safe::where('type', '!=' , 'custody')->get(),
        ];

        return $array;
    } // to add paremater in controller

    protected function with()
    {
        return ['safe'];
    }// to add paremater in controller


    public function store(Request $request)
    {
        $request->validate([
            'name'       => 'required',
            'amount'     => 'required',
            'type'       => 'required',
            'safe_id'    => ['required_if:type,cash'],
        ]);

        $fileName = '';
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/assets'), $fileName);
        }

        $requestArray = ['added_by' => Auth::id(),'file'=> $fileName] + $request->all();

        $row =  $this->model->create($requestArray);

        if ($request->safe_id && $request->type == 'cash') {
            $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;
            $safeBalanceAfterTransfer = $safeBalance + $request->amount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfterTransfer
            ]);
        }

        return redirect()->route('dashboard.assets.index')->with(isCreated());
    } // end of store

    public function update(Request $request, Asset $asset)
    {
        $request->validate([
            'name'       => 'required',
            'amount'     => 'required',
            'type'       => 'required',
            'safe_id'    => ['required_if:type,cash'],
        ]);

        $requestArray = $request->all();

        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/assets'), $fileName);
            $requestArray = ['file' => $fileName] + $request->all();
        }

        $row =  $this->model->FindOrFail($request->id);

        if ($row->safe_id != null) {

            $safeBalance              = Safe::where('id', $row->safe_id)->first()->balance;
            $safeBalancBeforUpdate    = $safeBalance - $row->amount;
            Safe::where('id', $row->safe_id)->update([
                'balance' => $safeBalancBeforUpdate
            ]);

        }

        $row->update($requestArray);

        if ($request->safe_id && $request->type == 'cash') {
            $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;
            $safeBalanceAfterUpdate = $safeBalance + $request->amount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfterUpdate
            ]);
        }

        return redirect()->route('dashboard.assets.index')->with(isUpdated());
    } // end of update

    public function exportToExcel()
    {
        return (new AssetsExport)->download('assets.xlsx');


    }

    public function destroy($id)
    {
        // return balance to previous value

        $row =  $this->model->FindOrFail($id);

        if ($row->safe_id != null) {

            $safeBalance              = Safe::where('id', $row->safe_id)->first()->balance;
            $safeBalancBeforUpdate    = $safeBalance - $row->amount;
            Safe::where('id', $row->safe_id)->update([
                'balance' => $safeBalancBeforUpdate
            ]);
        }

        $row->delete();


        return redirect()->route('dashboard.assets.index')->with(isDeleted());
    }// end of destroy


}
