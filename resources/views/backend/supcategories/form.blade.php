  <div class="row">
      @if(isset($row))
      <input type="hidden" value="{{ $row->id }}" name="row_id">
      @endif
    <div class="form-group col-md-4">
      <label> @lang('site.categories')  </label>
      <select name="category_id" class=" form-control select2">
      @foreach ($categories as $category)
          <option value="{{ $category->id}}" {{ isset($row) && $row->category_id == $category->id ? 'selected' : '' }} >

            @if(LaravelLocalization::getCurrentLocale() == 'ar')
              {{  $category->name_ar   }}
            @else  
              {{  $category->name_en   }}
            @endif
            </option>
      @endforeach
      </select>

    </div>
    
    <div class="form-group col-md-4">
        @php  $input = "name_en";    @endphp  
        <label> @lang('site.name_en')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name_en', isset($row) ? $row->{$input} : '')}}" required> 
    </div>

    <div class="form-group col-md-4">
      @php  $input = "name_ar";  @endphp
        <label> @lang('site.name_ar')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name_ar', isset($row) ? $row->{$input} : '')}}" required>
           
    </div>

    <div class="form-group col-md-12">
        <div>
          <label class=""> @lang('site.upload_photo') </label>
        </div>
      
        <div class="fileinput fileinput-new" data-provides="fileinput">
            <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000"> 
                @if(isset($row))
              <img src="{{ url('public/uploads/supcategories/photos/'.$row->photo)  }}"  width="100%" >
            
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
            