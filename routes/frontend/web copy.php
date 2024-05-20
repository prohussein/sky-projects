<?php


Route::group(['prefix' => LaravelLocalization::setLocale(), 'middleware' =>['localeSessionRedirect','localizationRedirect','localeViewPath']], function()
{
    /** ADD ALL LOCALIZED ROUTES INSIDE THIS GROUP **/

    Route::get('/', 'App\Http\Controllers\BackEnd\Home@index');
    Route::get('/home', 'App\Http\Controllers\FrontEnd\HomeController@index')->name('home');
    Route::get('/products', 'App\Http\Controllers\FrontEnd\HomeController@shop')->name('shop');
    Route::get('/posts', 'App\Http\Controllers\FrontEnd\HomeController@posts')->name('posts');
    Route::get('/post-details/{id}', 'App\Http\Controllers\FrontEnd\HomeController@postDetails')->name('post.details');
    Route::get('/contact-us', 'App\Http\Controllers\FrontEnd\HomeController@contactUs')->name('contact');
    Route::get('/about-us', 'App\Http\Controllers\FrontEnd\HomeController@aboutUs')->name('about');
    Route::get('/merchant-requests', 'App\Http\Controllers\FrontEnd\HomeController@merchantRequests')->name('merchant.requests');
    Route::get('/product-details/{id}', 'App\Http\Controllers\FrontEnd\HomeController@productDetails')->name('product.details');
    Route::get('/offer-details/{id}', 'App\Http\Controllers\FrontEnd\HomeController@offerDetails')->name('offer.details');
    Route::get('/product-category/{id}', 'App\Http\Controllers\FrontEnd\HomeController@productByCategory')->name('product.category');
    Route::get('/product-tag/{id}', 'App\Http\Controllers\FrontEnd\HomeController@tags')->name('product.tag');
    Route::get('/offers', 'App\Http\Controllers\FrontEnd\HomeController@offers')->name('offers');
    Route::get('/testminals', 'App\Http\Controllers\FrontEnd\HomeController@testminals')->name('testminals');


    Route::get('/make-order', 'App\Http\Controllers\FrontEnd\HomeController@makeOrder')->name('make.orders');
    Route::post('/save-order', 'App\Http\Controllers\FrontEnd\HomeController@saveOrder')->name('save.orders');

    Route::get('/certificates', 'App\Http\Controllers\FrontEnd\HomeController@certificates')->name('certificates');
    Route::get('/fairs', 'App\Http\Controllers\FrontEnd\HomeController@fairs')->name('fairs');
     Route::get('fair-details/{id}', 'App\Http\Controllers\FrontEnd\HomeController@fairById')->name('fairById');

    /// store mesage

    Route::post('store-message' , 'App\Http\Controllers\FrontEnd\HomeController@storeMessage')->name('send.message');

    Route::get('/index-rtl', 'App\Http\Controllers\FrontEnd\HomeController@indexRtl')->name('indexRtl');




});


