<div class="content_head_page">
  <div class="content_users">
    <div class="logo_users">
      <div class="avatar avatar_home">
        <!-- <img class="logo" src="{!! Auth::user()->agency->first()->getImageProfilPath() !!}"></img> -->
        <div class="content_first_letter background_first_letter">
            <label for="" class="color_first_letter">{{Auth::user()->last_name[0]}}</label>
        </div>
      </div>
      <label for="name_users" class="name_users">{{ Auth::user()->last_name }}</label>
      <ul class="dropdown_login popup_menus drop_login">
          <li class="agency_modifiers update_profile">
              <img src="{!! url('img/agency/icones_pages_agency/profil.svg') !!}"></img>
              <a href="{{ route('edit_agency') }}" class="title_menu" onclick="return false;">{!! trans('layout_agency.profil_agency') !!}</a>
          </li>
          <li class="agency_modifiers">
              <img src="{!! url('img/agency/icones_pages_agency/logout.svg') !!}"></img>
              <a href="{{ route('logout_agency') }}" class="title_menu" onclick="return false;">{!! trans('layout_agency.Log_out') !!}</a>
          </li>
      </ul>
    </div>
    <div class="logo_page logo_page_for_agency">
      <img class="logo_hello_staff" data-href="{{ route('home_agency') }}" src="{!! url('img/logo_hello_staff/logo_hello_staff_01.svg') !!}"></img>
    </div>
  </div>
<!-- Liste des menus dans un parent menus -->
  <div class="list_menu_page">

    <div class="menus">
      <div class="img_menus img_menus_agency">
        <img class="calendar" src="{!! url('img/icones_homes_pages/calendrier_icon.svg') !!}"></img>
      </div>
      <a href="{{route('calendar')}}" class="title_menu">{!! trans('layout_agency.calendar') !!}</a>
    </div>
    <div class="menus">
      <div class="img_menus img_menus_agency">
        <img class="event_finish" src="{!! url('img/icones_homes_pages/termines_icon.svg') !!}"></img>
      </div>
      <a href="{{route('finished_event')}}" class="title_menu">{!! trans('layout_agency.finish') !!}</a>
    </div>
    <div class="menus upcoming_event">
      <div class="img_menus img_menus_agency">
        <img class="event_venir" src="{!! url('img/icones_homes_pages/a_venir_icon.svg') !!}"></img>
      </div>
      <a href="{{route('future_event')}}" class="title_menu">{!! trans('layout_agency.upcoming_event') !!}</a>
    </div>
    <div class="menus">
      <div class="img_menus img_menus_agency">
        <img class="my_staff" src="{!! url('img/icones_homes_pages/icon staff.svg') !!}"></img>
      </div>
      <a href="{{ route('my_staff') }}" class="title_menu">{{-- {!! Auth::user()->agency->first()->name !!} --}} {!! trans("agency_home.My_staff") !!}</a>
    </div>

    <div class="finish_menu"></div>

    <div class="menus color_responsive_create_event">
      <div class="img_menus img_menus_agency">
        <img class="create_event" src="{!! url('img/icones_homes_pages/btn_creation_event.svg') !!}"></img>
      </div>
      <a href="{{ route('create_event') }}" class="title_menu">{!! trans('layout_agency.creation') !!}</a>
    </div>

  </div>
<!-- End liste des menus -->

  <!-- event version mobile -->
  <div class="responsive_menus_tools">
    <div class="link_create_event_responsive">
      <a type="button" name="" href="{{ route('create_event') }}" class="btn_creation_event_responsive">
        <img class="" src="{!! url('img/icones_creations/create_event_green.svg') !!}"></img>
      </a>
    </div>
    <div class="menus_responsive_btn">
      <span class="click_menus"></span>
      <span class="click_menus_1"></span>
      <span class="click_menus"></span>
    </div>
  </div>
  <!-- event version mobile -->

</div>
