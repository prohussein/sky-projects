
@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
<div class="row">
    <div class="form-group col-md-4">
        @php  $input = "name";    @endphp
        <label> @lang('site.name')  </label>

        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required>
    </div>

     <div class="form-group col-md-4">
        <label> نوع الموظف </label>
        <select class="form-control" name="type">
            <option value="temp" {{  isset($row) && $row->type == 'temp' ? 'selected' : ''}} > مؤقت </option>
            <option value="parmanent" {{  isset($row) && $row->type == 'parmanent' ? 'selected' : ''}} > دائم</option>
        </select>

    </div>


    <div class="form-group col-md-4">
        @php  $input = "start_date";    @endphp
        <label> تاريخ التعين </label>
        <input type="date" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('start_date', isset($row) ? $row->{$input} : '')}}">
    </div>

    <div class="form-group col-md-4">
        @php  $input = "phone";    @endphp
        <label> رقم التليفون  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('phone', isset($row) ? $row->{$input} : '')}}" >
    </div>

    <div class="form-group col-md-4">
        @php  $input = "address";    @endphp
        <label>  العنوان  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('address', isset($row) ? $row->{$input} : '')}}" >
    </div>

    <div class="form-group col-md-4">
        @php  $input = "file";    @endphp
        <label>  ملفات  </label>
        <input type="file" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" >
    </div>

     <div class="form-group col-md-4">
        <label>  ملاحظات  </label>
        <textarea class="form-control" name="notes" >
            {{ old('notes', isset($row) ? $row->notes : '')}}
        </textarea>
    </div>

    <div class="form-group col-md-4">
        <div class="animated-checkbox">
            <label>
            <input type="checkbox" name="active" value="1"  {{isset($row) && $row->active == 1 ? 'checked'  : ''}}><span class="label-text"> @lang('site.active') </span>
            </label>
        </div>
    </div>

    <div class="form-group col-md-4">
        <div class="animated-checkbox">
            <label>
            <input type="checkbox" id="addAccount" name="add_account" value="1"   onchange="valueChanged()"/>
            <span class="label-text">
                @if (isset($row) && $row->account_id)
                تعديل الحساب
                @else
                اضافة حساب
                @endif
            </span>
            </label>
        </div>
    </div>

    @php
      $input = "email";
    @endphp
    <div class="form-group col-md-4 add-user">
        <label> @lang('site.email')  </label>
        <input type="email" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('email', isset($row) && $row->user()->exists()  ? $row->user->email  : '')}}" >
    </div>
    @php
      $input = "password";
    @endphp
    <div class="form-group col-md-4 add-user">
        <label> @lang('site.password')  </label>
        <input type="password" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror">
    </div>
    <div class="form-group col-md-4 add-user">
        <label> الصورة  </label>
        <input type="file" name="photo" class="form-control" value="" >
    </div>

</div>

@push('js')
    <script type="text/javascript">
            if($('#addAccount').is(":checked"))
                $(".add-user").show();
            else
                $(".add-user").hide();
        function valueChanged()
        {
            if($('#addAccount').is(":checked"))
                $(".add-user").show();
            else
                $(".add-user").hide();
        }
    </script>

@endpush
