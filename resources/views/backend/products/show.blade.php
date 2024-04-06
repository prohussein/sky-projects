@extends('layouts.backend.app')

@section('pageTitle')
   @lang('site.all_'. $routeName .'') 
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => __('site.'. $routeName .''),
        'des'   => __('site.all_'. $routeName .'_des'),
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">@lang('site.'. $routeName .'')</a></li>
    <li class="breadcrumb-item">@lang('site.all_'. $routeName .'')</li>
    
@endcomponent

    <div class="tile mb-4">
       

        <div class="row">
          

        </div>{{-- end of row --}}
    </div>{{-- end of tile  --}}
@endsection