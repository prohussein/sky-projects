<!-- service-style-three -->
    <section class="service-style-three p_relative sec-pad bg-color-3 centred">
        <div class="pattern-layer" style="background-image: url('{{ asset('public/frontend/modern/assets/images/shape/shape-32.png') }}');"></div>
        <div class="auto-container">
            <div class="sec-title p_relative mb_50">
                <h2 >{{ $current_lang == 'ar' ? 'خدماتنا': 'Our Services ' }}</h2>
            </div>
            <div class="three-item-carousel owl-carousel owl-theme owl-nav-none">
                @foreach ($categories as $cat)


                <div class="service-block-two">
                    <div class="inner-box">
                        <figure class="image-box"><a href="{{ route('product.category' , $cat->id ) }}"><img src="{{ url('public/uploads/categories/photos/'. $cat->photo) }}" alt="" width="270px" height="250px"></a></figure>
                        <div class="lower-content mt-3">
                            
                            <h3><a href="{{ route('product.category' , $cat->id ) }}">{{ $current_lang == 'ar' ?  $cat->name_ar : $cat->name_en }}</a></h3>

                            <div class="link"><a href="{{ route('product.category' , $cat->id ) }}"><span> {{ $current_lang == 'ar' ?  'عرض المنتجات' : 'View Products' }}</span></a></div>
                        </div>
                    </div>
                </div>

                    @endforeach


            </div>
        </div>
    </section>
    <!-- service-style-three end -->
