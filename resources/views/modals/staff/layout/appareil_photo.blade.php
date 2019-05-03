<div id="appareil_photo" class="modal is_hidden is_visually_hidden">
  <!-- Modal content -->
  <div class="modal_content">
  	<div class="modal_head">
  		<p class="modal_title">{!! trans('staff_register.upload_photo') !!}</p>
  		<span class="close_modal close">&times;</span>
  	</div>
    
    
    <div class="modal_body">
                <div id="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div id="my_camera"></div>
                            <br/>
                            <input class="capture" type=button value= "{!! trans('staff_register.take_photo') !!}" onClick="take_snapshot()">
            
                            <input type="hidden" name="image" class="image-tag">
                        </div>
                        <div class="image_capture">
                            <div id="results">...</div>
                        </div>
                        <div class="col-md-12 text-center">
                            <br/>
                            <button class="register_webcam">{!! trans('staff_register.save_photo') !!}</button>
                        </div>
                  </div>
              </div>
      </div>
    </div>
</div>