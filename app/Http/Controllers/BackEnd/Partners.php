<?php

namespace App\Http\Controllers\BackEnd;
use Illuminate\Http\Request;
use App\Models\Partner;
use DB;
use Image;

class Partners extends BackEndController
{
    public function __construct(Partner $model)
    {

        // $this->middleware('permission:read_partners')->only(['index']);
        // $this->middleware('permission:create_partners')->only(['create','store']);
        // $this->middleware('permission:update_partners')->only(['edit', 'store']);
        // $this->middleware('permission:delete_partners')->only(['destroy']);
        parent::__construct($model);
    }//end of construct

    public function store(Request $request)
    {
        //dd($request->all());
        $request->validate([
            'photo' => 'required',

        ]);
        //dd($this->uploadImage($request));

        $file     = $request->file('photo');
        $fileName = time().str_random('10').'.'.$file->getClientOriginalName();
        $img      = Image::make($request->file('photo'));
        $img->fit(150, 95);
        $img->save(public_path('uploads/partners/photos/'. $fileName));


       // $file_photo = $this->uploadImage($request);

           // dd($file_photo);
        $requestArray = ['created_by' => auth()->user()->id , 'photo' => $fileName] + $request->all() ;
           //dd($requestArray);
        $row =  $this->model->create($requestArray);



        return redirect()->route('dashboard.partners.create')->with(isCreated());
    }// end of store

    public function update(Request $request, Partner $partner)
    {
         $request->validate([
             'photo' => 'image',


        ]);
        $requestArray = $request->all();

          if ($request->hasFile('photo')) {

            $file     = $request->file('photo');
            $fileName = time().str_random('10').'.'.$file->getClientOriginalName();
            $img      = Image::make($request->file('photo'));
            $img->fit(150, 95);
            $img->save(public_path('uploads/partners/photos/'. $fileName));

                  //  $fileName = $this->uploadImage($request);

            $requestArray = ['photo' => $fileName] + $requestArray;
            }

            $row =  $this->model->FindOrFail($partner->id);

                $row->update($requestArray);

        return redirect()->route('dashboard.partners.index')->with(isUpdated());

    }// end of update

    protected function uploadImage($request){

        $file = $request->file('photo');
        $fileName = time().str_random('10').'.'.$file->getClientOriginalExtension();
        $file->move(public_path('uploads/partners/photos'), $fileName);

        return $fileName ;

    }// end of upload image

}//en of controller
