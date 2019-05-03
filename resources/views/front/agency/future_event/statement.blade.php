
<section class="statement_agency">
	<input type="hidden" class="boolean" value="0">
	{!! Form::open(array('url' => route('event_statement_register'),'files' => true,'class'=>'event_statement_registration','autocomplete'=>'off', 'id'=>'event_statement_registration')) !!}
	@if($event)
	<input type="hidden" class="id_event" name="id_event" value="{{$event->id}}">
	@if(count($event->EventAgencyStatements)>0)
	@foreach($event->EventAgencyStatements as $state)
	@foreach($state->staffs as $idx => $staff)
	<div class="content_statement" data-eventState-id="{{$state->id}}">
		<div class="content-all">
			<div class="content_pages_statement">
				<div class="header_statement">
					<div class="content_step_profil">
						<div class="bg_step_statement">
							<div class="step_modify_profil flex_step_statement">
			    				<div class="label_statement">
									<label class="modify">{!! trans('statement_future.Statement') !!} {{$idx+1}}</label>
			    				</div>
		    					<div class="label_wth_statement">
		    						<label for="country">{!! trans('statement_future.Assigned_to') !!}
                        			</label>
		    					</div>
	   							<div class="dropdown_statement">
	   								<div class="form_item dropdown_create_event">
                        				<div class="dropdown-menu_compte_rendu">
                        					<div class="dropdown_content">
		    									<span class="span_dropdown">
			                                		<input class="input_dropdown_create_event svg_dropdown_create_event input_wth_statement input_drop_user" type="text" data-idUser="" name="user_names[0]" placeholder="---- " autocomplete="off" readonly value="{{ $staff->user->first_name }} {{ $staff->user->last_name }}">
			                                		<input type="hidden" class="hidden_id_user" name="id_users[0]" value="{{$staff->user->id}}">

					                                <span class="icon_input_statement">
					                                    <svg fill="#707070" height="24" viewBox="0 0 24 24" width="18">
					                                        <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z"></path>
					                                        <path d="M0-.75h24v24H0z" fill="none"></path>
					                                    </svg>
					                                </span>
		                            			</span>
		                            			<ul class="dropdown_login dropdown_users dropdownScroll" id="dropdown_users_manage" style="display: none;">
		                            			@if($event)
		                            			@foreach($event->eventStaffs as $eventStaff)
						                        @foreach($eventStaff->eventStaffCandidateConfirmed as $eventCandidate)
						                            <li>
							                            <div class="icone_name_users">
							                                <div class="avatar">
							                                    <img src="{!! $eventCandidate->staff->getImagePortraitPath() !!}" alt="">
							                                </div>
							                                <label for="name" data-id="{{$eventCandidate->staff->user->id}}" class="name_users">{{ $eventCandidate->staff->user->first_name }} {{ $eventCandidate->staff->user->last_name }}</label>
							                            </div>
							                            <label class="checkbox_users"></label>
							                        </li>
						                        @endforeach
						                        @endforeach
						                        @endif
							                    </ul>
			            					</div>
            							</div>
            						</div>

	    						</div>
	    						<div class="plus_img moins_img addon_plus_moins">
		    						<img src="{!! url('img/input_icons/plus_color.svg') !!}" class="add_parent">
		    						<img src="{!! url('img/input_icons/moins.svg') !!}" class="delete_parent img_opac">
	   							</div>
			            	</div>
						</div>
      				</div>
				</div>
				@foreach($state->eventStatementQuestionAnswers as $index => $value)
				<div class="content_question">
					<div class="flex_statement_content_question">
						<div class="first_divider_content_question">
								<label>
									Question #{{$index+1}}
								</label>
			              	<textarea class="text_brief_new wth_description_statement_question"  placeholder="" name="questions[{{$idx}}][]">{{ $value->question }}</textarea>
			              	<input type="hidden" class="idQuestionToRemove" name="question_id[{{$idx}}][]" value="{{$value->id}}">
			          	</div>
					</div>
					<div class="second_divider_content_question">
						<label class="label_second_desription">{!! trans('statement_future.text_staff') !!}
						</label>
						<div class="separator">
							<div class="plus_img moins_img addon_plus_moins second_divider_content_question_img">
								<div class="wth_img_before">
									<img src="{!! url('img/input_icons/plus_color.svg') !!}" class="add_child">
								</div>
								<div class="wth_img_after">
									<img src="{!! url('img/input_icons/moins.svg') !!}" class="delete_child img_opac img_after">
								</div>
							</div>
						</div>

					</div>
				</div>
				@endforeach

				<div class="footer_content_question">
					<button type="submit" class="add">{!! trans('statement_future.btn_save') !!}</button>
				</div>

			</div>
		</div>

	</div>
	@endforeach
	@endforeach
	@else
	<div class="content_statement">
		<div class="content-all">
			<div class="content_pages_statement">
				<div class="header_statement">
					<div class="content_step_profil">
						<div class="bg_step_statement">
							<div class="step_modify_profil flex_step_statement">
			    				<div class="label_statement">
									<label class="modify">{!! trans('statement_future.Statement') !!} 1</label>
			    				</div>
		    					<div class="label_wth_statement">
		    						<label for="country">{!! trans('statement_future.Assigned_to') !!}
                        			</label>
		    					</div>
	   							<div class="dropdown_statement">
	   								<div class="form_item dropdown_create_event">
                        				<div class="dropdown-menu_compte_rendu">
                        					<div class="dropdown_content">
		    													<span class="span_dropdown">
			                                		<input class="input_dropdown_create_event svg_dropdown_create_event input_wth_statement input_drop_user" type="text" data-idUser="" name="user_names[0]" placeholder="---- " autocomplete="off" readonly value="">
			                                		<input type="hidden" class="hidden_id_user" name="id_users[0]" value="">

					                                <span class="icon_input_statement">
					                                    <svg fill="#707070" height="24" viewBox="0 0 24 24" width="18">
					                                        <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z"></path>
					                                        <path d="M0-.75h24v24H0z" fill="none"></path>
					                                    </svg>
					                                </span>
		                            			</span>
		                            			<ul class="dropdown_login dropdown_users dropdownScroll" id="dropdown_users_manage" style="display: none;">
		                            			@if($event)
		                            			@foreach($event->eventStaffs as $eventStaff)
						                        @foreach($eventStaff->eventStaffCandidateConfirmed as $eventCandidate)
						                            <li>
							                            <div class="icone_name_users">
							                                <div class="avatar">
							                                    <img src="{!! $eventCandidate->staff->getImagePortraitPath() !!}" alt="">
							                                </div>
							                                <label for="name" data-id="{{$eventCandidate->staff->user->id}}" class="name_users">{{ $eventCandidate->staff->user->first_name }} {{ $eventCandidate->staff->user->last_name }}</label>
							                            </div>
							                            <label class="checkbox_users"></label>
							                        </li>
						                        @endforeach
						                        @endforeach
						                        @endif
							                    </ul>
			            					</div>
            							</div>
            						</div>

	    						</div>
	    						<div class="plus_img moins_img addon_plus_moins">
		    						<img src="{!! url('img/input_icons/plus_color.svg') !!}" class="add_parent">
		    						<img src="{!! url('img/input_icons/moins.svg') !!}" class="delete_parent img_opac">
	   							</div>
			            	</div>
						</div>
      				</div>
				</div>
				<div class="content_question">
					<div class="flex_statement_content_question">
						<div class="first_divider_content_question">
								<label>
									Question #1
								</label>
			              	<textarea class="text_brief_new wth_description_statement_question"  placeholder="
			              	" name="questions[0][]"></textarea>
			          	</div>
					</div>
					<div class="second_divider_content_question">
						<label class="label_second_desription">{!! trans('statement_future.text_staff') !!}
						</label>
						<div class="separator">
							<div class="plus_img moins_img addon_plus_moins second_divider_content_question_img">
								<div class="wth_img_before">
									<img src="{!! url('img/input_icons/plus_color.svg') !!}" class="add_child">
								</div>
								<div class="wth_img_after">
									<img src="{!! url('img/input_icons/moins.svg') !!}" class="delete_child img_opac img_after">
								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="footer_content_question">
					<button type="submit" class="add">{!! trans('statement_future.btn_save') !!}</button>
				</div>

			</div>
		</div>

	</div>
	@endif
	@endif

	{!! Form::close() !!}
</section>
