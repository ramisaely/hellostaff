@if($event)
<form id="regFormEveluation" method="post" enctype="multipart/form-data">
<input type="hidden" name="boolean" class="boolean">
<div class="evaluation_staff_content">
	<section class="step_evaluation_staff">
		<label class="title_step_evaluation_staff">{!! trans('evaluation_agency.Assessmenty_Recommendation') !!}</label>
		<div class="form_item_drop_right">
			<div class="form_item_drop_user">
	            <input class="input_create_event input_drop_user" id="gestionary_event" name="gestionary_event" value="" placeholder="  ---  " readonly="" autocomplete="off">
	            <ul class="dropdown_login dropdown_users dropdownScroll is_hidden">
                      @foreach($event->eventStaffs as $eventStaff)
                       @foreach($eventStaff->eventStaffCandidateConfirmed as $candidate)
                        <li>
                            <div class="icone_name_users">
                                <div class="avatar">
                                    <img src="{!! $candidate->staff->getImagePortraitPath() !!}" alt="">
                                </div>
                                <label for="name" data-id="{{$candidate->staff->id}} " class="name_users">{{$candidate->staff->user->first_name}} {{$candidate->staff->user->last_name}}</label>
                            </div>
                            <label class="checkbox_users"></label>
                            <input type="hidden" name="name" class="name user{{$candidate->staff->id}}">
                        </li>
                       @endforeach
                      @endforeach
	            </ul>
	        </div>
	    </div>
    </section>
@foreach($event->eventStaffs as $eventStaff)
  @foreach($eventStaff->eventStaffCandidateConfirmed as $candidate)
    <section class="evaluation_content">
    	<div class="view_evaluation" data-id_user="{{$candidate->staff->id}}">
            <input type="hidden" name="id_event[]" value="{{$eventStaff->eventAgency->id}}">
            <input type="hidden" name="id_agency[]" value="{{$candidate->agency_id}}">
            <input type="hidden" name="id_staff[]" value="{{$candidate->staff->id}}">
            <input type="hidden" name="id_eventStaff[]" value="{{$eventStaff->id}}">            
            <input type="hidden" class="id_assessment" name="id_assessment[]" value="{{ isset($candidate->staff->staffAssessment->first()->id) ? $candidate->staff->staffAssessment->first()->id : '' }}">

    		<div class="evaluation_note">
    			<div class="evaluation_avatar">
    				<div class="photo_candidates">
		              <img src="{!! $candidate->staff->getImagePortraitPath() !!}" alt="">
		            </div>
		            <div class="info_candidates">
		            	<span class="user_name">{{$candidate->staff->user->first_name}} {{$candidate->staff->user->last_name}}</span>
		            	<span class="user_post">{{ $eventStaff->post }}</span>
		            </div>
    			</div>
                <fieldset class="rating">
                    <input type="radio" id="star{{$candidate->staff->id}}16" name="rating{{$candidate->staff->id}}" value="5" /><label class = "full" for="star{{$candidate->staff->id}}16" data-value="5"></label>

                    <input type="radio" id="star{{$candidate->staff->id}}half16" name="rating{{$candidate->staff->id}}" value="4.5" /><label class="half" for="star{{$candidate->staff->id}}half16" data-value="4.5"></label>

                    <input type="radio" id="star{{$candidate->staff->id}}17" name="rating{{$candidate->staff->id}}" value="4" /><label class = "full" for="star{{$candidate->staff->id}}17" data-value="4"></label>

                    <input type="radio" id="star{{$candidate->staff->id}}half17" name="rating{{$candidate->staff->id}}" value="3.5" /><label class="half" for="star{{$candidate->staff->id}}half17" data-value="3.5"></label>

                    <input type="radio" id="star{{$candidate->staff->id}}18" name="rating{{$candidate->staff->id}}" value="3" /><label class = "full" for="star{{$candidate->staff->id}}18" data-value="3"></label>

                    <input type="radio" id="star{{$candidate->staff->id}}half18" name="rating{{$candidate->staff->id}}" value="2.5" /><label class="half" for="star{{$candidate->staff->id}}half18" data-value="2.5"></label>

                    <input type="radio" id="star{{$candidate->staff->id}}19" name="rating{{$candidate->staff->id}}" value="2" /><label class = "full" for="star{{$candidate->staff->id}}19" data-value="2"></label>

                    <input type="radio" id="star{{$candidate->staff->id}}half19" name="rating{{$candidate->staff->id}}" value="1.5" /><label class="half" for="star{{$candidate->staff->id}}half19" data-value="1.5"></label>

                    <input type="radio" id="star{{$candidate->staff->id}}20" name="rating{{$candidate->staff->id}}" value="1" /><label class = "full" for="star{{$candidate->staff->id}}20" data-value="1"></label>

                    <input type="radio" id="star{{$candidate->staff->id}}half20" name="rating{{$candidate->staff->id}}" value="half" /><label class="half" for="star{{$candidate->staff->id}}half20" data-value="0.5"></label>
                </fieldset>
                <input type="hidden" name="ratingResponse[]" class="ratingResponse" value="{{ isset($candidate->staff->staffAssessment->first()->rating) ? $candidate->staff->staffAssessment->first()->rating : '' }}">
    		</div>
            
    		<div class="evaluation_description evaluation_description_new" contenteditable="true">{{ isset($candidate->staff->staffAssessment->first()->description) ? $candidate->staff->staffAssessment->first()->description : '' }}</div>
            <input type="hidden" name="description[]" class="description" value="{{ isset($candidate->staff->staffAssessment->first()->description) ? $candidate->staff->staffAssessment->first()->description : '' }}">
    	</div>
    </section>
  @endforeach
@endforeach
    <section class="footer_evaluation">
    	<button data-register="{{ route('evaluation_register') }}" class="save_evaluation" type="button" name="button">{!! trans('evaluation_agency.btn_save') !!}</button>
        <small id="click_me" class="is_hidden">Click Me!</small>
    </section>
</div>
</form>
@endif
