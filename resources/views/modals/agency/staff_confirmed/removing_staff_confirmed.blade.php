<div id="removing_staff_confirmed" class="modal is_hidden is_visually_hidden">
 	
	 <div class="modal_content modal_myStaff">
	  	<div class="sodal_head">
			<span class="close_modal close">&times;</span>
		</div>
		<div class="modal_body">
				<label class="modify">
	    			<div class="avatar_myStaff_popup">
	    				<img class="img_Staff" src="">
	    			</div>
	    		</label>
			<div class="label_update_modal">
				<label class="label_big" >{!! trans('modals_my_staff.text_want') !!}</label>
				<label class="label_big_bold nameStaff" data-candidateId=""></label>
			</div>
		</div>
		<div class="footer_update_modal footer_modal_finish">
		   <button class="close_modal button_choose delete_staff" data-deletecandidate="{{ route('deleteCandidate') }}"> {!! trans('modals_my_staff.Delete') !!}
			</button>
	    </div>
	 </div>
	
</div>