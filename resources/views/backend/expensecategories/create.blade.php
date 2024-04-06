@extends('layouts.backend.app')

@section('pageTitle')
   @lang('site.add_'. $routeName .'') 
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => __('site.'. $routeName .''),
        'des'   => __('site.add_'. $routeName .'_des'),
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">@lang('site.'. $routeName .'')</a></li>
    <li class="breadcrumb-item"> @lang('site.add_'. $routeName .'') </li>
    
@endcomponent
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <form action="{{ route('dashboard.'. $routeName .'.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('post')
        
                    @include('backend.partials._errors')

                    @include('backend.'. $routeName .'.form')


                    <div class="form-group">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-plus"></i> @lang('site.add') </button>
                    </div>
                </form> {{-- end of form --}}
            </div>{{-- end of tile  --}}
            
        </div>{{-- end of col-md-12 --}}
    </div> {{-- end of row --}}


@endsection