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


@endcomponent

    <div class="row">
        <div class="col-md-12">
            <div class="tile mb-4">
        <form action="{{ route('dashboard.settings.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('post')

           @include('backend.partials._errors')

              {{--  description en --}}
            <div class="col-md-12">
                @php $input = "about-intro"; @endphp
                <div class="form-group">
                <label> @lang('site.about')  </label>
                <div class="adjoined-bottom">
                    <div class="grid-container">
                    <div class="grid-width-100">
                        <textarea id="editor" name="{{ $input }}">
                        {{ setting($input)}}
                        </textarea>
                    </div>
                    </div>
                </div>
                </div>
            </div>

            {{--  description ar --}}
            <div class="col-md-12">
                @php $input = "about-intro-ar"; @endphp
                <div class="form-group">
                <label> @lang('site.about-ar')  </label>
                <div class="adjoined-bottom">
                    <div class="grid-container">
                    <div class="grid-width-100">
                        <textarea id="editor1" name="{{ $input }}">
                        {{ setting($input)}}
                        </textarea>
                    </div>
                    </div>
                </div>
                </div>
            </div>

            <div class="form-group col-md-6">
                    <label > صورة الصفحة </label>
                    <div class="custom-file mb-4">
                        <input type="file" class="form-control" name="about_img" value="{{ setting('about_img') }}">
                    </div>
                    <img width="74" height="74" src="{{ url('public/uploads/settings/'. setting('about_img') ) }}" />
                </div>

               {{--  description en --}}
            <div class="col-md-12">
                @php $input = "about-footer-ar"; @endphp
                <div class="form-group">
                <label> نص الفوتر عربي  </label>
                    <textarea name="{{ $input }}" class="form-control">
                    {{ setting($input)}}
                    </textarea>
                </div>
            </div>
            <div class="col-md-12">
                @php $input = "about-footer-en"; @endphp
                <div class="form-group">
                <label> Footer Text English </label>
                    <textarea name="{{ $input }}" class="form-control">
                    {{ setting($input)}}
                    </textarea>
                </div>
            </div>

            {{--  description ar --}}
            {{--  <div class="col-md-12">
                @php $input = "about-team-en"; @endphp
                <div class="form-group">
                <label> @lang('site.team-en')  </label>
                <div class="adjoined-bottom">
                    <div class="grid-container">
                    <div class="grid-width-100">
                        <textarea id="editor3" name="{{ $input }}">
                        {{ setting($input)}}
                        </textarea>
                    </div>
                    </div>
                </div>
                </div>
            </div>  --}}
            {{-- <div class="col-md-12">
                @php $input = "features"; @endphp
                <div class="form-group">
                <label> @lang('site.description_ar')  </label>
                <div class="adjoined-bottom">
                    <div class="grid-container">
                    <div class="grid-width-100">
                        <textarea id="editor1" name="{{ $input }}">
                        {{ setting($input)}}
                        </textarea>
                    </div>
                    </div>
                </div>
                </div>
            </div> --}}





            <div class="form-group">
                <button type="submit" class="btn btn-primary"><i class="fa fa-plus"></i> SAVE </button>
            </div>
        </form>
    </div>{{-- end of tile  --}}

        </div>{{-- end of col 12 --}}
    </div>{{-- end of row --}}

    @push('js')
    <script>
        	initSample();

    </script>
    @endpush
@endsection
