<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\SupCategory;
use App\Models\SupsupCategory;
use App\Models\Slider;
use App\Models\Product;
use App\Models\Page;
use App\Models\Partner;
use App\Models\User;
use App\Models\Message;
class Home extends BackEndController
{
    public function __construct()
    {

    }//end of construct
    public function index(){
        //dd('welcom');
        $categories       = Category::count();
        $supCategories    = SupCategory::count();
        $supsupCategories = SupsupCategory::count();
        $sliders          = Slider::count();
        $products         = Product::count();
        $pages            = Page::count();

        $messages         = Message::count();
        $users            = User::count();


        return view('backend.index', compact('users','categories','supCategories','supsupCategories','sliders','products','pages','messages'));
    }// end of index
}// end of controller
