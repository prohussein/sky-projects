@extends('frontend.modern.layouts.app')
@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('title')
 {{ $current_lang == 'ar' ? 'اراء العملاء' : 'Testimonials' }}
@endsection

@section('content')


 <!-- Page Title -->
        <section class="page-title centred">
            <div class="bg-layer parallax-bg" data-parallax='{"y": 100}' style="background-image: url('{{ asset('public/frontend/modern/assets/images/customer.png') }}');"></div>
            <div class="auto-container">
                <div class="content-box">
                    <h2> {{ $current_lang == 'ar' ? 'اراء العملاء' : 'Testimonials' }}</h2>
                    <ul class="bread-crumb clearfix">
                        <li><a href="{{ route('home') }}">@lang('site.home')</a></li>
                        <li> {{ $current_lang == 'ar' ? 'اراء العملاء' : 'Testimonials' }}</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End Page Title -->







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
