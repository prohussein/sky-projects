  <div class="row">
    <div class="col-md-6">

      <div class="form-group">
          @php $input = "title_en"; @endphp  
          <label> @lang('site.name_en')  </label>
          <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" >
      </div>

      <div class="form-group">
          @php $input = "title_ar";  @endphp   
          <label> @lang('site.name_ar')  </label>
          <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" >  
      </div>

      <div class="form-group">
        @php $input = "description_en";  @endphp 
          <label> @lang('site.description_en')  </label>
          <textarea name="{{ $input }}" class="form-control  @error('{{ $input }}') is-invalid @enderror"  rows="3">{{ old('name', isset($row) ? $row->{$input} : '')}}</textarea>   
      </div>

      <div class="form-group">
          @php  $input = "description_ar";  @endphp 
          <label> @lang('site.description_ar')  </label>
          <textarea name="{{ $input }}" class="form-control  @error('{{ $input }}') is-invalid @enderror"  rows="3">{{ old('name', isset($row) ? $row->{$input} : '')}}</textarea>   
      </div>
      <div class="row">
        <div class="form-group col-md-9">
            @php $input = "url"; @endphp
            <label> @lang('site.url')  </label>
            <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" > 
        </div> 
        <div class="form-group col-md-3">
          <br><br>
          <div class="animated-checkbox">
            <label>
            <input type="checkbox" name="active" value="1"  {{isset($row) && $row->active == 1 ? ' checked ' : ''}}><span class="label-text"> @lang('site.active') </span>
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-6">
      <div class="form-group offset-md-2">
          <div>
            <label class=""> @lang('site.upload_photo') </label>
          </div>
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000"> 
                  @if(isset($row))
                  <img src="{{ url('public/uploads/sliders/'.$row->photo)  }}"  width="100%" >
                
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

  
    