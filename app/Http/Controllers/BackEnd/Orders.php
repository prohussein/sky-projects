<?php

namespace App\Http\Controllers\BackEnd;

use App\Models\Order;
use Illuminate\Http\Request;

class Orders extends BackEndController 
{
    public function __construct(Order $model)
    {
        
        $this->middleware('permission:read_orders')->only(['index']);
        $this->middleware('permission:create_orders')->only(['create','store']);
        $this->middleware('permission:update_orders')->only(['edit', 'store']);
        $this->middleware('permission:delete_orders')->only(['destroy']);
        parent::__construct($model);
    }//end of construct 
   
    public function store(Request $request)
    { 
           // dd($file_photo);
        $requestArray =  $request->all() ;
           //dd($requestArray);
        $row =  $this->model->create($requestArray);
       
        return redirect()->route('dashboard.orders.index')->with(isCreated());
    }// end of store

    public function update(Request $request, Order $order)
    {
         $request->validate([
           
        ]);
        //dd($request->all());

        $requestArray = $request->all();
           
        $row =  $this->model->FindOrFail($order->id);
            
        $row->update($requestArray);

        return redirect()->route('dashboard.orders.index')->with(isUpdated());

    }// end of update 
 

}//end of controller 
