
<header class="main-header">
    <!-- header-top -->
    <div class="header-top">
        <div class="top-inner">
            <div class="left-column">
                <ul class="info clearfix">
                    <li><i class="icon-4"></i>{{ setting('phone') }}</li>
                    <li><i class="icon-2"></i>{{ setting('address') }}</li>
                    <li><i class="icon-3"></i><a href="mailto:{{ setting('email') }}">{{ setting('email') }}</a></li>
                </ul>
            </div>
            <div class="right-column">
                <ul class="social-links clearfix">
                    @if (setting('facebook'))
                    <li><a href="{{ setting('facebook') }}" target="blank"><i class="fab fa-facebook-f"></i></a></li>
                    @endif
                    @if (setting('twitter'))
                    <li><a href="{{ setting('twitter') }}" target="blank"><i class="fab fa-twitter"></i></a></li>

                    @endif
                    @if (setting('linkedin'))
                    <li><a href="{{ setting('linkedin') }}" target="blank"><i class="fab fa-linkedin-in"></i></a></li>

                    @endif
                    @if (setting('instagram'))
                    <li><a href="{{ setting('instagram') }}" target="blank"><i class="fab fa-instagram"></i></a></li>
                    @endif
                    @if (setting('youtube'))
                    <li><a href="{{ setting('youtube') }}" target="blank"><i class="fab fa-youtube"></i></a></li>
                    @endif

                </ul>
            </div>
        </div>
    </div>
    <!-- header-lower -->
    <div class="header-lower">
        <div class="outer-box">
            <div class="menu-area clearfix">
                <div class="logo-box">
                    <figure class="logo"><a href="{{ route('home') }}"><img src="{{ url('public/uploads/settings/'. setting('logo') ) }}" alt="logo" title="logo"></a></figure>
                </div>
                <!--Mobile Navigation Toggler-->
                <div class="mobile-nav-toggler">
                    <i class="icon-bar"></i>
                    <i class="icon-bar"></i>
                    <i class="icon-bar"></i>
                </div>
                <nav class="main-menu navbar-expand-md navbar-light">
                    <div class="collapse navbar-collapse show clearfix" id="navbarSupportedContent">
                        <ul class="navigation clearfix">

                            <li><a href="{{ route('home') }}">@lang('site.home')</a></li>
                            <li><a href="{{ route('about') }}">@lang('site.about') </a></li>
                            <li><a href="{{ route('shop') }}">@lang('site.products')</a></li>
                            <li><a href="{{ route('testminals') }}"> {{ $current_lang == 'ar' ? 'اراء العملاء' : 'Testimonials' }}</a></li>
                            <li><a href="{{ route('posts') }}">@lang('site.pages') </a></li>
                            <li><a href="{{ route('contact') }}">@lang('site.contact') </a></li>

                            <li>
									@if($current_lang == 'ar')
									<a  title="English" style="margin: left" hreflang="en" href="{{ LaravelLocalization::getLocalizedURL('en', null, [], true) }}" class="active language-toggle" >
										<span>
											EN
										</span>
									</a>
									@else
									<a title="العربية" hreflang="ar" href="{{ LaravelLocalization::getLocalizedURL('ar', null, [], true) }}" class="active language-toggle" >
									<span>
										AR
									</span>
									</a>
									@endif
								</li>


                        </ul>
                    </div>
                </nav>
            </div>
            <div class="nav-right">
                {{-- <div class="support-box">
                    <h6> @lang('site.contact'): <a href="tel:{{ setting('phone') }}">{{ setting('phone') }}</a></h6>
                </div> --}}

                <div class="btn-box">
                    <a href="{{ route('contact') }}" class="theme-btn btn-one"> @lang('site.reserve') </a>
                </div>
            </div>
        </div>
    </div>

    <!--sticky Header-->
    <div class="sticky-header">
        <div class="outer-box">
            <div class="menu-area clearfix">
                <div class="logo-box">
                    <figure class="logo"><a href="{{ route('home') }}"><img src="{{ url('public/uploads/settings/'. setting('logo') ) }}" alt="logo" title="logo"></a></figure>
                </div>
                <nav class="main-menu clearfix">
                    <!--Keep This Empty / Menu will come through Javascript-->
                </nav>
            </div>
            <div class="nav-right">
                {{-- <div class="support-box">
                    <h6><i class="icon-4"></i>  @lang('site.contact'): <a href="tel:{{ setting('phone') }}">{{ setting('phone') }}</a></h6>
                </div> --}}

                <div class="btn-box">
                    <a href="{{ route('contact') }}" class="theme-btn btn-one"> @lang('site.reserve') </a>
                </div>
            </div>
        </div>
    </div>
</header>

 <!-- Mobile Menu  -->
        <div class="mobile-menu">
            <div class="menu-backdrop"></div>
            <div class="close-btn"><i class="fas fa-times"></i></div>

            <nav class="menu-box">
                <div class="nav-logo"><a href="{{ route('home') }}"><img src="{{ url('public/uploads/settings/'. setting('logo') ) }}" alt="logo" title="logo"></a></div>
                <div class="menu-outer"><!--Here Menu Will Come Automatically Via Javascript / Same Menu as in Header--></div>
                <div class="contact-info">
                    <h4>  @lang('site.contact')</h4>
                    <ul>
                        <li>{{ setting('address') }}</li>
                        <li><a href="tel:{{ setting('phone') }}">{{ setting('phone') }}</a></li>
                        <li><a href="mailto:{{ setting('email') }}">{{ setting('email') }}</a></li>
                    </ul>
                </div>
                <div class="social-links">
                    <ul class="clearfix">
                         @if (setting('facebook'))
                    <li><a href="{{ setting('facebook') }}" target="blank"><span class="fab fa-facebook-f"></span></a></li>
                    @endif
                    @if (setting('twitter'))
                    <li><a href="{{ setting('twitter') }}" target="blank"><span class="fab fa-twitter"></span></a></li>

                    @endif
                    @if (setting('linkedin'))
                    <li><a href="{{ setting('linkedin') }}" target="blank"><span class="fab fa-linkedin-in"></span></a></li>

                    @endif
                    @if (setting('instagram'))
                    <li><a href="{{ setting('instagram') }}" target="blank"><span class="fab fa-instagram"></span></a></li>
                    @endif
                    @if (setting('youtube'))
                    <li><a href="{{ setting('youtube') }}" target="blank"><span class="fab fa-youtube"></span></a></li>
                    @endif

                    </ul>
                </div>
            </nav>
        </div><!-- End Mobile Menu -->
