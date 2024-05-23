<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Employee;
use App\Models\ProjectUser;
use App\Models\Safe;
use App\Models\Subcontractor;
use Illuminate\Support\Facades\Auth;

class Home extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index(){
        $routeName     = 'projects';
        $projects      = ProjectUser::where('user_id', Auth::id())->with('project')->get();
        $contactors    = Subcontractor::all('id', 'name');
        $tempEmployees = Employee::where('type', 'temp')->select('id', 'name', 'type')->get();
        $safes         = Safe::where('user_id',Auth::user()->id)->get();

        return view('backend.index', compact('safes', 'routeName', 'tempEmployees', 'projects', 'contactors'));
       // return view('backend.index');
    }// end of index
}// end of controller
