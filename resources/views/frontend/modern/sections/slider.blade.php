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


           <!-- search-field -->
        <section class="search-field">
            <div class="auto-container">
                <div class="outer-container">
                    <div class="title-text centred p_relative d_block">
                        <h6> {{ $current_lang == 'ar' ? ' طلب عرض سعر' : 'Request Service Today' }}</h6>
                    </div>
                    <div class="search-area">
                        <form  method="post" action="{{ route('send.message') }}" enctype="multipart/form-data">
                                @csrf
                                @method('post')
                                <input type="hidden" name="type" value="2">
                            <div class="row clearfix">
                                <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                    <input type="text" name="name" placeholder="@lang('site.name')" required>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                    <input type="email" name="email" placeholder="@lang('site.email')" required>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                    <input type="text" name="phone" placeholder="@lang('site.phone')" required>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-12 form-group">

                                     <input type="text" name="message" placeholder="@lang('site.message')" required>
                                </div>
                            </div>
                            <div class="btn-box">
                                <button type="submit" class="theme-btn btn-one">{{ $current_lang == 'ar' ? ' ارسال' : 'Send Now' }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- search-field end -->
