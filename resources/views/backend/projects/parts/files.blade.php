<div class="tab-pane fade" id="pills-files" role="tabpanel" aria-labelledby="pills-files-tab">
    <div class="row">
        <div class="col-md-12">
            <div class="text-center mb-2">
                {{-- add contractors --}}
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalFiles">اضافة ملفات الي المشروع</button>
                <div class="modal" id="myModalFiles" style="margin-left: 520px !important; background-color:transparent !important">
                    <div class="modal-dialog">
                        <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"> اضافة ملف  </h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <form id="addFiles" name="add_files" action="{{ route('dashboard.project.files.store') }}" method="post" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="project_id" value="{{ $project->id }}">
                            <div class="modal-body">


                                <div class="form-group">
                                    <label> اسم الملف</label>
                                    <input type="text" name="name" class="form-control" value="">
                                </div>
                                 <div class="form-group">
                                    <label>المستند   </label>
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

            @if ($prjectFiles->count() > 0)
            <h4 class=" text-primary">ملفات  المشروع</h4>
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th> الاسم  </th>
                        <th> المستند </th>
                        <th>اجراء</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($prjectFiles as $file )


                    <tr>
                        <td>{{ $loop->index+1 }}</td>
                        <td> {{ $file->name  }}</td>

                        <td>
                            @if ($file->file)
                                <a href="{{ url('/public/uploads/projects/files',$file->file) }}" download="" >تحميل الملف<a>
                            @else
                                ---
                            @endif
                        </td>
                        <td>
                            <a type="button" class="btn btn-sm btn-warning" title="تعديل " data-toggle="modal" data-target="#myModalFiles{{ $file->id }}">
                                <i class="fa fa-edit"></i>
                            </a>

                                <!-- edit Modal -->
                            <div class="modal" id="myModalFiles{{ $file->id }}" style="margin-left: 520px !important; background-color:transparent !important">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title"> تعديل الملف  </h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- Modal body -->
                                    <form id="addFile{{ $file->id }}" name="add_file_{{ $file->id }}" action="{{ route('dashboard.project.files.update', $file->id) }}" method="post" enctype="multipart/form-data">
                                        @csrf
                                        <div class="modal-body">
                                            <input type="hidden" name="project_id" value="{{ $project->id }}">

                                            <div class="form-group">
                                                <label> الاسم</label>
                                                <input class="form-control" name="name" value="{{ $file->name }}">
                                            </div>

                                            <div class="form-group">
                                                <label>المستند   </label>
                                                <input type="file" name="file" class="form-control" >
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
                            <form action="{{ route('dashboard.project.files.destroy',  $file->id) }} " method="post" style="display:inline-block">
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
