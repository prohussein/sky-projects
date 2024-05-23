@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp

<div class="row">


    <div class="form-group col-md-3">
        <label>تاريخ التحويل </label>
        <input type="datetime-local" name="transfer_date" class="form-control" value="{{ old('transfer_date', isset($row) ? $row->transfer_date : '')}}" required>

    </div>
    <div class="form-group col-md-3">
        <label>من خزنة</label>
        <select  name="from_safe" class="form-control" required>
            <option selected disabled > اختر خزنة </option>

            @foreach ($mainSafes as $safe )
                <option value="{{ $safe->id }}" {{ isset($row) && $row->from_safe == $safe->id ? 'selected' : '' }} > {{ $safe->name .' [ '. $safe->balance .' ]' }} </option>
            @endforeach
        </select>
    </div>

    <div class="form-group col-md-3">
        <label>الي خزنة</label>
        <select  name="to_safe" class="form-control" required>
            <option selected disabled > اختر خزنة </option>
            @foreach ($subSafes as $safe )
                <option value="{{ $safe->id }}" {{ isset($row) && $row->to_safe == $safe->id ? 'selected' : '' }} > {{ $safe->name .' [ '. $safe->balance .' ]' }} </option>
            @endforeach
        </select>
    </div>


    <div class="form-group col-md-3">
        @php  $input = "amount";    @endphp
        <label>القيمة  </label>
        <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('amount', isset($row) ? $row->{$input} : '')}}" required>
    </div>


    <div class="form-group col-md-12">
        @php  $input = "notes";    @endphp
        <label>الوصف </label>
       <div>
        <input type="text" name="{{ $input }}" class="form-control" value="{{ old('notes', isset($row) ? $row->{$input} : '')}}">
       </div>
    </div>

</div>
