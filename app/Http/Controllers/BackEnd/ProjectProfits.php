<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Expense;
use App\Models\Project;
use App\Models\ProjectProfit;
use App\Models\Safe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProjectProfits extends Controller
{

    public function create($id){
        $row   = Project::where('id',$id)->with('customer', 'expenses', 'revenues')->first();
        $safes = Safe::all(['id','name']);

        return view('backend.projects.profits.create', compact('row', 'safes'));
    }

    public function edit(Request $request)
    {

    }

    public function store(Request $request)
    {
        //dd($request->all());
        $request->validate([

        ]);


        //return redirect()->back()->with(isCreated());
    }

    public function update(Request $request , $id){

        //dd($request->all());
        $request->validate([]);


        //return redirect()->back()->with(isCreated());
    }

    public function destroy($id){
        $row =   ProjectProfit::FindOrFail($id);

        $row->delete();
        return redirect()->back()->with(isDeleted());
    }

}
