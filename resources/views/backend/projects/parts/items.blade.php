<div class="tab-pane fade active show " id="pills-items" role="tabpanel" aria-labelledby="pills-items-tab">
    <div class="row">
        <div class="col-md-12">

                <div class="text-center mb-2">
                    <!-- Button to Open the Modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalItem">
                                اضافة بند
                    </button>

                    <!-- Add Modal -->
                    <div class="modal" id="myModalItem" style="margin-left: 520px !important; background-color:transparent !important">
                        <div class="modal-dialog">
                            <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title"> اضافة بنود المشروع </h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <form id="addItems" name="add_items" action="{{ route('dashboard.project.items.store') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="project_id" value="{{ $project->id }}">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>الكود </label>
                                    <input type="text" name="code" class="form-control" value="" required>
                                </div>
                                 <div class="form-group">
                                    <label>بيان الاعمال  </label>
                                    <input type="text" name="name" class="form-control" value="" required>
                                </div>

                                <div class="form-group">
                                    <label> كمية البند</label>
                                    <input type="number" step="-1" name="qty" class="form-control" value="" required>
                                </div>
                                <div class="form-group">
                                    <label> الفئة</label>
                                    <input type="number" step="-1" name="cat" class="form-control" value="" required>
                                </div>
                                 <div class="form-group">
                                    <label> اجمالي قيمة البند </label>
                                    <input type="number" step="-1" name="item_total" class="form-control" value="" required>
                                </div>
                                <div class="form-group">
                                    <label>   الكمية المنفذة علي الطبيعة </label>
                                    <input type="number" step="-1" name="implement_qty" class="form-control" value="" required>
                                </div>
                                <div class="form-group">
                                    <label>    اجمالي الكمية المنفذة علي الطبيعة </label>
                                    <input type="number" step="-1" name="total_implement_qty" class="form-control" value="" required>
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

                @if ($projectItems->count() > 0)
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th>الكود</th>
                            <th>بيان الاعمال  </th>
                            <th> كمية البند  </th>
                            <th>الفئة </th>
                            <th>اجمالي قيمة البند</th>
                            <th>الكمية المنفذة علي الطبيعة</th>
                            <th> اجمالي الكمية المنفذة علي الطبيعة </th>
                            <th>اجراء </th>
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

                                <td>
                                        <a type="button" class="btn btn-sm btn-warning" title="تعديل " data-toggle="modal" data-target="#myItem{{ $item->id }}">
                                            <i class="fa fa-edit"></i>
                                        </a>


                                        <!-- edit Modal -->
                                    <div class="modal" id="myItem{{ $item->id }}" style="margin-left: 520px !important; background-color:transparent !important">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title"> تعديل بنود المشروع </h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- Modal body -->
                                            <form id="editItem{{ $item->id }}" name="editItem{{ $item->id }}" action="{{ route('dashboard.project.items.update', $item->id) }}" method="post" enctype="multipart/form-data">
                                                @csrf
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label>الكود </label>
                                                    <input type="text" name="code" class="form-control" value="{{ $item->code }}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>بيان الاعمال  </label>
                                                    <input type="text" name="name" class="form-control" value="{{ $item->name }}" required>
                                                </div>

                                                <div class="form-group">
                                                    <label> كمية البند</label>
                                                    <input type="number" step="-1" name="qty" class="form-control" value="{{ $item->qty }}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label> الفئة</label>
                                                    <input type="number" step="-1" name="cat" class="form-control" value="{{ $item->cat }}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label> اجمالي قيمة البند </label>
                                                    <input type="number" step="-1" name="item_total" class="form-control" value="{{ $item->item_total }}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>   الكمية المنفذة علي الطبيعة </label>
                                                    <input type="number" step="-1" name="implement_qty" class="form-control" value="{{ $item->implement_qty }}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>    اجمالي الكمية المنفذة علي الطبيعة </label>
                                                    <input type="number" step="-1" name="total_implement_qty" class="form-control" value="{{ $item->total_implement_qty }}" required>
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
                                    <form action=" {{ route('dashboard.project.items.destroy',  $item->id) }} " method="post" style="display:inline-block">
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

                            <tr style="background-color:#1f3369; color:#fff;border:#ef9319 3px solid" >
                                <td>#</td>
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
    </div>
</div>

@push('js')
<script>
      $(document).on('change keyup blur','.changesNo',function(){

            // id_arr          = $(this).attr('id');
            // id              = id_arr.split("_");
            // quantity        = $('#quantity_'+id[1]).val();
            // $('#modalquantity_'+id[1]).val(quantity);
            // price           = $('#modalprice_'+id[1]).val();
            // $('#purch_price'+id[1]).text(price);
            // $('#priceinput'+id[1]).val(price);
            // total           = (parseFloat(price)*parseFloat(quantity)).toFixed(2);

            // // handel dicount

            // discountValue   = $('#modeldiscount_'+id[1]).val();
            // discountType    = $('#disctype_'+id[1]).val();

            // $('#discountinput_'+id[1]).val(discountValue);
            // $('#discounttypeinput_'+id[1]).val(discountType);

            // if(discountValue != '' && typeof(discountValue) != "undefined" ){
            //     if(discountType == 1){
            //         value = discountValue / 100 * total
            //         total = total - value ;
            //         $('.disc'+id[1]).text(value + ' ('+ discountValue + ' %)');
            //         }
            //     if(discountType == 2) {
            //         total = total - discountValue ;
            //         $('.disc'+id[1]).text(discountValue);
            //         }
            // }
            // amountBeforTax = total   ;
            // $('#totalLineBeforTax_'+id[1]).val(amountBeforTax);
            // $('#totalBeforTax_'+id[1]).text(amountBeforTax);

            // taxType =  $('#taxType').val() ;
            // if( taxType == 1){
            //     // handel tax
            //     taxRate         = $('#modeltax_'+id[1]).val();
            //     //alert(taxRate / 100 + 1);
            //     if(taxRate != '' && typeof(taxRate) != "undefined" ){
            //         taxAmount   = (parseFloat(amountBeforTax) * taxRate / 100) ;
            //         $('.tax_amount'+id[1]).text( taxAmount.toFixed(2) + ' ('+ taxRate + ' %)');
            //         $('#taxAmount_'+id[1]).val(taxAmount.toFixed(2));
            //         $('#tax_'+id[1]).val(taxRate);
            //         total       = parseFloat(amountBeforTax) + parseFloat(taxAmount);
            //     }
            // }// end of handel tax for item

            // // handel selected unit
            // unit  = $('#modalunit_'+id[1]).children(':selected').text();
            // $('.unit'+id[1]).text(unit);


            // if( quantity!='' && price !='' ){

            //     $('#totalLine_'+id[1]).val(parseFloat(total).toFixed(2));
            //     $('#total_'+id[1]).text(parseFloat(total).toFixed(2));
            // }

            // calculateTotal();
        }); // end of handel change qty and item
</script>
@endpush
