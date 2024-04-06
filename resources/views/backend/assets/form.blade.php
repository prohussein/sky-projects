@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp

<div class="row">


     <div class="form-group col-md-3">
        @php  $input = "name";    @endphp
        <label>الاسم  </label>
       <div>
       <input type="text" name="{{ $input }}" class="form-control" value="{{ old('name', isset($row) ? $row->{$input} : '')}}">
       </div>
    </div>

    <div class="form-group col-md-3">
        <label>النوع</label>
        <select  name="type" class="form-control" id="type">
            <option value="cash" {{ isset($row) && $row->type == 'cash' ? 'selected' : '' }} > نقدي </option>
            <option value="properties" {{ isset($row) && $row->type == 'properties' ? 'selected' : '' }} > ممتلكات </option>
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


    <div class="form-group col-md-12">
        @php  $input = "descripton";    @endphp
        <label>الوصف </label>
       <div>
        <input type="text" name="{{ $input }}" class="form-control" value="{{ old('descripton', isset($row) ? $row->{$input} : '')}}">
       </div>
    </div>

</div>

@push('js')
    <script>
            typeValue    = $('#type').val();

            if (typeValue == 'cash') {
                $("#safe").show();
            } else {
                $("#safe").hide();
            }
         $(document).on('change','#type',function(){
            typeValue    = $('#type').val();

            if (typeValue == 'cash') {
                $("#safe").show();
            } else {
                $("#safe").hide();
            }
        });
    </script>
@endpush
