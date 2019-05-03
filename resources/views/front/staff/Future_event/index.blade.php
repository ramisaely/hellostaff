@extends('front.staff.layout.master_account')

@section('additional-css')
  <!-- landing page event a venir -->
  {!! Html::style('css/Front/staff/futur_event/landing_page.css') !!}
  <!-- find candidiates -->

  {!! Html::style('css/Front/staff/futur_event/futur_event.css')!!}
  {!! Html::style('css/Front/staff/calendar/calendar.css')!!}
  {!! Html::style('css/Front/staff/calendar/fullcalendar.css')!!}
  {!! Html::style('css/Front/staff/calendar/pickmeup.css')!!}
  {!! Html::style('https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css') !!}
  {!! Html::style('https://use.fontawesome.com/releases/v5.7.0/css/all.css') !!}
  {!! Html::style('css/Front/fontawesome/fontawesome.min.css') !!}
  {!! Html::style('css/Front/staff/finished_event/agency_card/agency_card.css')!!}
  {!! Html::style('css/Front/staff/finished_event/agency_card/agency_card_responsive.css')!!}
  {!! Html::style('css/Front/staff/finished_event/event_card/event_card.css')!!}
  {!! Html::style('css/Front/staff/finished_event/event_card/event_card_responsive.css')!!}
@endsection

@section('menus')
  @if($event)
    <div class="content_future_event">
  	@include('front.staff.layout.header_slider')
    </div>
  @endif
@endsection

@section('content')
  @if($event)
    <div id="staff_future_event_content">
    	@include('front.staff.Future_event.content_future_event')
    </div>
  @else
    <!-- Landing Page -->
    @include ('front.staff.Future_event.landing_page')
    <!-- End Landing Page -->
  @endif
@endsection

@section('modal')
	@include('modals.staff.bills.show_my_bill');

@endsection

@section('additional-scripts')
	{!! Html::script('js/Front/calendar/lib/moment.min.js') !!}
	{!! Html::script('js/Front/calendar/lib/fullcalendar.js') !!}
	{!! Html::script('js/Front/calendar/lib/locale-all.js') !!}
	{!! Html::script('js/Front/calendar/jquery.pickmeup.js') !!}
	{!! Html::script('js/Front/staff/future_event.js') !!}
@endsection
