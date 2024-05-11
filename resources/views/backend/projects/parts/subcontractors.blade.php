<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
    <div class="row">
        <div class="col-md-12">
            <div class="text-center mb-2">
                {{-- add contractors --}}
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalContactors">اضافة مقاول الي المشروع</button>
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
                            <input type="hidden" name="project_id" value="{{ $project->id }}">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label> المقاول </label>
                                    <select class="form-control select2" name="subcontractor_id">
                                        <option selected disabled>اختر مقاول</option>

                                        @foreach ($contactors as $contactor)
                                        <option value="{{ $contactor->id }}" >{{ $contactor->name }}</option>
                                        @endforeach
                                    </select>
                                    <input type="hidden" name="project_id" class="form-control" value="{{ $project->id }}">
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
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalContactorsRevenus">اضافة مستخلص الي المقاول</button>

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
                            <input type="hidden" name="project_id" value="{{ $project->id }}">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label> المقاول </label>
                                    <select class="form-control select2" name="subcontractor_id">
                                        <option selected disabled>اختر مقاول</option>

                                        @foreach ($prjectCotractors as $subcontactor)
                                        <option value="{{ $subcontactor->subcontractor_id }}" >{{ $subcontactor->contractor->name ?? ''}}</option>
                                        @endforeach
                                    </select>
                                    <input type="hidden" name="project_id" class="form-control" value="{{ $project->id }}">
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
                                            <option value="{{ $safe->id }}" > {{ $safe->name }} </option>
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

            </div>

            @if ($prjectCotractors->count() > 0)
            <h4 class=" text-primary">المقاولاين داخل المشروع</h4>
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th> المقاول  </th>
                        <th>تاريخ البدء   </th>
                        <th>تاريخ الانتهاء  </th>
                        <th>قيمة التعاقد</th>
                        <th>ملفات</th>
                        <th>ملاحظات</th>
                        <th>اجراء</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($prjectCotractors as $contactor )


                    <tr>
                        <td>{{ $loop->index+1 }}</td>
                        <td> {{ $contactor->contractor->name ?? '' }}</td>
                        <td>{{ $contactor->start_date }}</td>
                        <td>{{ $contactor->end_date }}</td>
                        <td>{{ $contactor->amount }}</td>
                        <td>
                            @if ($contactor->file)
                                <a href="{{ url('/public/uploads/subcontractors/projects/',$contactor->file) }}" download="" >تحميل الملف<a>
                            @else
                                ---
                            @endif
                        </td>
                        <td>{{ $contactor->notes  }}</td>
                        <td>
                            <a type="button" class="btn btn-sm btn-warning" title="تعديل " data-toggle="modal" data-target="#myModalContactor{{ $contactor->id }}">
                                <i class="fa fa-edit"></i>
                            </a>

                                <!-- edit Modal -->
                            <div class="modal" id="myModalContactor{{ $contactor->id }}" style="margin-left: 520px !important; background-color:transparent !important">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title"> تعديل بيانات المقال {{ $contactor->id }}</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- Modal body -->
                                    <form id="addMaterialsContactor{{ $contactor->id }}" name="add_contactor_{{ $contactor->id }}" action="{{ route('dashboard.project.contactor.update', $contactor->id) }}" method="post" enctype="multipart/form-data">
                                        @csrf
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label> المقاول </label>
                                                <select class="form-control select2" name="subcontractor_id">
                                                    @foreach ($contactors as $cont)
                                                    <option value="{{ $cont->id }}" {{  $contactor->subcontractor_id == $cont->id ? 'selected' : '' }}  >{{ $cont->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>تاريخ البدء </label>
                                                <input type="date" name="start_date" class="form-control" value="{{ $contactor->start_date }}" required>
                                            </div>
                                            <div class="form-group">
                                                <label>تاريخ الانتهاء </label>
                                                <input type="date" name="end_date" class="form-control" value="{{ $contactor->end_date }}" >
                                            </div>

                                            <div class="form-group">
                                                <label> قيمة التعاقد</label>
                                                <input type="number" step="-1" name="amount" class="form-control" value="{{ $contactor->amount }}" required>
                                            </div>
                                            <div class="form-group">
                                                <label>ملفات التعاقد  </label>
                                                <input type="file" name="file" class="form-control" >
                                            </div>
                                            <div class="form-group">
                                                <label> ملاحظات</label>
                                                <textarea class="form-control" name="notes">{{ $contactor->notes }}</textarea>
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
                            <form action=" {{ route('dashboard.project.contactor.destroy',  $contactor->id) }} " method="post" style="display:inline-block">
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

            {{-- revenues --}}
            @if ($contactorsRevenus->count() > 0)
            <h4  class="text-primary">  مستخلاصات   المقاولاين   </h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                    <th>#</th>
                    <th> رقم المستخلص  </th>
                    <th>تاريخ   </th>
                    <th>المقاول </th>
                    <th>قيمة المستخلص  </th>
                    <th>الخزنة</th>
                    <th>المستند</th>
                    <th>اجراء</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($contactorsRevenus as $revenu)
                    <tr>
                        <td>{{ $loop->index+1 }}</td>
                        <td>{{ $revenu->reference }} </td>
                        <td>{{ $revenu->date }}</td>
                        <td>{{ $revenu->contactor->name ?? '' }} </td>
                        <td>{{ $revenu->amount }}</td>
                         <td>{{ $revenu->safe->name ?? '' }}</td>
                        <td>
                            @if($revenu->file)
                             <a href="{{url('public/uploads/projects/contractorrevenu/'.$revenu->file) }}" download="">تحميل المستند</a>
                             @else
                             -----
                             @endif
                        </td>
                        <td>
                            {{-- ediit revneu --}}
                            <a type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#myModalContactorsRevenus{{ $revenu->id }}" title="تعديل "><i class="fa fa-edit"></i></a>
                            <div class="modal" id="myModalContactorsRevenus{{ $revenu->id }}" style="margin-left: 520px !important; background-color:transparent !important">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title"> تعديل مستخلص مقاول  </h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- Modal body -->
                                    <form id="editContactorsRvenue{{ $revenu->date }}" name="edit_contactors_rvenue_{{ $revenu->date }}" action="{{ route('dashboard.project.contactor.rvenue.update', $revenu->id) }}" method="post" enctype="multipart/form-data">
                                        @csrf
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label> المقاول </label>
                                            <select class="form-control select2" name="subcontractor_id">

                                                @foreach ($prjectCotractors as $subcontactor)
                                                <option value="{{ $subcontactor->subcontractor_id }}" {{ $revenu->subcontractor_id == $subcontactor->subcontractor_id ? 'selected' : '' }}  >{{ $subcontactor->contractor->name ?? ''}}</option>
                                                @endforeach

                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>رقم المستخلص</label>
                                            <input type="text" name="reference" class="form-control" value="{{ $revenu->reference}}" required>
                                        </div>

                                        <div class="form-group">
                                            <label>تاريخ  </label>
                                            <input type="date" name="date" class="form-control" value="{{ $revenu->date }}" required>
                                        </div>

                                        <div class="form-group">
                                            <label> قيمة المستخلص</label>
                                            <input type="number" step="-1" name="amount" class="form-control" value="{{ $revenu->amount }}" required>
                                        </div>

                                        <div class="form-group">
                                            <label> الخزن</label>
                                            <select  name="safe_id" class="form-control" required >
                                                <option selected disabled > اختر خزنة </option>

                                                @foreach ($safes as $safe )
                                                    <option value="{{ $safe->id }}" {{ isset($revenu) && $revenu->safe_id == $safe->id ? 'selected' : '' }} > {{ $safe->name }} </option>
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
                             @if (auth()->user()->hasPermission('delete_'.$routeName .''))
                            <form action=" {{ route('dashboard.project.contactor.rvenue.destroy',  $revenu->id) }} " method="post" style="display:inline-block">
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
