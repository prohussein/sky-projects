@extends('frontend.modern.layouts.app')
@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('title')
@lang('site.about')
@endsection

@section('content')


 <!-- Page Title -->
        <section class="page-title centred">
            <div class="bg-layer parallax-bg" data-parallax='{"y": 100}' style="background-image: url('{{ asset('public/frontend/modern/assets/images/about.jpg') }}');"></div>
            <div class="auto-container">
                <div class="content-box">
                    <h2>@lang('site.about')</h2>
                    <ul class="bread-crumb clearfix">
                        <li><a href="{{ route('home') }}">@lang('site.home')</a></li>
                        <li>@lang('site.about')</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End Page Title -->


        <!-- about-section -->
        <section class="about-section sec-pad">
            <div class="pattern-layer-2" ></div>
            <div class="auto-container">
                <div class="row clearfix">
                    <div class="col-lg-6 col-md-12 col-sm-12 image-column">
                        <div class="image_block_eight">
                            <div data-animation-box class="image-box p_relative d_block">
                                <div class="shape">
                                    <div class="shape-1" ></div>
                                    <div class="shape-2" ></div>
                                </div>
                                <div class="icon-box float-bob-y"></div>
                                <figure data-animation-text class="overlay-anim-black-bg image image-1" data-animation="overlay-animation"><img src="{{ url('public/uploads/settings/'. setting('about_img') ) }}" alt=""></figure>
                                <figure class="image image-2"></figure>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 content-column">
                        <div class="content_block_one">
                            <div class="content-box p_relative d_block ml_30">
                                <div class="sec-title p_relative mb_25">
                                    <h5 class="d_block fs_17 lh_25 fw_medium mb_9"> @lang('site.about')</h5>
                                </div>
                                <div class="text p_relative d_block mb_30">
                                    <p>{!! $current_lang == 'ar' ? setting('about-intro-ar') :  setting('about-intro') !!}</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- about-section end -->


        <!-- service-style-three -->
        <section class="service-style-three p_relative sec-pad bg-color-3 centred">
            <div class="pattern-layer" style="background-image: url(assets/images/shape/shape-32.png);"></div>
            <div class="auto-container">
                <div class="sec-title p_relative mb_50">
                    <h2 >{{ $current_lang == 'ar' ? 'خدماتنا': 'Our Services ' }}</h2>
                </div>
                <div class="three-item-carousel owl-carousel owl-theme owl-nav-none">
                    @foreach ($categories as $cat)


                    <div class="service-block-two">
                        <div class="inner-box">
                            <figure class="image-box"><a href="{{ route('product.category' , $cat->id ) }}"><img src="{{ url('public/uploads/categories/photos/'. $cat->photo) }}" alt=""></a></figure>
                            <div class="lower-content">
                                <div class="icon-box">
                                    <div class="icon-shape" style="background-image: url(assets/images/shape/shape-31.png);"></div>
                                    <div class="icon"><i class="icon-15"></i></div>
                                </div>
                                <h3><a href="{{ route('product.category' , $cat->id ) }}">{{ $current_lang == 'ar' ?  $cat->name_ar : $cat->name_en }}</a></h3>

                                <div class="link"><a href="{{ route('product.category' , $cat->id ) }}"><span> {{ $current_lang == 'ar' ?  'عرض المنتجات' : 'View Products' }}</span></a></div>
                            </div>
                        </div>
                    </div>

                     @endforeach


                </div>
            </div>
        </section>
        <!-- service-style-three end -->


          <!-- testimonial-style-six -->
        <section class="testimonial-style-six p_relative centred">
            <div class="auto-container">
                <div class="sec-title p_relative mb_50">
                    <h5 class="d_block fs_17 lh_25 fw_medium mb_9"> {{ $current_lang == 'ar' ? 'اراء العملاء' : 'Testimonials' }}</h5>
                    <h2 class="d_block fs_40 lh_50 fw_bold"> {{ $current_lang == 'ar' ? ' قالوا علينا' : 'What Our Client Say' }}</h2>
                </div>
                <div class="row clearfix">
                     @foreach ($partners as $testimonial)
                    @if ($testimonial->content_ar != null && $testimonial->content_en != null)
                    <div class="col-lg-4 col-md-6 col-sm-12 testimonial-block">
                        <div class="testimonial-block-two">
                            <div class="inner-box">
                                <figure class="author-thumb"><img src="{{ url('public/uploads/partners/photos/'.$testimonial->photo)  }}" alt=""></figure>
                                <p>{{ $current_lang == 'ar' ? $testimonial->content_ar : $testimonial->content_en  }}</p>
                                <h4>{{ $current_lang == 'ar' ? $testimonial->name_ar : $testimonial->name_en  }}</h4>

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
                    @endif
                    @endforeach

                </div>
            </div>
        </section>
        <!-- testimonial-style-six end -->



@endsection
