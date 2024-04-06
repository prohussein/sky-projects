<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Image;


class Settings extends Controller
{


    public function social_links(){
        $routeName = 'settings';
        return view('backend.settings.social_links', compact('routeName') );

    } // end of social links

    public function general()
    {
        $routeName = 'settings';
        return view('backend.settings.general', compact('routeName'));
    }// end of general

    public function about(){
        $routeName = 'settings';
        return view('backend.settings.about', compact('routeName') );

    }// end of social links

    public function merchantRequests(){
        $routeName = 'settings';
        return view('backend.settings.merchant_requests', compact('routeName') );

    }// end of social links

    public function store(Request $request){

        $requestArray = $request->all();
        if ($request->file('about_img')) {

            $image =  Image::make($request->file('about_img'));

            // $image->resize(74, null, function ($constraint) {
            //     $constraint->aspectRatio();
            // });
            //$image->resize(74, 74);

            $imageName = time() . '-' . $request->file('about_img')->getClientOriginalName();
            $destinationPath = public_path('uploads/settings/');
            $image->save($destinationPath . $imageName);
            $requestArray = ['about_img' => $imageName] + $requestArray;
        }

        if ($request->file('logo')){

            $image =  Image::make($request->file('logo'));

            $image->resize(100, null, function ($constraint) {
                $constraint->aspectRatio();
            });


            $imageName = time() . '-' . $request->file('logo')->getClientOriginalName();
            $destinationPath = public_path('uploads/settings/');
            $image->save($destinationPath . $imageName);
            $requestArray = ['logo' => $imageName] + $requestArray;
        }

        setting($requestArray)->save();





       return  redirect()->back()->with(isCreated());

    }// end of store
}// end of controller
