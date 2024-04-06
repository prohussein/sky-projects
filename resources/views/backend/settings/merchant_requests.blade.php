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
        <form action="{{ route('dashboard.settings.store') }}" method="POST">
            @csrf
            @method('post')
 
           @include('backend.partials._errors')

         
          
              {{--  description en --}}
            <div class="col-md-12">
                @php $input = "merchant_requests_en"; @endphp 
                <div class="form-group">
                <label> @lang('site.merchant_requests')  </label>
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
                @php $input = "merchant_requests-ar"; @endphp 
                <div class="form-group">
                <label> @lang('site.merchant_requests-ar')  </label>
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