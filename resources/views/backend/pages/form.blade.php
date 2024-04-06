   <div class="row">


   @php
      $input = "name_en";
    @endphp
    <div class="form-group col-md-4">
        <label> @lang('site.name_en')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required>

    </div>

     @php
      $input = "name_ar";
    @endphp
    <div class="form-group col-md-4">
        <label> @lang('site.name_ar')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required>

    </div>

    
{{--  description  --}}
    <div class="col-md-12">
      @php $input = "content_en"; @endphp
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
      @php $input = "content_ar"; @endphp
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

    {{-- meta description  --}}
  <div class="col-md-12">
    @php $input = "meta_description"; @endphp
    <div class="form-group">
      <label> @lang('site.meta_des')  </label>
      <textarea name="{{ $input }}"  class="form-control @error('{{ $input }}') is-invalid @enderror" >{{ old('meta_des', isset($row) ? $row->{$input} : '')}}</textarea>

    </div>
  </div>

    {{-- upload photo --}}
    <div class="col-md-4">
      <div class="form-group ">
          <label>@lang('site.upload_photo') </label>
          <div>
              <div class="fileinput fileinput-new" data-provides="fileinput">
                  <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000">
                    @if(isset($row))
                    <img src="{{ url('public/uploads/pages/'.$row->photo)  }}"  width="100%" >
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

     {{--  meta keywords  --}}
  <div class="col-md-8">
    @php $input = "meta_keywords"; @endphp
    <div class="form-group">
      <label> @lang('site.meta_keywords')  </label>
      <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('meta_keywords', isset($row) ? $row->{$input} : '')}}" required>
    </div>
  </div>
</div>

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



@endpush
