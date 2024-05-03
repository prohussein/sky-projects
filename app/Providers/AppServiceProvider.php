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

       
    }
}
