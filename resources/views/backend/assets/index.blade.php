@extends('layouts.backend.app')

@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('pageTitle')
  الاصول
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

    <form action="{{route('dashboard.assets.index')}}" method="get">
        <div class="row">
                <div class="form-group col-md-3">
                    <label>النوع</label>
                    <select  name="type" class="form-control" id="type">
                        <option value="cash" {{ isset($request) && $request->type == 'cash' ? 'selected' : '' }} > نقدي </option>
                        <option value="properties" {{ isset($request) && $request->type == 'properties' ? 'selected' : '' }} > ممتلكات </option>
                        <option value="cash_money" {{ isset($request) && $request->type == 'cash_money' ? 'selected' : '' }} > نقود ائتمانية  </option>
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <button class="btn btn-info btn-lg mt-4" type="submit"> بحث</button>
                </div>


        </div>
    </form>

</div>
<div class="tile mb-4">
    {{-- project statictes  --}}
    <div class="row">

        <div class="col-md-4">
            <div class="widget-small primary" >
                <div class="info text-center">
                    <h4> نقدي   </h4>
                    <p style="font-weight: bold; font-size: 20px">
                        {{ $rows->where("type", 'cash')->count() }}
                    </p>
                    <p style="font-weight: bold; font-size: 20px">
                        {{ number_format ($rows->where("type", 'cash')->sum('amount')) }}
                    </p>

                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="widget-small primary" >
                <div class="info text-center">
                    <h4>ممتلكات  </h4>
                    <p style="font-weight: bold; font-size: 20px">
                        {{ $rows->where("type", 'properties')->count() }}
                    </p>
                    <p style="font-weight: bold; font-size: 20px">
                        {{ number_format ($rows->where("type", 'properties')->sum('amount')) }}
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="widget-small primary" >
                <div class="info text-center">
                    <h4> نقود ائتمانية   </h4>
                    <p style="font-weight: bold; font-size: 20px">
                        {{ $rows->where("type", 'cash_money')->count() }}
                    </p>
                    <p style="font-weight: bold; font-size: 20px">
                        {{ number_format ($rows->where("type", 'cash_money')->sum('amount')) }}
                    </p>
                </div>
            </div>
        </div>



    </div> {{-- end of row --}}
</div>

    <div class="tile mb-4">
        <div class="row">
            <div class="col-md-12">

                <div class="col-md-12 text-center">

                    <a href=" {{ route('dashboard.'. $routeName .'.index') }} " class="btn btn-primary"> <i class="fa fa-refresh"></i> @lang('site.refresh')</a>
                    <a href="{{ route('dashboard.'. $routeName .'.create')  }}" class="btn btn-primary"> <i class="fa fa-plus"></i>@lang('site.add')</a>
                    <form name="allexcel" action="{{ route('dashboard.assets.export.excell' ) }}" method="get" style="display:inline-block">
                        <input type="hidden"  name="type"   value="{{ $request->type }}">
                    <button   class="btn btn-warning" type="submit"> تصدير ملف اكسيل</button>
                </form>
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
                                    <tr class="text-white bg-secondary">
                                        <th>#</th>
                                        <th>الاسم </th>
                                         <th>النوع </th>
                                        <th>القيمة </th>
                                        <th> الخزنة </th>
                                        <th>المستند </th>
                                        <th>الوصف</th>
                                        <th>@lang('site.action')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($rows as $index=>$row)
                                    <tr>
                                        <td > {{ $index+1 }}          </td>
                                        <td > {{ $row->name }}        </td>
                                        <td >
                                            @if ($row->type == 'cash')
                                                    نقدي
                                            @elseif ($row->type == 'properties')
                                                    ممتلكات
                                                    @elseif ($row->type == 'cash_money')
                                                    نقود ائتمانية
                                            @endif

                                        </td>
                                        <td > {{ $row->amount }} </td>
                                        <td > {{ $row->safe->name ?? '' }}   </td>
                                        <td>
                                            @if($row->file)
                                             <a href="{{url('public/uploads/assets/'.$row->file) }}" download="">تحميل المستند</a>
                                             @else
                                             -----
                                             @endif
                                        </td>
                                        <td > {{ $row->descripton }} </td>
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
