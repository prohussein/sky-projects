@extends('layouts.backend.app')

@section('pageTitle')
    اضافة تحويل بين خزنة مشروع
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' =>  ' اضافة تحويل بين خزنة مشروع',
        'des'   =>'',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">تحويلات بين الخزن</a></li>
    <li class="breadcrumb-item"> اضافة تحويل </li>

@endcomponent
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <form action="{{ route('dashboard.'. $routeName .'.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('post')

                    @include('backend.partials._errors')

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
                            <select id="safes" name="from_safe" class="form-control" required>
                                <option selected disabled > اختر خزنة </option>

                                @foreach ($safes as $safe )
                                    <option value="{{ $safe->id }}" {{ isset($row) && $row->from_safe == $safe->id ? 'selected' : '' }} > {{ $safe->name .' [ '. $safe->balance .' ]' }} </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group col-md-3">
                            <label>الي خزنة</label>
                            <select id="subsafes" name="to_safe" class="form-control" required>
                                <option selected disabled > اختر خزنة </option>

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

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-plus"></i> @lang('site.add') </button>
                    </div>
                </form> {{-- end of form --}}
            </div>{{-- end of tile  --}}

        </div>{{-- end of col-md-12 --}}
    </div> {{-- end of row --}}


@endsection

@push('js')
    <script type="text/javascript">
        $("#safes").change(function(){
            $.ajax({
                url: "{{ route('dashboard.safetransfers.project.safes') }}?safe_id=" + $(this).val(),
                method: 'GET',
                success: function(data) {
                    $('#subsafes').html(data.html);
                }
            });
        });
    </script>
@endpush
