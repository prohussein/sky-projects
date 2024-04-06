@extends('frontend.modern.layouts.app')
@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('title')
@lang('site.pages')
@endsection

@section('content')

        <!-- Page Title -->
        <section class="page-title centred">
            <div class="bg-layer parallax-bg" data-parallax='{"y": 100}' style="background-image: url(assets/images/background/page-title.jpg);"></div>
            <div class="auto-container">
                <div class="content-box">
                    <h2>@lang('site.pages')</h2>
                    <ul class="bread-crumb clearfix">
                        <li><a href="{{ route('home') }}">@lang('site.home')</a></li>
                        <li>@lang('site.pages')</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End Page Title -->


         <section class="news-section alternat-2 blog-grid p_relative">
            <div class="auto-container">
                <div class="row clearfix">
                    @foreach ($posts as $post)


                    <div class="col-lg-4 col-md-6 col-sm-12 news-block">
                        <div class="news-block-one wow fadeInUp animated" data-wow-delay="600ms" data-wow-duration="1500ms">
                            <div class="inner-box p_relative d_block">
                                <figure class="image-box">
                                    <a href="{{ route( 'post.details', $post->id ) }}"><img src="{{ url('public/uploads/pages/'.$post->photo)  }}" alt=""></a>

                                </figure>
                                <div class="lower-content p_relative d_block">
                                    <h3><a href="{{ route( 'post.details', $post->id ) }}">{{ $current_lang == 'ar' ?   $post->name_ar   :   $post->name_en   }}</a></h3>
                                    <ul class="post-info clearfix">
                                        <li><i class="icon-42"></i>{{  $post->created_at  }}</li>
                                        <li><i class="icon-43"></i><a href="{{ route( 'post.details', $post->id ) }}"></a></li>
                                    </ul>
                                    <p>{!! Str::limit($current_lang == 'ar' ?   $post->content_en   :   $post->content_en , 100, '...') !!}</p>
                                    <div class="link"><a href="{{ route( 'post.details', $post->id ) }}">@lang('site.read_more')<i class="icon-7"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    @endforeach
                </div>
            </div>
        </section>

@endsection
