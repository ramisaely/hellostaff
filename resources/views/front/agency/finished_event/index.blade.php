@extends('front.agency.layout.master')

@section('additional-css')
  {!! Html::style('css/Front/agency/finished_event/evaluation_staff.css') !!}
  {!! Html::style('css/Front/agency/finished_event/evaluation_staff_responsive.css') !!}
  {!! Html::style('css/Front/agency/creation_event/create_event.css') !!}
  {!! Html::style('css/Front/agency/creation_event/create_event_responsive.css') !!}
  {!! Html::style('css/Front/calendar/fullcalendar.css') !!}
  {!! Html::style('css/Front/calendar/calendar.css') !!}
  {!! Html::style('css/Front/calendar/calendar_responsive.css') !!}
  {!! Html::style('css/Front/calendar/fullcalendar_responsive.css') !!}
  {!! Html::style('css/Front/agency/Future_event/confirmed_staff.css') !!}
  {!! Html::style('css/Front/agency/Future_event/confirmed_staff_responsive.css') !!}
  {!! Html::style('css/Front/agency/finished_event/statement.css') !!}
  {!! Html::style('css/Front/agency/finished_event/statement_responsive.css') !!}
  {!! Html::style('css/Front/agency/finished_event/event_form.css') !!}
  {!! Html::style('css/Front/agency/finished_event/event_form_responsive.css') !!}
  {!! Html::style('css/Front/agency/finished_event/finished_event.css') !!}
  {!! Html::style('css/Front/agency/finished_event/hb_finished.css') !!}
  {!! Html::style('css/Front/agency/finished_event/hb_finished_responsive.css') !!}
  {!! Html::style('css/Front/agency/future_event/Future_event_responsive.css') !!}
  {!! Html::style('css/Front/staff/bills/modals.css') !!}

  <!-- start candidate card css -->
  {!! Html::style('css/Front/agency/candidates_card/candidates_card.css') !!}
  {!! Html::style('css/Front/agency/candidates_card/candidates_card_responsive.css') !!}
  {!! Html::style('https://fonts.googleapis.com/css?family=Montserrat:100,200,300') !!}
  <!-- end candidate card css -->
@endsection

@section('modals')
  @include('modals.agency.future_event.confirm_proposed_jobs')
  @include('modals.agency.future_event.proposed_more_mystaff')
  @include('modals.agency.fiche_candidates.experience_candidat')
  @include('modals.agency.fiche_candidates.slider_image_candidates')

  @include('modals.agency.fiche_candidates.footer_modal')
  @include('modals.agency.fiche_candidates.iframe_view_cv')
  @include('modals.waiting.modal_wait')
@endsection

@section('content')

@include('front.agency.Header_slider.header_slider')
<div class="content_finished">
    @include('front.agency.finished_event.content_finished_event')
</div>

<!-- start candidate card view -->
<div class="content_candidate_card is_hidden">

</div>
<!-- end candidate card view -->

@endsection
@section('additional-scripts')
	{!! Html::script('js/Front/agency/finished_event.js') !!}
	{!! Html::script('js/Front/calendar/lib/moment.min.js') !!}
	{!! Html::script('js/Front/calendar/lib/fullcalendar.js') !!}
	{!! Html::script('js/Front/calendar/lib/locale-all.js') !!}
  {!! Html::script('js/Front/agency/futur_event_confirmated.js') !!}
  {!! Html::script('js/Front/agency/hb_finished.js') !!}
  {!! Html::script('js/Front/agency/header_slider.js') !!}
  {!! Html::script('js/Front/agency/candidates_card.js') !!}
  @if($event)
        <script type="text/javascript">
            window.agency_event = {!!$event!!};
        </script>
  @endif
@endsection
