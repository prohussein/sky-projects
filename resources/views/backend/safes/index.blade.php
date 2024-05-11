@extends('layouts.backend.app')

@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('pageTitle')
  الخزن
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => 'الخزن',
        'des'   => '',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">الخزن</a></li>
    <li class="breadcrumb-item">الخزن</li>

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
                                        <th>الاسم </th>
                                         <th>النوع </th>
                                        <th>الرصيد </th>
                                        <th>امين الخزنة</th>
                                        <th>ملاحظات </th>
                                        <th>@lang('site.action')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($rows as $index=>$row)
                                    <tr>
                                        <td > {{ $index+1 }}          </td>
                                        <td > {{ $row->name }}        </td>
                                        <td >
                                            @if ($row->type == 'main')
                                                    رئيسي
                                            @elseif ($row->type == 'bank')
                                                    بنك
                                            @elseif ($row->type == 'custody')
                                                    عهدة

                                            @endif

                                        </td>
                                        <td > {{ number_format($row->balance)  }}      </td>
                                         
                                        <td > {{ $row->employee->name ?? '' }}   </td>
                                        <td > {{ $row->descripton }}   </td>
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
