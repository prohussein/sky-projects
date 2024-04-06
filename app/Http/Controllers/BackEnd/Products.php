<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Tag;
use App\Models\Category;
use App\Models\SupCategory;
use App\Models\SupsupCategory;
use App\Models\Brand;
use App\Models\Type;
use App\Models\ProductPhoto;
use DB;
use Image;
class Products extends  BackEndController
{
     public function __construct(Product $model)
    {

        $this->middleware('permission:read_products')->only(['index']);
        $this->middleware('permission:create_products')->only(['create','store']);
        $this->middleware('permission:update_products')->only(['edit', 'store']);
        $this->middleware('permission:delete_products')->only(['destroy']);
        parent::__construct($model);
    }//end of construct

     protected function append(){

        $array =  [
            'categories' => Category::get(),
            'tags' => Tag::get(),
            'selectedTags' => [], 
            'brands' => Brand::get(),
        ];

        if(request()->route()->parameter('product')){

            $array['selectedTags']  = $this->model->find(request()->route()->parameter('product'))
                ->tags()->pluck('tags.id')->toArray();

        }
        return $array;

    }// to add paremater in controller

    public function store(Request $request)
    {
        $request->validate([

           'name_en' => 'required',
           'name_ar' => 'required',
           'desc_ar' => 'required',
           'desc_en' => 'required',
           'photo'   => 'required',
           'pdf'     => 'mimes:pdf',

        ]);



        // dd($requestArray);
         if ($request->hasFile('photo')) {

            $file     = $request->file('photo');
            $fileName1 = time().str_random('10').'.'.$file->getClientOriginalName();
            $img      = Image::make($request->file('photo'));
            $img->fit(300, 300);
            $img->save(public_path('uploads/products/'. $fileName1));

            $requestArray = [ 'photo' => $fileName1] ;

        }
        // $file_photo = $this->uploadImage($request);

            //dd($fileName);
            if ($request->hasFile('pdf')) {

            $pdf = $this->uploadPdf($request);

           // dd($pdf);
            //$requestArray = [ 'pdf' => $pdf] + $request->all() ;
             $requestArray += [ 'pdf' => $pdf ] ;

         }

           $requestArray += $request->all() ;

            //dd($requestArray);
        $row =  $this->model->create($requestArray);

        $this->syncTags($row , $requestArray);



        if ($row && $request->images) {
            $num_items = count($request->images);
            for ($i = 0; $i < $num_items; $i++) {
                $img = $request->images[$i];
                $fileName     = time().str_random('10').'.'.$img->getClientOriginalName();
                $img          = Image::make($img);
                $img->fit(650, 650);
                $img->save(public_path('uploads/products/photos/'. $fileName));
                $productPhoto = new ProductPhoto() ;
                $productPhoto->product_id = $row->id;
                $productPhoto->photo = $fileName ;
                $productPhoto->save();

            }
        }


        return redirect()->route('dashboard.products.index')->with(isCreated());
    }// end of store


    public function update(Request $request, Product $product)
    {
         $request->validate([
            'name_en' => 'required',
           'name_ar' => 'required',

        ]);

       $requestArray = $request->all();
            //dd($requestArray);

        if ($request->hasFile('photo')) {
            $file     = $request->file('photo');
            $fileName1 = time().str_random('10').'.'.$file->getClientOriginalName();
            $img      = Image::make($request->file('photo'));
            $img->fit(300, 300);
            $img->save(public_path('uploads/products/'. $fileName1));
            $requestArray = ['photo' => $fileName1] + $requestArray;
        }

         if ($request->hasFile('pdf')) {

            $pdf = $this->uploadPdf($request);

            //dd($pdf);
            //$requestArray = [ 'pdf' => $pdf] + $request->all() ;

             $requestArray = [ 'pdf' => $pdf ]  + $requestArray;
             //dd($requestArray) ;

         }






          //  dd($product->id);
         $row =  $this->model->FindOrFail($product->id);


        $row->update($requestArray);
        $this->syncTags($row , $requestArray);
        return redirect()->route('dashboard.products.index')->with(isUpdated());

    }// end of update

