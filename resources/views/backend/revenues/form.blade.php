@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp

<div class="row">




    <div class="col-md-4">
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

    <div class="col-md-4">
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

    <div class="form-group col-md-4">
        @php  $input = "date";    @endphp
        <label> التاريخ  </label>
        <input type="date" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('date', isset($row) ? $row->{$input} : '')}}" >
    </div>

    <div class="form-group col-md-4">
        @php  $input = "total_amount";    @endphp
        <label> القيمة الاجمالية  </label>
        <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('total_amount', isset($row) ? $row->{$input} : '')}}" >
    </div>

    <div class="form-group col-md-4">
        @php  $input = "tax_amount";    @endphp
        <label> قيمة الضرائب   </label>
        <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('tax_amount', isset($row) ? $row->{$input} : '')}}" >
    </div>

    <div class="form-group col-md-4">
        @php  $input = "net_amount";    @endphp
        <label> قيمة الصافي بعد الضرائب   </label>
        <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('net_amount', isset($row) ? $row->{$input} : '')}}" >
    </div>



</div>
