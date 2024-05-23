@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp

<div class="row">




    <div class="col-md-3">
        <label> العميل</label>
        <select id="customers" name="customer_id" class=" form-control select2">
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
        <select id="projects" name="project_id" class="projects form-control select2">
            <option disabled selected> اختر مشروع </option>
            @if (isset($row) && $row->project)
            <option value="{{ $row->project_id }}" selected> {{ $row->project->name ?? '' }}  </option>
            @endif
        </select>
    </div>

    <div class="form-group col-md-3" id="safe">
        <label> الخزن</label>
        <select id="safes" name="safe_id" class="form-control" required >
            <option selected disabled > اختر خزنة </option>
            @if (isset($row) && $row->safe_id)
            <option value="{{ $row->safe_id }}" selected> {{ $row->safe->name ?? '' }}  </option>
            @endif
        </select>
    </div>

    <div class="form-group col-md-3">
        @php  $input = "date";    @endphp
        <label> التاريخ  </label>
        <input type="date" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('date', isset($row) ? $row->{$input} : '')}}" >
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

    {{-- <div class="form-group col-md-3">
        @php  $input = "net_amount";    @endphp
        <label> قيمة الصافي بعد الضرائب   </label>
        <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('net_amount', isset($row) ? $row->{$input} : '')}}" >
    </div> --}}

    <div class="form-group col-md-3">
        <label>رفع المستند   </label>
        <input type="file" name="file" class="form-control" value="">
    </div>

</div>

@push('js')

    <script type="text/javascript">
        $("#projects").change(function(){
            $.ajax({
                url: "{{ route('dashboard.get.main.safe.project') }}?project_id=" + $(this).val(),
                method: 'GET',
                success: function(data) {
                    $('#safes').html(data.html);

                }
            });
        });
    </script>


    <script type="text/javascript">
            $("#customers").change(function(){
                $.ajax({
                    url: "{{ route('dashboard.get.customer.project') }}?customer_id=" + $(this).val(),
                    method: 'GET',
                    success: function(data) {
                        $('#projects').html(data.html);
                    }
                });
            });
    </script>



@endpush
