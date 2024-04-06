   <!-- shop-page-section -->
        <section class="shop-page-section bg-color-4">
            <div class="auto-container">
                  <div class="sec-title p_relative mb_50">
                    <h2 class="text-center">{{ $current_lang == 'ar' ? 'المنتجات': 'Products' }}</h2>
                </div>
                <div class="row clearfix">

                    <div class="col-lg-12 col-md-12 cols-sm-12 content-side">
                        <div class="our-shop">
                            <div class="wrapper grid">
                                <div class="shop-grid-content">
                                    <div class="row clearfix">
                                        @foreach ($products as $product)


                                        <div class="col-lg-4 col-md-6 col-sm-12 shop-block">
                                            <div class="shop-block-one">
                                                <div class="inner-box">
                                                    <div class="image-box">

                                                        <figure class="image"><img src="{{ url('public/uploads/products/'.$product->photo)  }}" alt="" width="270px" height="250px"></figure>
                                                        {{-- <ul class="option-list clearfix">
                                                            <li><a href="shop.html"><i class="icon-57"></i></a></li>
                                                            <li><a href="index-5.html"><i class="icon-62"></i></a></li>
                                                            <li><a href="index-5.html"><i class="icon-61"></i></a></li>
                                                            <li><a href="{{ url('public/uploads/products/'.$product->photo)  }}" class="lightbox-image" data-fancybox="gallery"><i class="icon-63"></i></a></li>
                                                        </ul> --}}
                                                    </div>
                                                    <div class="lower-content">
                                                        <h6><a href="{{ route( 'product.details', $product->id ) }}">	{{ $current_lang == 'ar' ?   $product->name_ar   :   $product->name_en   }}</a></h6>
                                                        <ul class="rating clearfix">
                                                            <li><i class="icon-71"></i></li>
                                                            <li><i class="icon-71"></i></li>
                                                            <li><i class="icon-71"></i></li>
                                                            <li><i class="icon-71"></i></li>
                                                            <li><i class="icon-71"></i></li>
                                                        </ul>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                         @endforeach



                                    </div>
                                </div>

                            </div>
                            <div class="pagination-wrapper centred mt_30 centred">
                                <ul class="pagination clearfix">
                                    <li>{{ $products->appends(request()->query())->links() }}  </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- shop-page-section -->

