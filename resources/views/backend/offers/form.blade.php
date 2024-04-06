<div class="row">
  {{-- name --}}
  <div class="col-md-4">
    @php
      $input = "name_en";  
    @endphp    
    <div class="form-group">
        <label> @lang('site.name_en')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name_en', isset($row) ? $row->{$input} : '')}}" required>
            
    </div>
  </div> 
  <div class="col-md-4">
     @php
      $input = "name_ar";  
    @endphp    
    <div class="form-group">
        <label> @lang('site.name_ar')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name_ar', isset($row) ? $row->{$input} : '')}}" required>
           
    </div>
  </div>
  {{-- category --}}
  <div class="col-md-4">
    <label> @lang('site.category')  </label>
    <select name="cat_id" class=" form-control select2 @error('cat_id') is-invalid @enderror">
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
 
  
  {{-- price --}}
  <div class="col-md-4">
    @php $input = "price_befoer_discount"; @endphp 
    <div class="form-group">
      <label> @lang('site.price_befoer_discount')  </label>
      <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('price_usd', isset($row) ? $row->{$input} : '')}}" required>
    </div>
  </div>
  <div class="col-md-4">
    @php $input = "price_after_discount"; @endphp 
    <div class="form-group">
      <label> @lang('site.price_after_discount')  </label>
      <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old( $input, isset($row) ? $row->{$input} : '')}}" required>
    </div>
  </div>

  <div class="col-md-4">
    @php $input = "price"; @endphp 
    <div class="form-group">
      <label> @lang('site.price')  </label>
      <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old( $input, isset($row) ? $row->{$input} : '')}}" required>
    </div>
  </div>
 
 
  {{-- type --}}
  <div class="col-md-4">
    <label> @lang('site.type')  </label>
    <select name="type" class=" form-control select2 @error('cat_id') is-invalid @enderror">
      
    
    @foreach($types as $type)
   
        <option value="{{ $type->id}}" {{ isset($row) && $row->type == $type->id ? 'selected' : '' }} >

          @if(LaravelLocalization::getCurrentLocale() == 'ar')
            {{  $type->name_ar   }}
          @else  
            {{  $type->name_en   }}
          @endif
          </option>
    @endforeach
    </select>

  </div>
 
  {{--  model name  --}}
  {{--  <div class="col-md-4">
    @php $input = "color"; @endphp 
    <div class="form-group">
      <label> @lang('site.color')  </label>
      <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old( $input, isset($row) ? $row->{$input} : '')}}" required>
    </div>
  </div>  --}}
 
 {{--  model name  --}}
  <div class="col-md-4">
    @php $input = "model_name"; @endphp 
    <div class="form-group">
      <label> @lang('site.model_name')  </label>
      <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old( $input, isset($row) ? $row->{$input} : '')}}" required>
    </div>
  </div>
   {{--  meta keywords  --}}
  <div class="col-md-4">
    @php $input = "meta_keywords"; @endphp 
    <div class="form-group">
      <label> @lang('site.meta_keywords')  </label>
      <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('location', isset($row) ? $row->{$input} : '')}}" required>
    </div>
  </div>

  
        <div class='col-md-4'>
           @php $input = "start"; @endphp 
            <div class="form-group">
               <label> @lang('site.start_date')  </label>
                <div class="input-group  ">
                    <input id="" name="start" class="form-control demoDate"  type="text" value="{{old('start', isset($row) ? $row->start : '')}}"  readonly>
                    
                </div>
              
        </div>
        </div>

        <div class='col-md-4'>
           @php $input = "end"; @endphp 
            <div class="form-group">
               <label> @lang('site.end_date')  </label>
              <input name="{{ $input }}" type='text' id="" class="form-control demoDate" value="{{old('end', isset($row) ? $row->end : '')}}" readonly />
            </div>
        </div>
       
    
   {{--  tags  --}}
  {{--  <div class="col-md-4">
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
         
  </div>  --}}


   {{--  instock --}}
  <div class="col-md-4">
    <div class="animated-checkbox">
      <br> 
            <label>
            <input type="checkbox" name="in_stock" value="1"  {{isset($row) && $row->in_stock == 1 ? ' checked ' : ''}}><span class="label-text"> @lang('site.in_stock') </span>
            </label>
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
              {{ old($input, isset($row) ? $row->{$input} : '')}}
            </textarea>
          </div>
        </div>
      </div>   
    </div>
  </div>

  
    

  
