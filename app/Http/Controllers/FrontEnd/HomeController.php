<?php

namespace App\Http\Controllers\FrontEnd;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Mail\Contact;
use App\Models\Category;
use App\Models\Order;
use App\Models\User;
use App\Models\Tag;
use Mail;
use App\Models\Message;
use App\Models\Fair;
use App\Models\FairAttachment;
use App\Models\Product;
use App\Models\Offer;
use App\Models\Page;
use Carbon\Carbon;
use DB;
Use Image;
use Illuminate\Support\Facades\Mail as FacadesMail;

class HomeController extends Controller
{

    public function index( Request $request){

         $products = Product::where([['active', '=' , 1],['featured',1]])->orderBy('id' , 'desc');
        if(request()->has('search') && request()->get('search') != ''){
            $products = $products->where('name_ar'  , 'like' , "%".request()->get('search')."%")
            ->orWhere('name_en'  , 'like' , "%".request()->get('search')."%");
        }
        $products = $products->paginate(12);
        $posts = Page::paginate(9);
        return view('frontend.modern.index', compact('products', 'posts'));

    }// end of index for home page

    public function shop(Request $request){
        $products = Product::with('tags','cats')->where('active', '=' , 1)->orderBy('id', 'desc');
       $products =   $products->paginate(30);
        return view('frontend.modern.products', compact('products'));
    }
    public function productDetails($id)
    {
        $product = Product::where('id', $id)->with('photos', 'cats', 'tags')->first();

        $productsByCat = Product::where('active', '=', 1)->where('cat_id',  $product->cat_id)->get();

        return view('frontend.modern.product_details', compact('product', 'id', 'productsByCat'));
    }

    public function fairs(){
       $fairs = Fair::orderBy('created_at', 'desc')->get();
        return view('frontend.fairs', compact('fairs'));
    }

     public function fairById($id){
         $fair = Fair::where('id',  $id )->with('attachments')->first();
         $photos = DB::table("fair_attachments")->where('type', '=' , 'photo')->where('fair_id', '=', $id)->get();
         $videos = DB::table("fair_attachments")->where('type', '=' , 'video')->where('fair_id', '=', $id)->get();
        //dd($photos);
        return view('frontend.fair_details', compact('fair', 'photos', 'videos'));
    }

    public function posts(){
        $posts   = Page::paginate(30);
        return view('frontend.modern.posts',compact('posts'));
    }

    public function postDetails($id)
    {
        $posts  = Page::paginate(5);
        $post   = Page::where('id',$id)->first();
        return view('frontend.modern.post_details', compact('post', 'posts'));
    }

    public function offers(){
         $today = Carbon::now();
       // dd($today);
        $offers = Offer::where('end' ,  '>=' , $today )->get();

        return view('frontend.all_offers', compact('offers'));
    }

    public function offerDetails($id){

        $offer = Offer::where('id' , $id)->with('types','cats')->first();

       //dd($product);
        return view('frontend.offer_details', compact('offer'));
    }

    public function productByCategory(Request $request ,$id){
        $products = Product::where('active', '=' , 1)->with('tags','cats')->where('cat_id', '=', $id)->paginate(30);

     // dd($products);
          return view('frontend.modern.category', compact('products'));
    }

    public function tags($id){
        $tag = Tag::findOrFail($id);
        $products = Product::where('active', '=' , 1)->with('tags','cats')->whereHas('tags' , function ($query) use ($id){
            $query->where('tag_id' , $id);
        })->orderBy('id' , 'desc')->paginate(30);
        return view('frontend.tags' , compact('products' , 'tag'));
    }
    public function contactUs(){
        return view('frontend.modern.contact');
    }
    public function aboutUs(){
        return view('frontend.modern.about');
    }

    public function testminals(){
        return view('frontend.modern.testminals');
    }


    public function storeMessage(Request $request)
    {

        $request->validate([
            'email' => 'required'
        ]);

        //dd($request->all());

      	$details =  Message::create($request->all());
        FacadesMail::to(setting('email'))->send(new Contact($details));
       
       return back()->with(isSend());
    }// end of store

    public function makeOrder(){

        return \view('frontend.make_order');

    }// end of make order

    public function saveOrder(Request $request){

      //  dd($request->all());
         $request->validate([
            'name'       => 'required',
            'phone'      => 'required|numeric',
            'address'    => 'required',
            'email'      => 'required|email',
            'order_desc' => 'required',
        ]);

       $order =   Order::create($request->all());

        Mail::to('m.hussain.waritex@gmail.com')->send(new \App\Mail\OrderMail($order));


        alert()->success( __('site.order_added'), __('site.success'));
       return back();

    }// end of save order

    public function certificates(){
        return view('frontend.certificate');
    }

    public function indexRtl()
    {
        return view('frontend.modern.index');
    }

}// end of controller


