<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\ProjectItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProjectItems extends Controller
{

    public function store(Request $request){
        //dd($request->all());
        $request->validate([

            'name'                  => 'required',
            'code'                  => 'required',
            'cat'                   => 'required',
            'project_id'            => 'required',
            'qty'                   => 'required',
            'item_total'            => 'required',
            'implement_qty'         => 'required',
            'total_implement_qty'   => 'required',

        ]);

        ProjectItem::create([
            'code'                 => $request->code,
            'name'                 => $request->name,
            'cat'                  => $request->cat,
            'project_id'           => $request->project_id,
            'qty'                  => $request->qty,
            'item_total'           => $request->qty,
            'implement_qty'        => $request->implement_qty,
            'total_implement_qty'  => $request->total_implement_qty,

        ]);

        return redirect()->back()->with(isCreated());
    }

    public function update(Request $request , $id){

        $request->validate([
            'name'                  => 'required',
            'code'                  => 'required',
            'cat'                   => 'required',
            'qty'                   => 'required',
            'item_total'            => 'required',
            'implement_qty'         => 'required',
            'total_implement_qty'   => 'required',
        ]);

        ProjectItem::where('id',$id)->update([
            'code'                 => $request->code,
            'name'                 => $request->name,
            'cat'                  => $request->cat,
            'qty'                  => $request->qty,
            'item_total'           => $request->qty,
            'implement_qty'        => $request->implement_qty,
            'total_implement_qty'  => $request->total_implement_qty,
        ]);

        return redirect()->back()->with(isUpdated());
    }

    public function destroy($id){
        //dd($id);
        ProjectItem::FindOrFail($id)->delete();
        return redirect()->back()->with(isDeleted());
    }
}