     protected function uploadImage($request){

        $file = $request->file('photo');
        $fileName = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/products'), $fileName);

        return $fileName ;

    }// end of upload image

     protected function uploadPdf($request){

        //dd($request->file('pdf'));
       // $uniqueFileName = uniqid() . $request->file('pdf')->getClientOriginalName() . '.' . $request->file('pdf')->getClientOriginalExtension();

       // dd($uniqueFileName);
       // $request->file('pdf')->move(public_path('uploads/products/pdf/') . $uniqueFileName);

        //return  $uniqueFileName ;

         $file = $request->file('pdf');
        $pdfname = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/products/pdf/'), $pdfname);

        return $pdfname ;

        // $file = $request->file('pdf');
        // $pdfname = time().str_random('10').'.'.$file->getClientOriginalExtension();
        // $file->move(public_path('uploads/products/pdf/'), $pdfname);

        //return $pdfname ;

    }// end of upload image


    protected function syncTags($row , $requestArray){

        if (isset($requestArray['tags']) && !empty($requestArray['tags'])) {
            $row->tags()->sync($requestArray['tags']);
        }
    }

    public function destroy($id)
    {
       $this->model->FindOrFail($id)->delete();
       DB::table('product_photos')->where('product_id', '=', $id)->delete();
        return redirect()->route('dashboard.'.$this->getClassNameFromModel().'.index')->with(isDeleted());
    }// end of destroy




    public function selectSupcat(Request $request)
    {


        if (!$request->cat_id) {
            $html = '<option value=""> select sup category</option>';
        } else {
            $html = '';
            $sups = SupCategory::where('category_id', $request->cat_id)->get();
            foreach ($sups as $sup) {
                $html .= '<option value="'.$sup->id.'">'.$sup->name_ar.'</option>';
            }
        }

        return response()->json(['html' => $html]);
    }// end of select sup

    public function supSelectSupcat(Request $request){
          if (!$request->sup_category) {
            $html = '<option value=""> select sup sup_category</option>';
        } else {
            $html = '';
            $supcats = SupsupCategory::where('sub_category', $request->sup_category)->get();
            foreach ($supcats as $supcat) {
                $html .= '<option value="'.$supcat->id.'">'.$supcat->name_ar.'</option>';
            }
        }

        return response()->json(['html' => $html]);
    }// end of sup Select Supcat

    public function updateActive(Request $request){

        $product = Product::findOrFail($request->id);
        $product->active = $request->status;
        if($product->save()){
            return 1;
        }
        return 0;


    }// end of update Active

    public function updateFeatured(Request $request){

        $product = Product::findOrFail($request->id);
        $product->featured = $request->status;
        if($product->save()){
            return 1;
        }
        return 0;


    }// end of update Active

    public function addPhotos(Request $request){
       // dd($request->all());
        if($request->images){
            $num_items = count($request->images);
            for ($i = 0; $i < $num_items; $i++) {
                $img = $request->images[$i];
                $fileName     = time().str_random('10').'.'.$img->getClientOriginalName();
                $img          = Image::make($img);
                $img->fit(650, 650);
                $img->save(public_path('uploads/products/photos/'. $fileName));
                $productPhoto = new ProductPhoto() ;
                $productPhoto->product_id = $request->id;
                $productPhoto->photo = $fileName ;
                $productPhoto->save();

            }

            return redirect()->back()->with(isCreated());
        }

    }

    public function getPhotosById($id){
        $routeName = 'products' ;
        $photos =  DB::table("product_photos")->where('product_id', '=' , $id)->get();

        return \view('backend.products.photos', compact('photos','routeName','id'));
    }

      public function deletePhotos($id){
        ProductPhoto::find($id)->delete($id);
        return back();
    }


    public function deleteAll(Request $request)
    {
       // dd($request->ids);
        $ids = $request->ids;
        DB::table("product_photos")->whereIn('id',explode(",",$ids))->delete();
        return response()->json(['success'=>"Deleted successfully."]);

    }

}
