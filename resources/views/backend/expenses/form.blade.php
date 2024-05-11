@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp

<div class="row">

    <div class="form-group col-md-3">
        @php  $input = "date";    @endphp
        <label> التاريخ  </label>
        <input class="form-control" name="date" type="date" value="{{ isset($row) ? $row->date : '' }}">

      {{-- <input class="form-control demoDate" name="date" type="text" value="{{ isset($row) ? $row->date : '' }}" placeholder="Select Date"> --}}
    </div>

    <div class="form-group col-md-3">
        <label> @lang('site.categories')  </label>
        <select  name="cat_id" class="form-control select2">

        <option value="" disabled selected> التصنيف  </option>
        @foreach ($cats as $cat)
            <option value="{{ $cat->id}}" {{ isset($row) && $row->cat_id == $cat->id ? 'selected' : '' }} > {{  $cat->name   }}  </option>
        @endforeach
        </select>
    </div>

     <div class="form-group col-md-3" id="safe">
        <label> الخزن</label>
        <select  name="safe_id" class="form-control" required >
            <option selected disabled > اختر خزنة </option>

            @foreach ($safes as $safe )
                <option value="{{ $safe->id }}" {{ isset($row) && $row->safe_id == $safe->id ? 'selected' : '' }} > {{ $safe->name }} </option>
            @endforeach
        </select>
    </div>
    <div class="form-group col-md-3">
        @php  $input = "amount";    @endphp
        <label> القيمة  </label>
        <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('amount', isset($row) ? $row->{$input} : '')}}" >
    </div>


    <div class="form-group col-md-9">
        @php  $input = "note";    @endphp
        <label> ملاحظات  </label>
       <div>
        <input type="text" name="{{ $input }}" class="form-control" value="{{ old('note', isset($row) ? $row->{$input} : '')}}">
       </div>
    </div>

     <div class="form-group col-md-3">
        <label>رفع المستند   </label>
        <input type="file" name="file" class="form-control" value="">
    </div>

</div>
