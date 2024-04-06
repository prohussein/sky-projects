 <!-- testimonial-style-two -->
        <section class="testimonial-style-two p_relative mt-4">
            <div class="auto-container">
                <div class="sec-title p_relative mb_50 centred">
                    <h5 class="d_block fs_17 lh_25 fw_medium mb_9">{{ $current_lang == 'ar' ? 'اراء العملاء' : 'Testimonials' }}</h5>
                    <h2 class="d_block fs_40 lh_50 fw_bold">{{ $current_lang == 'ar' ? ' قالوا علينا' : 'What Our Client Say' }}</h2>
                </div>
                <div class="two-item-carousel owl-carousel owl-theme owl-nav-none">

                    @foreach ($partners as $testimonial)
                    @if ($testimonial->content_ar != null && $testimonial->content_en != null)
                        <div class="testimonial-block-one">
                            <div class="inner-box p_relative d_block">
                                <div class="light-icon"><img src="{{ asset('public/frontend/modern/assets/images/icons/icon-3.png') }}" alt=""></div>
                                <div class="icon-box p_relative d_block fs_65"><i class="icon-31"></i></div>
                                <p>{{ $current_lang == 'ar' ? $testimonial->content_ar : $testimonial->content_en  }}</p>
                                <div class="author-box p_relative d_block">
                                    <figure class="author-thumb p_absolute l_0 t_0 w_70 h_70 b_radius_50"><img src="{{ url('public/uploads/partners/photos/'.$testimonial->photo)  }}" alt=""></figure>
                                    <h5>{{ $current_lang == 'ar' ? $testimonial->name_ar : $testimonial->name_en  }}</h5>

                                </div>
                            </div>
                        </div>
                    @endif
                    @endforeach
                </div>
            </div>
        </section>
        <!-- testimonial-style-two end -->
