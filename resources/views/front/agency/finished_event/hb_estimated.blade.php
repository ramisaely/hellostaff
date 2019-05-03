	<div class="content_future_budget">
		<div class="content_facture_budget">
		<label class="label_facturec_content">{!! trans('hb_estimated_future.Estimated_budget') !!}</label>
		@if($event)
          @foreach($event->eventStaffs as $index=>$eventStaff)
          @if(count($eventStaff->eventStaffCandidateConfirmed)>0)
          @if(count($eventStaff->eventFactures)>0)
			<div class="content_facture" data-index="{{$index}}">
				<div class="table_facture">
					<div class="table_col_one">
						<div class="th_distribution">
							<label class="label_facture">{{ $eventStaff->post }}</label>
						</div>
					@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)

						<div class="label_date_three label_simple">
							<div class="flex">
						 		<div class="facture_new">
							 		<div class="avatar_facture">
							 			<img src="{!! $candidat->staff->getImagePortraitPath() !!}">
							 		</div>
							 			<div class="litle_bouton"></div>
							 	</div>
					 			<label class="label_td">{{ $candidat->staff->user->first_name }} {{ $candidat->staff->user->last_name }}</label>
					 		</div>
						</div>
					@endforeach
					</div>
					<div class="table_col_two ">
						<div class="thead_two colonne2">
							<div class="label_date" data-head="{{ $eventStaff->post }}">
							 	<div class="flex_one"><a class="prev_facture previous"><</a>
							 	 <label class="label_facture_one startView">{{getDateString(startView($eventStaff))}}</label>
							@if(count($eventStaff->eventStaffDates)>0)
							 	@foreach($eventStaff->eventStaffDates as $j=>$eventStaffDate)
						   	 	 <label class="startDateHb" data-point="{{$j}}">{{ getDateString($eventStaffDate->date_start) }}</label>
						   	 	@endforeach
						   	@endif
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
									  <label class="label_three startHourView1">{{startHourView1($candidat, $eventStaff)}}</label>
									  <?php $countStart = 0?>
									@foreach($eventStaff->eventFactures as $s=>$facture)
									@if($facture->staff_id == $candidat->staff_id)
									<?php $countStart += 1?>
									  <label class="label_three is_hidden startHour" data-datestart="{{$countStart}}">{{$facture->start_hour_done}} h</label>
									@endif
									@endforeach
								   	  <a class="prev_facture">></a>
								   	  <label class="label_three endHourView1">{{endHourView1($candidat, $eventStaff)}}</label>
								   	  <?php $countEnd = 0?>
								   	@foreach($eventStaff->eventFactures as $e=>$facture)
								   	@if($facture->staff_id == $candidat->staff_id)
								   	<?php $countEnd += 1?>
								   	  <label class="label_three is_hidden endHour" data-dateend="{{$countEnd}}">{{$facture->end_hour_done}} h</label>
								   	@endif
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
										<td class="litle_td_three">{{ sumExpense($eventStaff, $candidat->staff_id) }} $</td>
										<td class="litle_td_two">{{$eventStaff->per_diem}} $<</td>
										<td class="litle_td_two">{{sumRange($eventStaff, $candidat->staff_id)}} $</td>
										<td class="litle_td_two">{{sumHours($candidat, $eventStaff)}} h</td>
										<td class="litle_td_four">{{sumRemuneration($eventStaff, $candidat->staff_id)}} $</td>
									</tbody>
							</table>
							@endforeach

						</div>
						<div class="thead_two colonne3">
							<div class="label_date" data-head="{{ $eventStaff->post }}">
							 	<div class="flex_one">
							 	 <label class="label_facture_one endView">{{getDateString(endView($eventStaff))}}</label>
							@if(count($eventStaff->eventStaffDates)>0)
							 	@foreach($eventStaff->eventStaffDates as $key=>$eventStaffDate)
						   	 	 <label class="endDateHb" data-key="{{$key}}">{{ getDateString($eventStaffDate->date_start) }}</label>
						   	 	@endforeach
						   	@endif
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
									<label class="label_three startHourView2">{{startHourView2($candidat, $eventStaff)}}</label>
									<?php $countStart = 0?>
									@foreach($eventStaff->eventFactures as $s1=>$facture)
									@if($facture->staff_id == $candidat->staff_id)
									<?php $countStart += 1 ?>
									  <label class="label_three is_hidden startHour2" data-datestart1="{{$countStart}}">{{ $facture->start_hour_done }} h</label>
									@endif
									@endforeach
								   	  <a class="prev_facture">></a>
								   	  <label class="label_three endHourView2">{{endHourView2($candidat, $eventStaff)}}</label>
								   	 <?php $countEnd = 0?>
								   	@foreach($eventStaff->eventFactures as $e1=>$facture)
								   	@if($facture->staff_id == $candidat->staff_id)
								   	<?php $countEnd += 1?>
								   	  <label class="label_three is_hidden endHour2" data-dateend1="{{$countEnd}}">{{ $facture->end_hour_done }} h</label>
								   	@endif
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
										<td class="litle_td_two">{{sumHours($candidat, $eventStaff)}} h</td>
										<td class="litle_td_four">{{sumRemuneration($eventStaff, $candidat->staff_id)}} $</td>
									</tbody>
							</table>
							@endforeach

						</div>
					</div>
					<div class="table_col_three">

						<div class="th">
							<div class="head_one">
								<label class="label_facture">{!! trans('hb_estimated_future.hourly_rates') !!}</label>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)
							<div class="label_date_three">
								<label class="label_three">{{ $eventStaff->hour_rate }} $/Hr</label>
							</div>
							@endforeach
						</div>
						<div class="th">
							<div class="head_one">
								<label class="label_facture">{!! trans('hb_estimated_future.outlay') !!} </label>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)
							<div class="label_date_three">
								<label class="label_three">{{ sumExpense($eventStaff, $candidat->staff_id) }} $</label>
						    </div>
						    @endforeach
						</div>
						<div class="th">
							<div class="head_one">
								<label class="label_facture">Per Diem Total</label>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)
							<div class="label_date_three">
								<label class="label_three">{{$eventStaff->per_diem}} $</label>
							</div>
							@endforeach
						</div>
						<div class="th">
							<div class="head_one">
								<label class="label_facture">{!! trans('hb_estimated_future.Kilometric_Fee') !!}</label>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)
							<div class="label_date_three">
								<label class="label_three">{{sumRange($eventStaff, $candidat->staff_id)}} $</label>
							</div>
							@endforeach
						</div>
						<div class="th">
							<div class="head_one">
								<label class="label_facture">{!! trans('hb_estimated_future.Total_hours') !!}</label>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)
							<div class="label_date_three">
								<label class="label_three">{{sumHours($candidat, $eventStaff)}} h</label>
							</div>
							@endforeach
						</div>
						<div class="th">
							<div class="head_one">
								<label class="label_facture">{!! trans('hb_estimated_future.Remuneration') !!}</label>
							</div>
							@foreach($eventStaff->eventStaffCandidateConfirmed as $candidat)
							<div class="label_date_three">
								<label class="label_three">{{sumRemuneration($eventStaff, $candidat->staff_id)}} $</label>
							</div>
							@endforeach
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
							   	 <label class="label_distribution_two">{{sumExpenseTotal($eventStaff)}} $</label>
					</div>
					<div class="border_foot_three">
							   	 <label class="label_distribution_two">{{sumPerdiemTotal($eventStaff)}} $</label>
					</div>
					<div class="border_foot_three">
							   	 <label class="label_distribution_two">{{sumRangeTotal($eventStaff)}} $</label>
					</div>
					<div class="border_foot_three">
							   	 <label class="label_distribution_two">{{sumHoursTotal($eventStaff)}} h</label>
					</div>
					<div class="border_foot_three border_foot_four">
							   	 <label class="label_distribution_two">{{sumRemunerationTotal($eventStaff)}} $</label>
					</div>
				</div>
	        </div>

	        <label class="label_facturec_content_one">{{$eventStaff->distance}}{!! trans('hb_estimated_future.text_label') !!} </label>
	        @endif
	        @endif
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
				   	 <label class="label_distribution_two">{{TotalExpense($event)}} $</label>
		</div>
		<div class="border_foot_three">
				   	 <label class="label_distribution_two">{{TotalPerdiem($event)}} $</label>
		</div>
		<div class="border_foot_three">
				   	 <label class="label_distribution_two">{{TotalRange($event)}} $</label>
		</div>
		<div class="border_foot_three">
				   	 <label class="label_distribution_two">{{totalHours($event)}} h</label>
		</div>
		<div class="border_foot_four border_foot_sixe">
				   	 <label class="label_distribution_two">{{TotalRemuneration($event)}} $</label>
		</div>
	</div>
	<div class="sentence_of_staff">
		<small>{!! trans('hb_estimated_future.text_sentence') !!}</small>
	</div>
