@extends('front.agency.layout.master')

@section('additional-css')
  <!-- landing page event a venir -->
  {!! Html::style('css/Front/agency/Future_event/landing_page.css') !!}
  <!-- find candidiates -->
  {!! Html::style('css/Front/agency/Future_event/find_candidates.css') !!}
  {!! Html::style('css/Front/agency/Future_event/find_candidates_responsive.css')!!}

  {!! Html::style('css/Front/agency/Future_event/hb_estimated.css') !!}
  {!! Html::style('css/Front/agency/Future_event/confirmed_staff.css') !!}
  {!! Html::style('css/Front/agency/Future_event/confirmed_staff_responsive.css') !!}
  {!! Html::style('css/Front/agency/Future_event/hb_estimated_responsive.css') !!}
  {!! Html::style('css/Front/agency/Future_event/asRange.css') !!}

  <!-- Speciale full calendar -->
  {!! Html::style('https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css') !!}
  {!! Html::style('https://use.fontawesome.com/releases/v5.7.0/css/all.css') !!}

  {!! Html::style('css/Front/calendar/pickmeup.css') !!}
  {!! Html::style('css/Front/agency/creation_event/create_event.css') !!}
  {!! Html::style('css/Front/agency/creation_event/create_event_responsive.css') !!}
  {!! Html::style('https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css') !!}

  {!! Html::style('css/Front/calendar/fullcalendar.css') !!}
  {!! Html::style('css/Front/calendar/calendar.css') !!}
  {!! Html::style('css/Front/calendar/calendar_responsive.css') !!}
  {!! Html::style('css/Front/calendar/fullcalendar_responsive.css') !!}
  {!! Html::style('css/Front/fontawesome/fontawesome.min.css') !!}
  {!! Html::style('css/Front/agency/Future_event/statement.css')!!}
  {!! Html::style('css/Front/agency/Future_event/statement_responsive.css')!!}


  <!-- a ne pas supprimer: responsiviter de notre header menu -->
  {!! Html::style('css/Front/agency/finished_event/finished_event.css') !!}
  {!! Html::style('css/Front/agency/finished_event/finished_event_responsive.css') !!}
  <!-- {!! Html::style('css/Front/agency/finished_event/event_form.css') !!} -->
  <!-- {!! Html::style('css/Front/agency/finished_event/event_form_responsive.css') !!} -->
  {!! Html::style('css/Front/agency/Future_event/event_form.css') !!}
  {!! Html::style('css/Front/agency/Future_event/event_form_responsive.css') !!}
  {!! Html::style('css/Front/staff/bills/modals.css') !!}
  <!-- End a ne pas supprimer: responsiviter de notre header menu -->
  <!-- end full calendar -->

  <!-- start candidate card css -->
  {!! Html::style('css/Front/agency/candidates_card/candidates_card.css') !!}
  {!! Html::style('css/Front/agency/candidates_card/candidates_card_responsive.css') !!}
  {!! Html::style('https://fonts.googleapis.com/css?family=Montserrat:100,200,300') !!}
  <!-- {!! Html::style('css/Front/generale/modal.css') !!} -->
  <!-- end candidate card css -->

@endsection

@section('content')
  @if($event)
    @include('front.agency.Header_slider.header_slider')
    <div class="content_future_event" data-eventPost="{{route('find_event')}}" data-updateEvent="{{ route('updateEvent') }}" data-eraseEvent="{{route('eraseEvent')}}" data-longueur="0">
        @include('front.agency.future_event.content_future_event')
    </div>

    <!-- start candidate card view -->
    <div class="content_candidate_card is_hidden">

    </div>
    <!-- end candidate card view -->
  @else
      <!-- Landing Page -->
      @include ('front.agency.future_event.landing_page')
      <!-- End Landing Page -->
  @endif
@endsection



@section('modals')
  @include('modals.agency.future_event.confirm_proposed_jobs')
  @include('modals.agency.future_event.proposed_more_mystaff')
  @include('modals.agency.fiche_candidates.experience_candidat')

  @include('modals.agency.fiche_candidates.footer_modal')
  @include('modals.agency.fiche_candidates.iframe_view_cv')
  @include('modals.agency.fiche_candidates.slider_image_candidates')
  @include('modals.agency.my_staff.add_person_myStaff')
  @include('modals.agency.my_staff.removing_ut_myStaff')
  @include('modals.agency.update_profil.modal_change_update_profil')
  @include('modals.waiting.modal_wait')
@endsection

@section('additional-scripts')
    <!-- Spaciale fullCalendar -->
    {!! Html::script('js/Front/calendar/lib/moment.min.js') !!}
    {!! Html::script('js/Front/calendar/lib/fullcalendar.js') !!}
    {!! Html::script('js/Front/calendar/lib/locale-all.js') !!}
    {!! Html::script('js/Front/calendar/calendar.js') !!}
    
    {!! Html::script('js/Front/agency/future_event.js') !!}
    {!! Html::script('js/Front/agency/futur_event_event_form.js') !!}
    {!! Html::script('js/Front/agency/futur_event_statement.js') !!}
    {!! Html::script('js/Front/agency/futur_event_confirmated.js') !!}
    {!! Html::script('js/Front/agency/futur_event_find_candidates.js') !!}
    {!! Html::script('js/Front/agency/future_event_facture_budget.js') !!}

    {!! Html::script('js/Front/calendar/jquery.pickmeup.js') !!}

    <script type="text/javascript" src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    @if($event)
        <script type="text/javascript">
            window.agency_event = {!!$event!!};
        </script>
    @endif
    {!! Html::script('js/Front/agency/header_slider.js') !!}
    {!! Html::script('https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick.min.js') !!}
    {!! Html::script('js/Front/agency/candidates_card.js') !!}

@endsection
