  @extends('layouts.backend.app')

@php 
	$current_lang =  LaravelLocalization::getCurrentLocale();
      $title = ($current_lang  == 'ar' ?  "ادارة الصور" :  "Mange Photos") ;
@endphp
@section('pageTitle')
   @lang('site.all_'. $routeName .'') 
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => __('site.'. $routeName .''),
        'des'   => $title,
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">@lang('site.'. $routeName .'')</a></li>
    <li class="breadcrumb-item"> {{ $title }}</li>
    
@endcomponent 
   <div class="row">
      <div class="col-md-12">
         <div class="tile">
            <form action="{{ route('dashboard.addfairphotos') }}" method="POST" enctype="multipart/form-data">
                 @csrf
                    @method('post')
                    @include('backend.partials._errors')
               <input type="hidden" value="{{ $id }}" name="id" >
               <div class="form-group">
                  <div class="input-field">
                     <label class="active">Photos</label><br>
                     <small> افضل مقاس 650 * 650</small> ** <strong> الحد الاقصي للرفع في المرة الواحدة 15 صورة</strong>
                     <div class="input-images-1" style="padding-top: .5rem;"></div>
                  </div>
               </div>
               <button type="submit" class="btn btn-primary"> @lang('site.add') </button>
            </form>
         </div>
      </div>
   </div>
   <button style="margin-bottom: 10px" class="btn btn-primary delete_all" data-url="{{ url('fairsphotosDeleteAll') }}">Delete All Selected</button>
   

      <div class="tile">
<div class="col-md-12">
        
           <div class="row" >
         
               @foreach ( $photos as $row)
               <div class="col-md-1" id="tr_{{$row->id}}">
                  
                    <input type="checkbox" class="sub_chk" data-id="{{$row->id}}">
                     
                        <img src="{{ asset('public/uploads/fairs/photos/'. $row->link ) }}" width="90%">
                     
                           
               </div>
               @endforeach
           </div>
         </div>
      </div>
 

@endsection

@push('js')
    <script type="text/javascript">
    $(document).ready(function () {


        $('#master').on('click', function(e) {
         if($(this).is(':checked',true))  
         {
            $(".sub_chk").prop('checked', true);  
         } else {  
            $(".sub_chk").prop('checked',false);  
         }  
        });


        $('.delete_all').on('click', function(e) {


            var allVals = [];  
            $(".sub_chk:checked").each(function() {  
                allVals.push($(this).attr('data-id'));
            });  


            if(allVals.length <=0)  
            {  
                alert("Please select row.");  
            }  else {  


                var check = confirm("Are you sure you want to delete this row?");  
                if(check == true){  


                    var join_selected_values = allVals.join(","); 


                    $.ajax({
                        url: $(this).data('url'),
                        type: 'DELETE',
                        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        data: 'ids='+join_selected_values,
                        success: function (data) {
                            if (data['success']) {
                                $(".sub_chk:checked").each(function() {  
                                    $(this).parents("tr").remove();
                                });
                                setInterval('location.reload()', 1000);        
                                alert(data['success']);
                            } else if (data['error']) {
                                alert(data['error']);
                            } else {
                                alert('Whoops Something went wrong!!');
                            }
                        },
                        error: function (data) {
                            alert(data.responseText);
                        }
                    });


                  $.each(allVals, function( index, value ) {
                      $('table tr').filter("[data-row-id='" + value + "']").remove();
                  });
                }  
            }  
        });


        $('[data-toggle=confirmation]').confirmation({
            rootSelector: '[data-toggle=confirmation]',
            onConfirm: function (event, element) {
                element.trigger('confirm');
            }
        });


        $(document).on('confirm', function (e) {
            var ele = e.target;
            e.preventDefault();


            $.ajax({
                url: ele.href,
                type: 'DELETE',
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                success: function (data) {
                    if (data['success']) {
                        $("#" + data['tr']).slideUp("slow");
                        alert(data['success']);
                    } else if (data['error']) {
                        alert(data['error']);
                    } else {
                        alert('Whoops Something went wrong!!');
                    }
                },
                error: function (data) {
                    alert(data.responseText);
                }
            });


            return false;
        });
    });
</script>

<script>
  $(document).ready(function () {
    
  $('.input-images-1').imageUploader();
    
 }); // end of document ready
</script> 
@endpush
