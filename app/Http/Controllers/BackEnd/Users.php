<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Role;
use Image;

use Auth;

class Users  extends BackEndController
{
    public function __construct(User $model)
    {

        // $this->middleware('permission:read_users')->only(['index']);
        // $this->middleware('permission:create_users')->only(['create','store']);
        // $this->middleware('permission:update_users')->only(['edit', 'store']);
        // $this->middleware('permission:delete_users')->only(['destroy']);
        parent::__construct($model);
    }//end of construct

    protected function append(){

       $roles = Role::get();
       return ['roles' => $roles] ;
    } // to add paremater in controller


    public function store(Request $request)
    {

        $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users,email',
            'password' => 'required|confirmed',
            'role' => 'required|numeric',

        ]);

        // add photo
        $fileName = '';
        $file     = $request->file('photo');
        $fileName = time() . str_random('10') . '.' . $file->getClientOriginalName();
        $img      = Image::make($request->file('photo'));
        $img->fit(256, 256);
        $img->save(public_path('uploads/users/' . $fileName));

        $user =   User::create([
            'name'              => $request->name,
            'email'             => $request->email,
            'phone_number'      => $request->phone_number,
            'active'            => $request->active,
            'password'          => bcrypt($request->password),
            'created_by'        => Auth::user()->id,
            'photo' => $fileName
        ]);
       // $user->attachRoles(['admin', $request->role_id]);
      $user->roles()->attach($request->role);

        return redirect()->route('dashboard.users.index')->with(isCreated());
    }// end of store

    public function update(Request $request, User $user )
    {
        //dd($request->all());
        $request->validate([
            'name'     => 'required',
            'email'    => 'required|unique:users,email,'.$user->id,
            'password' => 'nullable|confirmed',

        ]);

        $row =  $this->model->FindOrFail($user->id);
        $requestArray = $request->all();

        if(isset($requestArray['password']) && $request->has('password') != ""){
            $requestArray['password']  = Hash::make($request->password);
        }else{
            unset($requestArray['password']);
        }

        if ($request->hasFile('photo')) {
           // dd('her');
            $file     = $request->file('photo');
            $fileName = time() . str_random('10') . '.' . $file->getClientOriginalName();
            $img      = Image::make($request->file('photo'));
            $img->fit(256, 256);
            $img->save(public_path('uploads/users/' . $fileName));

            $requestArray = ['photo' => $fileName] + $requestArray;
        }

        $row->update($requestArray);



        $row->syncRoles([$request->role]);
// equivalent to $user->roles()->sync([$admin->id, $owner->id]);
        // $user->roles()->attach($request->role);

       //return redirect()->route('dashboard.users.edit', ['id' => $user->id]);
       return redirect()->route('dashboard.users.index')->with(isUpdated());

    }// end of update



}//en of controller
