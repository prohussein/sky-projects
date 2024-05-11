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
        <div class="row">
            <div class="col-md-12">

                <div class="col-md-12 text-center">
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"><i class="fa fa-list"></i>  اضافة مواد</button>
                    <button type="button" class="btn btn-secondary btn-lg" data-toggle="modal" data-target="#myModalContactors">   <i class="fa fa-user"></i>  اضافة مقاول الي المشروع </button>
                    <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModalContactorsRevenus"> <i class="fa fa-money"></i>  اضافة مستخلص الي المقاول</button>
                    <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#myModalWages">   <i class="fa fa-money"></i> اضافة أجور </button>
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalExpenses"><i class="fa fa-money"></i>    اضافة مصروفات </button>
                </div>

            </div>{{-- end of col 12--}}
        </div> {{-- end of row --}}

                {{-- mange materials --}}
                <div class="modal" id="myModal" style="margin-left: 520px !important; background-color:transparent !important">
                    <div class="modal-dialog">
                        <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"> اضافة مواد المشروع </h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <form id="addMaterials" name="add_materials" action="{{ route('dashboard.project.materials.store') }}" method="post" enctype="multipart/form-data">
                            @csrf
                        <div class="modal-body">
                            <div class="form-group">
                                <label> المشروع </label>
                                <select class="form-control select2" name="project_id">
                                    <option selected disabled>اختر مشروع</option>

                                    @foreach ($projects as $project)
                                    <option value="{{ $project->project_id }}" >{{ $project->project->name ?? ''}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label>اسم المادة</label>
                                <input type="text" name="material_name" class="form-control" value="" required>
                            </div>
                            <div class="form-group">
                                <label>تاريخ التوريد </label>
                                <input type="date" name="date" class="form-control" value="" required>
                            </div>
                            <div class="form-group">
                                <label> الكمية</label>
                                <input type="number" step="-1" name="material_qty" class="form-control" value="" required>
                            </div>
                            <div class="form-group">
                                <label> التكلفة</label>
                                <input type="number" step="-1" name="amount" class="form-control" value="" required>
                            </div>
                            <div class="form-group">
                                <label> الخزن</label>
                                <select  name="safe_id" class="form-control" required >
                                    <option selected disabled > اختر خزنة </option>

                                    @foreach ($safes as $safe )
                                        <option value="{{ $safe->id }}" {{ isset($row) && $row->safe_id == $safe->id ? 'selected' : '' }} > {{ $safe->name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label>رفع المستند   </label>
                                <input type="file" name="file" class="form-control" value="">
                            </div>
                            <div class="form-group">
                                <label> ملاحظات</label>
                                <textarea class="form-control" name="note"></textarea>
                            </div>

                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" >حفظ</button>
                        </div>
                        </form>

                        </div>
                    </div>
                </div>

                {{-- manage subcontractors --}}

                {{-- add contractors --}}
                <div class="modal" id="myModalContactors" style="margin-left: 520px !important; background-color:transparent !important">
                    <div class="modal-dialog">
                        <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"> اضافة مقاول للمشروع </h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <form id="addContactors" name="add_contactors" action="{{ route('dashboard.project.contactor.store') }}" method="post" enctype="multipart/form-data">
                            @csrf
                        <div class="modal-body">
                            <div class="form-group">
                                <label> المشروع </label>
                                <select class="form-control select2" name="project_id">
                                    <option selected disabled>اختر مشروع</option>

                                    @foreach ($projects as $project)
                                    <option value="{{ $project->project_id }}" >{{ $project->project->name ?? '' }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label> المقاول </label>
                                <select class="form-control select2" name="subcontractor_id">
                                    <option selected disabled>اختر مقاول</option>

                                    @foreach ($contactors as $contactor)
                                    <option value="{{ $contactor->id }}" >{{ $contactor->name }}</option>
                                    @endforeach

                                </select>
                            </div>
                            <div class="form-group">
                                <label>تاريخ البدء </label>
                                <input type="date" name="start_date" class="form-control" value="" required>
                            </div>
                            <div class="form-group">
                                <label>تاريخ الانتهاء </label>
                                <input type="date" name="end_date" class="form-control" value="" >
                            </div>

                            <div class="form-group">
                                <label> قيمة التعاقد</label>
                                <input type="number" step="-1" name="amount" class="form-control" value="" required>
                            </div>
                            <div class="form-group">
                                <label>ملفات التعاقد  </label>
                                <input type="file" name="file" class="form-control" value="">
                            </div>
                            <div class="form-group">
                                <label> ملاحظات</label>
                                <textarea class="form-control" name="notes"></textarea>
                            </div>

                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" >حفظ</button>
                        </div>
                        </form>

                        </div>
                    </div>
                </div>

                {{-- add revenue  --}}
                <div class="modal" id="myModalContactorsRevenus" style="margin-left: 520px !important; background-color:transparent !important">
                    <div class="modal-dialog">
                        <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"> اضافة مستخلص مقاول  </h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <form id="addContactorsRvenue" name="add_contactors_rvenue" action="{{ route('dashboard.project.contactor.rvenue.store') }}" method="post" enctype="multipart/form-data">
                            @csrf
                        <div class="modal-body">

                            <div class="form-group">
                                <label> المقاول </label>
                                <select class="form-control select2" name="subcontractor_id" id="contactors">
                                    <option selected disabled>اختر مقاول</option>

                                    @foreach ($contactors as $contactor)
                                        <option value="{{ $contactor->id }}" >{{ $contactor->name }}</option>
                                    @endforeach

                                </select>
                            </div>
                            <div class="form-group">
                                <label> المشروع </label>
                                <select class="form-control select2" name="project_id" id="projects">
                                    <option selected disabled>اختر مشروع</option>


                                </select>
                            </div>
                            <div class="form-group">
                                <label>رقم المستخلص</label>
                                <input type="text" name="reference" class="form-control" value="" required>
                            </div>

                            <div class="form-group">
                                <label>تاريخ  </label>
                                <input type="date" name="date" class="form-control" value="" required>
                            </div>

                            <div class="form-group">
                                <label> قيمة المستخلص</label>
                                <input type="number" step="-1" name="amount" class="form-control" value="" required>
                            </div>
                            <div class="form-group">
                                <label> الخزن</label>
                                <select  name="safe_id" class="form-control" required >
                                    <option selected disabled > اختر خزنة </option>

                                    @foreach ($safes as $safe )
                                        <option value="{{ $safe->id }}" {{ isset($row) && $row->safe_id == $safe->id ? 'selected' : '' }} > {{ $safe->name }} </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <label>رفع المستند   </label>
                                <input type="file" name="file" class="form-control" value="">
                            </div>

                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" >حفظ</button>
                        </div>
                        </form>

                        </div>
                    </div>
                </div>

                {{-- manage wages --}}
                <div class="modal" id="myModalWages" style="margin-left: 520px !important; background-color:transparent !important">
                    <div class="modal-dialog">
                        <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"> اضافة أجور المشروع </h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <form id="addProjectWages" name="add_project_wages" action="{{ route('dashboard.project.wages.store') }}" method="post" enctype="multipart/form-data">
                            @csrf
                        <div class="modal-body">
                            <div class="form-group">
                                <label> المشروع </label>
                                <select class="form-control select2" name="project_id">
                                    <option selected disabled>اختر مشروع</option>

                                    @foreach ($projects as $project)
                                    <option value="{{ $project->project_id }}" >{{ $project->project->name ?? '' }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label> الموظف </label>
                                <select class="form-control select2" name="employee_id">
                                    <option selected disabled>اختر موظف</option>

                                    @foreach ($tempEmployees as $emp)
                                    <option value="{{ $emp->id }}" >{{ $emp->name }}</option>
                                    @endforeach

                                </select>
                            </div>

                            <div class="form-group">
                                <label>تاريخ  </label>
                                <input type="date" name="date" class="form-control" value="" required>
                            </div>
                            <div class="form-group">
                                <label> الخزن</label>
                                <select  name="safe_id" class="form-control" required >
                                    <option selected disabled > اختر خزنة </option>

                                    @foreach ($safes as $safe )
                                        <option value="{{ $safe->id }}" {{ isset($row) && $row->safe_id == $safe->id ? 'selected' : '' }} > {{ $safe->name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label> القيمة</label>
                                <input type="number" step="-1" name="amount" class="form-control" value="" required>
                            </div>
                            <div class="form-group">
                                <label>رفع المستند   </label>
                                <input type="file" name="file" class="form-control" value="">
                            </div>
                            <div class="form-group">
                                <label> ملاحظات</label>
                                <textarea class="form-control" name="note"></textarea>
                            </div>

                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" >حفظ</button>
                        </div>
                        </form>

                        </div>
                    </div>
                </div>

                {{-- manage expenses  --}}
                <div class="modal" id="myModalExpenses" style="margin-left: 520px !important; background-color:transparent !important">
                    <div class="modal-dialog">
                        <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"> اضافة مصروفات المشروع </h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <form id="addProjectExpenses" name="add_project_expenses" action="{{ route('dashboard.project.expenses.store') }}" method="post" enctype="multipart/form-data">
                            @csrf
                        <div class="modal-body">
                            <div class="form-group">
                                <label> المشروع </label>
                                <select class="form-control select2" name="project_id">
                                    <option selected disabled>اختر مشروع</option>

                                    @foreach ($projects as $project)
                                    <option value="{{ $project->project_id }}" >{{ $project->project->name ?? ''}}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <label>تاريخ  </label>
                                <input type="date" name="date" class="form-control" value="" required>
                            </div>
                            <div class="form-group">
                                <label> الخزن</label>
                                <select  name="safe_id" class="form-control" required >
                                    <option selected disabled > اختر خزنة </option>

                                    @foreach ($safes as $safe )
                                        <option value="{{ $safe->id }}" {{ isset($row) && $row->safe_id == $safe->id ? 'selected' : '' }} > {{ $safe->name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label> القيمة</label>
                                <input type="number" step="-1" name="amount" class="form-control" value="" required>
                            </div>
                            <div class="form-group">
                                <label>رفع المستند   </label>
                                <input type="file" name="file" class="form-control" value="">
                            </div>
                            <div class="form-group">
                                <label> الغرض</label>
                                <textarea class="form-control" name="note"></textarea>
                            </div>

                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" >حفظ</button>
                        </div>
                        </form>

                        </div>
                    </div>
                </div> 

    </div>{{-- end of tile  --}}
@endsection

@push('js')


    <script type="text/javascript">
        $("#contactors").change(function(){
            $.ajax({
                url: "{{ route('dashboard.selectProjectsBelongsToSubcontract') }}?subcontractor_id=" + $(this).val(),
                method: 'GET',
                success: function(data) {
                    $('#projects').html(data.html);
                }
            });
        });
    </script>


@endpush


