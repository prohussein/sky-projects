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
            <div class="col-md-12">

                <div class="col-md-12 text-center">

                    <a href="" class="btn btn-primary">
                          @if ($type == 1)
                          All Messages
                          @elseif($type == 2)
                          All Leads
                          @elseif($type == 3)
                          All  subscrubers
                          @endif
                        </a>

                </div>

            </div>{{-- end of col 12--}}
        </div> {{-- end of row --}}

        <div class="row">
            <div class="col-md-12 table-responsive">

                    <div class="tile-body">

                        <div class="table-responsive">
                            @if ($rows->count() > 0)
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                         @if ($type == 2)
                                            <th>#</th>
                                            <th>@lang('site.name')</th>
                                            <th>@lang('site.email')</th>
                                            <th>@lang('site.phone')</th>
                                            <th>@lang('site.message')</th>
                                            <th>@lang('site.action')</th>
                                          @elseif($type == 3)
                                            <th>#</th>
                                            <th>@lang('site.email')</th>
                                            <th>@lang('site.action')</th>
                                           @elseif($type ==1 )
                                            <th>#</th>
                                            <th>@lang('site.name')</th>
                                            <th>@lang('site.email')</th>
                                            <th>@lang('site.phone')</th>
                                            <th>@lang('site.country')</th>
                                            <th>@lang('site.message')</th>
                                            <th>@lang('site.action')</th>
                                            @endif

                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($rows as $index=>$row)
                                    <tr>
                                        @if ($type == 2)


                                        <td >{{ $index+1 }}</td>
                                        <td>{{ $row->name }}</td>
                                        <td>{{ $row->email }}</td>
                                        <td>{{ $row->phone }}</td>
                                        <td>{{ $row->message }}</td>




                                        @elseif($type == 3)
                                        <td >{{ $index+1 }}</td>
                                        <td>{{ $row->email }}</td>

                                         @elseif($type ==1 )
                                        <td >{{ $index+1 }}</td>
                                        <td>{{ $row->name }}</td>
                                        <td>{{ $row->email }}</td>
                                        <td>{{ $row->phone }}</td>
                                        <td>{{ $row->country }}</td>
                                        <td>
                                            <div class="bs-component" style="margin-bottom: 3em;">
                                                <button class="btn btn-secondary" type="button" title=""
                                                data-container="body"
                                                data-toggle="popover"
                                                data-placement="top"
                                                data-content="{{ $row->message }}"
                                                data-original-title="{{ $row->subject }}" aria-describedby="popover458608">Read
                                                </button>
                                            </div>
                                        </td>

                                        @endif

                                         <td>
                                           @if (auth()->user()->hasPermission('delete_'.$routeName .''))
                                                <form action=" {{ route('dashboard.'. $routeName . '.destroy',  $row) }} " method="post" style="display:inline-block">
                                                @csrf
                                                @method('delete')
                                                <button type="submit" class="btn btn-danger btn-sm delete" title="@lang('site.delete')"><i class="fa fa-trash"></i> </button>
                                                </form>
                                                @else
                                                <button type="button" class="btn btn-danger btn-sm delete" disabled><i class="fa fa-trash"></i>  &#x1F625;</button>
                                            @endif
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table> {{-- end of table  --}}

                            {{--  {{ $rows->appends(request()->query())->links() }}  --}}
                            @else
                                <br>
                                <h2 class="text-center"> @lang('site.no_data_found')  &#x1F625;</h2>
                            @endif
                        </div>
                    </div>

            </div>{{-- end of col 12 --}}

        </div>{{-- end of row --}}
    </div>{{-- end of tile  --}}

    @push('js')
  <script>
      $('.bs-component [data-toggle="popover"]').popover();
      $('.bs-component [data-toggle="tooltip"]').tooltip();
    </script>
@endpush
@endsection
