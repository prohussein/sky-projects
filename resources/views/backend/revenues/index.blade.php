@extends('layouts.backend.app')

@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('pageTitle')
  المستخلصات
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => __('site.'. $routeName .''),
        'des'   => '',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">@lang('site.'. $routeName .'')</a></li>
    <li class="breadcrumb-item">@lang('site.'. $routeName .'')</li>

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
                                        <th>الكود </th>
                                         <th>العميل </th>
                                        <th>المشروع </th>
                                        <th>التاريخ</th>
                                        <th>القيمة الاجمالية</th>
                                        <th>قيمة الضرائب</th>
                                        <th>صافي القيمة</th>
                                        <th>المستند</th>
                                        <th>@lang('site.action')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($rows as $index=>$row)
                                    <tr>
                                        <td > {{ $index+1 }}          </td>
                                        <td > {{ $row->code }}        </td>
                                        <td > {{ $row->customer->name ?? '' }}</td>
                                        <td > {{ $row->project->name ?? '' }}</td>
                                        <td > {{ $row->date }}      </td>
                                        <td > {{ $row->total_amount }}   </td>
                                        <td > {{ $row->tax_amount }}   </td>
                                        <td > {{ $row->net_amount }}   </td>
                                        <td>
                                            @if($row->file)
                                             <a href="{{url('public/uploads/revenues/'.$row->file) }}" download="">تحميل المستند</a>
                                             @else
                                             -----
                                             @endif
                                        </td>
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
