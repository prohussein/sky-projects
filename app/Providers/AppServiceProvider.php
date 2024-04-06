<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use App\Models\Category;
use App\Models\Partner;
use App\Models\Tag;
use App\Models\Slider;
use App\Models\Product;
use App\Models\Fair;
use App\Models\Certificate;
use App\Models\Country;
use App\Models\Offer;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Schema::defaultStringLength(191);

        view()->share('partners', Partner::where([['active', 1], ['type', 'review']])->get());
        view()->share('clients', Partner::where([['active', 1], ['type', 'client']])->get());
        view()->share('offers', Offer::get());
        view()->share('categories', Category::get());
        view()->share('sliders', Slider::where('active', 1)->get());
        view()->share('lastSlider', Slider::where('active', 1)->orderBy('id', 'desc')->limit(1)->get());
        view()->share('tags', Tag::get());
        view()->share('featuredProducts', Product::where([['active', '=', 1], ['featured', '=', 1]])->orderBy('id', 'desc')->get());
        // view()->share('products', Product::with('tags')->get());
        view()->share('fairs', Fair::get());
        view()->share('certificates', Certificate::get());
    }
}
