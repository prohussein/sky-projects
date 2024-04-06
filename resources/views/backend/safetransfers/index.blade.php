@extends('layouts.backend.app')

@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('pageTitle')
  التحويلات بين الخزن
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => 'التحويلات ',
        'des'   => '',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">التحويلات بين الخزن</a></li>
    <li class="breadcrumb-item">التحويلات</li>

@endcomponent

    <div class="tile mb-4">
        <div class="row">
            <div class="col-md-12">

                <div class="col-md-12 text-center">

                    <a href=" {{ route('dashboard.'. $routeName .'.index') }} " class="btn btn-primary"> <i class="fa fa-refresh"></i> @lang('site.refresh')</a>
                    <a href="{{ route('dashboard.'. $routeName .'.create')  }}" class="btn btn-primary"> <i class="fa fa-plus"></i>@lang('site.add')</a>
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
                                        <th>#</th>
                                        <th>التاريخ </th>
                                         <th>من خزنة </th>
                                        <th>الي خزنة </th>
                                        <th>القيمة  </th>
                                        <th>اضيف بواسطة  </th>
                                        <th>ملاحظات </th>
                                        <th>@lang('site.action')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($rows as $index=>$row)
                                    <tr>
                                        <td > {{ $index+1 }}          </td>
                                        <td > {{ $row->transfer_date }}        </td>
                                        <td > {{ $row->senderSafe->name ?? '' }}</td>
                                        <td > {{ $row->receiverSafe->name ?? '' }}</td>
                                        <td > {{ $row->amount }}      </td>
                                        <td > {{ $row->user->name ?? '' }}   </td>
                                        <td > {{ $row->notes }}   </td>
                                        <td>
                                            @include('backend.partials._buttons')
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table> {{-- end of table  --}}

                            {{--  {{ $rows->appends(request()->query())->links() }}  --}}
                            @else
                                <br>
                                <h2 class="text-center"> @lang('site.no_data_found')  </h2>
                            @endif
                        </div>
                    </div>

            </div>{{-- end of col 12 --}}

        </div>{{-- end of row --}}
    </div>{{-- end of tile  --}}
@endsection
