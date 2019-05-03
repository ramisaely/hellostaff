@if($event)
<form id="regFormFacture" method="post" enctype="multipart/form-data" class="flex_container">
<div class="hour_facture_content">
  	<div class="section_title">
		<span>{!! trans('staff_hour.Hours_Bills') !!}</span>        	
  	</div>
  	<div class="table_hour_facture">
  		<table>
  			<thead>
  				<tr>
  					<th>Dates</th>
	  				<th class="cell_performed_hour">{!! trans('staff_hour.Hours_Effectuate') !!}</th>
	  				<th class="cell_hourly_rate">{!! trans('staff_hour.Hourly_rate') !!}</th>
	  				<th>Per diem</th>
	  				<th class="cell_distance_rate default_distance">@foreach($event->eventStaffs as $eventStaff){{$eventStaff->distance}}@endforeach$ /Km</th>
	  				<th class="cell_expense">{!! trans('staff_hour.outlay') !!}</th>
	  				<th class="cell_remuneration">{!! trans('staff_hour.Remuneration') !!}</th>
	  				<th class="cell_more_info">{!! trans('staff_hour.Additional_infos') !!}</th><!-- NB: calculer le rowspan à partir du nambre de ligne de la facture -->
  				</tr>
  			</thead>
  			<tbody>
          @foreach($event->eventStaffs as $eventStaff)
           @foreach($eventStaff->eventStaffDates as $key=>$eventStaffDate)
  				<tr class="content_table" data-key="{{$key}}">
            <input type="hidden" name="idFacture[]" value="{{($eventStaffDate->eventFacture)? $eventStaffDate->eventFacture->id:''}}" class="idFacture">
            <input type="hidden" name="idEventStaffDate[]" class="idEventStaffDate" value="{{ $eventStaffDate->id }}">
            <input type="hidden" name="idEventStaff" class="idEventStaff" value="{{$eventStaff->id}}">
            <input type="hidden" name="nameEvent" class="nameEvent" value="{{$event->name}}">
            <input type="hidden" name="dateEvent" class="dateEvent" value="{{show_date_to_bills($event->start_date,$event->start_date)}}">
            <input type="hidden" name="idStaff" class="idStaff" value="{{Auth::user()->staff->id}}">
  					<td data-label="Dates" class="dates">
  						<span class="cell_content dateStartEvent">{{ getDateString($eventStaffDate->date_start) }}</span>
              <input type="hidden" name="eventDate[]" value="{{ getDateString($eventStaffDate->date_start) }}">
  					</td>
  					<td data-label="{!! trans('hours.Hours_worked') !!}" class="cell_performed_hour">
  						<div class="cell_content">
  							<div class="performed_hour">
  								<div>
                  <input type="hidden" name="dateStart" class="dateStart" value="{{is_my_hour_event($eventStaffDate->start_hour_event_staff_date)}}">
                  <input type="hidden" name="hourEventStart[]" class="hourEventStart" value="{{ ($eventStaffDate->eventFacture) ?$eventStaffDate->eventFacture->start_hour_done:'' }}">
                    <span class="hour_from" contenteditable="true">{{is_my_hour_event($eventStaffDate->start_hour_event_staff_date)}}</span><span>&nbsp;hr</span></div>
	  							<span class="to"> > </span>
	  							<div>
                    <input type="hidden" name="dateEnd" class="dateEnd" value="{{is_my_hour_event($eventStaffDate->end_hour_event_staff_date)}}">
                    <input type="hidden" name="hourEventEnd[]" class="hourEventEnd" value="{{ ($eventStaffDate->eventFacture) ?$eventStaffDate->eventFacture->end_hour_done:'' }}">
                    <span class="hour_to" contenteditable="true">{{is_my_hour_event($eventStaffDate->end_hour_event_staff_date)}}</span><span>&nbsp;hr</span></div>
  							</div>
  							<button class="extendhour_facture_table">
  								<svg class="">
  									<use xlink:href="#icon-arrow-right">
  								</svg>
  							</button>
  						</div>
  					</td>
  					<td data-label="T.H." class="responsive_extension">
  						<span class="cell_content hourly_rate">{{$eventStaff->hour_rate}}$/hr</span>
  					</td>
  					<td data-label="Per diem" class="responsive_extension">
  						<span class="cell_content">--</span>
  					</td>
  					<td data-label="0.48$ /Km" class="cell_distance_rate responsive_extension">
  						<div class="distance_rate cell_content">
  							<span class="distance distance_actual" contenteditable="true">0Km</span>
                <input type="hidden" name="range_done[]" class="range_done" value="{{ ($eventStaffDate->eventFacture) ?$eventStaffDate->eventFacture->range_done:'' }}">
  							<span class="amount amount_actual">0$</span>
  						</div>
  					</td>
  					<td data-label="Dépenses" class="cell_expense responsive_extension">
  						<div class="expense cell_content">
  							<span class="amount amount_expense" contenteditable="true">0</span>
                <input type="hidden" name="expense_amount[]" class="expense_amount" value="{{ ($eventStaffDate->eventFacture) ?$eventStaffDate->eventFacture->expense:'' }}">
  							<span>$</span>
  						</div>
  					</td>
  					<td data-label="Rémunération" class="responsive_extension">
  						<span class="cell_content remuneration1"> 0 $</span>
              <input type="hidden" name="remunerations[]" class="remunerations">
  					</td>
            
  					<td data-label="Infos supplémentaires" rowspan="3" class="cell_more_info">
  						<div class="more_info cell_content add_info">
  							<span contenteditable="true" class="information">{{ ($eventStaffDate->eventFacture) ?$eventStaffDate->eventFacture->additional_info:'' }}</span>
                <input type="hidden" name="additional_info" class="additional_info" value="{{ ($eventStaffDate->eventFacture) ?$eventStaffDate->eventFacture->additional_info:'' }}">
  						</div>
  					</td>
  				</tr>
            @endforeach
          @endforeach
           


  				<tr class="responsive_more_info">
  					<td colspan="8" data-label="Infos supplémentaires">
  						<div class="more_info_content">
  							<span>{!! trans('staff_hour.text_infos') !!}</span>
  						</div>
  					</td>
  				</tr>
  				<tr class="sub_total">
  					<td class="sub_total_item"><span>__</span></td>
  					<td class="sub_total_item total_hour"><span>0 /hr</span></td>
  					<td class="sub_total_item"><span>__</span></td>
  					<td class="sub_total_item total_per_diem"><span>@foreach($event->eventStaffs as $eventStaff){{is_my_per_diem($eventStaff->per_diem)}}@endforeach $</span></td>
  					<td class="sub_total_item">
  						<div class="distance_rate">
  							<span class="distance distance_total">0Km</span>
  							<span class="amount amount_total">0$</span>
  						</div>
  					</td>
  					<td class="sub_total_item expense_total"><span>0 $</span></td>
  					<td class="sub_total_item total_net1"><span>0 $</span></td>
  					<td class="sub_total_item">
  						<div class="total total_net">TOTAL<span class="responsive_separator"></span>&nbsp;0 $</div>
              <input type="hidden" name="net_total" class="net_total">
  					</td>
  				</tr>
  			</tbody>
  		</table>
  		<span class="travelling">{!! trans('staff_hour.text_info') !!}</span>
  	</div>
  	<div class="hour_facture_footer">
  		<div class="left">
  			<a class="show_my_bill" data-findFacture="{{ route('findFacture') }}">{!! trans('staff_hour.See_bill') !!}</a>
  			<div class="message">
  				<p>{!! trans('staff_hour.See_agency') !!}</p>
  				<p>{!! trans('staff_hour.See_agence') !!}</p>
  			</div>
  		</div>
  		<div class="right">
  			<button data-stored="{{ route('storedInvoicies') }}">{!! trans('staff_hour.Validate') !!}</button>
  		</div>
  	</div>
</div>
</form>
@endif