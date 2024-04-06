    @php
      $input = "name_en";  
    @endphp    
    <div class="form-group">
        <label> @lang('site.name_en')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required>
           
    </div>

     @php
      $input = "name_ar";  
    @endphp    
    <div class="form-group">
        <label> @lang('site.name_ar')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required>
           
    </div>
            