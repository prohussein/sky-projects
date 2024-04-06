@extends('layouts.backend.app')

@section('pageTitle')
   @lang('site.dashboard')
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => __('site.dashboard'),
        'des' => __('site.dashboard'),
    ])



@endcomponent

<div class="row">

<div class="col-md-12"> <h2 class="text-center" style="color: #009688"> Reports    <i class="icon fa fa-bar-chart"></i></h2> <br><br> </div>

        <div class="col-md-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-bars fa-3x"></i>
            <div class="info text-center">
              <h4>@lang('site.categories')</h4>
              <p><b>{{ $categories }}</b></p>
              <a href="{{ route('dashboard.categories.index') }}"> @lang('site.all_categories')  </a>
            </div>
          </div>
        </div>




        <div class="col-md-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-cart-plus fa-3x"></i>
            <div class="info text-center">
              <h4>@lang('site.products')</h4>
              <p><b>{{ $products }}</b></p>
              <a href="{{ route('dashboard.products.index') }}"> @lang('site.all_products')  </a>
            </div>
          </div>
        </div>

        <div class="col-md-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-picture-o fa-3x"></i>
            <div class="info text-center">
              <h4>@lang('site.sliders')</h4>
              <p><b>{{ $sliders }}</b></p>
              <a href="{{ route('dashboard.sliders.index') }}"> @lang('site.all_sliders')  </a>
            </div>
          </div>
        </div>

        <div class="col-md-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-file fa-3x"></i>
            <div class="info text-center">
              <h4>@lang('site.pages')</h4>
              <p><b>{{ $pages }}</b></p>
              <a href="{{ route('dashboard.pages.index') }}"> @lang('site.all_pages')  </a>
            </div>
          </div>
        </div>

        <div class="col-md-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-comments-o fa-3x"></i>
            <div class="info text-center">
              <h4>@lang('site.messages')</h4>
              <p><b>{{ $messages }}</b></p>
              <a href="{{ route('dashboard.messages.index') }}"> @lang('site.all_messages')  </a>
            </div>
          </div>
        </div>

        <div class="col-md-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info text-center">
              <h4>@lang('site.users')</h4>
              <p><b>{{ $users }}</b></p>
              <a href="{{ route('dashboard.users.index') }}"> @lang('site.all_users')  </a>
            </div>
          </div>
        </div>






</div>



@endsection
