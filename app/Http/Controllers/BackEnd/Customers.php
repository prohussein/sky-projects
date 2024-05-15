<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;
use App\Models\Customer;
use Carbon\Carbon;

class Customers extends BackEndController
{
    public function __construct(Customer $model)
    {
        // $this->middleware('permission:read_customers')->only(['index']);
        // $this->middleware('permission:create_customers')->only(['create','store']);
        // $this->middleware('permission:update_customers')->only(['edit', 'store']);
        // $this->middleware('permission:delete_customers')->only(['destroy']);
        parent::__construct($model);
    }//end of construct



    public function store(Request $request)
    {
        $request->validate([
            'name'       => 'required',
        ]);

        $code = 'cust-' . maxId('App\Models\Customer');

        $requestArray = ['code' => $code] + $request->all() ;

        $row =  $this->model->create($requestArray);


        return redirect()->route('dashboard.customers.index')->with(isCreated());
    }// end of store

    public function update(Request $request, Customer $customer)
    {
         // dd($request->id);
         $request->validate([
            'name'       => 'required',


        ]);

            $requestArray = $request->all();
            $row =  $this->model->FindOrFail($request->id);
            $row->update($requestArray);


        return redirect()->route('dashboard.customers.index')->with(isUpdated());

    }// end of update

}
