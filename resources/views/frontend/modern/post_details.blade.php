@extends('frontend.modern.layouts.app')
@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('title')
{{ $current_lang == 'ar' ?   $post->name_ar   :   $post->name_en   }} @endsection
@section('content')

        <!-- Page Title -->
        <section class="page-title centred">
            <div class="bg-layer parallax-bg" data-parallax='{"y": 100}' style="background-image: url('{{ asset('public/frontend/modern/assets/images/logo.png') }}');"></div>
            <div class="auto-container">
                <div class="content-box">
                    <h2>@lang('site.pages')</h2>
                    <ul class="bread-crumb clearfix">
                        <li><a href="{{ route('home') }}">@lang('site.home')</a></li>
                        <li><a href="{{ route('posts') }}">@lang('site.pages')</a></li>
                        <li>{{ $current_lang == 'ar' ?   $post->name_ar   :   $post->name_en   }}</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End Page Title -->

          <!-- sidebar-page-container -->
        <section class="sidebar-page-container pt_120 pb_120">
            <div class="auto-container">
                <div class="row clearfix">
                    <div class="col-lg-8 col-md-12 col-sm-12 content-side">
                        <div class="blog-details-content p_relative d_block">
                            <div class="news-block-one">
                                <div class="inner-box p_relative d_block">
                                    <div class="single-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                                        <figure class="image-box">
                                            <img src="{{ url('public/uploads/pages/'.$post->photo)  }}" alt="">

                                        </figure>

                                    </div>
                                    <div class="lower-content p_relative d_block">
                                        <h3>{{ $current_lang == 'ar' ?   $post->name_ar   :   $post->name_en   }}</h3>
                                        <ul class="post-info clearfix">
                                            <li><i class="icon-42"></i>{{  $post->created_at   }}</li>

                                        </ul>
                                        <div class="text">
                                            <p>{!! $current_lang == 'ar' ?   $post->content_ar   :   $post->content_en  !!}</p>

                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12 sidebar-side">
                        <div class="blog-sidebar ml_20">




                            <div class="sidebar-widget post-widget">
                                <div class="widget-title">
                                    <h4>@lang('site.recent_posts')</h4>
                                </div>
                                <div class="post-inner">
                                    @foreach ($posts as $recent)
                                        <div class="post">
                                            <figure class="post-thumb"><a href="{{ route( 'post.details', $recent->id ) }}"><img src="{{ url('public/uploads/pages/'.$post->photo)  }}" alt=""></a></figure>
                                            <h5><a href="{{ route( 'post.details', $recent->id ) }}">{{ $current_lang == 'ar' ?   $recent->name_ar   :   $recent->name_en   }}</a></h5>
                                            <div class="post-date"><i class="icon-42"></i>{{  $recent->created_at  }}</div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>



                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- sidebar-page-container end -->

@endsection
