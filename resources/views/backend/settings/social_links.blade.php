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
    {{--  <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">@lang('site.'. $routeName .'')</a></li>
    <li class="breadcrumb-item"> @lang('site.edit_'. $routeName .'') </li>  --}}

@endcomponent

    <div class="row">
        <div class="col-md-12">
            <div class="tile mb-4">
        <form action="{{ route('dashboard.settings.store') }}" method="POST">
            @csrf
            @method('post')

           @include('backend.partials._errors')

           @php
               $social_sites = ['facebook', 'google', 'youtube', 'whatsapp', 'phone', 'email','twitter', 'linkedin','instagram','address','work_hours'];
           @endphp
            @foreach($social_sites  as $social_site)
            {{-- link --}}
            <div class="form-group">
                <label class="text-capitalize"> {{ $social_site }}  </label>
                <input type="text" name="{{ $social_site }}" class="form-control" value="{{ setting($social_site)}}">
            </div>



            @endforeach

            <hr>

            @php
               $facts = ['projects', 'clients', 'years_ex', 'team_no'];
           @endphp
            @foreach($facts  as $fact)
            {{-- link --}}
                <div class="form-group">
                    <label class="text-capitalize"> {{ $fact }}  </label>
                    <input type="text" name="{{ $fact }}" class="form-control" value="{{ setting($fact)}}">
                </div>
            @endforeach
            <div class="form-group">
                <button type="submit" class="btn btn-primary"><i class="fa fa-plus"></i> Add </button>
            </div>
        </form>
    </div>{{-- end of tile  --}}

        </div>{{-- end of col 12 --}}
    </div>{{-- end of row --}}

@endsection
