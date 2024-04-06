<div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
      <div class="row">
        <div class="col-md-12">

                <div class="text-center mb-2">
                    <!-- Button to Open the Modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalWages">
                                اضافة أجور
                    </button>

                    <!-- Add Modal -->
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
                                <input type="hidden" name="project_id" value="{{ $project->id }}">
                            <div class="modal-body">
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
                                    <label> القيمة</label>
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
                </div>
                @if ($wages->count() > 0)
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th>#</th>
                            <th>الموظف </th>
                            <th>تاريخ </th>
                            <th> القيمة  </th>
                            <th>الغرض </th>
                            <th>اجراء </th>
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
                                        <a type="button" class="btn btn-sm btn-warning" title="تعديل " data-toggle="modal" data-target="#myModalWages{{ $expense->id }}">
                                            <i class="fa fa-edit"></i>
                                        </a>


                                        <!-- edit Modal -->
                                    <div class="modal" id="myModalWages{{ $expense->id }}" style="margin-left: 520px !important; background-color:transparent !important">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title"> تعديل أجر الموظف </h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- Modal body -->
                                            <form id="editProjectWages{{ $expense->id }}" name="edit_project_wages_{{ $expense->id }}" action="{{ route('dashboard.project.wages.update', $expense->id) }}" method="post" enctype="multipart/form-data">
                                                @csrf
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label> الموظف </label>
                                                    <select class="form-control select2" name="employee_id">
                                                        <option selected disabled>اختر موظف</option>

                                                        @foreach ($tempEmployees as $emp)
                                                        <option value="{{ $emp->id }}" {{ $emp->id == $expense->employee_id ? 'selected' : ''  }}>{{ $emp->name }}</option>
                                                        @endforeach

                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>تاريخ  </label>
                                                    <input type="date" name="date" class="form-control" value="{{ $expense->date }}" required>
                                                </div>

                                                <div class="form-group">
                                                    <label> القيمة</label>
                                                    <input type="number" step="-1" name="amount" class="form-control" value="{{ $expense->amount }}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label> ملاحظات</label>
                                                    <textarea class="form-control" name="note">{{ $expense->note }}</textarea>
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

                                    @if (auth()->user()->hasPermission('delete_'.$routeName .''))
                                    <form action=" {{ route('dashboard.project.wages.destroy',  $expense->id) }} " method="post" style="display:inline-block">
                                    @csrf
                                    @method('delete')
                                    <button type="submit" class="btn btn-danger btn-sm delete" title="@lang('site.delete')"><i class="fa fa-trash"></i> </button>
                                    </form>
                                    @else
                                    <button type="button" class="btn btn-danger btn-sm delete" disabled><i class="fa fa-trash"></i>  &#x1F625;</button>
                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                @endif
        </div>
    </div>
</div>
