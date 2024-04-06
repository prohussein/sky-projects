<?php

namespace App\Http\Controllers\BackEnd;

use App\Models\Customer;
use App\Models\Employee;
use App\Models\Expense;
use Illuminate\Http\Request;
use App\Models\Project;
use App\Models\ProjectItem;
use App\Models\ProjectSubcontractor;
use App\Models\ProjectUser;
use App\Models\Safe;
use App\Models\Subcontractor;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class Projects extends BackEndController
{
    public function __construct(Project $model)
    {
        $this->middleware('permission:read_projects')->only(['index']);
        $this->middleware('permission:create_projects')->only(['create','store']);
        $this->middleware('permission:update_projects')->only(['edit', 'store']);
        $this->middleware('permission:delete_projects')->only(['destroy']);
        parent::__construct($model);
    } //end of construct


    protected function append()
    {
        $array =  [
            'customers' => Customer::all(['id','name']),
            'users' => User::all(['id', 'name']),
            'selectedUsers' => [],

        ];

        if (request()->route()->parameter('project')) {

            $array['selectedUsers']  = $this->model->find(request()->route()->parameter('project'))
            ->users()->pluck('users.id')->toArray();
        }
        return $array;
    } // to add paremater in controller

    protected function with()
    {
        return ['customer', 'subcontractors', 'expenses', 'items', 'revenues'];
    }// to add relation in the controller
    public function store(Request $request)
    {

        $request->validate([
            'name'       => 'required',
        ]);




        $code = 'sky-' . maxId('App\Models\Project');
        $requestArray = ['code' => $code] + $request->all() ;

        $row =  $this->model->create($requestArray);

        foreach ($request->users as $user) {
            ProjectUser::create([
                'project_id' => $row->id ,
                'user_id'    => $user
            ]);
        }

        return redirect()->route('dashboard.projects.index')->with(isCreated());;
    }// end of store

    public function update(Request $request, Project $project)
    {
         // dd($request->id);
         $request->validate([
            'name'       => 'required',
        ]);

        $requestArray = $request->all();
        $row =  $this->model->FindOrFail($request->id);
        $row->update($requestArray);

        ProjectUser::where('project_id',$row->id)->delete();

        foreach ($request->users as $user) {
            ProjectUser::create([
                'project_id' => $row->id,
                'user_id'    => $user
            ]);
        }

        return redirect()->route('dashboard.projects.index')->with(isUpdated());

    }// end of update

    public function show($id){
        $routeName = 'projects';

        $project   = Project::where('id',$id)->first();

        $materials = Expense::where([['project_id',$id],['type', 'materials']])
                    ->select('id','project_id','type','amount','date','note','material_qty','material_name')
                    ->get();

        $expenses  = Expense::where([['project_id', $id], ['type', 'other']])
                    ->select('id', 'project_id', 'type', 'amount', 'date', 'note')
                    ->get();

        $wages     = Expense::where([['project_id', $id], ['type', 'tempwages']])
                    ->select('id', 'project_id', 'type', 'amount', 'date', 'note', 'employee_id')
                    ->with('employee')
                    ->get();

        $tempEmployees = Employee::where('type','temp')->select('id','name','type')->get();

        $prjectCotractors   = ProjectSubcontractor::where('project_id', $id)->with('contractor')->get();

        $contactorsRevenus  = Expense::where([['project_id', $id], ['type', 'subcontractor']])
                                ->select('id', 'project_id', 'subcontractor_id', 'type', 'amount', 'date', 'reference')
                                ->with('contactor')
                                ->get();

        $projectItems    = ProjectItem::where('project_id', $id)->get();
        $safes           = Safe::all(['id', 'name']);

        if($projectItems->sum('total_implement_qty') > 0){
            $projectProgress =  ($projectItems->sum('total_implement_qty') /  $projectItems->sum('item_total')) * 100;

        }else{
            $projectProgress =  0;

        }

        $contactors = Subcontractor::all('id','name');

        return view('backend.projects.show',compact('safes','project', 'projectProgress','routeName','materials', 'projectItems', 'expenses', 'wages', 'prjectCotractors', 'contactors', 'tempEmployees','contactorsRevenus'));
    }


    public function manage(){
        $routeName     = 'projects';
        $projects      = ProjectUser::where('user_id',Auth::id())->with('project')->get();
        $contactors    = Subcontractor::all('id', 'name');
        $tempEmployees = Employee::where('type', 'temp')->select('id', 'name', 'type')->get();
        $safes         = Safe::all(['id', 'name']);

        return view('backend.projects.manage',compact('safes','routeName', 'tempEmployees', 'projects', 'contactors'));
    }

    public function selectProjectsBelongsToSubcontract(Request $request)
    {


        if (!$request->subcontractor_id) {
            $html = '<option disabled selected> اختر مشروع </option>';
        } else {
            $html = '';
            $sups = ProjectSubcontractor::where('subcontractor_id', $request->subcontractor_id)->with('project')->get();
            foreach ($sups as $sup) {
                $html .= '<option value="' . $sup->project_id . '">' . $sup->project->name  . '</option>';
            }
        }

        return response()->json(['html' => $html]);
    }// end of select sup


}
