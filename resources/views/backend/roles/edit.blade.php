@extends('layouts.backend.app')
@section('pageTitle')
   @lang('site.edit_'. $routeName .'') 
@endsection

@section('content')
 
@component('backend.partials._pagebar',
    [
        'title' => __('site.'. $routeName .''),
        'des'   => __('site.edit_'. $routeName .'_des'),
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">@lang('site.'. $routeName .'')</a></li>
    <li class="breadcrumb-item"> @lang('site.edit_'. $routeName .'') </li>
    
@endcomponent
    <div class="row">
        <div class="col-md-12">
            <div class="tile mb-4">
        <form action="{{ route('dashboard.'. $routeName .'.update', $row->id) }}" method="POST">
            @csrf
            @method('put')
 
           @include('backend.partials._errors')

           @include('backend.'. $routeName .'.form')

           
            <div class="form-group">
                <button type="submit" class="btn btn-primary"><i class="fa fa-edit"></i> @lang('site.update') </button>
            </div>
        </form>
    </div>{{-- end of tile  --}}

        </div>{{-- end of col 12 --}}
    </div>{{-- end of row --}}

@endsection