@extends('frontend.modern.layouts.app')
@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('title')
@lang('site.home')
@endsection

@section('content')


 @include('frontend.modern.sections.slider2')

    @include('frontend.modern.sections.home.about_1')

    @include('frontend.modern.sections.home.services_1')

    @include('frontend.modern.sections.home.products_2')

    @include('frontend.modern.sections.home.qouta_1')


    @include('frontend.modern.sections.home.testimonials_2')

    @include('frontend.modern.sections.home.news_1')

@endsection
