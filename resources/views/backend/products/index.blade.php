@extends('layouts.backend.app')
@php 
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('pageTitle')
   @lang('site.all_'. $routeName .'') 
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => __('site.'. $routeName .''),
        'des'   => __('site.all_'. $routeName .'_des'),
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">@lang('site.'. $routeName .'')</a></li>
    <li class="breadcrumb-item">@lang('site.all_'. $routeName .'')</li>
    
@endcomponent

    <div class="tile mb-4">
        <div class="row">
            <div class="col-md-12">
                    
                <div class="col-md-12 text-center">
                    
                    <a href=" {{ route('dashboard.'. $routeName .'.index') }} " class="btn btn-primary"> <i class="fa fa-refresh"></i> @lang('site.refresh')</a>
                    <a href="{{ route('dashboard.'. $routeName .'.create')  }}" class="btn btn-primary"> <i class="fa fa-plus"></i>@lang('site.add')</a>
                </div>

            </div>{{-- end of col 12--}}
        </div> {{-- end of row --}}

        <div class="row">
            <div class="col-md-12 table-responsive">
                
                    <div class="tile-body">
                        
                        <div class="table-responsive">
                            @if ($rows->count() > 0)
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                         <th>@lang('site.photo')</th>
                                        <th>@lang('site.name_en') </th>
                                        <th>@lang('site.name_ar')</th>
                                        <th>@lang('site.brand')</th>
                                        <th>@lang('site.category')</th>
                                        <th>@lang('site.supcategory')</th>
                                        <th>@lang('site.active')</th>
                                        <th>{{ $current_lang == 'ar' ? 'مميز' : 'Featured' }} </th>
                                        {{--  <th>@lang('site.supsupcategory')</th>  --}}
                                        <th>@lang('site.action')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($rows as $index=>$row)
                                    <tr>
                                        <td >{{ $index+1 }}</td>
                                        <td >   
                                            <a href="{{ url('public/uploads/products/'.$row->photo)  }}" target="blank">
                                                <img src="{{ url('public/uploads/products/'.$row->photo)  }}" width="50px" height="50px"> 
                                            </a>
                                        </td>
                                        <td > {{ $row->name_en }} </td>
                                        <td > {{ $row->name_ar }} </td>
                                        @if($row->brands)
                                        <td > {{ $current_lang == 'ar' ? $row->brands->name_ar : $row->brands->name_en }} </td>
                                        @else
                                         <td> {{ $current_lang == 'ar' ? '' : '' }}  </td>
                                        @endif 
                                        
                                        @if($row->cats)
                                        <td > {{ $current_lang == 'ar' ? $row->cats->name_ar : $row->cats->name_en }} </td> 
                                        @else
                                        <td> {{ $current_lang == 'ar' ? '' : '' }}  </td>
                                        @endif 
                                        
                                        @if($row->supcats)
                                        <td > {{ $current_lang == 'ar' ? $row->supcats->name_ar : $row->supcats->name_en }} </td> 
                                         @else 
                                          <td> {{ $current_lang == 'ar' ? '' : '' }}  </td>
                                        @endif
                                        	<td>
                                                <label class="">
                                                    <input onchange="update_active(this)" value="{{ $row->id }}" type="checkbox" <?php if($row->active == 1) echo "checked";?> >
                                                   
                                                </label>
                                            </td>
                                        <td>
                                            <label class="">
                                                    <input onchange="update_featured(this)" value="{{ $row->id }}" type="checkbox" <?php if($row->featured == 1) echo "checked";?> >
                                                   
                                                </label>
                                        </td>
                                        <td>

                                            <a href="{{ route('dashboard.getPhotosById', $row->id) }}" class="btn btn-info">{{ $current_lang == 'ar' ? 'ادارة الصور' : 'Mange Photos' }} </a>
                                
                                            @include('backend.partials._buttons')
                                           
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table> {{-- end of table  --}}

                            {{--  {{ $rows->appends(request()->query())->links() }}  --}}
                            @else
                                <br>
                                <h2 class="text-center"> @lang('site.no_data_found')  &#x1F625;</h2>
                            @endif
                        </div>
                    </div>
                
            </div>{{-- end of col 12 --}}

        </div>{{-- end of row --}}
    </div>{{-- end of tile  --}}
@endsection

@push('js')
    <script type="text/javascript">
           function update_active(el){
            if(el.checked){
                var status = 1;
            }
            else{
                var status = 0;
            }
            $.post('{{ route('products.active') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
                if(data == 1){
                    AIZ.plugins.notify('success', 'active products updated successfully');
                }
                else{
                    AIZ.plugins.notify('danger', 'Something went wrong');
                }
            });
        } 

        function update_featured(el){
            if(el.checked){
                var status = 1;
            }
            else{
                var status = 0;
            }
            $.post('{{ route('products.featured') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
                if(data == 1){
                    AIZ.plugins.notify('success', 'featured products updated successfully');
                }
                else{
                    AIZ.plugins.notify('danger', 'Something went wrong');
                }
            });
        } 

    </script>
@endpush