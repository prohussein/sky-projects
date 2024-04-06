 
   
    <div class="form-group">
        @php  $input = "name";    @endphp  
        <label> @lang('site.name')  </label>
       
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required> 
    </div>