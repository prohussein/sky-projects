@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp

<div class="row">




    <div class="col-md-3">
        <label> العميل</label>
        <select name="customer_id" class=" form-control select2">
            <option disabled selected> اختر عميل </option>
            @foreach ($customers as $customer)
                <option value="{{ $customer->id}}" {{ isset($row) && $row->customer_id == $customer->id ? 'selected' : '' }} >
                    {{ $customer->name }}
                </option>
            @endforeach
        </select>
    </div>

    <div class="col-md-3">
        <label> المشروع</label>
        <select name="project_id" class=" form-control select2">
            <option disabled selected> اختر مشروع </option>
            @foreach ($projects as $project)
                <option value="{{ $project->id}}" {{ isset($row) && $row->project_id == $project->id ? 'selected' : '' }} >
                    {{ $project->name }}
                </option>
            @endforeach
        </select>
    </div>

    <div class="form-group col-md-3">
        @php  $input = "date";    @endphp
        <label> التاريخ  </label>
        <input type="date" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('date', isset($row) ? $row->{$input} : '')}}" >
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
        @php  $input = "total_amount";    @endphp
        <label> القيمة الاجمالية  </label>
        <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('total_amount', isset($row) ? $row->{$input} : '')}}" >
    </div>

    <div class="form-group col-md-3">
        @php  $input = "tax_amount";    @endphp
        <label> قيمة الضرائب   </label>
        <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('tax_amount', isset($row) ? $row->{$input} : '')}}" >
    </div>

    <div class="form-group col-md-3">
        @php  $input = "net_amount";    @endphp
        <label> قيمة الصافي بعد الضرائب   </label>
        <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('net_amount', isset($row) ? $row->{$input} : '')}}" >
    </div>

    <div class="form-group col-md-3">
        <label>رفع المستند   </label>
        <input type="file" name="file" class="form-control" value="">
    </div>

</div>
