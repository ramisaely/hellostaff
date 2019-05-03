@extends('front.agency.layout.master')

@section('additional-css')
	{!! Html::style('https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css') !!}
	{!! Html::style('https://use.fontawesome.com/releases/v5.7.0/css/all.css') !!}

	{!! Html::style('css/Front/agency/creation_event/create_event.css') !!}
	{!! Html::style('css/Front/agency/creation_event/creation_of_event.css') !!}
	{!! Html::style('css/Front/agency/creation_event/creation_of_event_responsive.css') !!}
	{!! Html::style('css/Front/agency/Future_event/confirmed_staff.css') !!}
	{!! Html::style('css/Front/agency/creation_event/create_event_responsive.css') !!}
	{!! Html::style('https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css') !!}
	{!! Html::style('css/Front/calendar/pickmeup.css') !!}

	{!! Html::style('css/Front/calendar/fullcalendar.css') !!}
	{!! Html::style('css/Front/calendar/calendar.css') !!}
	{!! Html::style('css/Front/calendar/calendar_responsive.css') !!}
	{!! Html::style('css/Front/calendar/fullcalendar_responsive.css') !!}
	{!! Html::style('css/Front/fontawesome/fontawesome.min.css') !!}

@endsection

@section('content')
	{!! Form::open(array('url' => route('post_register_event'),'files' => true,'class'=>'event_registration','autocomplete'=>'off' ,'id'=>'regForm')) !!}
		<div class="content_wrap">
			<div class="creation_reg_head">
				<p class="header_title"> {!! trans('create_event.title') !!} </p>
				<!-- <span class="language_site">
					<div class="checkbox">
						<input type="checkbox" id="fr_site" data-val="fr" class="change_language">
						<label class="french checkbox_label" for="fr_site">Français</label>
					</div>
					<div class="checkbox">
						<input type="checkbox" id="en_site" data-val="en" class="change_language">
						<label class="english checkbox_label" for="en_site">English</label>
					</div>
				</span> -->
			</div>
			<div class="content">
					@include('front.agency.create_event.creation')
			</div>
		</div>
		<div class="content_bouton_finish">
			<button type="submit" id="click_me" class="is_hidden">Click Me!</button>
		    <button type="button" class="finish">{!! trans('create_event.btn_save') !!}</button>
		</div>
	{!! Form::close() !!}
@endsection

@section('modal')
	@include('modals.agency.create_event.popup_dates')
	@include('modals.agency.create_event.popup_dates_2')
	@include('modals.agency.create_event.modal_event_users')
	@include('modals.agency.create_event.modal_change_create_event')
	@include('modals.agency.create_event.modal_confirm_removing_post')
	@include('modals.agency.create_event.modal_confirm_finish')
@endsection

@section('additional-scripts')
	{!! Html::script('js/Front/calendar/lib/moment.min.js') !!}
	{!! Html::script('js/Front/calendar/lib/fullcalendar.js') !!}
	{!! Html::script('js/Front/calendar/lib/locale-all.js') !!}
	<script type="text/javascript" src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

	{!! Html::script('js/Front/calendar/jquery.pickmeup.js') !!}
	{!! Html::script('js/Front/calendar/calendar.js') !!}
	{!! Html::script('js/Front/agency/creation_event.js') !!}
@endsection
