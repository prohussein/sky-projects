
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
        <label> نوع الموظف </label>
        <select class="form-control" name="type">
            <option value="temp" {{  isset($row) && $row->type == 'temp' ? 'selected' : ''}} > مؤقت </option>
            <option value="parmanent" {{  isset($row) && $row->type == 'parmanent' ? 'selected' : ''}} > دائم</option>
        </select>

    </div>


    <div class="form-group col-md-6">
        @php  $input = "start_date";    @endphp
        <label> تاريخ التعين </label>
        <input type="date" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('start_date', isset($row) ? $row->{$input} : '')}}">
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

     <div class="form-group col-md-6">
        <label>  ملاحظات  </label>
        <textarea class="form-control" name="notes" >
            {{ old('notes', isset($row) ? $row->notes : '')}}
        </textarea>
    </div>



</div>
