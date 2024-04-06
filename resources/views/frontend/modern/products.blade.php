@extends('frontend.modern.layouts.app')
@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('title')
@lang('site.products')
@endsection

@section('content')

        <!-- Page Title -->
        <section class="page-title centred">
            <div class="bg-layer parallax-bg" data-parallax='{"y": 100}' style="background-image: url(assets/images/background/page-title.jpg);"></div>
            <div class="auto-container">
                <div class="content-box">
                    <h2>@lang('site.products')</h2>
                    <ul class="bread-crumb clearfix">
                        <li><a href="{{ route('home') }}">@lang('site.home')</a></li>
                        <li>@lang('site.products')</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End Page Title -->


        <!-- shop-page-section -->
        <section class="shop-page-section bg-color-4">
            <div class="auto-container">
                <div class="row clearfix">
                    <div class="col-lg-3 col-md-12 col-sm-12 sidebar-side">
                        <div class="shop-sidebar">

                            <div class="category-widget sidebar-widget">
                                <div class="widget-title">
                                    <h4>@lang('site.categories')</h4>
                                </div>
                                <div class="widget-content">
                                    <ul class="category-list clearfix">
                                        @foreach ($categories as $cat)

                                        <li><a href="{{ route('product.category' , $cat->id ) }}"><i class="icon-7"></i>{{ $current_lang == 'ar' ? $cat->name_ar : $cat->name_en }}</a></li>

                                    @endforeach
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-9 col-md-12 cols-sm-12 content-side">
                        <div class="our-shop">

                            <div class="wrapper grid">
                                <div class="shop-grid-content">
                                    <div class="row clearfix">
                                        @foreach ($products as $product)


                                        <div class="col-lg-4 col-md-6 col-sm-12 shop-block">
                                            <div class="shop-block-one">
                                                <div class="inner-box">
                                                    <div class="image-box">

                                                        <figure class="image"><img src="{{ url('public/uploads/products/'.$product->photo)  }}" alt=""></figure>
                                                        {{-- <ul class="option-list clearfix">
                                                            <li><a href="shop.html"><i class="icon-57"></i></a></li>
                                                            <li><a href="index-5.html"><i class="icon-62"></i></a></li>
                                                            <li><a href="index-5.html"><i class="icon-61"></i></a></li>
                                                            <li><a href="{{ url('public/uploads/products/'.$product->photo)  }}" class="lightbox-image" data-fancybox="gallery"><i class="icon-63"></i></a></li>
                                                        </ul> --}}
                                                    </div>
                                                    <div class="lower-content">
                                                        <h6><a href="{{ route( 'product.details', $product->id ) }}">	{{ $current_lang == 'ar' ?   $product->name_ar   :   $product->name_en   }}</a></h6>
                                                        <ul class="rating clearfix">
                                                            <li><i class="icon-71"></i></li>
                                                            <li><i class="icon-71"></i></li>
                                                            <li><i class="icon-71"></i></li>
                                                            <li><i class="icon-71"></i></li>
                                                            <li><i class="icon-71"></i></li>
                                                        </ul>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                         @endforeach



                                    </div>
                                </div>

                            </div>
                            <div class="pagination-wrapper centred mt_30 centred">
                                {{-- <ul class="pagination clearfix">
                                    <li>{{ $products->appends(request()->query())->links() }}  </li>

                                </ul> --}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- shop-page-section -->

@endsection
