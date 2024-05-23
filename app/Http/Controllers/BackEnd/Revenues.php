<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\Project;
use App\Models\Revenue;
use App\Models\Safe;
use Carbon\Carbon;

class Revenues extends BackEndController
{
    public function __construct(Revenue $model)
    {
        // $this->middleware('permission:read_revenues')->only(['index']);
        // $this->middleware('permission:create_revenues')->only(['create', 'store']);
        // $this->middleware('permission:update_revenues')->only(['edit', 'store']);
        // $this->middleware('permission:delete_revenues')->only(['destroy']);
        parent::__construct($model);
    } //end of construct


    protected function append()
    {
        $array =  [
            'customers' => Customer::all(['id', 'name']),
            'projects'  => Project::all(['id', 'name']),
            'safes'     => Safe::all(['id','name']),
        ];
        return $array;
    } // to add paremater in controller

    protected function with()
    {
      return  ['safe','customer','project'] ;
    }
    public function store(Request $request)
    {
        $request->validate([
            'project_id'        => 'required',
            'customer_id'       => 'required',
            'date'              => 'required',
            'total_amount'      => 'required',
            //'net_amount'        => 'required',
            'tax_amount'        => 'required',
            'safe_id'           => 'required',
        ]);

        $code = 'rev-' . maxId('App\Models\Revenue');

        $fileName = '';
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/revenues'), $fileName);
        }


        $requestArray = ['code' => $code , 'file' => $fileName] + $request->all();

        $row =  $this->model->create($requestArray);

        // dd($row->total_amount . ' ' . $row->tax_amount);
        // $safeBalance              = Safe::where('id', $row->safe_id)->first()->balance;
        // $safeBalanceAfterTransfer = $safeBalance + $row->net_amount;
        // Safe::where('id', $row->safe_id)->update([
        //     'balance' => $safeBalanceAfterTransfer
        // ]);


        return redirect()->route('dashboard.revenues.index')->with(isCreated());
    } // end of store

    public function update(Request $request, Revenue $revenue)
    {
        // dd($request->id);
        $request->validate([
            'project_id'        => 'required',
            'customer_id'       => 'required',
            'date'              => 'required',
            'total_amount'      => 'required',
           // 'net_amount'        => 'required',
            'tax_amount'        => 'required',
            'safe_id'           => 'required',
        ]);

        $netAmount = floatval($request->total_amount)  - floatval($request->tax_amount);
        //dd($netAmount);
        $requestArray = ['net_amount' => $netAmount] + $request->all();

        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/revenues'), $fileName);
            $requestArray = ['file' => $fileName] + $requestArray;
        }
        $row =  $this->model->FindOrFail($request->id);

        //dd($row->net_amount);

        if ($row->safe_id != null) {

            $safeBalance              = Safe::where('id', $row->safe_id)->first()->balance;
            $safeBalancBeforUpdate    = $safeBalance - $row->net_amount;
            Safe::where('id', $row->safe_id)->update([
                'balance' => $safeBalancBeforUpdate
            ]);
        }


        $row->update($requestArray);

        if ($request->safe_id) {
            $safeBalance              = Safe::where('id', $request->safe_id)->first()->balance;
            $safeBalanceAfterUpdate = $safeBalance + $netAmount;
            Safe::where('id', $request->safe_id)->update([
                'balance' => $safeBalanceAfterUpdate
            ]);
        }
        return redirect()->route('dashboard.revenues.index')->with(isUpdated());
    } // end of update

    public function getprojectsbelongCustomer(Request $request){
        if (!$request->customer_id) {
            $html = '<option value=""> اختر المشروع </option>';
        } else {
            $html = '<option value=""> اختر المشروع </option>';
            $projects = Project::where('customer_id' , $request->customer_id )->select('id','name')->get();
            foreach ($projects as $project) {
                $html .= '<option value="' . $project->id . '">' . $project->name . '</option>';
            }
        }
        return response()->json(['html' => $html]);
    }

    public function getMainSafeForproject(Request $request)
    {
        if (!$request->project_id) {
            $html = '<option value=""> اختر الخزنة </option>';
        } else {
            $html = '';
            $safes = Safe::where([['project_id', $request->project_id],['parent_id',null]])->select('id', 'name')->get();
            foreach ($safes as $safe) {
                $html .= '<option value="' . $safe->id . '">' . $safe->name . '</option>';
            }
        }
        return response()->json(['html' => $html]);
    }

    public function destroy($id)
    {
        $row =   $this->model->FindOrFail($id);

        $safeBalance       = Safe::where('id', $row->safe_id)->first()->balance;
        $newSafeBalance    = $safeBalance - $row->net_amount;
        Safe::where('id', $row->safe_id)->update([
            'balance' => $newSafeBalance
        ]);

        $row->delete();
        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.index')->with(isDeleted());
    }// end of destroy

}
