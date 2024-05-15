<?php

namespace App\Http\Controllers\BackEnd;

use App\Models\Employee;
use Illuminate\Http\Request;
use App\Models\Safe;
use App\Models\SafeTransfer;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class SafeTransfers extends BackEndController
{
    public function __construct(SafeTransfer $model)
    {
        // $this->middleware('permission:read_safes')->only(['index']);
        // $this->middleware('permission:create_safes')->only(['create', 'store']);
        // $this->middleware('permission:update_safes')->only(['edit', 'store']);
        // $this->middleware('permission:delete_safes')->only(['destroy']);
        parent::__construct($model);
    } //end of construct


    protected function append()
    {

        $array =  [
            'users' => User::all(['id','name']),
            'safes' => Safe::all(['id', 'name']),
        ];


        return $array;
    }// to add paremater in controller


    public function store(Request $request)
    {
        $request->validate([

            'from_safe'       => 'required',
            'to_safe'         => 'required',
            'amount'          => 'required',
            'transfer_date'   => 'required',
        ]);

        // safe_receive_blance  safe_send_blance

        // handle safes balance

        $senderSafeBalance   = Safe::where('id',$request->from_safe)->first()->balance ;
        $receiverSafeBalance = Safe::where('id', $request->to_safe)->first()->balance;
        if($senderSafeBalance < $request->amount){
            return back()->with(isOverAmount());
        }
        $senderSafeBalanceAfterTransfer = $senderSafeBalance - $request->amount;
        $receiverSafeBalanceAfterTransfer = $receiverSafeBalance + $request->amount;

        $requestArray = ['added_by'=> Auth::id(),'safe_receive_blance' => $receiverSafeBalanceAfterTransfer  , 'safe_send_blance' => $senderSafeBalanceAfterTransfer] + $request->all();

        $row =  $this->model->create($requestArray);

        Safe::where('id', $request->from_safe)->update([
            'balance' => $senderSafeBalanceAfterTransfer
        ]);

        Safe::where('id', $request->to_safe)->update([
            'balance' => $receiverSafeBalanceAfterTransfer
        ]);
        return redirect()->route('dashboard.safetransfers.index')->with(isCreated());
    } // end of store

    public function update(Request $request, SafeTransfer $transfer)
    {
        $request->validate([
            'from_safe'       => 'required',
            'to_safe'         => 'required',
            'amount'          => 'required',
            'transfer_date'   => 'required',
        ]);

        // return balance to previous value

        $row =  $this->model->FindOrFail($request->id);

        $oldSenderSafeBalance = Safe::where('id', $row->from_safe)->first()->balance;

        $oldSenderSafeBalanceAfterTransfer = $oldSenderSafeBalance + $row->amount;

        $oldReceiverSafeBalance = Safe::where('id', $row->to_safe)->first()->balance;

        $oldRreceiverSafeBalanceAfterTransfer = $oldReceiverSafeBalance - $row->amount;

        //update safes balances before update

        Safe::where('id', $row->from_safe)->update([
            'balance' => $oldSenderSafeBalanceAfterTransfer
        ]);

        Safe::where('id', $row->to_safe)->update([
            'balance' => $oldRreceiverSafeBalanceAfterTransfer
        ]);

        // start update

        $senderSafeBalance = Safe::where('id', $request->from_safe)->first()->balance;
        $senderSafeBalanceAfterTransfer = $senderSafeBalance - $request->amount;
        $receiverSafeBalance = Safe::where('id', $request->to_safe)->first()->balance;
        $receiverSafeBalanceAfterTransfer = $receiverSafeBalance + $request->amount;

        $requestArray = ['added_by' => Auth::id(), 'safe_receive_blance' => $receiverSafeBalanceAfterTransfer, 'safe_send_blance' => $senderSafeBalanceAfterTransfer] + $request->all();


        $row->update($requestArray);

        Safe::where('id', $request->from_safe)->update([
            'balance' => $senderSafeBalanceAfterTransfer
        ]);

        Safe::where('id', $request->to_safe)->update([
            'balance' => $receiverSafeBalanceAfterTransfer
        ]);

        return redirect()->route('dashboard.safetransfers.index')->with(isUpdated());
    } // end of update

    public function destroy($id)
    {
        // return balance to previous value

        $row =  $this->model->FindOrFail($id);

        $oldSenderSafeBalance = Safe::where('id', $row->from_safe)->first()->balance;

        $oldSenderSafeBalanceAfterTransfer = $oldSenderSafeBalance + $row->amount;

        $oldReceiverSafeBalance = Safe::where('id', $row->to_safe)->first()->balance;

        $oldRreceiverSafeBalanceAfterTransfer = $oldReceiverSafeBalance - $row->amount;

        //update safes balances before update

        Safe::where('id', $row->from_safe)->update([
            'balance' => $oldSenderSafeBalanceAfterTransfer
        ]);

        Safe::where('id', $row->to_safe)->update([
            'balance' => $oldRreceiverSafeBalanceAfterTransfer
        ]);

        $row->delete();


        return redirect()->route('dashboard.safetransfers.index')->with(isDeleted());
    }// end of destroy


}
