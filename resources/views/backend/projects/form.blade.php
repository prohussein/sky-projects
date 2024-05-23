
@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
<div class="row">
    <div class="form-group col-md-3">
        @php  $input = "name";    @endphp
        <label> @lang('site.name')  </label>

        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required>
    </div>

     <div class="form-group col-md-3">
        @php  $input = "start_date";    @endphp
        <label>  تاريخ البدء</label>
        <input type="date" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('start_date', isset($row) ? $row->{$input} : '')}}">
    </div>

    <div class="form-group col-md-3">
        @php  $input = "end_date";    @endphp
        <label> تاريخ الانتهاء   </label>
        <input type="date" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('end_date', isset($row) ? $row->{$input} : '')}}" >
    </div>


    <div class="col-md-3">
        <label> مدير المشروع  </label>
        <select name="manager_id" class=" form-control select2">
            @foreach ($users as $user)
                <option value="{{ $user->account_id}}"  {{ isset($row) && $row->manager_id == $user->account_id ? 'selected' : '' }}>
                    {{ $user->name }}
                </option>
            @endforeach
        </select>

    </div> 

     <div class="col-md-3">
        <label> ادارة التنفيذ   </label>
        <select name="users[]" class=" form-control select2" multiple >
            @foreach ($users as $user)
                <option value="{{ $user->account_id}}"  {{ in_array( $user->account_id, $selectedUsers) ? 'selected' : '' }}>
                    {{ $user->name }}
                </option>
            @endforeach
        </select>

    </div>

     <div class="col-md-3">
        <label> العميل</label>
        <select name="customer_id" class=" form-control select2" required>
            @foreach ($customers as $customer)
                <option value="{{ $customer->id}}" {{ isset($row) && $row->customer_id == $customer->id ? 'selected' : '' }} >
                    {{ $customer->name }}
                </option>
            @endforeach
        </select>

    </div>



    <div class="form-group col-md-3">
        @php  $input = "customer_cost";    @endphp
        <label>  تكلفة العميل  </label>
        <input type="number" step="any" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('customer_cost', isset($row) ? $row->{$input} : '')}}" required>
    </div>
    <div class="form-group col-md-3">
        @php  $input = "estimated_cost";    @endphp
        <label>  تكلفة المتوقعة  </label>
        <input type="number" step="any" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('estimated_cost', isset($row) ? $row->{$input} : '')}}" required>
    </div>


</div>
