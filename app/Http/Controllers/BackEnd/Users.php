<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Role;

use Auth;

class Users  extends BackEndController
{
    public function __construct(User $model)
    {
        
        $this->middleware('permission:read_users')->only(['index']);
        $this->middleware('permission:create_users')->only(['create','store']);
        $this->middleware('permission:update_users')->only(['edit', 'store']);
        $this->middleware('permission:delete_users')->only(['destroy']);
        parent::__construct($model);
    }//end of construct 
    
    protected function append(){
     
       $roles = Role::get();
       return ['roles' => $roles] ;
    }// to add paremater in controller 
    public function store(Request $request)
    { 

        $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users,email',
            'password' => 'required|confirmed',
            'role_id' => 'required|numeric',
           
        ]);
       
        $user =   User::create([
            'name'              => $request->name,
            'email'             => $request->email,
            'phone_number'      => $request->phone_number,
            'active'            => $request->active,
            'password'          => bcrypt($request->password),
            'created_by'        => Auth::user()->id,
        ]);
       // $user->attachRoles(['admin', $request->role_id]);
      $user->roles()->attach($request->role);

        return redirect()->route('dashboard.users.index')->with(isCreated());
    }// end of store

    public function update(Request $request, User $user )
    {

        $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users,email,'.$user->id,
        ]);

        $row =  $this->model->FindOrFail($user->id);
        $requestArray = $request->all();
            
        if(isset($requestArray['password']) && $request->has('password') != ""){
            $requestArray['password']  = Hash::make($request->password);
        }else{
            unset($requestArray['password']);
        }

        $row->update($requestArray);

        
        ///////////////////////////////

       //return redirect()->route('dashboard.users.edit', ['id' => $user->id]);
       return redirect()->route('dashboard.users.index')->with(isUpdated());

    }// end of update 

   

}//en of controller 
