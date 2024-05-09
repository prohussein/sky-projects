@extends('layouts.backend.app')

@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('pageTitle')
   @lang('site.'. $routeName .'')
@endsection

@section('content')
@push('css')
<style>
    .no-space{
         white-space: nowrap;
         text-align: center;
    }




</style>
@endpush
@component('backend.partials._pagebar',
    [
        'title' => __('site.'. $routeName .''),
        'des' => '',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">@lang('site.'. $routeName .'')</a></li>
    <li class="breadcrumb-item">@lang('site.'. $routeName .'')</li>

@endcomponent
<div class="tile mb-4">

    <form action="{{route('dashboard.projects.index')}}" method="get">
        <div class="row">
                <div class="form-group col-md-3">
                    <label>العميل</label>
                    <select  class="form-control" id="customer" name="customer_id">
                        <option value="" > الكل </option>
                        @foreach ($customers as $customer)
                            <option value="{{ $customer->id }}" {{ isset($request) && $request->customer_id == $customer->id  ? 'selected' : '' }} > {{ $customer->name }} </option>
                        @endforeach
                    </select>
                </div>
                 <div class="form-group col-md-3">
                    <label>من تاريخ</label>
                    <input type="date" name="from" class="form-control" value="{{ isset($request) && $request->from   ? $request->from : '' }}">
                </div>
                 <div class="form-group col-md-3">
                    <label>الي تاريخ</label>
                    <input type="date" name="to" class="form-control" value="{{ isset($request) && $request->to   ? $request->to : '' }}">
                </div>
                <div class="form-group col-md-3">
                    <button class="btn btn-info btn-lg mt-4" type="submit"> بحث</button>
                </div>


        </div>
    </form>

</div>
    <div class="tile mb-4">
        <div class="row">
            <div class="col-md-12">

                <div class="col-md-12 text-center">

                    <a href=" {{ route('dashboard.'. $routeName .'.index') }} " class="btn btn-primary"> <i class="fa fa-refresh"></i> @lang('site.refresh')</a>
                    <a href="{{ route('dashboard.'. $routeName .'.create')  }}" class="btn btn-primary"> <i class="fa fa-plus"></i>@lang('site.add')</a>
                    <a href="{{ route('dashboard.'. $routeName .'.export.excel')  }}" class="btn btn-info"> <i class="fa fa-plus"></i>تصدير اكسيل</a>

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
                                        <th rowspan="2">#</th>
                                        <th rowspan="2">@lang('site.name') </th>
                                        <th rowspan="2">الكود</th>
                                        <th rowspan="2" class="no-space">العميل  </th>
                                        <th rowspan="2" class="no-space">تاريخ البداية  </th>
                                        <th rowspan="2" class="no-space">تاريخ الانتهاء </th>
                                        <th rowspan="2" class="no-space">تكلفة العميل <br> {{ number_format($rows->sum('customer_cost') )}} </th>
                                        <th rowspan="2" class="no-space">التكلفة المتوقعة <br> {{ number_format($rows->sum('estimated_cost')) }} </th>
                                        <th colspan="4" class="no-space">عناصر تكاليف المشروع</th>
                                        <th rowspan="2" class="no-space">اجمالي التكاليف <br> {{ number_format($rows->pluck('expenses')->flatten()->sum('amount')) }}</th>
                                        <th rowspan="2" class="no-space">نسبة الانجاز</th>
                                        <th colspan="3" class="no-space">الايرادات </th>
                                        <th colspan="2" class="no-space">ربح العملية</th>

                                        <th rowspan="2" class="no-space">@lang('site.action')</th>
                                    </tr>
                                    <tr class="text-white bg-secondary">

                                        <th > المواد <br>
                                            {{ number_format($rows->pluck('expenses')->flatten()->where('type', 'materials')->sum('amount')) }}
                                           </th>
                                        <th class="no-space">مقاولين الباطن <br>
                                            {{ number_format($rows->pluck('expenses')->flatten()->where('type', 'subcontractor')->sum('amount')) }}
                                        </th>
                                        <th>الاجور <br>
                                            {{ number_format($rows->pluck('expenses')->flatten()->where('type', 'tempwages')->sum('amount')) }}
                                        </th>
                                        <th class="no-space">مصروفات اخري <br>
                                            {{ number_format($rows->pluck('expenses')->flatten()->where('type', 'other')->sum('amount')) }}
                                        </th>

                                        <th class="no-space">اجمالي <br>
                                            {{ number_format($rows->pluck('revenues')->flatten()->sum('total_amount')) }}

                                        </th>
                                        <th class="no-space">الاستقطاعات <br>
                                            {{ number_format($rows->pluck('revenues')->flatten()->sum('tax_amount')) }}

                                        </th>
                                        <th class="no-space">الصافي <br>
                                            {{ number_format($rows->pluck('revenues')->flatten()->sum('net_amount')) }}

                                        </th>

                                        <th class="no-space">ربح متوقع cust - estim<br>

                                            {{ number_format($rows->sum('customer_cost') - $rows->sum('estimated_cost')) }}
                                        </th>
                                        <th class="no-space">ربح فعلي <br>
                                            {{ number_format($rows->pluck('revenues')->flatten()->sum('net_amount')  - $rows->pluck('expenses')->flatten()->sum('amount') ) }}
                                        </th>



                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($rows as $index=>$row)
                                    <tr>
                                        <td >{{ $index+1 }}</td>
                                        <td class="no-space"> {{ $row->name }} </td>
                                        <td > {{ $row->code }} </td>
                                        <td class="no-space"> {{ $row->customer->name ?? '' }} </td>
                                        <td > {{ $row->start_date }} </td>
                                        <td > {{ $row->end_date }} </td>
                                        <td > {{ $row->customer_cost }} </td>
                                        <td > {{ $row->estimated_cost }} </td>

                                        <td>
                                            @php $totalMaterials = 0; @endphp
                                            @foreach($row->expenses as $expense)
                                                @if($expense->type === 'materials')
                                                    @php
                                                        $totalMaterials += $expense->amount;
                                                    @endphp
                                                @endif
                                            @endforeach
                                            {{ $totalMaterials }}
                                        </td>
                                        <td>
                                            @php $totalSubcontractor = 0; @endphp
                                            @foreach($row->expenses as $expense)
                                                @if($expense->type === 'subcontractor')
                                                    @php
                                                        $totalSubcontractor += $expense->amount;
                                                    @endphp
                                                @endif
                                            @endforeach

                                            {{ $totalSubcontractor }}
                                        </td>
                                         <td>
                                            @php $totalTempwages = 0; @endphp
                                            @foreach($row->expenses as $expense)
                                                @if($expense->type === 'tempwages')
                                                   @php
                                                        $totalTempwages += $expense->amount;
                                                    @endphp
                                                @endif
                                            @endforeach
                                            {{ $totalTempwages }}
                                        </td>
                                        <td>
                                            @php $totalOther = 0; @endphp
                                            @foreach($row->expenses as $expense)
                                                @if($expense->type === 'other')
                                                   @php
                                                        $totalOther += $expense->amount;
                                                    @endphp
                                                @endif
                                            @endforeach
                                            {{ $totalOther }}
                                        </td>

                                        <td > {{ $row->expenses->sum('amount') }} </td>

                                        <td >
                                            @if ($row->items->sum('total_implement_qty') > 0)
                                            {{ number_format ($row->items->sum('total_implement_qty') / $row->items->sum('item_total') * 100,2)  . ' % ' }}
                                            @else
                                             0 %
                                            @endif


                                        </td>

                                        <td > {{ $row->revenues->sum('total_amount') }}  </td>
                                        <td > {{ $row->revenues->sum('tax_amount') }} </td>
                                        <td > {{ $row->revenues->sum('net_amount') }} </td>

                                        <td > {{ $row->customer_cost - $row->estimated_cost }} </td>
                                        <td > {{ $row->revenues->sum('net_amount')  -  $row->expenses->sum('amount') }} </td>

                                        <td class="no-space">
                                            @if (auth()->user()->hasPermission('update_'.$routeName .''))
                                            <a href="{{route('dashboard.'. $routeName . '.show', $row)}}" class="btn btn-sm btn-primary" title="ادارة المشروع"><i class="fa fa-cogs"></i></a>

                                            @endif
                                            @if (auth()->user()->hasPermission('read_'.$routeName .''))
                                            <a href="{{route('dashboard.'. $routeName . '.report', $row->id)}}" class="btn btn-sm btn-info" title="تقرير المشروع"><i class="fa fa-bar-chart"></i></a>

                                            @endif
                                             @if (auth()->user()->hasPermission('update_'.$routeName .''))
                                            <a href="{{route('dashboard.'. $routeName . '.show', $row)}}" class="btn btn-sm btn-success" title="اقفال المشروع "><i class="fa fa-lock"></i></a>

                                            @endif
                                            @include('backend.partials._buttons')
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table> {{-- end of table  --}}

                            {{--  {{ $rows->appends(request()->query())->links() }}  --}}
                            @else
                                <br>
                                <h2 class="text-center"> @lang('site.no_data_found') </h2>
                            @endif
                        </div>
                    </div>

            </div>{{-- end of col 12 --}}

        </div>{{-- end of row --}}
    </div>{{-- end of tile  --}}
@endsection
