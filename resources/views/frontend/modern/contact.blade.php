@extends('frontend.modern.layouts.app')
@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('title')
@lang('site.contact')
@endsection

@section('content')


  <!-- Page Title -->
        <section class="page-title centred">
            <div class="bg-layer parallax-bg" data-parallax='{"y": 100}' style="background-image: url('{{ asset('public/frontend/modern/assets/images/contact.jpg') }}');"></div>
            <div class="auto-container">
                <div class="content-box">
                    <h2>@lang('site.contact')</h2>
                    <ul class="bread-crumb clearfix">
                        <li><a href="{{ route('home') }}">@lang('site.home')</a></li>
                        <li>@lang('site.contact')</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End Page Title -->

          <!-- contact-style-three -->
        <section class="contact-style-three">
            <div class="auto-container">
                <div class="row clearfix">
                    <div class="col-lg-4 col-md-12 col-sm-12 info-column">
                        <div class="contact-info mr_70">
                            <h3>@lang('site.Get In Touch')</h3>
                            {{-- <p>Give us a call or drop by anytime, we answer all enquiries within 24 hours.</p> --}}
                            <ul class="info-list clearfix">
                                <li>{{ setting('address') }}</li>
                                <li><a href="mailto:{{ setting('email') }}">{{ setting('email') }}</a></li>
                                <li><a href="tel:{{ setting('phone') }}">{{ setting('phone') }}</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-12 col-sm-12 form-column">
                        <div class="form-inner">
                            <form method="post" action="{{ route('send.message') }}" id="contact-form">
                                @csrf
                                @method('post')
                                <input type="hidden" name="type" value="1">

                                <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <input type="text" name="name" placeholder=" {{ $current_lang == 'ar' ? 'ادخل الاسم' : 'Your Name' }}" required="">
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <input type="email" name="email" placeholder=" {{ $current_lang == 'ar' ? 'ادخل الايميل' : 'Your Email' }}" required="">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                        <input type="text" name="phone" required="" placeholder=" {{ $current_lang == 'ar' ? 'ادخل التليفون' : 'Phone' }}">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                        <textarea name="message" placeholder=" {{ $current_lang == 'ar' ? ' اكتب رسالتك' : 'Enter Message' }}"></textarea>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                        <div class="check-box">
                                            <input class="check" type="checkbox" id="checkbox">
                                            <label for="checkbox"> {{ $current_lang == 'ar' ? 'موافق علي الشروط والاحكام ' : 'Accept Terms and Conditions ' }}. *</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 form-group message-btn mr-0">
                                        <button class="theme-btn btn-one" type="submit" name="submit-form"> {{ $current_lang == 'ar' ? 'ارسال ' : 'Send Message ' }} <i class="far fa-angle-right"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- contact-style-three end -->

@endsection
