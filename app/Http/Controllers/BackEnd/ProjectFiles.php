<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\ProjectFile;
use Illuminate\Http\Request;

class ProjectFiles extends Controller
{
    public function store(Request $request){
       // dd($request->all());
        $request->validate([
            'name'        => 'required',
            'project_id'  => 'required',
            'file'        => 'required',
        ]);


        // handle file

        $fileName = '';
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/projects/files'), $fileName);
        }

        ProjectFile::create([
            'name'           => $request->name,
            'project_id'     => $request->project_id,
            'file'           => $fileName
        ]);

        return redirect()->back()->with(isCreated());
    }

    public function update(Request $request , $id){

        $request->validate([
            'name'        => 'required',
            'project_id'  => 'required',
        ]);

        $fileRow = ProjectFile::FindOrFail($id);
        $fileName = null ;
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/projects/files'), $fileName);
        }else{

            $fileName = $fileRow->file ;

        }

        $requestArray = ['file' => $fileName] + $request->all();

        $fileRow->update($requestArray);

        return redirect()->back()->with(isUpdated());
    }
    public function destroy($id){
        //dd($id);
        ProjectFile::FindOrFail($id)->delete();
        return redirect()->back()->with(isDeleted());
    }
}
