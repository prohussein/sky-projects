<div class="row">
    @php
      $input = "name";
    @endphp
    <div class="form-group col-md-6">
        <label> @lang('site.name')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required>
    </div>
    @php
      $input = "email";
    @endphp
    <div class="form-group col-md-6">
        <label> @lang('site.email')  </label>
        <input type="email" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('email', isset($row) ? $row->{$input} : '')}}" required>
    </div>
    @php
      $input = "password";
    @endphp
    <div class="form-group col-md-6">
        <label> @lang('site.password')  </label>
        <input type="password" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror">
    </div>
    @php
      $input = "password_confirmation";
    @endphp
    <div class="form-group col-md-6">
        <label> @lang('site.password_confirmation')  </label>
        <input type="password" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror">
    </div>

     @php
      $input = "phone_number";
    @endphp
    <div class="form-group col-md-6">
        <label> @lang('site.phone_number')  </label>
        <input type="text" name="phone_number" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('phone_number', isset($row) ? $row->{$input} : '')}}" required>
    </div>



     <div class="form-group col-md-6">
        <label> الوظيفة  </label>
        <select name="role" class="form-control select2" >
            @foreach ($roles as $role)
                <option value="{{ $role->id }}" @if(isset($row) && $row->hasRole($role->name) == $role->name) selected @endif>{{ $role->name }}</option>
            @endforeach
        </select>
        {{-- <a href=" {{ route('dashboard.roles.create') }} "> Create New Role</a> --}}
    </div>

    {{-- <div class="form-group col-md-6">
        <label> الصورة  </label>
        <input type="file" name="photo" class="form-control" value="" >
    </div> --}}

    <div class="col-md-6">
      <div class="form-group offset-md-2">
          <div>
            <label class=""> @lang('site.upload_photo') </label>
          </div>
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000">
                  @if(isset($row))
                  <img src="{{ url('public/uploads/users/'.$row->photo)  }}"  width="100%" >

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

     <div class="form-group col-md-6">
        <div class="animated-checkbox">
            <label>
            <input type="checkbox" name="active" value="1"  {{isset($row) && $row->active == 1 ? ' checked ' : ''}}><span class="label-text"> @lang('site.active') </span>
            </label>
        </div>

    </div>
</div>

