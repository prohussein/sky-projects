 <!-- news-section -->
        <section class="news-section p_relative sec-pad">
            <div class="auto-container">
                <div class="sec-title p_relative mb_50 centred">


                    <h2 class="d_block fs_40 lh_50 fw_medium fw_bold">{{ $current_lang == 'ar' ? 'اخر الاخبار' : 'Latest News' }}</h2>
                </div>
                <div class="row clearfix">
                    @foreach ($posts as $post)


                    <div class="col-lg-4 col-md-6 col-sm-12 news-block">
                        <div class="news-block-one wow fadeInUp animated" data-wow-delay="00ms" data-wow-duration="1500ms">
                            <div class="inner-box p_relative d_block">
                                <figure class="image-box"><a href="{{ route( 'post.details', $post->id ) }}"><img src="{{ url('public/uploads/pages/'.$post->photo)  }}" alt=""></a></figure>
                                <div class="lower-content p_relative d_block">
                                    <h3><a href="{{ route( 'post.details', $post->id ) }}">{{ $current_lang == 'ar' ? $post->name_ar : $post->name_en }}</a></h3>
                                    <ul class="post-info clearfix">
                                        <li><i class="icon-42"></i>{{ $post->created_at }}</li>
                                    </ul>
                                    <p>{!! Str::limit($current_lang == 'ar' ? $post->content_ar : $post->content_en, 80, '...') !!}</p>
                                    <div class="link"><a href="{{ route( 'post.details', $post->id ) }}">@lang('site.read_more')<i class="icon-7"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>

                     @endforeach

                </div>
            </div>
        </section>
        <!-- news-section end -->
