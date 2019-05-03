<form id="regFormEstimated" method="post">
	<div class="content_future_budget">
		<div class="content_facture_budget">
		<label class="label_facturec_content">{!! trans('hb_estimated_future.Estimated_budget') !!}</label>
		@if($event)
          @foreach($event->eventStaffs as $index=>$eventStaff)

			<div class="content_facture" data-index="{{$index}}">
			  <input type="hidden" name="idEventStaff[{{ $index }}]" value="{{ $eventStaff->id }}">
				<div class="table_facture">
					<div class="table_col_one">
						<div class="th_distribution">
							<label class="label_facture">{{ $eventStaff->post }}</label>
							<input type="hidden" name="idFacture[]" value="@foreach($eventStaff->eventFactures as $facture){{($facture)? $facture->id.',':''}}@endforeach" class="idFacture">
						</div>
						<?php $reste = $eventStaff->necessary_staff - count($eventStaff->eventStaffCandidateConfirmed)?>
					@foreach($eventStaff->eventStaffCandidateConfirmed as $cle=>$candidat)
						<div class="label_date_three label_simple">
							<div class="flex">
						 		<div class="facture_new">
							 		<div class="avatar_facture">
							 			<img src="{!! $candidat->staff->getImagePortraitPath() !!}">
							 		</div>
							 			<div class="litle_bouton"></div>
							 	</div>
							 	<input type="hidden" name="idStaff[{{ $index }}][]" value="{{ $candidat->staff->id}}">
					 			<label class="label_td">{{ $candidat->staff->user->first_name }} {{ $candidat->staff->user->last_name }}</label>
					 		</div>
						</div>
					@endforeach
					<?php for ($i=0; $i < $reste; $i++) { ?>
						<div class="label_date_three label_simple">
							<div class="flex">
						 		<div class="facture_new">
							 		<div class="avatar_facture">
							 			<img src="">
							 		</div>
							 			<!-- <div class="litle_bouton"></div> -->
							 	</div>
					 			<label class="label_td"></label>
					 		</div>
						</div>
					<?php } ?>

					</div>
					<div class="table_col_two ">
						<div class="thead_two colonne2">
							<div class="label_date" data-head="{{ $eventStaff->post }}">
							 	<div class="flex_one"><a class="prev_facture previous"><</a>
							 	 <label class="label_facture_one startView">{{getDateString(startViewFuture($eventStaff))}}</label>
							 @foreach($eventStaff->eventStaffDates as $j=>$eventStaffDate)
						   	 	 <label class="startDateHb" data-point="{{$j}}">{{ getDateString($eventStaffDate->date_start) }}</label>
						   	 @endforeach
						   	 @foreach($eventStaff->eventStaffDates as $j=>$eventStaffDate)
						   	 	 <input type="hidden" name="date_start[{{ $index }}][]" value="{{ $eventStaffDate->date_start }}">
						   	 	 <input type="hidden" name="idEventStaffDate[{{ $index }}][]" value="{{ $eventStaffDate->id }}">
						   	 @endforeach
						   		</div>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)

							<div class="label_date_three label_clic nextPrevOne" id="table_id">
								<div class="display_facture">
								 	<div class="litle_bouton"></div>
								 	<label class="label_td">{{ $candidat->staff->user->first_name }} {{ $candidat->staff->user->last_name }}</label>
								</div>
								<div class="flex_two">
									<div class="date_flex">
									  <label class="label_three startHourView1 hours_editable" contenteditable="true">{{startHourFuture1($eventStaff)}}</label>&nbsp;h
									  <?php $countStart = 0?>

									@foreach($eventStaff->eventStaffDates as $s=>$eventStaffdate)

									<?php $countStart += 1?>
									  <label class="label_three is_hidden startHour" data-datestart="{{$countStart}}">{{getHourEvent($eventStaffdate->start_hour_event_staff_date)}}</label>

									@endforeach
									@foreach($eventStaff->eventStaffDates as $s=>$eventStaffdate)

									  <input type="hidden" name="hourStart[{{$index}}][]" value="{{getHourEvent($eventStaffdate->start_hour_event_staff_date)}}">

									@endforeach
								   	  <a class="prev_facture">></a>
								   	  <label class="label_three endHourView1 hours_editable" contenteditable="true">{{endHourFuture1($eventStaff)}}</label>&nbsp;h
								   	  <?php $countEnd = 0?>
								   	@foreach($eventStaff->eventStaffDates as $e=>$eventStaffdate)

								   	<?php $countEnd += 1?>
								   	  <label class="label_three is_hidden endHour" data-dateend="{{$countEnd}}">{{getHourEvent($eventStaffdate->end_hour_event_staff_date)}}</label>

								   	@endforeach
								   	@foreach($eventStaff->eventStaffDates as $e=>$eventStaffdate)

								   	  <input type="hidden" name="hourEnd[{{$index}}][]" value="{{getHourEvent($eventStaffdate->end_hour_event_staff_date)}}">

								   	@endforeach
									</div>
							   	<div class="slide_facrure">
							   	  	 <div class="border_facture"></div>
							   	  	  <a class="icone_play prev_facture">></a>
							   	</div>
								</div>
							</div>

							<table class="litle_table is_hidden" id="litle_table_id">
									<thead class="litle_head">
										<tr class="litle_tr">
											<th class="litle_th_one">{!! trans('hb_estimated_future.hourly_rates') !!}</th>
											<th class="litle_th_three">{!! trans('hb_estimated_future.outlay') !!}</th>
											<th class="litle_th_two">{!! trans('hb_estimated_future.Per_Diem') !!}</th>
											<th class="litle_th_two">{!! trans('hb_estimated_future.Fee') !!} Km</th>
											<th class="litle_th_two">{!! trans('hb_estimated_future.hours') !!}</th>
											<th class="litle_th_four">{!! trans('hb_estimated_future.Remuneration') !!}</th>
										</tr>
									</thead>
									<tbody class="litle_body">
										<td class="litle_td_one">{{ $eventStaff->hour_rate }} $/Hr</td>
										<td class="litle_td_three">{{ sumExpense($eventStaff, $candidat->staff_id) }} $</td>
										<td class="litle_td_two">{{$eventStaff->per_diem}} $<</td>
										<td class="litle_td_two">{{sumRange($eventStaff, $candidat->staff_id)}} $</td>
										<td class="litle_td_two">{{sumHoursFuture($eventStaff)}} h</td>
										<td class="litle_td_four">{{sumRemuneration($eventStaff, $candidat->staff_id)}} $</td>
									</tbody>
							</table>
							@endforeach
							<?php for ($i=0; $i < $reste; $i++) { ?>
								<div class="label_date_three label_clic nextPrevOne" id="table_id">
									<div class="display_facture">
									 	<div class="litle_bouton"></div>
									 	<label class="label_td"></label>
									</div>
									<div class="flex_two">
										<div class="date_flex">
										  <label class="label_three startHourView1 hours_editable" contenteditable="true">{{startHourFuture1($eventStaff)}}</label>&nbsp;h
										  <?php $countStart = 0?>

										@foreach($eventStaff->eventStaffDates as $s=>$eventStaffdate)

										<?php $countStart += 1?>
										  <label class="label_three is_hidden startHour" data-datestart="{{$countStart}}">{{getHourEvent($eventStaffdate->start_hour_event_staff_date)}}</label>

										@endforeach
										@foreach($eventStaff->eventStaffDates as $s=>$eventStaffdate)

										  <input type="hidden" name="hourStart[{{$index}}][]" value="{{getHourEvent($eventStaffdate->start_hour_event_staff_date)}}">

										@endforeach
									   	  <a class="prev_facture">></a>
									   	  <label class="label_three endHourView1 hours_editable" contenteditable="true">{{endHourFuture1($eventStaff)}}</label>&nbsp;h
									   	  <?php $countEnd = 0?>
									   	@foreach($eventStaff->eventStaffDates as $e=>$eventStaffdate)

									   	<?php $countEnd += 1?>
									   	  <label class="label_three is_hidden endHour" data-dateend="{{$countEnd}}">{{getHourEvent($eventStaffdate->end_hour_event_staff_date)}}</label>

									   	@endforeach
									   	@foreach($eventStaff->eventStaffDates as $e=>$eventStaffdate)

									   	  <input type="hidden" name="hourEnd[{{$index}}][]" value="{{getHourEvent($eventStaffdate->end_hour_event_staff_date)}}">

									   	@endforeach
										</div>
								   	<div class="slide_facrure">
								   	  	 <div class="border_facture"></div>
								   	  	  <a class="icone_play prev_facture">></a>
								   	</div>
									</div>
								</div>

								<table class="litle_table is_hidden" id="litle_table_id">
										<thead class="litle_head">
											<tr class="litle_tr">
												<th class="litle_th_one">T.H</th>
												<th class="litle_th_three">{!! trans('hb_estimated_future.outlay') !!}</th>
												<th class="litle_th_two">Per Diem</th>
												<th class="litle_th_two">{!! trans('hb_estimated_future.Fee') !!} Km</th>
												<th class="litle_th_two">{!! trans('hb_estimated_future.hours') !!}</th>
												<th class="litle_th_four">{!! trans('hb_estimated_future.Remuneration') !!}</th>
											</tr>
										</thead>
										<tbody class="litle_body">
											<td class="litle_td_one">{{ $eventStaff->hour_rate }} $/Hr</td>
											<td class="litle_td_three">$</td>
											<td class="litle_td_two">{{$eventStaff->per_diem}} $<</td>
											<td class="litle_td_two"> $</td>
											<td class="litle_td_two">{{sumHoursFuture($eventStaff)}} h</td>
											<td class="litle_td_four"> $</td>
										</tbody>
								</table>
							<?php } ?>

						</div>
						<div class="thead_two colonne3">
							<div class="label_date" data-head="{{ $eventStaff->post }}">
							 	<div class="flex_one">
							 	 <label class="label_facture_one endView">{{getDateString(endViewFuture($eventStaff))}}</label>
							 @foreach($eventStaff->eventStaffDates as $key=>$eventStaffDate)
						   	 	 <label class="endDateHb" data-key="{{$key}}">{{ getDateString($eventStaffDate->date_start) }}</label>
						   	 @endforeach
						   	 	 <a class="prev_facture next">></a>
						   		</div>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)
							<div class="label_date_three nextPrevTwo">
								<div class="display_facture">
								 	<div class="litle_bouton"></div>
								 	<label class="label_td">{{ $candidat->staff->user->first_name }} {{ $candidat->staff->user->last_name }}</label>
								</div>
								<div class="flex_two">
									<div class="date_flex">
									<label class="label_three startHourView2 hours_editable" contenteditable="true">{{startHourFuture2($eventStaff)}}</label>&nbsp;h
									<?php $countStart = 0?>
									@foreach($eventStaff->eventStaffDates as $s1=>$eventStaffDate)
									<?php $countStart += 1 ?>
									  <label class="label_three is_hidden startHour2" data-datestart1="{{$countStart}}">{{getHourEvent($eventStaffDate->start_hour_event_staff_date)}}</label>
									@endforeach
								   	  <a class="prev_facture">></a>
								   	  <label class="label_three endHourView2 hours_editable" contenteditable="true">{{endHourFuture2($eventStaff)}}</label>&nbsp;h
								   	 <?php $countEnd = 0?>
								   	@foreach($eventStaff->eventStaffDates as $e1=>$eventStaffDate)
								   	<?php $countEnd += 1?>
								   	  <label class="label_three is_hidden endHour2" data-dateend1="{{$countEnd}}">{{getHourEvent($eventStaffDate->end_hour_event_staff_date)}}</label>
								   	@endforeach
									</div>
							   	<div class="slide_facrure">
							   	  	 <div class="border_facture"></div>
							   	  	  <a class="icone_play prev_facture">></a>
							   	</div>
								</div>
							</div>
							<table class="litle_table is_hidden">
									<thead class="litle_head">
										<tr class="litle_tr">
											<th class="litle_th_one">T.H</th>
											<th class="litle_th_three">{!! trans('hb_estimated_future.outlay') !!}</th>
											<th class="litle_th_two">Per Diem</th>
											<th class="litle_th_two">{!! trans('hb_estimated_future.Fee') !!} Km</th>
											<th class="litle_th_two">{!! trans('hb_estimated_future.hours') !!}</th>
											<th class="litle_th_four">{!! trans('hb_estimated_future.Remuneration') !!}</th>
										</tr>
									</thead>
									<tbody class="litle_body">
										<td class="litle_td_one">{{ $eventStaff->hour_rate }} $/Hr</td>
										<td class="litle_td_three">{{ sumExpense($eventStaff, $candidat->staff_id) }} $</td>
										<td class="litle_td_two">{{$eventStaff->per_diem}} $<</td>
										<td class="litle_td_two">{{sumRange($eventStaff, $candidat->staff_id)}} $</td>
										<td class="litle_td_two">{{sumHoursFuture($eventStaff)}} h</td>
										<td class="litle_td_four">{{sumRemuneration($eventStaff, $candidat->staff_id)}} $</td>
									</tbody>
							</table>
							@endforeach
							<?php for ($i=0; $i < $reste; $i++) { ?>
								<div class="label_date_three nextPrevTwo">
									<div class="display_facture">
									 	<div class="litle_bouton"></div>
									 	<label class="label_td"></label>
									</div>
									<div class="flex_two">
										<div class="date_flex">
										<label class="label_three startHourView2 hours_editable" contenteditable="true">{{startHourFuture2($eventStaff)}}</label>&nbsp;h
										<?php $countStart = 0?>
										@foreach($eventStaff->eventStaffDates as $s1=>$eventStaffDate)
										<?php $countStart += 1 ?>
										  <label class="label_three is_hidden startHour2" data-datestart1="{{$countStart}}">{{getHourEvent($eventStaffDate->start_hour_event_staff_date)}}</label>
										@endforeach
									   	  <a class="prev_facture">></a>
									   	  <label class="label_three endHourView2 hours_editable" contenteditable="true">{{endHourFuture2($eventStaff)}}</label>&nbsp;h
									   	 <?php $countEnd = 0?>
									   	@foreach($eventStaff->eventStaffDates as $e1=>$eventStaffDate)
									   	<?php $countEnd += 1?>
									   	  <label class="label_three is_hidden endHour2" data-dateend1="{{$countEnd}}">{{getHourEvent($eventStaffDate->end_hour_event_staff_date)}}</label>
									   	@endforeach
										</div>
								   	<div class="slide_facrure">
								   	  	 <div class="border_facture"></div>
								   	  	  <a class="icone_play prev_facture">></a>
								   	</div>
									</div>
								</div>
								<table class="litle_table is_hidden">
										<thead class="litle_head">
											<tr class="litle_tr">
												<th class="litle_th_one">T.H</th>
												<th class="litle_th_three">{!! trans('hb_estimated_future.outlay') !!}</th>
												<th class="litle_th_two">Per Diem</th>
												<th class="litle_th_two">{!! trans('hb_estimated_future.Fee') !!} Km</th>
												<th class="litle_th_two">{!! trans('hb_estimated_future.hours') !!}</th>
												<th class="litle_th_four">{!! trans('hb_estimated_future.Remuneration') !!}</th>
											</tr>
										</thead>
										<tbody class="litle_body">
											<td class="litle_td_one">{{ $eventStaff->hour_rate }} $/Hr</td>
											<td class="litle_td_three"> $</td>
											<td class="litle_td_two">{{$eventStaff->per_diem}} $<</td>
											<td class="litle_td_two"> $</td>
											<td class="litle_td_two">{{sumHoursFuture($eventStaff)}} h</td>
											<td class="litle_td_four"> $</td>
										</tbody>
								</table>
							<?php } ?>

						</div>
					</div>
					<div class="table_col_three">

						<div class="th">
							<div class="head_one">
								<label class="label_facture">{!! trans('hb_estimated_future.hourly_rates') !!}</label>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)
							<div class="label_date_three th_hourly_rate">
								<label class="label_three hourly_rate">{{ $eventStaff->hour_rate }} $/Hr</label>
							</div>
							@endforeach
							<?php for ($i=0; $i < $reste; $i++) { ?>
								<div class="label_date_three th_hourly_rate">
									<label class="label_three hourly_rate">{{ $eventStaff->hour_rate }} $/Hr</label>
								</div>
							<?php } ?>
						</div>
						<div class="th">
							<div class="head_one">
								<label class="label_facture">{!! trans('hb_estimated_future.outlay') !!} </label>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $cle=>$candidat)
							<div class="label_date_three th_expense">
								<label class="label_three label_editable expense" contenteditable="true">{{ sumExpenseFuture($eventStaff, $candidat->staff_id) }}</label>&nbsp;$
								<input type="hidden" name="expense[{{ $index }}][]" class="expenseVal" value="{{ sumExpenseFuture($eventStaff, $candidat->staff_id) }}">
						    </div>
						    @endforeach
						    <?php for ($i=0; $i < $reste; $i++) { ?>
								<div class="label_date_three th_expense">
									<label class="label_three label_editable expense" contenteditable="true"></label>&nbsp;$
									<input type="hidden" name="expense[{{ $index }}][]" class="expenseVal" value="">
							    </div>
							<?php } ?>
						</div>
						<div class="th">
							<div class="head_one">
								<label class="label_facture">Per Diem Total</label>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)
							<div class="label_date_three th_per_diem">
								<label class="label_three per_diem">{{$eventStaff->per_diem}} $</label>
							</div>
							@endforeach
							<?php for ($i=0; $i < $reste; $i++) { ?>
								<div class="label_date_three th_per_diem">
									<label class="label_three per_diem">{{$eventStaff->per_diem}} $</label>
								</div>
							<?php } ?>
						</div>
						<div class="th">
							<div class="head_one">
								<!-- /**{!! trans('hb_estimated_future.Kilometric_Fee') !!}*/ -->
								<label class="label_facture rangeInitial">{{ $eventStaff->distance }}</label><div class="label_facture">&nbsp;$/Km</div>

							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $cle => $candidat)
							<div class="label_date_three label_special_km th_range">
								<!-- /*interieur label: {{sumRangeFuture($eventStaff, $candidat->staff_id)}}*/ -->
								<input type="hidden" class="distanceStaff" value="{{ $eventStaff->distance }}">
								<label class="label_three label_editable distance" contenteditable="true">00</label>km
								<label class="distMoney distmoney_label_editable_distance">00 $</label>
								<input type="hidden" name="range[{{ $index }}][]" class="distVal">
							</div>
							@endforeach
							<?php for ($i=0; $i < $reste; $i++) { ?>
								<div class="label_date_three label_special_km th_range">
									<input type="hidden" class="distanceStaff" value="{{ $eventStaff->distance }}">
									<label class="label_three label_editable distance" contenteditable="true">00</label>km
									<label class="distMoney distmoney_label_editable_distance">00 $</label>
									<input type="hidden" name="range[{{ $index }}][]" class="distVal">
								</div>
							<?php } ?>
						</div>
						<div class="th">
							<div class="head_one">
								<label class="label_facture">{!! trans('hb_estimated_future.Total_hours') !!}</label>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)
							<div class="label_date_three th_total_hours">
								<label class="label_three sumHours">{{sumHoursFuture($eventStaff)}} h</label>
							</div>
							@endforeach
							<?php for ($i=0; $i < $reste; $i++) { ?>
								<div class="label_date_three th_total_hours">
									<label class="label_three sumHours">{{sumHoursFuture($eventStaff)}} h</label>
								</div>
							<?php } ?>
						</div>
						<div class="th">
							<div class="head_one">
								<label class="label_facture">{!! trans('hb_estimated_future.Remuneration') !!}</label>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $cle => $candidat)
							<div class="label_date_three th_remuneration">
								<label class="label_three remuneration"></label>
								<input type="hidden" name="remuneration[{{ $index }}][]" class="remVal">
							</div>
							@endforeach
							<?php for ($i=0; $i < $reste; $i++) { ?>
								<div class="label_date_three th_remuneration">
									<label class="label_three remuneration"></label>
									<input type="hidden" name="remuneration[{{ $index }}][]" class="remVal">
								</div>
							<?php } ?>
						</div>
					</div>
				</div>
				<div class="foot_table">
					<div class="border_foot_one">
							   	 <label class="label_distribution_two">TOTAL</label>
					</div>
					<div class="border_foot_two">

					</div>
					<div class="border_foot_two">

					</div>
					<div class="border_foot_three">

					</div>
					<div class="border_foot_three">
							   	 <label class="label_distribution_two totalExpense">{{sumExpenseTotal($eventStaff)}} $</label>
					</div>
					<div class="border_foot_three">
							   	 <label class="label_distribution_two totalPer_diem">{{sumPerdiemTotal($eventStaff)}} $</label>
					</div>
					<div class="border_foot_three">
							   	 <label class="label_distribution_two totalRange">{{sumRangeTotal($eventStaff)}} $</label>
					</div>
					<div class="border_foot_three">
							   	 <label class="label_distribution_two hourTotal">0 h</label>
					</div>
					<div class="border_foot_three border_foot_four">
							   	 <label class="label_distribution_two remTotal">{{sumRemunerationTotal($eventStaff)}} $</label>
					</div>
				</div>
	        </div>

	        <label class="label_facturec_content_one">{{$eventStaff->distance}}{!! trans('hb_estimated_future.text_label') !!} </label>

	      @endforeach
	    @endif
		</div>
	</div>
	<div class="foot_table_total">
		<div class="border_foot_one border_foot_five">
				   	 <label class="label_distribution_two">TOTAL</label>
		</div>
		<div class="border_foot_two">

		</div>
		<div class="border_foot_two">

		</div>
		<div class="border_foot_three">

		</div>
		<div class="border_foot_three">
				   	 <label class="label_distribution_two greatSumExpense">{{TotalExpense($event)}} $</label>
		</div>
		<div class="border_foot_three">
				   	 <label class="label_distribution_two greatSumPerDiem">{{TotalPerdiem($event)}} $</label>
		</div>
		<div class="border_foot_three">
				   	 <label class="label_distribution_two greatSumRange">{{TotalRange($event)}} $</label>
		</div>
		<div class="border_foot_three">
				   	 <label class="label_distribution_two greatSumHours">{{totalHours($event)}} h</label>
		</div>
		<div class="border_foot_four border_foot_sixe">
				   	 <label class="label_distribution_two greatSumRem">{{TotalRemuneration($event)}} $</label>
		</div>
	</div>
	<div class="save_content">
		<button class="button_save btn_save_hb_estimated" data-storeBudget="{{ route('storeBudget') }}">{!! trans('hb_estimated_future.btn_save') !!}
		</button>

	</div>
</form>
