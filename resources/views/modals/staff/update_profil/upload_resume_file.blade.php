<div id="upload_resume_file" class="modal is_hidden is_visually_hidden">
  <!-- Modal content -->
  <div class="modal_content">
    <div class="modal_head">
      <span class="close_modal close">&times;</span>
    </div>
    <div class="modal_body">
      <div class="image_file">
        <label for="resume">
          <img id="resume" src="{!! url('/img/input_icons/flech.svg') !!}">
        </label>
      </div>

      <span class="message">{!! trans('upload_staff.cv') !!}</span>

      <button class="choose_file">{!! trans('upload_staff.Validate') !!}</button>
    </div>
    
  </div>
</div>