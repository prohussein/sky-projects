<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-38EKSTLWEX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-38EKSTLWEX');
</script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<title> @yield('title') </title>
@php
	$current_lang =  LaravelLocalization::getCurrentLocale();
@endphp
<!-- Fav Icon -->
<link rel="icon" href="{{ url('public/uploads/settings/'. setting('logo') ) }}" type="image/x-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<!-- Stylesheets -->
<link href="{{ asset('public/frontend/modern/assets/css/font-awesome-all.css') }}" rel="stylesheet">
<link href="{{ asset('public/frontend/modern/assets/css/flaticon.css') }}" rel="stylesheet">
<link href="{{ asset('public/frontend/modern/assets/css/owl.css') }}" rel="stylesheet">
<link href="{{ asset('public/frontend/modern/assets/css/bootstrap.css') }}" rel="stylesheet">
<link href="{{ asset('public/frontend/modern/assets/css/jquery.fancybox.min.css') }}" rel="stylesheet">
<link href="{{ asset('public/frontend/modern/assets/css/animate.css') }}" rel="stylesheet">
<link href="{{ asset('public/frontend/modern/assets/css/color.css') }}" rel="stylesheet">
<link href="{{ asset('public/frontend/modern/assets/css/elpath.css') }}" rel="stylesheet">
<link href="{{ asset('public/frontend/modern/assets/css/jquery-ui.css') }}" rel="stylesheet">

@if ($current_lang == 'ar')
<link href="{{ asset('public/frontend/modern/assets/css/rtl.css') }}" rel="stylesheet">
@endif

<link href="{{ asset('public/frontend/modern/assets/css/style.css') }}" rel="stylesheet">
<link href="{{ asset('public/frontend/modern/assets/css/responsive.css') }}" rel="stylesheet">
<link href="{{ asset('public/frontend/modern/assets/css/custom.css') }}" rel="stylesheet">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" rel="stylesheet">

</head>

<!-- page wrapper -->
<body>

    <div class="boxed_wrapper rtl">


        <!-- preloader -->
        {{-- <div class="loader-wrap">
            <div class="preloader">
                <div class="preloader-close">x</div>
                <div id="handle-preloader" class="handle-preloader">
                    <div class="animation-preloader">
                        <div class="spinner"></div>
                        <div class="txt-loading">
                            <span data-text-preloader="e" class="letters-loading">
                                e
                            </span>
                            <span data-text-preloader="a" class="letters-loading">
                                a
                            </span>
                            <span data-text-preloader="s" class="letters-loading">
                                s
                            </span>
                            <span data-text-preloader="t" class="letters-loading">
                                t
                            </span>
                            <span data-text-preloader="o" class="letters-loading">
                                o
                            </span>
                            <span data-text-preloader="n" class="letters-loading">
                                n
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div> --}}
        <!-- preloader end -->


        <!--Search Popup-->



        <!-- main header -->
    @include('frontend.modern.layouts.header')
        <!-- main-header end -->


@yield('content')






        <!-- main-footer -->
        @include('frontend.modern.layouts.footer')
        <!-- main-footer end -->


       <a href="https://api.whatsapp.com/send?phone={{ setting('whatsapp') }}"  class="float-whatsapp" target="_blank">
            <i class="fab fa-whatsapp mt-3 fa-xl"></i>
        </a>

        <a href="tel:{{ setting('phone') }}"  class="float-phone" >
            <i class="fa fa-phone mt-3" ></i>
        </a>

        <div class="scroll-to-top">
            <div>
                <div class="scroll-top-inner">
                    <div class="scroll-bar">
                        <div class="bar-inner"></div>
                    </div>
                    <div class="scroll-bar-text">{{ $current_lang == 'ar' ? 'اعلي' : 'Top' }} </div>
                </div>
            </div>
        </div>


    </div>


  <!-- jequery plugins -->
    <script src="{{ asset('public/frontend/modern/assets/js/jquery.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/popper.min.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/plugins.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/owl.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/wow.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/validation.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/jquery.fancybox.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/appear.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/scrollbar.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/isotope.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/jquery.nice-select.min.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/jquery-ui.js') }}"></script>
    <script src="{{ asset('public/frontend/modern/assets/js/parallax-scroll.js') }}"></script>

    <!-- main-js -->
    <script src="{{ asset('public/frontend/modern/assets/js/script.js') }}"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script>
        @if (Session::has('message'))
            var type = "{{ Session::get('alert-type', 'info') }}"
            switch (type) {
                case 'info':

                    toastr.options.timeOut = 10000;
                    toastr.info("{{ Session::get('message') }}");
                    var audio = new Audio('audio.mp3');
                    audio.play();
                    break;
                case 'success':

                    toastr.options.timeOut = 10000;
                    toastr.success("{{ Session::get('message') }}");
                    var audio = new Audio('audio.mp3');
                    audio.play();

                    break;
                case 'warning':

                    toastr.options.timeOut = 10000;
                    toastr.warning("{{ Session::get('message') }}");
                    var audio = new Audio('audio.mp3');
                    audio.play();

                    break;
                case 'error':

                    toastr.options.timeOut = 10000;
                    toastr.error("{{ Session::get('message') }}");
                    var audio = new Audio('audio.mp3');
                    audio.play();

                    break;
            }
        @endif
    </script>
        {{-- @include('sweet::alert') --}}

        @stack('js')
</body><!-- End of .page_wrapper -->
</html>
