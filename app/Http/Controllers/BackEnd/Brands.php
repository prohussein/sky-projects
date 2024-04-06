<?php

namespace App\Http\Controllers\BackEnd;

use App\Models\Brand;
use Illuminate\Http\Request;

class Brands extends BackEndController 
{
    public function __construct(Brand $model)
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

        ]);  

        $brand =   Brand::create($request->all());
        
       
        return redirect()->route('dashboard.brands.index')->with(isCreated());
    }// end of store

    public function update(Request $request, Brand $brand)
    {
         $request->validate([
            'name_en' => 'required|unique:brands,name_en,' . $brand->id,
            'name_ar' => 'required|unique:brands,name_ar,' . $brand->id,
        ]);
        //dd($request->all());
        $brand->update($request->all());

        
        return redirect()->route('dashboard.brands.index')->with(isUpdated());

    }// end of update 

    

}//en of controller 
