@extends('layouts.backend.app')
@php
	$lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('pageTitle')
   @lang('site.'. $routeName .'')
@endsection


@section('content')

@component('backend.partials._pagebar',
    [
        'title' => __('site.'. $routeName .''),
        'des'   => __('site.edit_'. $routeName .'_des'),
    ])


@endcomponent

    <div class="row">
        <div class="col-lg-12 col-12 layout-spacing ">
            <div class="statbox widget box box-shadow p-3">
                <div class="col-md-12">
                    <div class="tile mb-4">
                 <form action="{{ route('dashboard.settings.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('post')

                    @include('backend.partials._errors')

                @php
                    $settings = ['company_name'];
                @endphp
                <div class="row">
                @foreach($settings  as $setting)
                {{-- link --}}

                <div class="form-group col-md-6">
                    <label class="text-capitalize">  @lang('site.'. $setting .'') </label>
                    <input type="text" name="{{ $setting }}" class="form-control" value="{{ setting($setting)}}">
                </div>
                @endforeach


                <div class="form-group col-md-6">
                    <label > لوجو </label>
                    <div class="custom-file mb-4">
                        <input type="file" class="form-control" name="logo" value="{{ setting('logo') }}">
                    </div>
                    <img width="74" height="74" src="{{ url('public/uploads/settings/'. setting('logo') ) }}" />
                </div>


                <div class="form-group">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-plus"></i> @lang('site.save')</button>
                </div>
            </form>
            </div>{{-- end of tile  --}}

        </div>{{-- end of col 12 --}}
            </div>
        </div>
    </div>{{-- end of row --}}

@endsection

@push('js')
<script src="{{ asset('public/backend/ckeditor/ckeditor.js') }}"></script>
<script>
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );
</script>
<script>
    ClassicEditor
        .create( document.querySelector( '#editor1' ) )
        .catch( error => {
            console.error( error );
        } );
</script>
@endpush
