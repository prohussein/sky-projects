<div class="tab-pane fade show " id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                        <div class="row">
                            <div class="col-md-12">

                                    <div class="text-center mb-2">
                                        <!-- Button to Open the Modal -->
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                                 اضافة مواد
                                        </button>

                                        <!-- Add Modal -->
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
                                                    <input type="hidden" name="project_id" value="{{ $project->id }}">
                                                <div class="modal-body">
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
                                                                <option value="{{ $safe->id }}"> {{ $safe->name }} </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label> ملاحظات</label>
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

                                    @if ($materials->count() > 0)
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                <th>#</th>
                                                 <th>تاريخ التوريد</th>
                                                <th> الاسم  </th>
                                                <th>الكمية </th>
                                                <th>التكلفة</th>
                                                <th>الخزنة</th>
                                                <th>المستند</th>
                                                <th>ملاحظات</th>
                                                <th>اجراء </th>
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
                                                    <td>{{ $material->safe->name ?? '' }}</td>
                                                    <td>
                                                        @if($material->file)
                                                         <a href="{{url('public/uploads/projects/materials/'.$material->file) }}" download="">تحميل المستند</a>
                                                         @else
                                                         -------
                                                         @endif
                                                    </td>
                                                    <td>{{ $material->note }}</td>
                                                    <td>
                                                         <a type="button" class="btn btn-sm btn-warning" title="تعديل " data-toggle="modal" data-target="#myModal{{ $material->id }}">
                                                                <i class="fa fa-edit"></i>
                                                            </a>


                                                            <!-- edit Modal -->
                                                        <div class="modal" id="myModal{{ $material->id }}" style="margin-left: 520px !important; background-color:transparent !important">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">

                                                                <!-- Modal Header -->
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title"> تعديل مواد المشروع </h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>

                                                                <!-- Modal body -->
                                                                <form id="addMaterials{{ $material->id }}" name="add_materials_{{ $material->id }}" action="{{ route('dashboard.project.materials.update', $material->id) }}" method="post" enctype="multipart/form-data">
                                                                    @csrf
                                                                <div class="modal-body">
                                                                    <div class="form-group">
                                                                        <label>اسم المادة</label>
                                                                        <input type="text" name="material_name" class="form-control" value="{{ $material->material_name }}" required>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>تاريخ التوريد </label>
                                                                        <input type="date" name="date" class="form-control" value="{{ $material->date }}" required>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label> الكمية</label>
                                                                        <input type="number" step="-1" name="material_qty" class="form-control" value="{{ $material->material_qty }}" required>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label> التكلفة</label>
                                                                        <input type="number" step="-1" name="amount" class="form-control" value="{{ $material->amount }}" required>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label> الخزن</label>
                                                                        <select  name="safe_id" class="form-control" required >
                                                                            <option selected disabled > اختر خزنة </option>

                                                                            @foreach ($safes as $safe )
                                                                                <option value="{{ $safe->id }}" {{ isset($material) && $material->safe_id == $safe->id ? 'selected' : '' }} > {{ $safe->name }} </option>
                                                                            @endforeach
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label> ملاحظات</label>
                                                                        <textarea class="form-control" name="note">{{ $material->note }}</textarea>
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
                                                        <form action=" {{ route('dashboard.project.materials.destroy',  $material->id) }} " method="post" style="display:inline-block">
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
