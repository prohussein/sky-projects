
@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
<div class="row">
    <div class="form-group col-md-6">
        @php  $input = "name";    @endphp
        <label> @lang('site.name')  </label>

        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required>
    </div>

    <div class="form-group col-md-6">
        @php  $input = "contact_person";    @endphp
        <label> الشخص المسئول</label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('contact_person', isset($row) ? $row->{$input} : '')}}">
    </div>

    <div class="form-group col-md-6">
        @php  $input = "phone";    @endphp
        <label> رقم التليفون  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('phone', isset($row) ? $row->{$input} : '')}}" >
    </div>

    <div class="form-group col-md-6">
        @php  $input = "address";    @endphp
        <label>  العنوان  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('address', isset($row) ? $row->{$input} : '')}}" >
    </div>

    <div class="form-group col-md-6">
        @php  $input = "file";    @endphp
        <label>  ملفات  </label>
        <input type="file" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" >
    </div>



</div>
