<div id="connection_home" class="modal is_hidden is_visually_hidden">
  <!-- Modal content -->
  <div class="modal_content">
  	<div class="modal_head">
      <div class="connection_home_modals">
        <div class="head_modals">
          <p class="modal_title">{!! trans('connection.Hello') !!}</p><p class="bold_title name_users">{{ fullName(Auth::user()->last_name, Auth::user()->first_name) }}</p>
          <!-- <span class=" close">&times;</span> -->
        </div>
        <div class="separed_modals_home"></div>
        <div class="text_connection_home">
          <p class="text_home">{!! trans('connection.text_welc') !!}</p>
          <p class="text_home">HelloStaff</p>
        </div>
        <button class="close_modal btn_connection_home">{!! trans('connection.Start') !!}</button>
      </div>
  	</div>
  </div>
</div>
