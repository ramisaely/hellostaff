@extends('front.staff.layout.master_account')

@section('additional-css')
  <!-- landing page event a venir -->
  {!! Html::style('css/Front/staff/futur_event/landing_page.css') !!}
  <!-- find candidiates -->
  {!! Html::style('css/Front/staff/finished_event/hour_facture/hour_facture.css') !!}
  {!! Html::style('css/Front/staff/finished_event/hour_facture/modals.css') !!}
  {!! Html::style('css/Front/staff/bills/modals.css') !!}
  {!! Html::style('css/Front/staff/finished_event/hour_facture/hour_facture_responsive.css')!!}
  {!! Html::style('css/Front/staff/finished_event/staff_report/staff_report.css')!!}
  {!! Html::style('css/Front/staff/finished_event/staff_report/staff_report_responsive.css')!!}
  {!! Html::style('css/Front/staff/finished_event/agency_card/agency_card.css')!!}
  {!! Html::style('css/Front/staff/finished_event/agency_card/agency_card_responsive.css')!!}
  {!! Html::style('css/Front/staff/finished_event/event_card/event_card.css')!!}
  {!! Html::style('css/Front/staff/finished_event/event_card/event_card_responsive.css')!!}
@endsection

@section('menus')
  @if($event)
  	@include('front.staff.layout.header_slider')
  @endif
@endsection

@section('content')
  @if($event)
    <div id="staff_finished_event_content">
  		@include('front.staff.finished_event.content_finished_event')
    </div>
  @else
    <!-- Landing Page -->
    @include ('front.staff.finished_event.landing_page')
    <!-- End Landing Page -->
  @endif
@endsection

@section('modal')
	@include('modals.staff.bills.show_my_bill');
@endsection

@section('additional-scripts')
  {!! Html::script('https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js') !!}
	{!! Html::script('js/Front/staff/finished_event.js') !!}
	{!! Html::script('js/Front/staff/hour_facture.js') !!}
	{!! Html::script('js/Front/staff/staff_report.js') !!}
	{!! Html::script('js/Front/staff/agency_card.js') !!}
@endsection
