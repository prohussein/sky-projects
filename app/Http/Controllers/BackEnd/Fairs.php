<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Fair;
use App\Models\FairAttachment;
use DB;
Use Image;

class Fairs extends BackEndController
{
    public function __construct(Fair $model)
    {
        
        $this->middleware('permission:read_fairs')->only(['index']);
        $this->middleware('permission:create_fairs')->only(['create','store']);
        $this->middleware('permission:update_fairs')->only(['edit', 'store']);
        $this->middleware('permission:delete_fairs')->only(['destroy']);
        parent::__construct($model);
    }//end of construct 
   
    public function store(Request $request)
    { 
        $request->validate([
           
            'photo' => 'required',
        ]);   
         
         //$file_photo = $this->uploadImage($request);
        $file     = $request->file('photo');                                     
        $fileName = time().str_random('10').'.'.$file->getClientOriginalName();
        $img      = Image::make($request->file('photo'));
        $img->fit(350, 350);
        $img->save(public_path('uploads/fairs/'. $fileName));
           // dd($file_photo);
        $requestArray = ['photo' => $fileName] + $request->all() ;
           // dd($requestArray);
        $row =  $this->model->create($requestArray);
       
      
        return redirect()->route('dashboard.fairs.index')->with(isCreated());
    }// end of store

    public function update(Request $request, Fair $fair)
    {

         $request->validate([
            
        ]);
        
      
        $requestArray = $request->all();
           
          if ($request->hasFile('photo')) {

            $file     = $request->file('photo');                                     
            $fileName = time().str_random('10').'.'.$file->getClientOriginalName();
            $img      = Image::make($request->file('photo'));
            $img->fit(350, 350);
            $img->save(public_path('uploads/fairs/'. $fileName));
                
                    //$fileName = $this->uploadImage($request);
            
            $requestArray = ['photo' => $fileName] + $requestArray;
            }

            $row =  $this->model->FindOrFail($fair->id);
    
                $row->update($requestArray);

       
        return redirect()->route('dashboard.fairs.index')->with(isUpdated());

    }// end of update 

    protected function uploadImage($request){

        $file = $request->file('photo');                                          
        $fileName = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/fairs'), $fileName);

        return $fileName ;

    }// end of upload image 


    public function addVideos(Request $request){
        $fairVideo = new FairAttachment() ;
        $fairVideo->fair_id = $request->id;
        $fairVideo->type = 'video';
        $fairVideo->link = $request->link ;
        $fairVideo->save();

        
            return redirect()->back()->with(isCreated());
    }
    public function addPhotos(Request $request){
       // dd($request->all());
        if($request->images){
            $num_items = count($request->images);
            for ($i = 0; $i < $num_items; $i++) {
                $img = $request->images[$i];
                $fileName     = time().str_random('10').'.'.$img->getClientOriginalName();
                $img          = Image::make($img);
                $img->fit(650, 650);
                $img->save(public_path('uploads/fairs/photos/'. $fileName));
                $fairPhoto = new FairAttachment() ;
                $fairPhoto->fair_id = $request->id;
                $fairPhoto->type = 'photo';
                $fairPhoto->link = $fileName ;
                $fairPhoto->save();
                
            }

          
            return redirect()->back()->with(isCreated());
        }
           
    }

     public function getPhotosById($id){
        $routeName = 'fairs' ;
        $photos =  DB::table("fair_attachments")->where('type' , '=' , 'photo')->where('fair_id', '=' , $id)->get();

        return \view('backend.fairs.photos', compact('photos','routeName','id'));
    }

     public function getVideosById($id){
        $routeName = 'fairs' ;
        $videos =  DB::table("fair_attachments")->where('type' , '=' , 'video')->where('fair_id', '=' , $id)->get();

        return \view('backend.fairs.videos', compact('videos','routeName','id'));
    }

    public function deleteAll(Request $request)
    {
       // dd($request->ids);
        $ids = $request->ids;
        DB::table("fair_attachments")->whereIn('id',explode(",",$ids))->delete();
        return response()->json(['success'=>"Deleted successfully."]);
         
    }
}// end of controller 