@extends('layouts.backend.app')

@section('pageTitle')
اضافة تسوية
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => ' اضافة تسوية',
        'des'   =>'',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">التسويات</a></li>
    <li class="breadcrumb-item"> اضافة تسوية </li>

@endcomponent
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <form action="{{ route('dashboard.'. $routeName .'.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('post')

                    @include('backend.partials._errors')

                    {{-- @include('backend.'. $routeName .'.form') --}}



                    <div class="row">
                        {{-- safe statictes  --}}
                        <h2 class="text-center col-md-12 pb-2">{{ $safe->name }}</h2>
                        <div class="col-md-4 ">
                            <div class="widget-small primary" >
                                <div class="info text-center p-2">
                                    <h4> رصيد الخزنة الحالي   </h4>

                                    <p style="font-weight: bold; font-size: 20px">
                                        {{ number_format ($safe->balance) }}
                                    </p>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="widget-small primary" >
                                <div class="info text-center p-2">
                                     <h4> اجمالي المصروفات  </h4>

                                    <p style="font-weight: bold; font-size: 20px">
                                        {{ number_format ($expenses->sum('amount')) }}
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="widget-small primary" >
                                <div class="info text-center p-2">
                                    <h4>اجمالي التحويلات للخزنة  </h4>


                                    <p style="font-weight: bold; font-size: 20px">
                                        {{ number_format ($transfers->sum('amount')) }}
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12"><hr></div>

                        {{-- transfares table --}}
                        <div class="col-md-12">
                            <h5>التحويلات التي تمت للخزنة</h5>
                            <table class="table table-bordered">
                                <thead class="table-info">
                                    <tr>
                                        <th>التاريخ</th>
                                        <th>من خزنة </th>
                                        <th>القيمة</th>
                                        <th>القائم بالتحويل</th>
                                        <th>ملاحظات</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($transfers as $transfer)

                                        <tr>
                                            <td>{{ $transfer->transfer_date }}</td>
                                            <td>{{ $transfer->senderSafe->name ?? ''}}</td>
                                            <td>{{ $transfer->amount }}</td>
                                            <td>{{ $transfer->user->name ?? '' }}</td>
                                            <td>{{ $transfer->notes }}</td>
                                        </tr>

                                    @endforeach

                                </tbody>
                            </table>
                        </div>

                        {{-- expenses table --}}
                        <div class="col-md-12">
                            <h5>المصروفات التي خرجت من الخزنة </h5>
                            <table class="table table-bordered">
                                <thead>
                                    <tr class="table-info">
                                        <th>#</th>
                                        <th>التاريخ</th>
                                        <th>القيمة</th>
                                        <th>النوع </th>
                                        <th>المشروع</th>
                                        <th>ملاحظات</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($expenses as   $index=>$expense)
                                    <tr>
                                        <td>{{ $index+1 }}   </td>
                                        <td>{{ $expense->date }}</td>
                                        <td>{{ $expense->amount }}</td>
                                        <td>{{  translateExpenseType($expense->type) }}</td>
                                        <td>{{ $expense->project->name ?? '' }}</td>
                                        <td>{{ $expense->note }}</td>

                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div> {{-- end of row --}}


                    <div class="form-group">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-plus"></i> تسوية الخزنة  </button>
                    </div>
                </form> {{-- end of form --}}
            </div>{{-- end of tile  --}}

        </div>{{-- end of col-md-12 --}}
    </div> {{-- end of row --}}


@endsection
