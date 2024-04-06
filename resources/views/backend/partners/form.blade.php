    <div class="row">
      <div class="col-md-6">


        @php $input = "name_en"; @endphp
        <div class="form-group">
            <label> @lang('site.name_en')  </label>
            <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name_en', isset($row) ? $row->{$input} : '')}}" required>
        </div>

        @php $input = "name_ar";  @endphp
        <div class="form-group">
            <label> @lang('site.name_ar')  </label>
            <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name_ar', isset($row) ? $row->{$input} : '')}}" required>

        </div>

        @php $input = "content_en";  @endphp
        <div class="form-group">
            <label> @lang('site.content_en')  </label>
            <textarea class="form-control" name="{{ $input }}">
                {{ old('content_en', isset($row) ? $row->{$input} : '')}}
            </textarea>

        </div>

        @php $input = "content_ar";  @endphp
        <div class="form-group">
            <label> @lang('site.content_ar')  </label>
            <textarea class="form-control" name="{{ $input }}">
                {{ old('content_ar', isset($row) ? $row->{$input} : '')}}
            </textarea>

        </div>

            <div class="form-group">
                <label for="type"> @lang('site.type')  </label>
                <select id="cat" name="type" class=" form-control">


                    <option value="client" {{ isset($row) && $row->type == 'client' ? 'selected' : '' }} >
                        {{ LaravelLocalization::getCurrentLocale() == 'ar' ? 'عميل' : 'client'  }}
                    </option>
                    <option value="review" {{ isset($row) && $row->type == 'review' ? 'selected' : '' }} >
                        {{ LaravelLocalization::getCurrentLocale() == 'ar' ? 'ريفيو' : 'review'  }}
                    </option>

                </select>

            </div>


        <div class="animated-checkbox">
          <label>
          <input type="checkbox" name="active" value="1"  {{isset($row) && $row->active == 1 ? ' checked ' : ''}}><span class="label-text"> @lang('site.active') </span>
          </label>
        </div>

      </div>
      <div class="offset-md-1 col-md-5">
        <br>
        <div class="form-group ">
          <div>
            <label class=""> @lang('site.upload_photo') </label>
          </div>

            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000">
                   @if(isset($row))
                  <img src="{{ url('public/uploads/partners/photos/'.$row->photo)  }}"  width="100%" >

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

