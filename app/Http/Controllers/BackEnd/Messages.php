<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Message;
class Messages extends Controller
{
    public function index(){
        // select counts  
               
 
        $messages = Message::where('type' , '1') ->orderByRaw('created_at DESC')->limit(5)->get();
        $leads = Message::where('type' , '2') ->orderByRaw('created_at DESC')->limit(5)->get();
        $news = Message::where('type' , '3') ->orderByRaw('created_at DESC')->limit(5)->get();
        
        $routeName = 'messages';

        return view('backend.messages.index', compact('routeName','messages','leads','news'));
    }// end of index 

    public function getMessageByType($type){
        //dd($type);
        $routeName = 'messages';

        $rows = Message::where('type' , $type) ->orderByRaw('created_at DESC')->get();
        return view('backend.messages.message_type', compact('routeName','rows','type'));
    }// end of getMessageByType

    public function destroy($id)
    {
       Message::FindOrFail($id)->delete();
       
       
        return redirect()->back()->with(isDeleted());
    }// end of destroy
    
}
