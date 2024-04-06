 <!-- product-page-section -->
        <section class="project-page-two">
            <div class="auto-container">
                <div class="sortable-masonry">
                    <div class="upper-box centred mb_30">
                        <div class="sec-title p_relative mb_40">
                            <h5 class="d_block fs_17 lh_25 fw_medium mb_9">@lang('site.products')</h5>
                        </div>
                        <div class="filters">
                            <ul class="filter-tabs filter-btns clearfix">
                                <li class="active filter" data-role="button" data-filter=".all">{{ $current_lang == 'ar' ? 'الكل' : 'All' }}</li>
                                @foreach ($categories as $cat)
                                <li class="filter" data-role="button" data-filter=".{{ $cat->id }}">{{ $current_lang == 'ar' ? $cat->name_ar : $cat->name_en }}</li>
                                @endforeach

                            </ul>
                        </div>
                    </div>
                    <div class="items-container row clearfix">
                        @foreach ($products as $product)
                        <div class="col-lg-4 col-md-6 col-sm-12 masonry-item small-column all  {{ $product->cats->id }}">
                            <div class="project-block-three">
                                <div class="inner-box">
                                    <div class="image-box">
                                        <figure class="image"><img src="{{ url('public/uploads/products/'.$product->photo)  }}" alt="{{ $current_lang == 'ar' ?   $product->name_ar   :   $product->name_en   }}"></figure>
                                        <div class="view-btn"><a href="{{ url('public/uploads/products/'.$product->photo)  }}" class="lightbox-image" data-fancybox="gallery"><i class="icon-28"></i></a></div>
                                    </div>
                                    <div class="lower-content">
                                        <h4><a href="{{ route( 'product.details', $product->id ) }}">{{ $current_lang == 'ar' ?   $product->name_ar   :   $product->name_en   }}</a></h4>
                                        <span>{{ $current_lang == 'ar' ?   $product->cats->name_ar   :   $product->cats->name_en   }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach

                    </div>
                </div>
            </div>
        </section>
        <!-- product-page-section end -->
