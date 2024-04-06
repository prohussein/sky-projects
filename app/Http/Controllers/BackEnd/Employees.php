<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;
use App\Models\Employee;
use Carbon\Carbon;
 
class Employees extends BackEndController
{
    public function __construct(Employee $model)
    {
        $this->middleware('permission:read_employees')->only(['index']);
        $this->middleware('permission:create_employees')->only(['create', 'store']);
        $this->middleware('permission:update_employees')->only(['edit', 'store']);
        $this->middleware('permission:delete_employees')->only(['destroy']);
        parent::__construct($model);
    } //end of construct



    public function store(Request $request)
    {
        $request->validate([
            'name'       => 'required',
        ]);

        $code = 'emp-' . maxId('App\Models\Employee');
        $fileName = '';
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/employees'), $fileName);


        }
        $requestArray = ['code' => $code , 'file'=> $fileName] + $request->all();

        $row =  $this->model->create($requestArray);


        return redirect()->route('dashboard.employees.index')->with(isCreated());
    } // end of store

    public function update(Request $request, Employee $employee)
    {
        $request->validate([
            'name'       => 'required',
        ]);

        $requestArray = $request->all();
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/employees'), $fileName);
            $requestArray = ['file' => $fileName] + $request->all();
        }

        $row =  $this->model->FindOrFail($request->id);
        $row->update($requestArray);


        return redirect()->route('dashboard.employees.index')->with(isUpdated());
    } // end of update

}
