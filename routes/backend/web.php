<?php

use App\Http\Controllers\BackEnd\Assets;
use App\Http\Controllers\BackEnd\Customers;
use App\Http\Controllers\BackEnd\Employees;
use App\Http\Controllers\BackEnd\ManageMaterials;
use App\Http\Controllers\BackEnd\ProjectContractors;
use App\Http\Controllers\BackEnd\ProjectExpenses;
use App\Http\Controllers\BackEnd\ProjectItems;
use App\Http\Controllers\BackEnd\Projects;
use App\Http\Controllers\BackEnd\ProjectWages;
use App\Http\Controllers\BackEnd\Revenues;
use App\Http\Controllers\BackEnd\Safes;
use App\Http\Controllers\BackEnd\SafeTransfers;
use App\Http\Controllers\BackEnd\Subcontractors;
use Illuminate\Support\Facades\Route;

Route::group(['prefix' => LaravelLocalization::setLocale(), 'middleware' =>['localeSessionRedirect','localizationRedirect','localeViewPath']], function()
{
    /** ADD ALL LOCALIZED ROUTES INSIDE THIS GROUP **/

    Route::prefix('dashboard')
        ->name('dashboard.')
        ->middleware(['auth','role:super_admin'])
        ->group(function(){

        Route::resource('customers', Customers::class);

        Route::resource('projects', Projects::class);
        Route::get('projects/manageproject/cost', [Projects::class, 'manage'])->name('projects.manage.cost');
        Route::get('/selectProjectsBelongsContract', [Projects::class, 'selectProjectsBelongsToSubcontract'])->name('selectProjectsBelongsToSubcontract');

        Route::resource('revenues', Revenues::class);
        Route::resource('safes', Safes::class);
        Route::resource('safetransfers', SafeTransfers::class);


        Route::post('project/items/store', [ProjectItems::class, 'store'])->name('project.items.store');
        Route::delete('project/items/delete/{id}', [ProjectItems::class, 'destroy'])->name('project.items.destroy');
        Route::post('project/items/update/{id}', [ProjectItems::class, 'update'])->name('project.items.update');


        Route::post('project/materials/store', [ManageMaterials::class, 'store'])->name('project.materials.store');
        Route::delete('project/materials/delete/{id}', [ManageMaterials::class, 'destroy'])->name('project.materials.destroy');
        Route::post('project/materials/update/{id}', [ManageMaterials::class, 'update'])->name('project.materials.update');

        Route::post('project/expenses/store', [ProjectExpenses::class, 'store'])->name('project.expenses.store');
        Route::delete('project/expenses/delete/{id}', [ProjectExpenses::class, 'destroy'])->name('project.expenses.destroy');
        Route::post('project/expenses/update/{id}', [ProjectExpenses::class, 'update'])->name('project.expenses.update');

        Route::post('project/wages/store', [ProjectWages::class, 'store'])->name('project.wages.store');
        Route::delete('project/wages/delete/{id}', [ProjectWages::class, 'destroy'])->name('project.wages.destroy');
        Route::post('project/wages/update/{id}', [ProjectWages::class, 'update'])->name('project.wages.update');


        Route::resource('subcontractors', Subcontractors::class);
        Route::resource('assets', Assets::class);
        Route::get('assets/export/excell', [Assets::class, 'exportToExcel'])->name('assets.export.excell');

        Route::post('project/contactor/store', [ProjectContractors::class, 'store'])->name('project.contactor.store');
        Route::delete('project/contactor/delete/{id}', [ProjectContractors::class, 'destroy'])->name('project.contactor.destroy');
        Route::post('project/contactor/update/{id}', [ProjectContractors::class, 'update'])->name('project.contactor.update');

        Route::post('project/contactor/rvenue/store', [ProjectContractors::class, 'storeRevenu'])->name('project.contactor.rvenue.store');
        Route::delete('project/contactor/rvenue/delete/{id}', [ProjectContractors::class, 'destroyRevenue'])->name('project.contactor.rvenue.destroy');
        Route::post('project/contactor/rvenue/update/{id}', [ProjectContractors::class, 'updateRevenue'])->name('project.contactor.rvenue.update');

        Route::resource('employees', Employees::class);


        Route::get('/', 'App\Http\Controllers\BackEnd\Home@index')->name('index');


        Route::resource('expenses', 'App\Http\Controllers\BackEnd\Expenses');

        //  Expense Categories
        Route::resource('expensecategories', 'App\Http\Controllers\BackEnd\ExpenseCategories');
        // Role routes
        Route::resource('roles', 'App\Http\Controllers\BackEnd\Roles');
        // Sliders routes
        Route::resource('sliders', 'App\Http\Controllers\BackEnd\Sliders');
        // users routes
        Route::resource('users', 'App\Http\Controllers\BackEnd\Users');

         // Brands routes
        Route::resource('brands', 'App\Http\Controllers\BackEnd\Brands');

        // categories routes
        Route::resource('categories', 'App\Http\Controllers\BackEnd\Categories');
         Route::resource('supcategories', 'App\Http\Controllers\BackEnd\SupCategories');
         Route::resource('supsupcategories', 'App\Http\Controllers\BackEnd\SupsupCategories');

        // types routes
        Route::resource('types', 'App\Http\Controllers\BackEnd\Types');

         // pages routes
        Route::resource('pages', 'App\Http\Controllers\BackEnd\Pages');

         // jobs routes
        Route::resource('jobs', 'App\Http\Controllers\BackEnd\Jobs');

        // jobs applications routes
        Route::resource('jobapplications', 'App\Http\Controllers\BackEnd\JobApplications');

         // products routes
        Route::resource('products', 'App\Http\Controllers\BackEnd\Products');

          Route::resource('orders', 'App\Http\Controllers\BackEnd\Orders');


         // offers routes
        Route::resource('offers', 'App\Http\Controllers\BackEnd\Offers');


         // routes products photos
        Route::resource('productphotos', 'App\Http\Controllers\BackEnd\ProductPhotos');

         Route::get('getPhotosById/{id}', 'App\Http\Controllers\BackEnd\Products@getPhotosById')->name('getPhotosById');

        Route::post('addPhotos', 'App\Http\Controllers\BackEnd\Products@addPhotos')->name('addphotos');

        Route::resource('certificates', 'App\Http\Controllers\BackEnd\Certificates');

         // partners routes
        Route::resource('partners', 'App\Http\Controllers\BackEnd\Partners');

        Route::resource('fairs', 'App\Http\Controllers\BackEnd\Fairs');
        Route::get('getfairPhotosById/{id}', 'App\Http\Controllers\BackEnd\Fairs@getPhotosById')->name('getfairPhotosById');
        Route::get('getfairVideosById/{id}', 'App\Http\Controllers\BackEnd\Fairs@getVideosById')->name('getVideosById');
        Route::post('addfairvideos', 'App\Http\Controllers\BackEnd\Fairs@addVideos')->name('addfairvideos');
        Route::post('addfairphotos', 'App\Http\Controllers\BackEnd\Fairs@addPhotos')->name('addfairphotos');



         // tags routes
        Route::resource('tags', 'App\Http\Controllers\BackEnd\Tags');

         // message routes
        Route::resource('messages', 'App\Http\Controllers\BackEnd\Messages');
        Route::get('/message-type/{id}', 'App\Http\Controllers\BackEnd\Messages@getMessageByType');

        // setting routes
        Route::get('setting/general', 'App\Http\Controllers\BackEnd\Settings@general')->name('settings.general');

        Route::get('setting/social_links' , 'App\Http\Controllers\BackEnd\Settings@social_links')->name('settings.social_links');
        Route::get('setting/about' , 'App\Http\Controllers\BackEnd\Settings@about')->name('settings.about');
        Route::get('setting/merchant-requests' , 'App\Http\Controllers\BackEnd\Settings@merchantRequests')->name('settings.merchant_requests');
        Route::post('settings' , 'App\Http\Controllers\BackEnd\Settings@store')->name('settings.store');


    });

});


