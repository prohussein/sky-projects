<div class="tab-pane fade" id="pills-expenses" role="tabpanel" aria-labelledby="pills-expenses-tab">
    <div class="row">
        <div class="col-md-12">

                <div class="text-center mb-2">
                    <!-- Button to Open the Modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalExpenses">    اضافةمصروفات </button>

                    <!-- Add Modal -->
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
                                <input type="hidden" name="project_id" value="{{ $project->id }}">
                            <div class="modal-body">

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
                                            <option value="{{ $safe->id }}"  > {{ $safe->name }} </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label> الغرض</label>
                                    <textarea class="form-control" name="note"></textarea>
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
                </div>
                @if ($expenses->count() > 0)
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th>#</th>
                            <th>تاريخ </th>
                            <th> القيمة  </th>
                            <th> الخزنة  </th>
                            <th>الغرض </th>
                            <th>المستند</th>
                            <th>اجراء </th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($expenses as  $expense)
                            <tr>
                                <td >{{ $loop->index }}</td>
                                <td>{{ $expense->date }}</td>
                                <td>{{ $expense->amount }}</td>
                                <td>{{ $expense->safe->name ?? '' }}</td>
                                <td>{{ $expense->note }}</td>
                                <td>
                                    @if($expense->file)
                                     <a href="{{url('public/uploads/projects/expenses/'.$expense->file) }}" download="">تحميل المستند</a>
                                     @else
                                     -----
                                     @endif
                                </td>
                                <td>
                                        <a type="button" class="btn btn-sm btn-warning" title="تعديل " data-toggle="modal" data-target="#myModalExpenses{{ $expense->id }}">
                                            <i class="fa fa-edit"></i>
                                        </a>


                                        <!-- edit Modal -->
                                    <div class="modal" id="myModalExpenses{{ $expense->id }}" style="margin-left: 520px !important; background-color:transparent !important">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title"> تعديل مصروفات المشروع </h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- Modal body -->
                                            <form id="addProjectExpenses{{ $expense->id }}" name="add_project_expenses_{{ $expense->id }}" action="{{ route('dashboard.project.expenses.update', $expense->id) }}" method="post" enctype="multipart/form-data">
                                                @csrf
                                            <div class="modal-body">

                                                <div class="form-group">
                                                    <label>تاريخ  </label>
                                                    <input type="date" name="date" class="form-control" value="{{ $expense->date }}" required>
                                                </div>

                                                <div class="form-group">
                                                    <label> القيمة</label>
                                                    <input type="number" step="-1" name="amount" class="form-control" value="{{ $expense->amount }}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label> الخزن</label>
                                                    <select  name="safe_id" class="form-control" required >
                                                        <option selected disabled > اختر خزنة </option>

                                                        @foreach ($safes as $safe )
                                                            <option value="{{ $safe->id }}" {{ isset($expense) && $expense->safe_id == $safe->id ? 'selected' : '' }} > {{ $safe->name }} </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label> ملاحظات</label>
                                                    <textarea class="form-control" name="note">{{ $expense->note }}</textarea>
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

                                    @if (auth()->user()->hasPermission('delete_'.$routeName .''))
                                    <form action=" {{ route('dashboard.project.expenses.destroy',  $expense->id) }} " method="post" style="display:inline-block">
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
