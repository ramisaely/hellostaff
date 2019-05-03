<div class="header_menus staff_finished_event_menus">
    <div class="list_menus">
      <div class="menu_head active" data-content="event_card_page">
        <div class="icone_header">
          <img src="{!! url('img/agency/icones_pages_agency/fiche_evnet.svg') !!}" alt="">
        </div>
        <label class="title_menus">{!! trans('staff_future.Event_sheet') !!}</label>
      </div>
      <span class="responsive_dotted"></span>
      <div class="menu_head" data-content="agency_card_page">
        <div class="icone_header">
          <img src="{!! url('img/agency/icones_pages_agency/fiche_agence.svg') !!}" alt="">
        </div>
        <label class="title_menus">{!! trans('staff_future.Agency_sheet') !!}</label>
      </div>
      <span class="responsive_dotted"></span>
      <div class="menu_head" data-content="calendar_page">
        <div class="icone_header">
          <img src="{!! url('img/agency/icones_pages_agency/calendar.svg') !!}" alt="">
        </div>
        <label class="title_menus">{!! trans('staff_future.Calendar') !!}</label>
      </div>
    </div>
</div>

<section class="staff_finished_event"> 
	<div class="page event_card_page" id="event_card_page">
		@include('front.staff.Future_event.event_card')
	</div>
	<div class="page agency_card_page is_hidden" id="agency_card_page">
		@include('front.staff.Future_event.agency_card')
	</div>
	<div class="page hour_facture_page is_hidden" id="calendar_page">
		<section class="calendar_content" data-all_events="{{ route('get_events_by_staff') }}">
			<div id='calendar'></div>
		</section>
	</div>
</section>