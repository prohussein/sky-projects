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
                                    <h3 class=""> @lang('site.about')</h3>
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
