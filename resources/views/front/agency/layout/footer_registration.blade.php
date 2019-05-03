<div class="footer" >
    <a class="step_btn step_prev_btn" id="prevBtn" onclick="prevPrev(-1)">{!! trans('agency_register.previous') !!}</a>
	<a class="step_btn step_next_btn" id="nextBtn" data-delete-session= "{{route('remove_agency_in_session')}}" onclick="nextPrev(1)">{!! trans('agency_register.next') !!}</a>
</div>
