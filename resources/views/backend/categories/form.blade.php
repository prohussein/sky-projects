     {{-- brand --}}
  {{--  <div class="col-md-4">
    <label> @lang('site.brands')  </label>
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
      --}}
     
   
    <div class="form-group">
        @php  $input = "name_en";    @endphp  
        <label> @lang('site.name_en')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required> 
    </div>

         
     
    
    <div class="form-group">
      @php  $input = "name_ar";  @endphp
        <label> @lang('site.name_ar')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required>
           
    </div>

    <div class="form-group ">
          <div>
            <label class=""> @lang('site.upload_photo') </label>
          </div>
        
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000"> 
                   @if(isset($row))
                  <img src="{{ url('public/uploads/categories/photos/'.$row->photo)  }}"  width="100%" >
                
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
            