    <div class="row">
      <div class="col-md-12">

        <div class="form-group">
           <label> @lang('site.products')  </label>
          <select name="product_id" class=" form-control select2 @error('product_id') is-invalid @enderror">

             <option value="" > @lang('site.select_product')</option>
          @foreach ($products as $product)
              <option value="{{ $product->id}}" {{ isset($row) && $row->product_id == $product->id ? 'selected' : '' }} >

                @if(LaravelLocalization::getCurrentLocale() == 'ar')
                  {{  $product->name_ar   }}
                @else  
                  {{  $product->name_en   }}
                @endif
                </option>
          @endforeach
          </select>
        </div>

         
       

        

      </div>
      <div class="offset-md-5 col-md-5">
        <br>
        <div class="form-group ">
          <div>
            <label class=""> @lang('site.upload') </label>
          </div>
        
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 150px; border: 1px solid #000"> 
                   @if(isset($row))
                  <img src="{{ url('public/uploads/products/photos/'.$row->photo)  }}"  width="100%" >
                  @endif
                </div>
                <div>
                    <span class="btn red btn-outline btn-file">
                        <span class="fileinput-new btn btn-primary"> @lang('site.select_photo')  </span>
                        <span class="fileinput-exists btn btn-info"> @lang('site.change') </span>
                        <input type="file" name="photo"> </span>
                    <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> @lang('site.remove') </a>
                </div>
            </div>
        </div>
      </div>
    </div>
    
            