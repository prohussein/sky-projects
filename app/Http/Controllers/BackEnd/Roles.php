<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Role;
use Illuminate\Http\Request;
use App\Http\Requests\Backend\Roles\Store;
use App\Http\Requests\Backend\Roles\Update;

class Roles extends BackEndController
{
    public function __construct(Role $model)
    {

        // $this->middleware('permission:read_roles')->only(['index']);
        // $this->middleware('permission:create_roles')->only(['create','store']);
        // $this->middleware('permission:update_roles')->only(['edit', 'store']);
        // $this->middleware('permission:delete_roles')->only(['destroy']);
        parent::__construct($model);
    }//end of construct
    protected function fillter($rows){
        //dd($rows);
         $rows =  //$rows->whereNotIn('name',['super_admin'])


        $rows->with('permissions')
        ->withCount('users');


        return $rows ;
    }
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:roles,name',
             'permissions' => 'required|array|min:1'
        ]);
        $role =   Role::create($request->all());
        $role->attachPermissions($request->permissions);

        return redirect()->route('dashboard.roles.index')->with(isCreated());
    }// end of store

    public function update(Request $request, Role $role)
    {

         $request->validate([
            'name' => 'required|unique:roles,name,' . $role->id,
             'permissions' => 'required|array|min:1'
        ]);

        $role->update($request->all());

        $role->syncPermissions($request->permissions);

        return redirect()->route('dashboard.roles.index')->with(isUpdated());

    }// end of update



}//en of controller
