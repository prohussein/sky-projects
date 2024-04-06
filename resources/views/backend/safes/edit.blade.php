@extends('layouts.backend.app')
@section('pageTitle')
   تعديل الخزنة
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' =>'الخزن ',
        'des'   => '',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">الخزن</a></li>
    <li class="breadcrumb-item"> تعديل الخزنة </li>

@endcomponent
    <div class="row">
        <div class="col-md-12">
            <div class="tile mb-4">
        <form action="{{ route('dashboard.'. $routeName .'.update', $row->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('put')

           @include('backend.partials._errors')

           @include('backend.'. $routeName .'.form')

           <input type="hidden" value="{{$row->id}}" name="id">
            <div class="form-group">
                <button type="submit" class="btn btn-primary"><i class="fa fa-edit"></i> @lang('site.update') </button>
            </div>
        </form>
    </div>{{-- end of tile  --}}

        </div>{{-- end of col 12 --}}
    </div>{{-- end of row --}}

@endsection
