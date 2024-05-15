    @php
      $input = "name";
    @endphp
    <div class="form-group">
        <label> @lang('site.name')  </label>
        <input type="text" name="{{ $input }}" class="form-control @error('{{ $input }}') is-invalid @enderror" value="{{ old('name', isset($row) ? $row->{$input} : '')}}" required>

    </div>
             {{-- handel permissions  --}}

    <div class="form-group">
        <h4> @lang('site.permissions') </h4>

        <table class="table table-hover">
            <thead>
                <th style="width:5%">#</th>
                <th style="width:15%">@lang('site.model')</th>
                <th style="width:80%">@lang('site.permissions')</th>
            </thead>
            <tbody>

                @php
                    $models = ['users','roles','settings', 'customers'] ;
                @endphp

                @foreach($models as $index=>$model )
                <tr>
                <td>{{ $index+1 }}</td>
                <td>{{ $model }}</td>
                <td>

                    @php
                        $permissions_maps = ['create', 'read',  'update', 'delete'];
                    @endphp
                    <select name="permissions[]" class=" form-control select2 @error('permissions') is-invalid @enderror" multiple >
                    @foreach ($permissions_maps as $permissions_map)
                        <option value="{{ $permissions_map . '_' . $model}}" {{ isset($row) && $row->hasPermission($permissions_map . '_' . $model)? 'selected' : '' }} >
                            {{  $permissions_map   }} </option>
                    @endforeach

                    </select>
                </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
