@extends('layouts.backend.app')

@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
@section('pageTitle')
ادارة المشروع
@endsection

@section('content')

@component('backend.partials._pagebar',
    [
        'title' => 'ادارة المشروع',
        'des' => '',
    ])
    <li class="breadcrumb-item"><a href="{{ route('dashboard.'. $routeName .'.index')}}">@lang('site.'. $routeName .'')</a></li>
    <li class="breadcrumb-item">ادارة المشروع</li>

@endcomponent

    <div class="tile mb-4">
        {{-- project statictes  --}}
        <div class="row">
            <div class="col-md-12 mb-3">
                <h2 class="text-center text-primary mb-3"> {{ $project->name . " ( " . number_format($projectProgress ,2) ." % )" }} </h4>
            </div>

            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>تكلفة المواد  </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($materials->sum('amount')) }}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>الاجور   </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($wages->sum('amount') )}}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4> مقاولين الباطن  </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($contactorsRevenus->sum('amount')) }}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>مصروفات اخري </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($expenses->sum('amount')) }}</p>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>تكلفة المشروع  </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($project->customer_cost) }}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>التكلفة التقديرية   </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($project->estimated_cost )}}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4>التكلفة الفعلية  </h4>
                        <p style="font-weight: bold; font-size: 20px">{{ number_format($contactorsRevenus->sum('amount') + $wages->sum('amount') + $materials->sum('amount') + $expenses->sum('amount') )}}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget-small primary" >
                    <div class="info text-center">
                        <h4> الربح الفعلي  </h4>
                        <p style="font-weight: bold; font-size: 20px">
                            {{ number_format($project->revenues->sum('net_amount')  - $project->expenses->sum('amount') ) }}
                            {{--number_format( $project->customer_cost - ($contactorsRevenus->sum('amount') + $wages->sum('amount') + $materials->sum('amount') + $expenses->sum('amount')) )--}}
                        </p>
                    </div>
                </div>
            </div>

        </div> {{-- end of row --}}
    </div>

    <div class="tile mb-4">
        {{-- project details  --}}
        <div class="row">
            <div class="col-md-12">
                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active btn" id="pills-items-tab" data-toggle="pill" data-target="#pills-items" type="button" role="tab" aria-controls="pills-items" aria-selected="true">بنود مقايسة المشروع </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link  btn" id="pills-home-tab" data-toggle="pill" data-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">ادارة المواد</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link btn" id="pills-profile-tab" data-toggle="pill" data-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">مقاولين الباطن</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link btn" id="pills-contact-tab" data-toggle="pill" data-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">الاجور</button>

                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link btn" id="pills-expenses-tab" data-toggle="pill" data-target="#pills-expenses" type="button" role="tab" aria-controls="pills-expenses" aria-selected="false">مصروفات اخري </button>

                    </li>
                     <li class="nav-item" role="presentation">
                        <button class="nav-link btn" id="pills-files-tab" data-toggle="pill" data-target="#pills-files" type="button" role="tab" aria-controls="pills-files" aria-selected="false">ملفات المشروع  </button>

                    </li>
                </ul>
            </div>
            <div class="col-md-12">
                @include('backend.partials._errors')

                <div class="tab-content" id="pills-tabContent">

                    @include('backend.projects.parts.items')

                    @include('backend.projects.parts.materials')

                    @include('backend.projects.parts.subcontractors')

                    @include('backend.projects.parts.wages')

                    @include('backend.projects.parts.expenses')

                    @include('backend.projects.parts.files')





                </div>
            </div>

        </div>{{-- end of row --}}


    </div>{{-- end of tile  --}}
@endsection
