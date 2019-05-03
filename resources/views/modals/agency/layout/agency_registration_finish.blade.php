<?php 
    if(Session::has('agencyData')) {
        $agency_data = Session::get('agencyData');
    }
  ?>
<div id="agency_registration_finish" class="modal is_hidden is_visually_hidden">
  <!-- Modal content -->
  <div class="modal_content finish_content">
      <div class="modal_body">
          <div class="check check_confirmation">
        	<img src="{!! url('img/input_icons/icon_top.svg') !!}"></img>
        </div>
        <input type="hidden" id="data_name_entreprise" name="" value="{{Session::has('agencyData') ? $agency_data['name_entreprise'] : ''}}"/>
       	<p class="post_confirmation">{!! trans('agency_register.success') !!}</p>
       	<p class="mediumparagraph text_confirmation">{!! trans('agency_register.felicitation') !!}</p>
       	<p class="medium_paragraph text_confirmation">'<span id="entreprise_name_modal"></span>' {!! trans('agency_register.textfelicitation') !!}</p>
      </div>
        
      <div class="footer footer_modal_finish">
    	   <a class="step_btn" id="confirm_agency" data-remove_session = "{{ route('remove_agency_in_session') }}">{!! trans('agency_register.confirm') !!}</a>
      </div>
  </div>
</div>