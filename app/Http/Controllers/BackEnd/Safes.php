<?php

namespace App\Http\Controllers\BackEnd;

use App\Models\Employee;
use Illuminate\Http\Request;
use App\Models\Safe;
use App\Models\User;
use Carbon\Carbon;

class Safes extends BackEndController
{
    public function __construct(Safe $model)
    {
        // $this->middleware('permission:read_safes')->only(['index']);
        // $this->middleware('permission:create_safes')->only(['create', 'store']);
        // $this->middleware('permission:update_safes')->only(['edit', 'store']);
        // $this->middleware('permission:delete_safes')->only(['destroy']);
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
        if ($request->type) {
            $rows = $rows->where('type', $request->type);
        }


        $rows = $rows->orderBy('id', 'desc')->get();
        //dd($rows);

        $routeName = $this->getClassNameFromModel();
        return view('backend.' . $routeName . '.index', compact('rows', 'routeName', 'request'));
    }// end of index

    protected function append()
    {
        $array =  [
            'users' => Employee::all(['id','name']),
        ];
        return $array;
    } // to add paremater in controller

    protected function with()
    {
        return ['employee'];
    }// to add paremater in controller


    public function store(Request $request)
    {
        $request->validate([
            'name'       => 'required',
            'user_id'    => 'required',
            'type'       => 'required',
        ]);


        $requestArray =  $request->all();

        $row =  $this->model->create($requestArray);


        return redirect()->route('dashboard.safes.index')->with(isCreated());
    } // end of store

    public function update(Request $request, Safe $asset)
    {
        $request->validate([
            'name'       => 'required',
            'user_id'    => 'required',
            'type'       => 'required',
        ]);

        $requestArray = $request->all();


        $row =  $this->model->FindOrFail($request->id);
        $row->update($requestArray);


        return redirect()->route('dashboard.safes.index')->with(isUpdated());
    } // end of update

}
