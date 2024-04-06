@extends('layouts.backend.app')

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
                                        <th>@lang('site.product') </th>
                    
                                        <th>@lang('site.photo')</th>
                                        <th>@lang('site.action')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($rows as $index=>$row)
                                    <tr>
                                        <td >{{ $index+1 }}</td>
                                        <td > 
                                            @if(LaravelLocalization::getCurrentLocale() == 'ar')
                                            {{ $row->product->name_ar }} 
                                            @else  
                                            {{ $row->product->name_en }} 
                                            @endif
                                            
                                        </td>
                                       
                                        <td >   
                                            <a href="{{ url('public/uploads/products/photos/'.$row->photo)  }}" target="blank">
                                                <img src="{{ url('public/uploads/products/photos/'.$row->photo)  }}" width="50px" height="50px"> 
                                            </a>
                                        </td>
                                        <td>
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