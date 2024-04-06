<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Page;
use Illuminate\Http\Request;

class Pages extends BackEndController
{
    public function __construct(Page $model)
    {

        $this->middleware('permission:read_pages')->only(['index']);
        $this->middleware('permission:create_pages')->only(['create','store']);
        $this->middleware('permission:update_pages')->only(['edit', 'store']);
        $this->middleware('permission:delete_pages')->only(['destroy']);
        parent::__construct($model);
    }//end of construct

    public function store(Request $request)
    {
        $request->validate([
            'name_en' => 'required',
            'name_ar' => 'required',

            'content_ar' => 'required',
            'content_en' => 'required',

        ]);

        $file_photo = $this->uploadImage($request);

            //dd($fileName);
        $requestArray = [ 'photo' => $file_photo ] + $request->all() ;
           // dd($requestArray);
        $row =  $this->model->create($requestArray);


        return redirect()->route('dashboard.pages.index')->with(isCreated());
    }// end of store

    public function update(Request $request, Page $page)
    {
         $request->validate([
            'name_en' => 'required',
            'name_ar' => 'required',
             'content_ar' => 'required',
            'content_en' => 'required',
           
        ]);
        //dd($request->all());
           $requestArray = $request->all();
                //dd($requestArray);
            if ($request->hasFile('photo')) {

                    $fileName = $this->uploadImage($request);

            $requestArray = ['photo' => $fileName] + $requestArray;
            }

            $row =  $this->model->FindOrFail($page->id);

            $row->update($requestArray);

        return redirect()->route('dashboard.pages.index')->with(isUpdated());

    }// end of update


     protected function uploadImage($request){

        $file = $request->file('photo');
        $fileName = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/pages'), $fileName);

        return $fileName ;

    }// end of upload image



}//en of controller
