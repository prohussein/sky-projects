        <section class="banner-section banner-style-one p_relative">
            <div class="shape">
                <div class="shape-1 p_absolute l_0 b_0 z_2"></div>
                <div class="shape-2 p_absolute l_0 t_0 z_2"></div>
                <div class="shape-3 p_absolute l_0 t_0 z_2"></div>
            </div>
            <div class="banner-carousel owl-theme owl-carousel owl-dots-none">
                @foreach ($sliders as $slider)

                <div class="slide-item p_relative pt_180">
                    <div class="image-layer p_absolute" style="background-image:  url('{{ asset('public/uploads/sliders/'.$slider->photo)}}');background-repeat: no-repeat;  background-size: cover;"></div>
                    <div class="auto-container">
                        <div class="content-box p_relative d_block z_5">
                             <h2 class="p_relative d_block fs_60 lh_70 fw_bold mb_18">{{ $current_lang == 'ar' ? $slider->title_ar : $slider->title_en}}</h2>
                            <p class="p_relative d_block fs_18">{{ $current_lang == 'ar' ? $slider->description_ar : $slider->description_en}}</p>
                        </div>
                    </div>
                </div>

                @endforeach

            </div>
        </section>




        <!-- search-field end -->