<div class="col-md-12">
  <br> <h3 class="text-center"> Offers Images </h3> <br>
</div>
 
  {{-- upload photo --}}
   <div class="col-md-4">
    <div class="form-group ">
        <label>@lang('site.upload_photo') </label>
        <div>
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000"> 
                   @if(isset($row))
                  <img src="{{ url('public/uploads/offers/'.$row->photo)  }}"  width="100%" >
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
  
  {{-- upload photo 1 --}}
   <div class="col-md-4">
    <div class="form-group ">
        <label>@lang('site.upload_photo') </label>
        <div>
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000"> 
                   @if(isset($row))
                  <img src="{{ url('public/uploads/offers/'.$row->photo1)  }}"  width="100%" >
                  @endif
                </div>
                <div>
                    <span class="btn red btn-outline btn-file">
                        <span class="fileinput-new btn btn-primary"> @lang('site.select_photo')  </span>
                        <span class="fileinput-exists btn btn-info"> @lang('site.change') </span>
                        <input type="file" name="photo1"> </span>
                    <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> @lang('site.remove') </a>
                </div>
            </div>
        </div>
    </div>
  </div>
  {{-- upload photo 2 --}}
   <div class="col-md-4">
    <div class="form-group ">
        <label>@lang('site.upload_photo') </label>
        <div>
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000"> 
                   @if(isset($row))
                  <img src="{{ url('public/uploads/offers/'.$row->photo2)  }}"  width="100%" >
                  @endif
                </div>
                <div>
                    <span class="btn red btn-outline btn-file">
                        <span class="fileinput-new btn btn-primary"> @lang('site.select_photo')  </span>
                        <span class="fileinput-exists btn btn-info"> @lang('site.change') </span>
                        <input type="file" name="photo2"> </span>
                    <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> @lang('site.remove') </a>
                </div>
            </div>
        </div>
    </div>
  </div>
  {{-- upload photo 3 --}}
   <div class="col-md-4">
    <div class="form-group ">
        <label>@lang('site.upload_photo') </label>
        <div>
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000"> 
                   @if(isset($row))
                  <img src="{{ url('public/uploads/offers/'.$row->photo3)  }}"  width="100%" >
                  @endif
                </div>
                <div>
                    <span class="btn red btn-outline btn-file">
                        <span class="fileinput-new btn btn-primary"> @lang('site.select_photo')  </span>
                        <span class="fileinput-exists btn btn-info"> @lang('site.change') </span>
                        <input type="file" name="photo3"> </span>
                    <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> @lang('site.remove') </a>
                </div>
            </div>
        </div>
    </div>
  </div>
  {{-- upload photo 4 --}}
   <div class="col-md-4">
    <div class="form-group ">
        <label>@lang('site.upload_photo') </label>
        <div>
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000"> 
                   @if(isset($row))
                  <img src="{{ url('public/uploads/offers/'.$row->photo4)  }}"  width="100%" >
                  @endif
                </div>
                <div>
                    <span class="btn red btn-outline btn-file">
                        <span class="fileinput-new btn btn-primary"> @lang('site.select_photo')  </span>
                        <span class="fileinput-exists btn btn-info"> @lang('site.change') </span>
                        <input type="file" name="photo4"> </span>
                    <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> @lang('site.remove') </a>
                </div>
            </div>
        </div>
    </div>
  </div>
        
</div>
<br>

@push('js')

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

</script> 

<script>
  function myRandom() {
    var number = 1 + Math.floor(Math.random() * 60000000);
    document.getElementById("refrence").value = number ;
  }
</script>


    
@endpush
            