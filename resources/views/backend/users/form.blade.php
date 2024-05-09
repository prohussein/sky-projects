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
        <label> Roles  </label>
        <select name="role" class="form-control select2" >
            @foreach ($roles as $role)
                <option value="{{ $role->id }}" @if(isset($row) && $row->hasRole($role->name) == $role->name) selected @endif>{{ $role->name }}</option>
            @endforeach
        </select>
        <a href=" {{ route('dashboard.roles.create') }} "> Create New Role</a>
    </div>

     <div class="form-group col-md-6">
        <div class="animated-checkbox">
            <label>
            <input type="checkbox" name="active" value="1"  {{isset($row) && $row->active == 1 ? ' checked ' : ''}}><span class="label-text"> @lang('site.active') </span>
            </label>
        </div>

    </div>
</div>

