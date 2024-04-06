<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Brand;
use App\Models\SupCategory;
use App\Models\SupsupCategory;

class SupsupCategories extends BackEndController 
{
    public function __construct(SupsupCategory $model)
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
            'name_en' => 'required|unique:supsup_categories,name_en',
            'name_ar' => 'required|unique:supsup_categories,name_ar',

        ]);  

        $data  = new  SupsupCategory();

        $data->name_ar	     = $request->name_ar;
        $data->name_en       = $request->name_en;
        $data->sub_category  = $request->sup_category;
        $data->category      = $request->cat_id;
       
      
        $data->save();

        return redirect()->route('dashboard.supsupcategories.index')->with(isCreated());
    }// end of store

    public function update(Request $request, SupsupCategory $category)
    {
         $request->validate([
            'name_en' => 'required|unique:supsup_categories,name_en,' . $category->id,
            'name_ar' => 'required|unique:supsup_categories,name_ar,' . $category->id,
        ]);
       // dd($request->row_id);

       $row_id = $request->row_id;
       $data = SupsupCategory::find($row_id);
        $data->name_ar	     = $request->name_ar;
        $data->name_en       = $request->name_en;
        $data->sub_category  = $request->sup_category;
        $data->category      = $request->cat_id;
    
    $data->save();
       
    // $category->update($request->all());

        return redirect()->route('dashboard.supsupcategories.index')->with(isUpdated());

    }// end of update 

}//en of controller 
