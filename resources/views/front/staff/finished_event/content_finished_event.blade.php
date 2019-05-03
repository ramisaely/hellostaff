<div class="header_menus staff_finished_event_menus">
  <div class="list_menus">
    <div class="menu_head active" data-content="event_card_page">
      <div class="icone_header">
        <img src="{!! url('img/agency/icones_pages_agency/fiche_evnet.svg') !!}" alt="">
      </div>
      <label class="title_menus">{!! trans('agency_staff.Event_sheet') !!}</label>
    </div>
    <span class="responsive_dotted"></span>
    <div class="menu_head" data-content="agency_card_page">
      <div class="icone_header">
        <img src="{!! url('img/agency/icones_pages_agency/fiche_agence.svg') !!}" alt="">
      </div>
      <label class="title_menus">{!! trans('agency_staff.sheet_Agency') !!}</label>
    </div>
    <span class="responsive_dotted"></span>
    <div class="menu_head" data-content="staff_report_page">
      <div class="icone_header">
        <img src="{!! url('img/agency/icones_pages_agency/compte_rendu.svg') !!}" alt="">
      </div>
      <label class="title_menus">{!! trans('agency_staff.statement') !!}</label>
    </div>
    <span class="responsive_dotted"></span>
    <div class="menu_head" data-content="hour_facture_page">
      <div class="icone_header">
        <img src="{!! url('img/agency/icones_pages_agency/heures.svg') !!}" alt="">
      </div>
      <label class="title_menus">{!! trans('agency_staff.Hours_bills') !!}</label>
    </div>
  </div>
</div>

<section class="staff_finished_event"> 
	<div class="page event_card_page" id="event_card_page">
		@include('front.staff.finished_event.event_card')
	</div>
	<div class="page agency_card_page is_hidden" id="agency_card_page">
		@include('front.staff.finished_event.agency_card')
	</div>
	<div class="page staff_report_page is_hidden" id="staff_report_page">
		@include('front.staff.finished_event.staff_report')
	</div>
	<div class="page hour_facture_page is_hidden" id="hour_facture_page">
		@include('front.staff.finished_event.hour_facture')
	</div>
</section>