@extends('layouts.backend.app')

@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('pageTitle')
ادارة المشروع
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => 'تقرير المشروع',
        'des' => '',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">@lang('site.'. $routeName .'')</a></li>
    <li class="breadcrumb-item">تقرير المشروع</li>

@endcomponent

    <div class="tile mb-4">
        {{-- project statictes  --}}
        <div class="row">
            <div class="col-md-12 mb-3">
                <h2 class="text-center text-primary mb-3"> {{ $project->name . " ( " . number_format($projectProgress) ." % )" }} </h4>
                <div class="row table-info p-3">
                <div class="col-md-3"> كود المشروع : {{ $project->code }} </div>
                <div class="col-md-3"> العميل : {{ $project->customer->name }} </div>
                <div class="col-md-3">تاريخ البدء : {{ $project->start_date }} </div>
                <div class="col-md-3">تاريخ الانتهاء : {{ $project->end_date }} </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>تكلفة المواد  </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($materials->sum('amount')) }}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>الاجور   </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($wages->sum('amount') )}}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4> مقاولين الباطن  </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($contactorsRevenus->sum('amount')) }}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>مصروفات اخري </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($expenses->sum('amount')) }}</p>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>تكلفة المشروع  </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($project->customer_cost) }}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>التكلفة التقديرية   </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($project->estimated_cost )}}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>التكلفة الفعلية  </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($contactorsRevenus->sum('amount') + $wages->sum('amount') + $materials->sum('amount') + $expenses->sum('amount') )}}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4> الربح الفعلي  </h4>
                        <p style="font-weight: bold; font-size: 20px">
                            {{ number_format($project->revenues->sum('net_amount')  - $project->expenses->sum('amount') ) }}
                            {{--number_format( $project->customer_cost - ($contactorsRevenus->sum('amount') + $wages->sum('amount') + $materials->sum('amount') + $expenses->sum('amount')) )--}}
                        </p>
                    </div>
                </div>
            </div>

        </div> {{-- end of row --}}
    </div>

    <div class="tile mb-4">
        {{-- project details  --}}
        <div class="row">
            <div class="col-md-12">
                @if ($projectItems->count() > 0)
                <h3>بنود مقايسة المشروع</h3>
                <table class="table table-bordered">
                    <thead class="table-info">
                        <tr>
                        <th>الكود</th>
                        <th>بيان الاعمال  </th>
                        <th> كمية البند  </th>
                        <th>الفئة </th>
                        <th>اجمالي قيمة البند</th>
                        <th>الكمية المنفذة علي الطبيعة</th>
                        <th> اجمالي الكمية المنفذة علي الطبيعة </th>

                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($projectItems as  $item)
                        <tr>

                            <td>{{ $item->code }}</td>
                            <td>{{ $item->name }}</td>
                            <td>{{ $item->qty }}</td>
                            <td>{{ $item->cat }}</td>
                            <td>{{ $item->item_total }}</td>
                            <td>{{ $item->implement_qty }}</td>
                            <td>{{ $item->total_implement_qty }}</td>


                        </tr>
                        @endforeach

                        <tr class="table-danger">

                            <td>الاجمالي</td>
                            <td>{{ $projectItems->sum('qty') }}</td>
                            <td>{{ $projectItems->sum('cat') }}</td>
                            <td>{{ $projectItems->sum('item_total') }}</td>
                            <td>{{ $projectItems->sum('implement_qty') }}</td>
                            <td>{{ $projectItems->sum('total_implement_qty') }}</td>
                            <td>{{ number_format($projectProgress ,2) ." % " }} : نسبة الانجاز </td>
                        </tr>
                    </tbody>
                </table>
                @endif
            </div>
            <div class="col-md-12">
                <hr>
                @if ($materials->count() > 0)
                <h3> مواد المشروع</h3>
                <table class="table table-bordered">
                    <thead class="table-info">
                        <tr>
                        <th>#</th>
                        <th>تاريخ التوريد</th>
                        <th> الاسم  </th>
                        <th>الكمية </th>
                        <th>التكلفة</th>
                        <th>المستند</th>
                        <th>ملاحظات</th>

                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($materials as  $material)
                        <tr>
                            <td >{{ $loop->index }}</td>
                            <td>{{ $material->date }}</td>
                            <td>{{ $material->material_name }}</td>
                            <td>{{ $material->material_qty }}</td>
                            <td>{{ $material->amount }}</td>
                            <td>
                                @if($material->file)
                                    <a href="{{url('public/uploads/projects/materials/'.$material->file) }}" download="">تحميل المستند</a>
                                    @else
                                    -----
                                    @endif
                            </td>
                            <td>{{ $material->note }}</td>

                        </tr>
                        @endforeach
                    </tbody>
                </table>
                @endif
            </div>
            <div class="col-md-12">

                @if ($wages->count() > 0)
                <hr>
                <h3>الاجور داخل المشروع</h3>
                <table class="table table-bordered">
                    <thead class="table-info">
                        <tr>
                        <th>#</th>
                        <th>الموظف </th>
                        <th>تاريخ </th>
                        <th> القيمة  </th>
                        <th>الغرض </th>
                        <th>المستند</th>

                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($wages as  $expense)
                        <tr>
                            <td >{{ $loop->index }}</td>
                            <td>{{ $expense->employee->name ?? '' }}</td>
                            <td>{{ $expense->date }}</td>
                            <td>{{ $expense->amount }}</td>
                            <td>{{ $expense->note }}</td>
                            <td>
                                @if($expense->file)
                                    <a href="{{url('public/uploads/projects/expenses/'.$expense->file) }}" download="">تحميل المستند</a>
                                    @else
                                    -----
                                    @endif
                            </td>

                        </tr>
                        @endforeach
                    </tbody>
                </table>
                @endif
            </div>
            <div class="col-md-12">
                 @if ($expenses->count() > 0)
                 <hr>
                <h3>المصروفات الاخري داخل المشروع</h3>
                <table class="table table-bordered">
                    <thead class="table-info">
                        <tr>
                        <th>#</th>
                            <th>تاريخ </th>
                        <th> القيمة  </th>
                        <th>الغرض </th>
                        <th>المستند</th>

                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($expenses as  $expense)
                        <tr>
                            <td >{{ $loop->index }}</td>
                            <td>{{ $expense->date }}</td>
                            <td>{{ $expense->amount }}</td>
                            <td>{{ $expense->note }}</td>
                            <td>
                                @if($expense->file)
                                    <a href="{{url('public/uploads/projects/expenses/'.$expense->file) }}" download="">تحميل المستند</a>
                                    @else
                                    -----
                                    @endif
                            </td>

                        </tr>
                        @endforeach
                    </tbody>
                </table>
                @endif
            </div>
            <div class="col-md-12">
                @if ($contactorsRevenus->count() > 0)
                <hr>
                <h3 >  مستخلاصات   المقاولاين  داخل المشروع </h3>
                <table class="table  table-bordered">
                    <thead  class="table-info">
                        <tr>
                        <th>#</th>
                        <th> رقم المستخلص  </th>
                        <th>تاريخ   </th>
                        <th>المقاول </th>
                        <th>قيمة المستخلص  </th>
                        <th>المستند</th>

                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($contactorsRevenus as $revenu)
                        <tr >
                            <td>{{ $loop->index+1 }}</td>
                            <td>{{ $revenu->reference }} </td>
                            <td>{{ $revenu->date }}</td>
                            <td>{{ $revenu->contactor->name ?? '' }} </td>
                            <td>{{ $revenu->amount }}</td>
                            <td>
                                @if($revenu->file)
                                <a href="{{url('public/uploads/projects/contractorrevenu/'.$revenu->file) }}" download="">تحميل المستند</a>
                                @else
                                -----
                                @endif
                            </td>

                        </tr>
                        @endforeach

                    </tbody>
                </table>
                @endif
            </div>

            <div class="col-md-12">
                @if ($revenus->count() > 0)
                <hr>
                <h3 >  مستخلاصات المشروع </h3>
                <table class="table  table-bordered">
                    <thead  class="table-info">
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

                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($revenus as $index=>$row)
                        <tr >
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

                        </tr>
                        @endforeach

                    </tbody>
                </table>
                @endif
            </div>

        </div>{{-- end of row --}}


    </div>{{-- end of tile  --}}
@endsection
