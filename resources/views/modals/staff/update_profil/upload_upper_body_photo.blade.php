<div id="upload_upper_body_photo" class="modal is_hidden is_visually_hidden">
  <!-- Modal content -->
  <div class="modal_content">
  	<div class="modal_head">
  		<span class="close_modal close">&times;</span>
  	</div>
    <div class="modal_body">
      <div class="image_file">
        <label for="upper_body_photo">
          <img id="upper_body_photo" src="{!! url('/img/input_icons/flech.svg') !!}">
        </label>
      </div>

      <span class="message">{!! trans('upload_staff.photo_beatfl') !!}</span>

      <button class="choose_file">{!! trans('upload_staff.Validate') !!}</button>
    </div>
    
  </div>
</div>