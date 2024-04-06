<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;

use App\Models\Tag;

class Tags extends BackEndController
{
     public function __construct(Tag $model)
    {
        
        $this->middleware('permission:read_tags')->only(['index']);
        $this->middleware('permission:create_tags')->only(['create','store']);
        $this->middleware('permission:update_tags')->only(['edit', 'store']);
        $this->middleware('permission:delete_tags')->only(['destroy']);
        parent::__construct($model);
    }//end of construct 

    public function store(Request $request)
    { 
        $request->validate([
            'name_en' => 'required|unique:tags,name_en',
            'name_ar' => 'required|unique:tags,name_ar',

        ]);  

        $tag =   Tag::create($request->all());
        
        return redirect()->route('dashboard.tags.index')->with(isCreated());
    }// end of store

    public function update(Request $request, Tag $tag)
    {
         $request->validate([
            'name_en' => 'required|unique:tags,name_en,' . $tag->id,
            'name_ar' => 'required|unique:tags,name_ar,' . $tag->id,
        ]);
        //dd($request->all());
        $tag->update($request->all());

        return redirect()->route('dashboard.tags.index')->with(isUpdated());

    }// end of update 

   

}//en of controller 

