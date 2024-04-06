<?php

namespace App\Http\Controllers\BackEnd;

use App\Models\Category;
use App\Models\Brand;
use Illuminate\Http\Request;

class Categories extends BackEndController 
{
    public function __construct(Category $model)
    {
        
        $this->middleware('permission:read_categories')->only(['index']);
        $this->middleware('permission:create_categories')->only(['create','store']);
        $this->middleware('permission:update_categories')->only(['edit', 'store']);
        $this->middleware('permission:delete_categories')->only(['destroy']);
        parent::__construct($model);
    }//end of construct 
   
    public function store(Request $request)
    { 
        $request->validate([
            'name_en' => 'required|unique:categories,name_en',
            'name_ar' => 'required|unique:categories,name_ar',
            'photo' => 'required',
          
        ]);  

         $file_photo = $this->uploadImage($request);
       
           // dd($file_photo);
        $requestArray = [ 'photo' => $file_photo] + $request->all() ;
           //dd($requestArray);
        $row =  $this->model->create($requestArray);
        
        //$category =   Category::create($request->all());
        
       
        return redirect()->route('dashboard.categories.index')->with(isCreated());
    }// end of store

    public function update(Request $request, Category $category)
    {
         $request->validate([
            'name_en' => 'required|unique:categories,name_en,' . $category->id,
            'name_ar' => 'required|unique:categories,name_ar,' . $category->id,
        ]);
        //dd($request->all());

         $requestArray = $request->all();
           
          if ($request->hasFile('photo')) {
                
                    $fileName = $this->uploadImage($request);
            
            $requestArray = ['photo' => $fileName] + $requestArray;
            }

            $row =  $this->model->FindOrFail($category->id);
            
                $row->update($requestArray);

       
       // $category->update($request->all());

        
        return redirect()->route('dashboard.categories.index')->with(isUpdated());

    }// end of update 

     protected function uploadImage($request){

        $file = $request->file('photo');                                          
        $fileName = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/categories/photos'), $fileName);

        return $fileName ;

    }// end of upload image 

    

}//en of controller 
