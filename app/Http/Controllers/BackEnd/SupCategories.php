<?php

namespace App\Http\Controllers\BackEnd;

use App\Models\Category;
use App\Models\Brand;
use App\Models\SupCategory;
use Illuminate\Http\Request;

class SupCategories extends  BackEndController 
{
    public function __construct(SupCategory $model)
    {
        
        $this->middleware('permission:read_categories')->only(['index']);
        $this->middleware('permission:create_categories')->only(['create','store']);
        $this->middleware('permission:update_categories')->only(['edit', 'store']);
        $this->middleware('permission:delete_categories')->only(['destroy']);
        parent::__construct($model);
    }//end of construct 
    protected function append(){

        $array =  [
            'categories' => Category::get(),
        ];

        return $array;
    }
    public function store(Request $request)
    { 
        $request->validate([
            'name_en' => 'required|unique:sup_categories,name_en',
            'name_ar' => 'required|unique:sup_categories,name_ar',

        ]);  

        $file_photo = $this->uploadImage($request);
       
           // dd($file_photo);
        $requestArray = [ 'photo' => $file_photo] + $request->all() ;
           //dd($requestArray);
        $row =  $this->model->create($requestArray);
        
        //$category =   Category::create($request->all());
        
        return redirect()->route('dashboard.supcategories.index')->with(isCreated());
    }// end of store

    public function update(Request $request, SupCategory $category)
    {
        $row_id = $request->row_id;
         $request->validate([
            'name_en' => 'required|unique:sup_categories,name_en,' . $row_id,
            'name_ar' => 'required|unique:sup_categories,name_ar,' . $row_id,
        ]);
        //dd($request->all());

         $requestArray = $request->all();
           
          if ($request->hasFile('photo')) {
                
                    $fileName = $this->uploadImage($request);
            
            $requestArray = ['photo' => $fileName] + $requestArray;
            }

            $row =  $this->model->FindOrFail($row_id);
            
                $row->update($requestArray);

       
       // $category->update($request->all());

        return redirect()->route('dashboard.supcategories.index')->with(isUpdated());

    }// end of update 

     protected function uploadImage($request){

        $file = $request->file('photo');                                          
        $fileName = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/supcategories/photos'), $fileName);

        return $fileName ;

    }// end of upload image 

    

}//en of controller 
