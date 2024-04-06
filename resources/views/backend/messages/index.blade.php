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

    <div class="row">
        <div class="col-md-4">
          <div class="widget-small primary"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>@lang('site.leads')</h4>
              <p><b>{{ $leads->count() }}</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="widget-small info"><i class="icon fa fa-commenting-o fa-3x"></i>
            <div class="info">
              <h4>@lang('site.messages')</h4>
              <p><b>{{$messages->count()}}</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="widget-small warning"><i class="icon fa fa-envelope-o fa-3x"></i>
            <div class="info">
              <h4>@lang('site.news')</h4>
              <p><b>{{ $news->count() }}</b></p>
            </div>
          </div>
        </div>

    </div>
    <h2 class="text-center btn btn-info">@lang('site.show_last') 5 </h2>
    <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="row">
                <div class="col-md-6">
                     <h3 class="tile-title"> @lang('site.leads') </h3>
                </div>
                <div class="col-md-6">
                 <a class="btn btn-primary" href="{{ asset('dashboard/message-type/2') }}" > @lang('site.show_all')</a>
                </div>
            </div>
            <table class="table table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>@lang('site.name')</th>
                  <th>@lang('site.email')</th>
                  <th>@lang('site.phone')</th>
                  <th>@lang('site.message')</th>

                </tr>
              </thead>
              <tbody>
                @foreach ($leads as $index=>$lead)
                    <tr>
                    <td >{{ $index+1 }}</td>
                    <td>{{ $lead->name }}</td>
                    <td>{{ $lead->email }}</td>
                    <td>{{ $lead->phone }}</td>
                    <td>{{ $lead->message }}</td>

                    </tr>
               @endforeach
              </tbody>
            </table>
          </div>
        </div> {{--  end of --}}
        <div class="col-md-12">
          <div class="tile">
              <div class="row">
                <div class="col-md-6">
                     <h3 class="tile-title">@lang('site.messages')</h3>
                </div>
                <div class="col-md-6">
                 <a class="btn btn-primary" href="{{ asset('dashboard/message-type/1') }}" > @lang('site.show_all')</a>
                </div>
            </div>

            <table class="table table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>@lang('site.name')</th>
                  <th>@lang('site.email')</th>
                  <th>@lang('site.phone')</th>
                  <th>@lang('site.message')</th>
                </tr>
              </thead>
              <tbody>
                 @foreach ($messages as $index=>$message)
                    <tr>
                    <td >{{ $index+1 }}</td>
                    <td>{{ $message->name }}</td>
                    <td>{{ $message->email }}</td>
                    <td>{{ $message->phone }}</td>
                    <td>
                            <div class="bs-component" style="margin-bottom: 3em;">
                                <button class="btn btn-secondary" type="button" title=""
                                data-container="body"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="{{ $message->message }}"
                                data-original-title="{{ $message->subject }}" aria-describedby="popover458608">Read
                                </button>
                            </div>
                        </td>


                    </tr>
               @endforeach

              </tbody>
            </table>
          </div>
        </div> {{--  end of --}}
        <div class="col-md-12">
          <div class="tile">
               <div class="row">
                <div class="col-md-6">
                     <h3 class="tile-title">@lang('site.news')</h3>
                </div>
                <div class="col-md-6">
                 <a class="btn btn-primary" href="{{ asset('dashboard/message-type/3') }}" > @lang('site.show_all')</a>
                </div>

            <table class="table table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>@lang('site.email')</th>

                </tr>
              </thead>
              <tbody>

                 @foreach ($news as $index=>$new)
                    <tr>
                    <td >{{ $index+1 }}</td>

                    <td>{{ $new->email }}</td>

                    </tr>
               @endforeach
              </tbody>
            </table>
          </div>
        </div> {{--  end of --}}

    </div>{{-- end of row --}}
@push('js')
  <script>
      $('.bs-component [data-toggle="popover"]').popover();
      $('.bs-component [data-toggle="tooltip"]').tooltip();
    </script>
@endpush
@endsection
