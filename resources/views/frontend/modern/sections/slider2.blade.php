    <!-- banner-section -->
        <section class="banner-style-four p_relative centred">
            <div class="banner-carousel owl-theme owl-carousel owl-dots-none">
                @foreach ($sliders as $slider)
                <div class="slide-item p_relative">
                    <div class="image-layer p_absolute" style="background-image:url('{{ asset('public/uploads/sliders/'.$slider->photo)}}');"></div>
                    <div class="auto-container">
                        <div class="content-box p_relative d_block z_5">
                            <h2 class="p_relative d_block fs_60 lh_70 fw_bold mb_18">{{ $current_lang == 'ar' ? $slider->title_ar : $slider->title_en}}</h2>
                            <p class="p_relative d_block fs_18">{{ $current_lang == 'ar' ? $slider->description_ar : $slider->description_en}}</p>
                            <div class="btn-box">
                                <a href="{{ route('shop') }}" class="theme-btn btn-one">@lang('site.products')</a>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach

            </div>
        </section>
        <!-- banner-section end -->


        <!-- feature-style-four -->
        <section class="feature-style-four p_relative centred">
            <div class="auto-container">
                <div class="inner-container">
                    <div class="row clearfix">
                        @foreach ($categories->take(3) as $cat)
                        <div class="col-lg-4 col-md-6 col-sm-12 feature-block">
                            <div class="feature-block-four wow fadeInUp" data-wow-duration="1500ms">
                                <div class="inner-box">
                                    <div class="icon-box">
                                        <div class="icon-shape" style="background-image: url(assets/images/shape/shape-30.png);"></div>
                                        <div class="icon"><i class="icon-13"></i></div>
                                    </div>
                                    <h3><a href="{{ route('product.category' , $cat->id ) }}">{{ $current_lang == 'ar' ?  $cat->name_ar : $cat->name_en }}</a></h3>
                                    <div class="link"><a href="{{ route('product.category' , $cat->id ) }}"><span> {{ $current_lang == 'ar' ?  'عرض المنتجات' : 'View Products' }}</span></a></div>
                                </div>
                            </div>
                        </div>

                        @endforeach
                    </div>
                </div>
            </div>
        </section>
        <!-- feature-style-four end -->
