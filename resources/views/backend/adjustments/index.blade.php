@extends('layouts.backend.app')

@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('pageTitle')
  التسويات
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => 'التسويات',
        'des'   => '',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">التسويات</a></li>

@endcomponent
<div class="tile mb-4">

    <form action="{{route('dashboard.adjustments.create')}}" method="get">
        <div class="row">
                <div class="form-group col-md-3">
                   <label> الخزن</label>
                    <select  name="safe_id" class="form-control" required >
                        <option selected disabled > اختر خزنة </option>

                        @foreach ($safes as $safe )
                            <option value="{{ $safe->id }}" {{ isset($row) && $row->safe_id == $safe->id ? 'selected' : '' }} > {{ $safe->name }} </option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <button class="btn btn-info btn-lg mt-4" type="submit"> تسوية  </button>
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
                                        <th>الموظف </th>
                                        <th>التاريخ </th>
                                        <th>الخزنة </th>
                                        <th> الخزنة المحول لها </th>
                                        <th>اجمالي التحويلات </th>
                                        <th>اجمالي المصروفات</th>
                                        <th>الباقي في الخزنة </th>
                                        <th> ملاحظات  </th>
                                        <th>@lang('site.action')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($rows as $index=>$row)
                                    <tr>
                                        <td > {{ $index+1 }}          </td>
                                        <td > {{ $row->user->name ?? '' }} </td>
                                        <td > {{ $row->created_at }} </td>
                                        <td > {{ $row->safe->name ?? '' }}   </td>
                                        <td > {{ $row->receiverSafe->name ?? '' }}   </td>
                                        <td > {{ number_format($row->total_expenses) }} </td>
                                        <td > {{ number_format($row->total_transfares) }} </td>
                                        <td > {{ number_format($row->safe_balance) }} </td>
                                        <td class="text-warp"> {{ $row->notes }} </td>
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
