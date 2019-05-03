<div id="upload_head_shot_photo" class="modal is_hidden is_visually_hidden">
  <!-- Modal content -->
  <div class="modal_content">
  	<div class="modal_head">
  		<span class="close_modal close">&times;</span>
  	</div>
    <div class="modal_body">
      <div class="image_file">
        <label for="head_shot_photo">
          <img id="head_shot_photo" src="{!! url('/img/input_icons/flech.svg') !!}">
        </label>
      </div>

      <span class="message">{!! trans('upload_staff.photo_beatfl') !!}</span>

      <button for="head_shot_photo" class="choose_file">{!! trans('upload_staff.Validate') !!}</button>
    </div>
    
  </div>
</div>