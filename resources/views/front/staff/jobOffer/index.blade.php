@extends('front.staff.layout.master_account')

@section('additional-css')
  {!! Html::style('css/Front/staff/job_offer/job_offer.css') !!}
  {!! Html::style('css/Front/staff/job_offer/modals.css') !!}
  {!! Html::style('css/Front/staff/job_offer/job_offer_responsive.css')!!}
  {!! Html::style('css/Front/staff/finished_event/event_card/event_card.css')!!}
  {!! Html::style('css/Front/staff/finished_event/event_card/event_card_responsive.css')!!}
@endsection

@section('content')
	<section class="content_pages job_offers">
		<div class="job_offers_content">
	      	<div class="section_title">
	      		<div class="section_title_content">
	      			<label>{!! trans('job.List_bid') !!}</label>
		        	<div class="form_item search">
	        			<div class="input_group">
			                <input class="" type="text" name="" id="filter_job_offer" placeholder="{!! trans('job.text_offre') !!}">
			                <span class="input_addon backgroung_search">
			                </span>
			            </div>
		        		<small class="message_job_offer">{!! trans('job.text_off') !!}
		            	</small>
		        	</div>
	      		</div>	        	
	      	</div>
	      	<div class="table_job_offer">
	      		<table id="table_job_offer_to_filter" class="">
	      			<thead>
	      				<tr>
	      					<th><span>{!! trans('job.Event') !!}</span></th>
	      					<th><span>Dates</th>
	      					<th><span>{!! trans('job.job') !!}</span></th>
	      					<th><span>{!! trans('job.City') !!}</span></th>
	      					<th><span>{!! trans('job.Hourly_rate') !!}</span></th>
	      					<th><span>{!! trans('job.Apply') !!}</span></th>
	      					<th><span>{!! trans('job.Refuse') !!}</span></th>
	      					<th><span>{!! trans('job.Status') !!}</span></th>
	      				</tr>
	      			</thead>
	      			<tbody>
	      				@if($event_candidates)
		      				@foreach($event_candidates as $key => $job)
		      				<tr class="tr_job"  data-key={{$key}} data-language="{{getLanguageId()}}">
		      					<td data-label="Evènement">
		      						<div class="cell_wrapper">
		      							<div class="job_offer_event">
			      							<input type="hidden" name="idEvent" class="idEvent" value="{{$job->eventStaff->eventAgency->id}}" data-getEvent="{{route('getEvent')}}">
			      							<span>{{$job->eventStaff->eventAgency->name}}</span>
			      							<a class="infoEvent">
			      								<i class="fa fa-info" aria-hidden="true"></i>
			      							</a>
			      						</div>
		      						</div>
		      					</td>
		      					<td data-label="Dates">
		      						<div class="cell_wrapper">
		      							{{showDateJobOffer($job->eventStaff->eventAgency->start_date,$job->eventStaff->eventAgency->end_date)}}
		      						</div>
		      					</td>
		      					<td data-label="Job">
		      						<div class="the_job cell_wrapper">
		      							<span class="job_color" style="background: {{$job->eventStaff->color_event_staff}};"></span>
		      							<input type="hidden" name="idEventStaff" class="idEventStaff" value="{{$job->eventStaff->id}}">
		      							<span>{{$job->eventStaff->post}}</span>
		      						</div>
		      					</td>
		      					<td data-label="{!! trans('job.City') !!}">
		      						<div class="cell_wrapper">
		      							{{$job->eventStaff->eventAgency->location_event}}
		      						</div>
		      					</td>
		      					<td data-label="{!! trans('job.Hourly_rate') !!}" class="hourly_rate">	      				
		      						<div class="cell_wrapper">
		      							{{showHourlyRate($job->eventStaff->hour_rate)}}
		      						</div>
		      					</td>
		      					<td data-label="{!! trans('job.Apply') !!}" class="parent_for_apply_job">
		      						<div class="spectrum_switch apply cell_wrapper">
		      							<input type="checkbox" class="apply_for_job" role="switch" value=""  data-url="{{route('apply_or_deline_job')}}" data-event-candidat-id="{{$job->id}}" {{statusApplication($job->status_event_id)}}>
		      							<label class="switch_out label_appy_for_job">
		      								<span class="switch_in"></span>
		      							</label>
		      						</div>
		      					</td>
		      					<td data-label="{!! trans('job.Refuse') !!}" class="parent_for_decline_job">
		      						<div class="spectrum_switch decline cell_wrapper">
		      							<input type="checkbox" class="decline_job" role="switch" value="" data-url="{{route('apply_or_deline_job')}}" data-event-candidat-id="{{$job->id}}" {{statusRefused($job->status_event_id)}}>
		      							<label class="switch_out label_decline_job"><span class="switch_in"></span></label>
		      						</div>
		      					</td>
		      					<td data-label="{!! trans('job.Status') !!}" class="status_job" data-status-id="{{$job->status_event_id}}">
		      							{{$job->statusEvent->getByLanguageId(getLanguageId())->name}}
		      					</td>

		      				</tr>
		      				@endforeach
	      				@endif
	      			</tbody>
	      		</table>
	      	</div>
		</div>
	</section>

	<section class="event_card_page is_hidden">
		@include('front.staff.jobOffer.event_card')
	</section>
@endsection

@section('modal')
	@include('modals.staff.job_offers.congrate_job_application_success')
	@include('modals.staff.job_offers.decline_new_job_application')
	@include('modals.staff.job_offers.modal_applicant_available')
	@include('modals.staff.job_offers.warning_for_confirmed_application')
	@include('modals.staff.job_offers.job_application_sent')
@endsection

@section('additional-scripts')
  {!! Html::script('js/Front/staff/job_offer.js') !!}
@endsection