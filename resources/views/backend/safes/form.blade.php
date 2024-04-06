@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp

<div class="row">


     <div class="form-group col-md-6">
        @php  $input = "name";    @endphp
        <label>الاسم  </label>
       <div>
       <input type="text" name="{{ $input }}" class="form-control" value="{{ old('name', isset($row) ? $row->{$input} : '')}}">
       </div>
    </div>

    <div class="form-group col-md-6">
        <label>النوع</label>
        <select  name="type" class="form-control">
            <option value="main" {{ isset($row) && $row->type == 'cash' ? 'selected' : '' }} > رئيسي </option>
            <option value="bank" {{ isset($row) && $row->type == 'properties' ? 'selected' : '' }} > بنك </option>
            <option value="custody" {{ isset($row) && $row->type == 'properties' ? 'selected' : '' }} > عهدة </option>
        </select>
    </div>


    <div class="form-group col-md-6">
        @php  $input = "balance";    @endphp
        <label>الرصيد  </label>
        <input type="number" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('balance', isset($row) ? $row->{$input} : 0)}}"  readonly>
    </div>

    <div class="form-group col-md-6">
        <label>امين الخزنة</label>
        <select  name="user_id" class="form-control">
            @foreach ($users as $user )
                <option value="{{ $user->id }}" {{ isset($row) && $row->user_id == $user->id ? 'selected' : '' }} > {{ $user->name }} </option>
            @endforeach

        </select>
    </div>

    <div class="form-group col-md-12">
        @php  $input = "descripton";    @endphp
        <label>الوصف </label>
       <div>
        <input type="text" name="{{ $input }}" class="form-control" value="{{ old('descripton', isset($row) ? $row->{$input} : '')}}">
       </div>
    </div>

</div>
