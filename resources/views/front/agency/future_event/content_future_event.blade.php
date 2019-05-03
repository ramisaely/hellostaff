   <div class="header_menus">
    <div class="list_menus">
      <div class="menu_head event_form_menu" data-content="event_form">
        <div class="icone_header">
          <img src="{!! url('img/agency/icones_pages_agency/fiche_evnet.svg') !!}" alt="">
        </div>
        <label class="title_menus">{!! trans('content_future_event.Event_sheet') !!}</label>
      </div>
      <span class="responsive_dotted"></span>
      <div class="menu_head find_candidates_menu active" data-content="find_candidates">
        <div class="icone_header">
          <img src="{!! url('img/agency/icones_pages_agency/trouver_candidats.svg') !!}" alt="">
        </div>
        <label class="title_menus">{!! trans('content_future_event.candidate') !!}</label>
      </div>
      <span class="responsive_dotted"></span>
      <div class="menu_head confirmed_staff_menu" data-content="confirmed_staff">
        <div class="icone_header">
          <img src="{!! url('img/agency/icones_pages_agency/staff_confirme.svg') !!}" alt="">
        </div>
        <label class="title_menus">{!! trans('content_future_event.Staff_confirmed') !!}</label>
      </div>
      <span class="responsive_dotted"></span>
      <div class="menu_head statement_menu" data-content="statement">
        <div class="icone_header">
          <img src="{!! url('img/agency/icones_pages_agency/compte_rendu.svg') !!}" alt="">
        </div>
        <label class="title_menus">{!! trans('content_future_event.statement') !!}</label>
      </div>
      <span class="responsive_dotted"></span>
      <div class="menu_head hb_estimated_menu" data-content="hb_estimated">
        <div class="icone_header">
          <img src="{!! url('img/agency/icones_pages_agency/heures.svg') !!}" alt="">
        </div>
        <label class="title_menus">{!! trans('content_future_event.Hours_forecast') !!}</label>
      </div>
    </div>
   </div>
   <div class="future_event">
      <div class="event_form is_hidden">
        @include('front.agency.future_event.event_form')
      </div>
      <div class="find_candidates">
        @include('front.agency.future_event.find_candidates')
      </div>
      <div class="confirmed_staff is_hidden">
        @include('front.agency.future_event.confirmed_staff')
      </div>
      <div class="statement is_hidden">
        @include('front.agency.future_event.statement')
      </div>
      <div class="hb_estimated is_hidden">
        @include('front.agency.future_event.hb_estimated')
      </div>
  </div>
