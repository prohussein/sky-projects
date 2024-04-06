<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Certificate;
use Image;

class Certificates extends BackEndController
{
    public function __construct(Certificate $model)
    {
        
        $this->middleware('permission:read_certificates')->only(['index']);
        $this->middleware('permission:create_certificates')->only(['create','store']);
        $this->middleware('permission:update_certificates')->only(['edit', 'store']);
        $this->middleware('permission:delete_certificates')->only(['destroy']);
        parent::__construct($model);
    }//end of construct 
    
    public function store(Request $request)
    { 
        $request->validate([
           
            'photo' => 'required',
        ]);  
        //dd($request->all()) ;
        $file     = $request->file('photo');                                     
        $fileName = time().str_random('10').'.'.$file->getClientOriginalName();
        $img      = Image::make($request->file('photo'));
        $img->fit(700, 530);
        $img->save(public_path('uploads/certificates/'. $fileName));
         //$file_photo = $this->uploadImage($request);
       
           // dd($file_photo);
        $requestArray = ['photo' => $fileName] + $request->all() ;
           // dd($requestArray);
        $row =  $this->model->create($requestArray);
       
       
        return redirect()->route('dashboard.certificates.index')->with(isCreated());
    }// end of store

    public function update(Request $request, Certificate $certificate)
    {

         $request->validate([
            
        ]);
        
      
        $requestArray = $request->all();
           
          if ($request->hasFile('photo')) {
                
                    $fileName = $this->uploadImage($request);
            
            $requestArray = ['photo' => $fileName] + $requestArray;
            }

            $row =  $this->model->FindOrFail($certificate->id);
    
                $row->update($requestArray);

        return redirect()->route('dashboard.certificates.index')->with(isUpdated());

    }// end of update 

    protected function uploadImage($request){

        $file = $request->file('photo');                                          
        $fileName = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/certificates'), $fileName);

        return $fileName ;

    }// end of upload image 
}// end of controller 