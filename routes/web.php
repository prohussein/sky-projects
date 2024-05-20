<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

//Route::group(['prefix' => LaravelLocalization::setLocale(), 'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath']], function () {
    /** ADD ALL LOCALIZED ROUTES INSIDE THIS GROUP **/
    Auth::routes();

    Route::get('/testone', function () {
        return view('welcome');
    });


    Route::get('/subcat', 'BackEnd\Products@selectSupcat')->name('subcat');
    Route::get('/supsubcat', 'BackEnd\Products@supSelectSupcat')->name('supsubcat');

    Route::post('/products/active', 'BackEnd\Products@updateActive')->name('products.active');
    Route::post('/products/featured', 'BackEnd\Products@updateFeatured')->name('products.featured');

    Route::delete('photosDeleteAll', 'BackEnd\Products@deleteAll');
    Route::delete('fairsphotosDeleteAll', 'BackEnd\Fairs@deleteAll');

//});
