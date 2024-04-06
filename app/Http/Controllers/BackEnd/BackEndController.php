<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class BackEndController extends Controller
{


    protected $model ;

   public function __construct(Model $model){

       $this->model = $model ;
   }

    public function index()
    {
        $rows  = $this->model;
        $rows  = $this->fillter($rows);
        $with  = $this->with();
        if (!empty($with)) {
            $rows = $rows->with($with);
        }
        $rows = $rows->orderBy('id', 'desc')->get();
        //dd($rows);

        $routeName = $this->getClassNameFromModel();
        return view('backend.' . $routeName . '.index', compact('rows', 'routeName'));
    }// end of index
    public function create()
    {
        $routeName = $this->getClassNameFromModel();
        $append = $this->append();
        return view('backend.'.$this->getClassNameFromModel().'.create' , compact('routeName'))->with($append);
    }// end of create

     public function edit($id)
    {
        $append = $this->append();
        $routeName = $this->getClassNameFromModel();
        $row =  $this->model->FindOrFail($id);
         //dd($id);
        return view('backend.'.$this->getClassNameFromModel().'.edit', compact('row','routeName'))->with($append);
    }// end of edit

     public function destroy($id)
    {
       $this->model->FindOrFail($id)->delete();


        return redirect()->route('dashboard.'.$this->getClassNameFromModel().'.index')->with(isDeleted());
    }// end of destroy

    protected function getClassNameFromModel(){
        return Str::plural(strtolower(class_basename($this->model))) ;
    }//end of get class name from model

    protected function fillter($rows){
        return $rows ;
    }

     protected function with(){
        return [] ;
    }// to add relation in the controller
    protected function append(){
        return [] ;
    }// to add paremater in controller


}//end of controller
