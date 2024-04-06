<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Offer;
use App\Models\PropertyType;
use App\Models\Category;
use Carbon\Carbon;

class Offers extends BackEndController
{
     public function __construct(Offer $model)
    {
        
        $this->middleware('permission:read_offers')->only(['index']);
        $this->middleware('permission:create_offers')->only(['create','store']);
        $this->middleware('permission:update_offers')->only(['edit', 'store']);
        $this->middleware('permission:delete_offers')->only(['destroy']);
        parent::__construct($model);
    }//end of construct 

     protected function append(){

        $array =  [
            'categories' => Category::get(),
            'types' => PropertyType::get(),
           
           
        ];
       
        return $array;
       
    }// to add paremater in controller
    public function store(Request $request)
    { 
        $request->validate([
           // 'name_en' => 'required|unique:categories,name_en',
           'name_en' => 'required', 
           'name_ar' => 'required',
           'desc_ar' => 'required',
           'desc_en' => 'required'

        ]);  

       $requestArray = $request->all();
                //dd($requestArray);
            if ($request->hasFile('photo')) {
                
                    $fileName = $this->uploadImage($request);
            
            $requestArray = ['photo' => $fileName] + $requestArray;
            }

            if ($request->hasFile('photo1')) {
                
                    $fileName1 = $this->uploadImage1($request);
            
            $requestArray = ['photo1' => $fileName1] + $requestArray;
            }

            if ($request->hasFile('photo2')) {
                
                    $fileName2 = $this->uploadImage2($request);
            
            $requestArray = ['photo2' => $fileName2] + $requestArray;
            }

            if ($request->hasFile('photo3')) {
                
                    $fileName3 = $this->uploadImage3($request);
            
            $requestArray = ['photo3' => $fileName3] + $requestArray;
            }

            if ($request->hasFile('photo4')) {
                
                    $fileName4 = $this->uploadImage4($request);
            
            $requestArray = ['photo4' => $fileName4] + $requestArray;
            }
        $row =  $this->model->create($requestArray);
      
        // $this->syncTags($row , $requestArray);
      
        return redirect()->route('dashboard.offers.index')->with(isCreated());
    }// end of store 

     
    public function update(Request $request, Offer $offer)
    {
         $request->validate([
            
        ]);

       $requestArray = $request->all();
                //dd($requestArray);
            if ($request->hasFile('photo')) {
                
                    $fileName = $this->uploadImage($request);
            
            $requestArray = ['photo' => $fileName] + $requestArray;
            }

            if ($request->hasFile('photo1')) {
                
                    $fileName1 = $this->uploadImage1($request);
            
            $requestArray = ['photo1' => $fileName1] + $requestArray;
            }

            if ($request->hasFile('photo2')) {
                
                    $fileName2 = $this->uploadImage2($request);
            
            $requestArray = ['photo2' => $fileName2] + $requestArray;
            }

            if ($request->hasFile('photo3')) {
                
                    $fileName3 = $this->uploadImage3($request);
            
            $requestArray = ['photo3' => $fileName3] + $requestArray;
            }

            if ($request->hasFile('photo4')) {
                
                    $fileName4 = $this->uploadImage4($request);
            
            $requestArray = ['photo4' => $fileName4] + $requestArray;
            }

         $row =  $this->model->FindOrFail($offer->id);
            

           
                
                $row->update($requestArray);
       
        return redirect()->route('dashboard.products.index')->with(isUpdated());

    }// end of update 

     protected function uploadImage($request){

        $file = $request->file('photo');                                          
        $fileName = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/offers'), $fileName);

        return $fileName ;

    }// end of upload image 

     protected function uploadImage1($request){

        $file = $request->file('photo1');                                          
        $fileName1 = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/offers'), $fileName1);

        return $fileName1 ;

    }// end of upload image 

     protected function uploadImage2($request){

        $file = $request->file('photo2');                                          
        $fileName2 = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/offers'), $fileName2);

        return $fileName2 ;

    }// end of upload image
     protected function uploadImage3($request){

        $file = $request->file('photo3');                                          
        $fileName3 = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/offers'), $fileName3);

        return $fileName3 ;

    }// end of upload image 
    
     protected function uploadImage4($request){

        $file = $request->file('photo4');                                          
        $fileName4 = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/offers'), $fileName4);

        return $fileName4 ;

    }// end of upload image 

   
}
