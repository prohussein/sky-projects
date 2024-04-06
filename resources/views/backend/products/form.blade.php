@php 
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
<div class="row">
  {{-- name --}}
  <div class="col-md-6">
    @php
      $input = "name_en";  
    @endphp    
    <div class="form-group">
        <label> @lang('site.name_en')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name_en', isset($row) ? $row->{$input} : '')}}" required>
            
    </div>
  </div> 
  <div class="col-md-6">
     @php
      $input = "name_ar";  
    @endphp    
    <div class="form-group">
        <label> @lang('site.name_ar')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name_ar', isset($row) ? $row->{$input} : '')}}" required>
           
    </div>
  </div>
  {{--  brand  --}}
 
  <div class="col-md-3">
    <label> @lang('site.brand')  </label>
    <select name="brand_id" class=" form-control select2 @error('brand_id') is-invalid @enderror">
    @foreach ($brands as $brand)
        <option value="{{ $brand->id}}" {{ isset($row) && $row->brand_id == $brand->id ? 'selected' : '' }} >

          @if(LaravelLocalization::getCurrentLocale() == 'ar')
            {{  $brand->name_ar   }}
          @else  
            {{  $brand->name_en   }}
          @endif
          </option>
    @endforeach
    </select>

  </div>   
  {{-- category --}}
  <div class="col-md-3">
    <label for="cat"> @lang('site.category')  </label>
    <select id="cat" name="cat_id" class=" form-control select2">
      <option >@lang('site.category') </option>
    @foreach ($categories as $category)
        <option value="{{ $category->id}}" {{ isset($row) && $row->cat_id == $category->id ? 'selected' : '' }} >

          @if(LaravelLocalization::getCurrentLocale() == 'ar')
            {{  $category->name_ar   }}
          @else  
            {{  $category->name_en   }}
          @endif
          </option>
    @endforeach
    </select>

  </div>

  {{-- sup category --}}
  <div class="col-md-3">
    <label> @lang('site.supcategory')  </label>
    <select id="cats" name="sup_category" class=" form-control select-sup select2 ">
       @if(isset($row->sup_category))
       <option value="{{$row->sup_category}}" selected > {{ $current_lang == 'ar' ? $row->supcats->name_ar : $row->supcats->name_en }} </option>
      @else 
        <option value=""> select sup category </option>
      @endif
      
    </select>

  </div>

  {{--  active --}}
  <div class="col-md-3">
    <br>
    <div class="animated-checkbox">
      <br> 
            <label>
            <input type="checkbox" name="active" value="1"  {{isset($row) && $row->active == 1 ? ' checked ' : ''}}><span class="label-text"> @lang('site.active') </span>
            </label>
    </div>
  </div>
   {{-- sup sup_category --}}
  {{--  <div class="col-md-3">
    <label> @lang('site.supsupcategory')  </label>
    <select id="supcats" name="supsup_category" class=" form-control select-sup select2 ">
       @if(isset($row->supsup_category))
       <option value="{{$row->supsup_category}}"> {{ $current_lang == 'ar' ? $row->supsupcats->name_ar : $row->supsupcats->name_en }} </option>
      @else 
        <option value=""> select sup category </option>
      @endif
     
    </select>

  </div>
    --}}
  {{--  description  --}}
    <div class="col-md-12">
      @php $input = "desc_en"; @endphp 
      <div class="form-group">
        <label> @lang('site.description_en')  </label>
        <div class="adjoined-bottom">
          <div class="grid-container">
            <div class="grid-width-100">
              <textarea id="editor" name="{{ $input }}">
                {{ old( $input , isset($row) ? $row->{$input} : '')}}
              </textarea>
            </div>
          </div>
        </div>   
      </div>
    </div>

    <div class="col-md-12">
      @php $input = "desc_ar"; @endphp 
      <div class="form-group">
        <label> @lang('site.description_ar')  </label>
        <div class="adjoined-bottom">
          <div class="grid-container">
            <div class="grid-width-100">
              <textarea id="editor1" name="{{ $input }}">
                {{ old( $input , isset($row) ? $row->{$input} : '')}}
              </textarea>
            </div>
          </div>
        </div>   
      </div>
    </div>
  

   {{--  tags  --}}
  <div class="col-md-12">
           @php $input = "tags[]"; @endphp
        
           
            <div class="tile-body">
               <label> @lang('site.tags')  </label>
             
              
              <select name="{{$input}}" class="form-control" id="demoSelect" multiple="">
                  @foreach($tags  as $tag)
                    <option value="{{ $tag->id }}"  {{ in_array( $tag->id, $selectedTags) ? 'selected' : '' }}>
                      @if(LaravelLocalization::getCurrentLocale() == 'ar')
                        {{  $tag->name_ar   }}
                      @else  
                        {{  $tag->name_en   }}
                      @endif
                    </option>
                   @endforeach
                
              </select>
            </div>
         
  </div>

   {{-- meta description  --}}
  <div class="col-md-12">
    @php $input = "meta_des"; @endphp 
    <div class="form-group">
      <label> @lang('site.meta_des')  </label>
      <textarea name="{{ $input }}"  class="form-control @error('{{ $input }}') is-invalid @enderror" >{{ old('location', isset($row) ? $row->{$input} : '')}}</textarea>
      
    </div>
  </div>

   {{--  meta keywords  --}}
  <div class="col-md-12">
    @php $input = "meta_keywords"; @endphp 
    <div class="form-group">
      <label> @lang('site.meta_keywords')  </label>
      <input type="text" name="{{ $input }}" class=" @error('{{ $input }}') is-invalid @enderror" value="{{ old('location', isset($row) ? $row->{$input} : '')}}" placeholder="{{ $current_lang == 'ar' ? 'اكتب الكلمة بعدها اضغط انتر' : 'write word and hit enter'  }}" >
    </div>
  </div>
    

  {{-- upload photo --}}
  <div class="col-md-2">
    <div class="form-group ">
        <label> {{ $current_lang == 'ar' ?  'صور المنتج المصغرة ' : 'thumbinal image'}} </label><br>  <small> افضل مقاس 300 * 300 </small>
         
        <div>
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000"> 
                   @if(isset($row))
                  <img src="{{ url('public/uploads/products/'.$row->photo)  }}"  width="100%" >
                  @endif
                </div>
                <div>
                    <span class="btn red btn-outline btn-file">
                        <span class="fileinput-new btn btn-primary"> @lang('site.select_photo')  </span>
                        <span class="fileinput-exists btn btn-info"> @lang('site.change') </span>
                        <input type="file" name="photo"> </span>
                    <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> @lang('site.remove') </a>
                </div>
            </div>
        </div>
    </div>
  </div>

   <div class="col-md-3">
     <br> <br> 
    <div class="form-group ">
        <label> {{ $current_lang == 'ar' ?  'رفع البرشور ' : 'Brochure'}} 
         
        <div>
            <input type="file" name="pdf" class="">
        </div>
    </div>
  </div>


  <div class="col-md-7 form-group">
      <div class="input-field">
          <label class="active"> {{ $current_lang == 'ar' ?  'صور المنتج ' : 'Product Photos'}} </label><br>
          <small> افضل مقاس 650 * 650
          </small>
          <div class="input-images-1" style="padding-top: .5rem;"></div>
    </div>
  
        
  </div>

</div>
<br>

@push('js')


    <script type="text/javascript">
        $("#cat").change(function(){
            $.ajax({
                url: "{{ route('subcat') }}?cat_id=" + $(this).val(),
                method: 'GET',
                success: function(data) {
                    $('#cats').html(data.html);
                }
            });
        });

         $("#cats").change(function(){
            $.ajax({
                url: "{{ route('supsubcat') }}?sup_category=" + $(this).val(),
                method: 'GET',
                success: function(data) {
                    $('#supcats').html(data.html);
                }
            });
        });
    </script>

  <script>

  $(document).ready(function () {
    
    function filePreview(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#uploadForm + img').remove();
            $('#uploadForm').after('<img src="'+e.target.result+'" width="450" height="300"/>');
        };
        reader.readAsDataURL(input.files[0]);
    }
}
 }); // end of document ready
  
 
	initSample();

   $('.input-images-1').imageUploader();

</script> 
 
  <script>
  function myRandom() {
    var number = 1 + Math.floor(Math.random() * 60000000);
    document.getElementById("refrence").value = number ;
  }
  </script>

  <script>
  $(document).ready(function () {
    
    $('[name=meta_keywords]').tagify();
    
 }); // end of document ready
</script> 
    
@endpush
            