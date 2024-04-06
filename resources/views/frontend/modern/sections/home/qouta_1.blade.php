 <!-- qouta -->
        <section class="search-field-two alternat-2 p_relative">
            <div class="pattern-layer" style="background-image: url('{{ asset('public/frontend/modern/assets/images/shape/shape-17.png') }}');"></div>
            <div class="auto-container">
                <div class="title-text centred p_relative d_block">
                    <h2>To Take Service Please Contact <br />with Our Expert</h2>
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
        </section>
        <!-- qouta end -->
