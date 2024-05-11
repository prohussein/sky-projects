@extends('layouts.backend.app')

@section('pageTitle')
   اقفال المشروع
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => 'اقفال المشروع',
        'des'   => '',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.projects.index')}}">المشروعات</a></li>


@endcomponent
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <form action="{{ route('dashboard.project.profits.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('post')

                    @include('backend.partials._errors')

                    

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-plus"></i> @lang('site.add') </button>
                    </div>
                </form> {{-- end of form --}}
            </div>{{-- end of tile  --}}

        </div>{{-- end of col-md-12 --}}
    </div> {{-- end of row --}}


@endsection
