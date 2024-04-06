  <!-- testimonial-section -->
        <section class="testimonial-section p_relative">
            <div class="bg-layer parallax-bg" data-parallax='{"y": 100}' style="background-image: url('{{ asset('public/frontend/modern/assets/images/customer.png') }}');"></div>
            <div class="bg-layer-2" style="background-image: url('{{ asset('public/frontend/modern/assets/images/customer.png') }}');"></div>
            <div class="auto-container">
                <div class="row align-items-center clearfix">
                    <div class="col-lg-6 col-md-12 col-sm-12 title-column">
                        <div class="sec-title light p_relative mb_50">
                            <h5 class="d_block fs_17 lh_25 fw_medium mb_9"> {{ $current_lang == 'ar' ? 'اراء العملاء' : 'Testimonials' }}</h5>
                    <h2 class="d_block fs_40 lh_50 fw_bold"> {{ $current_lang == 'ar' ? ' قالوا علينا' : 'What Our Client Say' }}</h2>

                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 testimonial-column">
                        <div class="testimonial-inner p_relative d_block ml_30">
                            <div class="single-item-carousel owl-carousel owl-dots-none nav-style-one">
                                @foreach ($partners as $testimonial)
                                @if ($testimonial->content_ar != null && $testimonial->content_en != null)
                                <div class="testimonial-block-one">
                                    <div class="inner-box p_relative d_block">
                                        <div class="light-icon"><img src="" alt=""></div>
                                        <div class="icon-box p_relative d_block fs_65"><i class="icon-31"></i></div>
                                        <p>{{ $current_lang == 'ar' ? $testimonial->content_ar : $testimonial->content_en  }}</p>
                                        <div class="author-box p_relative d_block">
                                            <figure class="author-thumb p_absolute l_0 t_0 w_70 h_70 b_radius_50"><img src="{{ url('public/uploads/partners/photos/'.$testimonial->photo)  }}" alt=""></figure>
                                            <h5> {{ $current_lang == 'ar' ? $testimonial->name_ar : $testimonial->name_en  }}</h5>

                                        </div>
                                    </div>
                                </div>
                                @endif
                                @endforeach

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- testimonial-section end -->
