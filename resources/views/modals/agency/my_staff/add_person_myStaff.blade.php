<div id="add_person_myStaff" class="modal is_hidden is_visually_hidden">
 	
	 <div class="modal_content modal_myStaff">
	  	<div class="sodal_head">
			<span class="close_modal close">&times;</span>
		</div>
		<div class="modal_body">
				<label class="modify">
	    			<div class="avatar_myStaff_popup">
	    				<img class="img_Staff" src="../../img/img_slider/thumb01.jpg">
	    			</div>
	    		</label>
			<div class="label_update_modal">
				<label class="label_big" data-idStaff="">{!! trans('add_modal.text_add') !!}</label>
				<label class="label_big_bold myStaffName"></label>
			</div>
		</div>
		<div class="footer_update_modal footer_modal_finish">
		   <button class="close_modal button_choose button_add button_add_my_staff" data-addNewMyStaff="{{ route('addStaffToMyStaff') }}"> {!! trans('add_modal.btn_add') !!}
			</button>
	    </div>
	 </div>
	
</div>