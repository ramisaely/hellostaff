@extends('front.staff.layout.master_account')

@section('additional-css')
  <!-- landing page event a venir -->
  {!! Html::style('css/Front/staff/futur_event/landing_page.css') !!}
  <!-- find candidiates -->
  {!! Html::style('css/Front/staff/bills/bills.css') !!}
  {!! Html::style('css/Front/staff/bills/modals.css') !!}
  {!! Html::style('css/Front/staff/bills/bills_responsive.css')!!}
@endsection

@section('content')
  @if($events)
	<section class="content_pages staff_bills">
		<div class="job_offers_content">
	      	<div class="section_title">
	      		<div class="section_title_content">
	      			<label>{!! trans('bills_staff.invoices') !!}</label>
		        	<div class="form_item search">
	        			<div class="input_group">
			                <input class="" type="text" name="" id="filter_bills" placeholder="{!! trans('bills_staff.search') !!}">
			                <span class="input_addon backgroung_search">
			                </span>
			            </div>
		        		<small class="message_job_offer">{!! trans('bills_staff.invoices') !!}
		            	</small>
		        	</div>
	      		</div>
	      	</div>
	      	@if($events)
	      	<div class="table_staff_bills">
	      		<table id="table_bills_to_filter" class="">
	      			<thead>
	      				<tr>
	      					<th><span>Logo</span></th>
	      					<th><span>{!! trans('bills_staff.Agency') !!}</span></th>
	      					<th><span>{!! trans('bills_staff.Bill_date') !!}</span></th>
	      					<th><span>{!! trans('bills_staff.Event') !!}</span></th>
	      					<th><span>{!! trans('bills_staff.Bill_code') !!}</span></th>
	      					<th><span>{!! trans('bills_staff.Job') !!}</span></th>
	      					<th><span>Total</span></th>
	      					<th><span>{!! trans('bills_staff.See_bill') !!}</span></th>
	      					<th><span>{!! trans('bills_staff.Download') !!}</span></th>
	      				</tr>
	      			</thead>
	      			<tbody>
	      			@foreach($events as $key=>$event)
	      				@foreach($event->eventStaffs as $eventStaff)

	      				<tr class="content_table">
	      					<input type="hidden" value="{{ $eventStaff->id }}" class="idEventStaff">
	      					<td data-label="{!! trans('bills_staff.Agency') !!}" class="td_logo_agency">
	      						<div class="logo_agency cell_wrapper">
	      							<img class="logAgence" src="{{ $event->agency->getImageProfilPath() }}">
	      						</div>
	      					</td>
	      					<td class="td_agency_name">
	      						<div class="cell_wrapper">
	      							{{ $event->agency->name }}
	      						</div>
	      					</td>
	      					<td data-label="{!! trans('bills_staff.Bill_date') !!}" class="date_bills">
	      						<div class="cell_wrapper date_bills_text">
	      							{{ showOneDate($eventStaff) }}
	      						</div>
	      					</td>
	      					<td data-label="{!! trans('bills_staff.Event') !!}" class="nameEvent">
	      						<div class="cell_wrapper">
	      							{{ $event->name }}
	      						</div>
	      					</td>
	      					<td data-label="{!! trans('bills_staff.Bill_code') !!}">
	      						<div class="cell_wrapper">
	      							{{Auth::user()->first_name}}{{Auth::user()->last_name}}.{{intBillsCode($key+1)}}
	      						</div>
	      					</td>
	      					<td data-label="{!! trans('bills_staff.Job') !!}" class="post">
	      						<div class="cell_wrapper">
	      							{{ $eventStaff->post }}
	      						</div>
	      					</td>
	      					<td data-label="Total" class="total_net">
		      					<div class="cell_wrapper total_net_text">
		      						{{ showOneTotal($eventStaff) }}
	      						</div>
		      				</td>
	      					<td data-label="{!! trans('bills_staff.See_bill') !!}">
	      						<div class="see_bill cell_wrapper">
	      							<a class="bill_link" data-findFacture="{{ route('findFacture') }}">
	      								<img src="{!! url('/img/staff/view_bill.svg') !!}">
	      							</a>
	      						</div>
	      					</td>
	      					<td data-label="{!! trans('bills_staff.Download') !!}">

	      						<div class="download_bill">
	      							<a class="download_bill_link" data-findFacture="{{ route('findFacture') }}">
	      								<img src="{!! url('/img/staff/download_01.svg') !!}">
	      							</a>
	      						</div>
	      					</td>
	      				</tr>
	      				@endforeach
	      			@endforeach
	      			</tbody>
	      		</table>
	      	</div>
			@endif
		</div>
	</section>
@else
  <!-- Landing Page -->
  @include ('front.staff.Future_event.landing_page')
  <!-- End Landing Page -->
@endif
@endsection

@section('modal')
	@include('modals.staff.bills.show_my_bill')
@endsection

@section('additional-scripts')
  {!! Html::script('https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js') !!}
  {!! Html::script('js/Front/staff/staff_bills.js') !!}
@endsection
