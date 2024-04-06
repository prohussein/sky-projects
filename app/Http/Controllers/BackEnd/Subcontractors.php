<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;
use App\Models\Subcontractor;
use Carbon\Carbon;

class Subcontractors extends BackEndController
{
    public function __construct(Subcontractor $model)
    {
        $this->middleware('permission:read_subcontractors')->only(['index']);
        $this->middleware('permission:create_subcontractors')->only(['create', 'store']);
        $this->middleware('permission:update_subcontractors')->only(['edit', 'store']);
        $this->middleware('permission:delete_subcontractors')->only(['destroy']);
        parent::__construct($model);
    } //end of construct



    public function store(Request $request)
    {
        $request->validate([
            'name'       => 'required',
        ]);

        $code = 'cont-' . maxId('App\Models\Subcontractor');
        $fileName = '';
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/subcontractors'), $fileName);

           // $filePath  = public_path('uploads/subcontractors/' . $fileName) ;

        }
       // dd($filePath);
        $requestArray = ['code' => $code , 'file'=> $fileName] + $request->all();

        $row =  $this->model->create($requestArray);


        return redirect()->route('dashboard.subcontractors.index')->with(isCreated());
    } // end of store

    public function update(Request $request, Subcontractor $subcontractor)
    {
        // dd($request->id);
        $request->validate([
            'name'       => 'required',

        ]);
        $requestArray = $request->all();
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/subcontractors'), $fileName);
            $requestArray = ['file' => $fileName] + $request->all();
        }

        $row =  $this->model->FindOrFail($request->id);
        $row->update($requestArray);


        return redirect()->route('dashboard.subcontractors.index')->with(isUpdated());
    } // end of update

}
