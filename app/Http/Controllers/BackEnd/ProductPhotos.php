<?php

namespace App\Http\Controllers\BackEnd;

use App\Models\Product;
use App\Models\ProductPhoto;
use Illuminate\Http\Request;

class ProductPhotos extends BackEndController
{
     public function __construct(ProductPhoto $model)
    {
         
        $this->middleware('permission:read_products')->only(['index']);
        $this->middleware('permission:create_products')->only(['create','store']);
        $this->middleware('permission:update_products')->only(['edit', 'store']);
        $this->middleware('permission:delete_products')->only(['destroy']);
        parent::__construct($model);
    }//end of construct 
    protected function append(){
       $products = Product::get();
       return ['products' => $products] ;
    }// to add paremater in controller 

    public function store(Request $request)
    { 
        //dd($request->all());
        $request->validate([
            'photo' => 'required',
            'product_id' => 'required',

        ]);  
        //dd($this->uploadImage($request));
        $file_photo = $this->uploadImage($request);
       
           // dd($file_photo);
        $requestArray = [ 'photo' => $file_photo] + $request->all() ;
           //dd($requestArray);
        $row =  $this->model->create($requestArray);
 
       // $property =   Property::create($request->all());
        
        return redirect()->route('dashboard.productphotos.create')->with(isCreated());
    }// end of store


    public function update(Request $request, ProductPhoto $ProductPhoto, $id)
    {
         $request->validate([
            'photo' => 'required',
            'product_id' => 'required',
        ]);
        $row = $this->model->FindOrFail($id);
        //dd('PropertyPhoto::FindOrFail($propertyPhoto->id)');
        $requestArray = $request->all();
           
          if ($request->hasFile('photo')) {
                
                    $fileName = $this->uploadImage($request);
            
            $requestArray = ['photo' => $fileName] + $requestArray;
            }

            
           
                $row->update($requestArray);
                
        return redirect()->route('dashboard.productphotos.index')->with(isUpdated());

    }// end of update 
    

    protected function uploadImage($request){ 

        $file = $request->file('photo');                                          
        $fileName = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/products/photos'), $fileName);

        return $fileName ;

    }// end of upload image 

}//en of controller 
 