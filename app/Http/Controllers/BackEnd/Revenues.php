<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\Project;
use App\Models\Revenue;
use Carbon\Carbon;

class Revenues extends BackEndController 
{
    public function __construct(Revenue $model)
    {
        $this->middleware('permission:read_revenues')->only(['index']);
        $this->middleware('permission:create_revenues')->only(['create', 'store']);
        $this->middleware('permission:update_revenues')->only(['edit', 'store']);
        $this->middleware('permission:delete_revenues')->only(['destroy']);
        parent::__construct($model);
    } //end of construct


    protected function append()
    {
        $array =  [
            'customers' => Customer::all(['id', 'name']),
            'projects'  => Project::all(['id', 'name']),
        ];
        return $array;
    } // to add paremater in controller


    public function store(Request $request)
    {
        $request->validate([
            'project_id'        => 'required',
            'customer_id'       => 'required',
            'date'              => 'required',
            'total_amount'      => 'required',
            'net_amount'        => 'required',
            'tax_amount'        => 'required',
        ]);

        $code = 'rev-' . maxId('App\Models\Revenue');

        $requestArray = ['code' => $code] + $request->all();

        $row =  $this->model->create($requestArray);


        return redirect()->route('dashboard.revenues.index')->with(isCreated());
    } // end of store

    public function update(Request $request, Revenue $revenue)
    {
        // dd($request->id);
        $request->validate([
            'name'       => 'required',
        ]);

        $requestArray = $request->all();
        $row =  $this->model->FindOrFail($request->id);
        $row->update($requestArray);

        return redirect()->route('dashboard.revenues.index')->with(isUpdated());
    } // end of update

}
