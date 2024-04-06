  
@php 
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
  <div class="row">

       @if(isset($row))
      <input type="hidden" value="{{ $row->id }}" name="row_id">
      @endif
    
    {{-- category --}}
  <div class="col-md-6">
    <label for="cat"> @lang('site.categories')  </label>
    <select id="cat" name="cat_id" class=" form-control select2">
      <option > select category </option>
    @foreach ($categories as $category)
         <option value="{{ $category->id}}" {{ isset($row) && $row->category == $category->id ? 'selected' : '' }} >

          @if(LaravelLocalization::getCurrentLocale() == 'ar')
            {{  $category->name_ar   }}
          @else  
            {{  $category->name_en   }}
          @endif
          </option>
    @endforeach
    </select>

  </div>

  {{-- sup category --}}
  <div class="col-md-6">
    <label> @lang('site.sup_category')  </label>
    <select id="cats" name="sup_category" class=" form-control select-sup select2 ">
      @if(isset($row))
       <option value="$row->sub_category"> {{ $current_lang == 'ar' ? $row->supcategory->name_ar : $row->supcategory->name_en }} </option>
      @else 
        <option value=""> select sup category </option>
      @endif
       
        
          
     
    </select>

  </div>


    <div class="form-group col-md-6">
        @php  $input = "name_en";    @endphp  
        <label> @lang('site.name_en')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name_en', isset($row) ? $row->{$input} : '')}}" required> 
    </div>

    <div class="form-group col-md-6">
      @php  $input = "name_ar";  @endphp
        <label> @lang('site.name_ar')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name_ar', isset($row) ? $row->{$input} : '')}}" required>
           
    </div>

   
  </div>

  @push('js')


    <script type="text/javascript">
        $("#cat").change(function(){
            $.ajax({
                url: "{{ route('subcat') }}?cat_id=" + $(this).val(),
                method: 'GET',
                success: function(data) {
                    $('#cats').html(data.html);
                }
            });
        });
    </script>

    @endpush
            