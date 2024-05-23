<?php

namespace App\Http\Controllers\BackEnd;

use Illuminate\Http\Request;
use App\Models\Employee;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Image;
use App\Models\Role;
use Illuminate\Support\Facades\Hash;

class Employees extends BackEndController
{
    public function __construct(Employee $model)
    {
        // $this->middleware('permission:read_employees')->only(['index']);
        // $this->middleware('permission:create_employees')->only(['create', 'store']);
        // $this->middleware('permission:update_employees')->only(['edit', 'store']);
        // $this->middleware('permission:delete_employees')->only(['destroy']);
        parent::__construct($model);
    } //end of construct



    public function store(Request $request)
    {
        $request->validate([
            'name'       => 'required',
            'email'      => 'unique:users,email|required_if:add_account,1',
            'password'   => ['required_if:add_account,1'],
        ]);

        $accountId = null;
        if($request->add_account == 1){
            $accountId = $this->createUser($request) ;
        }

        $code = 'emp-' . maxId('App\Models\Employee');

        $fileName = '';
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/employees'), $fileName);
        }

        $requestArray = ['code' => $code , 'file'=> $fileName, 'account_id' => $accountId] + $request->all();

        $row =  $this->model->create($requestArray);


        return redirect()->route('dashboard.employees.index')->with(isCreated());
    } // end of store

    protected function createUser($request){

        $fileName = '';
        if ($request->file('photo')) {
            $file     = $request->file('photo');
            $fileName = time() . str_random('10') . '.' . $file->getClientOriginalName();
            $img      = Image::make($request->file('photo'));
            $img->fit(256, 256);
            $img->save(public_path('uploads/users/' . $fileName));
        }


        $user =   User::create([
            'name'              => $request->name,
            'email'             => $request->email,
            'phone_number'      => $request->phone,
            'active'            => $request->active,
            'password'          => bcrypt($request->password),
            'created_by'        => Auth::user()->id,
            'photo'             => $fileName
        ]);
        $user->addRole('user');
        return $user->id;
    }

    public function update(Request $request, Employee $employee)
    {
        $request->validate([
            'name'  => 'required',
            'email' => 'required_if:add_account,1 | unique:users,email,' . $employee->account_id

        ]);

        $row =  $this->model->FindOrFail($request->id);
        if ($request->active) {
            $active = 1;
        } else {
            $active = 0;
        }
        $accountId = $row->account_id;
        if($request->add_account == 1){

            if ($row->account_id) {
                //update account
               $this->updateUser($request, $row, $active);

            } else {
                //create new account
                $accountId = $this->createUser($request);
            }
        }

        $fileName = $row->file ;
        if ($request->has('file')) {
            $file = $request->file('file');
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/employees'), $fileName);
        }



        $requestArray = ['file' => $fileName , 'account_id' => $accountId , 'active' => $active] + $request->all();
        $row->update($requestArray);


        return redirect()->route('dashboard.employees.index')->with(isUpdated());
    } // end of update

    protected function updateUser($request , $row , $active){

        $user = User::FindOrFail($row->account_id);
        if (isset($request->password) && $request->has('password') != "") {
            $password  = Hash::make($request->password);
        } else {
            $password  =  $user->password;
        }
        $fileName = $user->photo;
        if ($request->file('photo')) {
            $file     = $request->file('photo');
            $fileName = time() . str_random('10') . '.' . $file->getClientOriginalName();
            $img      = Image::make($request->file('photo'));
            $img->fit(256, 256);
            $img->save(public_path('uploads/users/' . $fileName));
        }
        $updateUser =   [
                            'email'        => $request->email,
                            'name'         => $request->name ,
                            'phone_number' => $request->phone ,
                            'password'     => $password,
                            'active'       => $active,
                            'photo'        => $fileName
                        ];

        $user->update($updateUser);

        return true ;

    }//end of function

    public function destroy($id)
    {
        //dd($id);
        $row = $this->model->FindOrFail($id) ;
        if($row->account_id){
            User::FindOrFail($row->account_id)->delete();
        }
        $row->delete();
        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.index')->with(isDeleted());
    }// end of destroy

}
