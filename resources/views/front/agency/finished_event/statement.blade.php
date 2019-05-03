@if($event)
@foreach($event->EventAgencyStatements as $state)
@foreach($state->staffs as $staff)
<div class="content_statement_finished_event">
	<div class="content_pages_statement_finished_event">
		<div class="statement_finished_event">
			<div class="content_step_profil">
				<div class="step_modify_profil">
	        		<label class="modify">{!! trans('statement.report_rendered') !!}</label>
	            </div>
	            <div class="form_item_create_event separator_form ">
	            	<label class="modify wth_statement_label"> {!! trans('statement.By') !!} </label>
                	<input class="input_create_event backgroung" type="text" value="{{ $staff->user->first_name }} {{ $staff->user->last_name }}" name="emplacement" id="emplacement" value="" placeholder="Alexia Gourd" readonly>
                	<ul class="dropdown_liste_jobs is_hidden">
				        <li class="box_shadow_filter">
				          <div class="content_liste_staff">
				              <div class="avatar_staff">
				                <div class="avatar">
				                  <img src="http://localhost/HelloStaffProject/HelloStaffProject/public/img/candidates/ThomasLussiez.jpg" alt="">
				                </div>
				              </div>
				              <div class="description_staff">
				                <label for="" class="name_staff">Rachel D.</label>
				              </div>
				          </div>
				          <div class="action_staff">
				            <div class="icones_loupe">
				              <img src="http://localhost/HelloStaffProject/HelloStaffProject/public/img/input_icons/plus_color.svg" alt="">
				            </div>
				          </div>
				        </li>
				    </ul>
                </div>
			</div>
		</div>
		@foreach($state->eventStatementQuestionAnswers as $answer)
		<div class="content_divider_finished_pages">
			<div class
			="first_divider_statement_content_finished_event">
				<div class="flex_statement_finished_event">
					<div class="question_statement_finished_event">
						<label>Question</label>
						<textarea readonly>{{ $answer->question }}</textarea>
					</div>
					<div class="response_statement_finished_event">
						<label>{!! trans('statement.answer') !!}</label>
						<textarea readonly>{{ isset($answer->answer)? $answer->answer : '' }}</textarea>
					</div>
				</div>
			</div>
			<div class="second_divider_statement_content_finished_event">
				<div class="flex_second_divider_finished_event">
					<label>{!! trans('statement.Attachments') !!}</label>
					<!-- fichier downlod repet -->
					@foreach($answer->eventStatementQuestionAnswerFile as $file)
					<div class="fihiers_downlod">
						<input type="" name="" class="input_statement_finished_event input_create_event nameFile" placeholder="{{ compressPlacehoder($file->name) }}" value="" readonly>
						<a href="{{url('/upload/staff/report/'.$file->name)}}" download><img class="downloadFile" src="{!! url('img/input_icons/flech.svg') !!}"></a>	
					</div>	
					@endforeach
					
				</div>
			</div>
		</div>	
		@endforeach	
	</div>
</div>
@endforeach
@endforeach
@endif
