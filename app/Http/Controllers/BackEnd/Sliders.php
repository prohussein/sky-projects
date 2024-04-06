<?php

namespace App\Http\Controllers\BackEnd;
use Illuminate\Http\Request;
use App\Models\Slider;
use Image;
class Sliders extends BackEndController
{
    public function __construct(Slider $model)
    {
        
        $this->middleware('permission:read_sliders')->only(['index']);
        $this->middleware('permission:create_sliders')->only(['create','store']);
        $this->middleware('permission:update_sliders')->only(['edit', 'store']);
        $this->middleware('permission:delete_sliders')->only(['destroy']);
        parent::__construct($model);
    }//end of construct 
   
    public function store(Request $request)
    { 
         $request->validate([
          'photo' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
            
        ]);   
         
        //dd($request->photo);
        $file     = $request->file('photo');                                     
        $fileName = time().str_random('10').'.'.$file->getClientOriginalName();
        $img      = Image::make($request->file('photo'));
        $img->fit(1920, 700);
        $img->save(public_path('uploads/sliders/'. $fileName));
        
        // $file_photo = $this->uploadImage($request);
       
          
        $requestArray = ['created_by' => auth()->user()->id , 'photo' => $fileName] + $request->all() ;
           // dd($requestArray);
        $row =  $this->model->create($requestArray);
        //$slider =   Slider::create($request->all());

        return redirect()->route('dashboard.sliders.index')->with(isCreated());
    }// end of store

    public function update(Request $request, Slider $slider)
    {

         $request->validate([
            
        ]);
        
      
        $requestArray = $request->all();
           
          if ($request->hasFile('photo')) {
                
                    $fileName = $this->uploadImage($request);
            
            $requestArray = ['photo' => $fileName] + $requestArray;
            }

            $row =  $this->model->FindOrFail($slider->id);
            

           
                
                $row->update($requestArray);




        //$slider->update($request->all());

        return redirect()->route('dashboard.sliders.index')->with(isUpdated());

    }// end of update 

    protected function uploadImage($request){

        $file = $request->file('photo');                                          
        $fileName = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/sliders'), $fileName);

        return $fileName ;

    }// end of upload image 
}// end of controller 