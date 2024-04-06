     {{-- brand --}}
  {{--  <div class="col-md-4">
    <label> @lang('site.brands')  </label>
    <select name="brand_id" class=" form-control select2 @error('brand_id') is-invalid @enderror">
    @foreach ($brands as $brand)
        <option value="{{ $brand->id}}" {{ isset($row) && $row->brand_id == $brand->id ? 'selected' : '' }} >

          @if(LaravelLocalization::getCurrentLocale() == 'ar')
            {{  $brand->name_ar   }}
          @else  
            {{  $brand->name_en   }}
          @endif
          </option>
    @endforeach
    </select>

  </div>
      --}}
     
   
    <div class="form-group">
        @php  $input = "name";    @endphp  
        <label> @lang('site.name')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required> 
    </div>

         
     
    
    <div class="form-group">
      @php  $input = "phone";  @endphp
        <label> @lang('site.phone')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('phone', isset($row) ? $row->{$input} : '')}}" required>
           
    </div>

    <div class="form-group">
      @php  $input = "email";  @endphp
        <label> @lang('site.email')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('email', isset($row) ? $row->{$input} : '')}}" required>
           
    </div>

    <div class="form-group">
      @php  $input = "address";  @endphp
        <label> @lang('site.address')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('address', isset($row) ? $row->{$input} : '')}}" required>
           
    </div>

    <div class="form-group">
      @php  $input = "order_desc";  @endphp
        <label> @lang('site.description')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('order_desc', isset($row) ? $row->{$input} : '')}}" required>
           
    </div>

            