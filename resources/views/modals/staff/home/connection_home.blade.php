<div id="connection_home" class="modal is_hidden is_visually_hidden">
  <!-- Modal content -->
  <div class="modal_content">
  	<div class="modal_head">
      <div class="connection_home_modals">
        <div class="head_modals">
          <p class="modal_title">Hello</p>&nbsp;&nbsp;<p class="bold_title name_users">{{ fullName(Auth::user()->first_name, Auth::user()->last_name) }}</p>
          <!-- <span class=" close">&times;</span> -->
        </div>
        <div class="separed_modals_home"></div>
        <div class="text_connection_home">
          <p class="text_home">{!! trans('connection_staff.text_welcome') !!}</p>
          <p class="text_home">{!! trans('connection_staff.text_two') !!}</p>
        </div>
        <button class="close_modal btn_connection_home">{!! trans('connection_staff.Start_now') !!}</button>
      </div>
  	</div>
  </div>
</div>
