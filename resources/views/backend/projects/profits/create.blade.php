@extends('layouts.backend.app')

@section('pageTitle')
   اقفال المشروع
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => 'اقفال المشروع',
        'des'   => '',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.projects.index')}}">المشروعات</a></li>


@endcomponent
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <form action="{{ route('dashboard.project.profits.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('post')

                    @include('backend.partials._errors')
                    <div class="row">
                        <div class="col-md-6">

                            <p class="h5 p-2">اسم المشروع       : {{ $row->name }}</p>
                            <p class="h5 p-2">اسم العميل        : {{ $row->customer->name ?? '' }}</p>
                            <p class="h5 p-2">تكلفة العميل      : {{ number_format($row->customer_cost) }}</p>
                            <p class="h5 p-2">التكلفة التقديرية : {{ number_format($row->estimated_cost) }}</p>
                            <p class="h5 p-2">التكلفة الفعلية   : {{ number_format($row->expenses->sum('amount'))  }}</p>
                            <p class="h5 p-2">اجمالي الايرادات   : {{ number_format($row->revenues->sum('net_amount')) }}</p>
                            <p class="h3 p-2">صافي الربح / الخسارة  : {{ number_format($row->revenues->sum('net_amount') - $row->expenses->sum('amount') ) }}</p>

                        </div>
                        <div class="col-md-6">
                            @if ($row->revenues->sum('net_amount') - $row->expenses->sum('amount') > 0)

                            <div class="form-group" id="safe">
                                <label> الخزن</label>
                                <select  name="safe_id" class="form-control" required >
                                    <option selected disabled >  اختر خزنة ترحيل الارباح</option>

                                    @foreach ($safes as $safe )
                                        <option value="{{ $safe->id }}" > {{ $safe->name }} </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-lock"></i> اقفال المشروع وترحيل الارباح </button>
                            </div>

                            @endif

                        </div>
                    </div>


                </form> {{-- end of form --}}
            </div>{{-- end of tile  --}}

        </div>{{-- end of col-md-12 --}}
    </div> {{-- end of row --}}


@endsection
