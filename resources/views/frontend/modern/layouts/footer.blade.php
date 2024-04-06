

 @php
        $current_lang =  LaravelLocalization::getCurrentLocale();
    @endphp

     <!-- funfact-section -->
        <section class="funfact-section p_relative centred bg-color-2">
            <div class="auto-container">
                <div class="inner-container p_relative">
                    <div class="counter-block-one wow slideInUp animated" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <div class="inner-box">
                            <div class="icon-box p_relative d_block fs_60"><i class="icon-38"></i></div>
                            <div class="count-outer count-box">
                                <span class="count-text" data-speed="1500" data-stop="{{ setting('projects')}}">0</span>
                            </div>
                            <p> {{ $current_lang == 'ar' ? 'مشاريع' : ' Successful projects' }}</p>
                        </div>
                    </div>
                    <div class="counter-block-one wow slideInUp animated" data-wow-delay="100ms" data-wow-duration="1500ms">
                        <div class="inner-box">
                            <div class="icon-box p_relative d_block fs_60"><i class="icon-39"></i></div>
                            <div class="count-outer count-box">
                                <span class="count-text" data-speed="1500" data-stop="{{ setting('clients')}}">0</span>
                            </div>
                            <p> {{ $current_lang == 'ar' ? ' العملاء' : ' Satisfied Clients' }}</p>
                        </div>
                    </div>
                    <div class="counter-block-one wow slideInUp animated" data-wow-delay="200ms" data-wow-duration="1500ms">
                        <div class="inner-box">
                            <div class="icon-box p_relative d_block fs_60"><i class="icon-40"></i></div>
                            <div class="count-outer count-box">
                                <span class="count-text" data-speed="1500" data-stop="{{ setting('team_no')}}">0</span>
                            </div>
                            <p> {{ $current_lang == 'ar' ? 'فريق العمل' : ' Experienced Staff' }}</p>
                        </div>
                    </div>
                    <div class="counter-block-one wow slideInUp animated" data-wow-delay="300ms" data-wow-duration="1500ms">
                        <div class="inner-box">
                            <div class="icon-box p_relative d_block fs_60"><i class="icon-41"></i></div>
                            <div class="count-outer count-box">
                                <span class="count-text" data-speed="1500" data-stop="{{ setting('years_ex')}}">0</span>
                            </div>
                            <p> {{ $current_lang == 'ar' ? 'سنوات الخبرة' : 'Years Of Experience' }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- funfact-section -->


     <!-- clients-section -->
        <section class="clients-section p_relative">
            <div class="auto-container">
                 <h2 class="text-center mb-4"> {{ $current_lang == 'ar' ? ' العملاء' : ' Our Clients' }}</h2>
                <div class="five-item-carousel owl-carousel owl-theme owl-nav-none owl-dots-none">
                    @foreach ($clients as $partner )
                        <figure class="clients-logo p_relative d_block"><a href="#"><img src="{{ url('public/uploads/partners/photos/'.$partner->photo)  }}" alt=""></a></figure>
                    @endforeach
                </div>
            </div>
        </section>
        <!-- clients-section end -->
        {{-- <section class="subscribe-section p_relative">
            <div class="auto-container">
                <div class="inner-container">
                    <div class="row align-items-center clearfix">
                        <div class="col-lg-6 col-md-12 col-sm-12 text-column">
                            <div class="text p_relative d_block">
                                <h2>  {{ $current_lang == 'ar' ? 'اشترك في النشرة البريدية ' : 'Subscribe to Our Newsletter' }}</h2>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 form-column">
                            <div class="form-inner p_relative d_block">
                                <form method="post" action="{{ route('send.message') }}" >
									@csrf
									@method('post')
									<input type="hidden" name="type" value="3">
                                    <div class="form-group">
                                        <input type="email" name="email" placeholder="{{ $current_lang == 'ar' ? 'ادخل البريد الالكتروني ' : 'Enter Your Email' }}" required="">
                                        <button type="submit"> {{ $current_lang == 'ar' ? 'اشترك الان' : 'Subscribe Now' }}<i class="icon-7"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section> --}}
        <!-- subscribe-section end -->

    <footer class="main-footer p_relative bg-color-2">
        <div class="icon-layer"></div>
        <div class="footer-top p_relative d_block">
            <div class="auto-container">
                <div class="row clearfix">
                    <div class="col-md-6 col-sm-12 footer-column">
                        <div class="footer-widget logo-widget">
                            <figure class="footer-logo ">
                                <a href="{{ route('home') }}" >
                                    <img class="bg-logo" src="{{ url('public/uploads/settings/'. setting('logo') ) }}" alt="logo" title="logo">
                                </a>
                            </figure>
                            <div >
                                <p> {{  $current_lang == 'ar' ? setting('about-footer-ar')  :  setting('about-footer-en')}} </p>
                                <a href="{{ route('about') }}" class="btn btn-warning">@lang('site.read_more')</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 footer-column">
                        <div class="footer-widget links-widget ml_100">
                            <div class="widget-title">
                                <h3>@lang('site.links')</h3>
                            </div>
                            <div class="widget-content">
                                <ul class="links-list clearfix">
                                    <li><a href="{{ route('home') }}"> @lang('site.home')</a></li>
                                    <li><a href="{{ route('about') }}">  @lang('site.about') </a></li>
                                    <li><a href="{{ route('contact') }}">  @lang('site.contact')</a></li>
                                    <li><a href="{{ route('shop') }}"> @lang('site.products')</a></li>
                                    <li><a href="{{ route('posts') }}"> @lang('site.pages')</a></li>
                                    <li><a href="{{ route('contact') }}">  @lang('site.contact')</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-12 footer-column">
                        <div class="footer-widget contact-widget">
                            <div class="widget-title">
                                <h3> @lang('site.contact')</h3>
                            </div>
                            <div class="widget-content">
                                <ul class="info-list clearfix">
                                    <li>{{ setting('address') }}</li>
                                    <li><a href="tel:{{ setting('phone') }}">{{ setting('phone') }}</a></li>
                                    <li><a href="mailto:{{ setting('email') }}">{{ setting('email') }}</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom p_relative bg-color-footer">
            <div class="auto-container">
                <div class="bottom-inner p_relative">
                    <div class="copyright"><p><a href="{{ route('home') }}"> {{ setting('company_name') }} </a> &copy; 2023 جميع الحقوق محفوظة</p></div>
                    <ul class="footer-nav">
                        <li><a href="https://co-marketingagency.com/en" target="blank">   @lang('site.developed_by') co-marketingagency</a></li>

                    </ul>
                </div>
            </div>
        </div>
    </footer>
