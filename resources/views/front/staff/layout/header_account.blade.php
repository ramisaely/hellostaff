<div class="content_head_page header_account">
  <div class="content_users">
    <div class="logo_users">
      <div class="avatar avatar_home">
        <img class="logo" src="{!! isset(Auth::user()->staff->portrait_pic) ? Auth::user()->staff->getImagePortraitPath() : url('img/login/users_profil.JPG') !!}"></img>
      </div>
      <label for="name_users" class="name_users">{{Auth::user()->first_name}}</label>
      <ul class="dropdown_login popup_menus drop_login">
          <li class="staff_modifiers update_profile_staff">
              <img src="{!! url('img/agency/icones_pages_agency/profil.svg') !!}"></img>
              <a href="{{ route('update_profil_staff') }}" class="title_menu" onclick="return false;">{!! trans('header_compte.Candidate_Profile') !!}</a>
          </li>
          <li class="staff_modifiers">
              <img src="{!! url('img/agency/icones_pages_agency/logout.svg') !!}" onclick="return false;"></img>
              <a href="{{route('logout_staff')}}">{!! trans('header_compte.Sign_Out') !!}</a>
          </li>
      </ul>
    </div>
    <div class="logo_page logo_page_for_staff">
      <img class="logo_hello_staff" data-href="{!! route('home_staff') !!}" src="{!! url('img/logo_hello_staff/logo_hello_staff_01.svg') !!}"></img>
    </div>
  </div>
<!-- Liste des menus dans un parent menus -->
  <div class="list_menu_page">

    <a href="{{route('staff_calendar')}}"  class="menus" onclick="return false;">
      <div class="img_menus img_menus_staff">
        <img class="calendar" src="{!! url('img/icones_homes_pages/calendrier_icon.svg') !!}"></img>
      </div>
      <span class="title_menu">{!! trans('header_compte.Calendar') !!}</span>
    </a>

    <a href="{{route('finished_event_staff')}}" class="menus" onclick="return false;">
      <div class="img_menus img_menus_staff">
        <img class="event_finish" src="{!! url('img/icones_homes_pages/termines_icon.svg') !!}"></img>
      </div>
      <span class="title_menu">{!! trans('header_compte.finish') !!}</span>
    </a>

    <a href="{{route('future_event_staff')}}" class="menus" onclick="return false;">
      <div class="img_menus img_menus_staff">
        <img class="event_venir" src="{!! url('img/icones_homes_pages/a_venir_icon.svg') !!}"></img>
      </div>
      <span class="title_menu">{!! trans('header_compte.Upcoming_Event') !!}</span>
    </a>

    <a href="{{ route('job_offer') }}" class="menus" onclick="return false;">
      <div class="img_menus img_menus_staff">
        <img class="my_staff" src="{!! url('img/staff/jobs_icon.svg') !!}"></img>
      </div>
      <span class="title_menu">{!! trans('header_compte.Job_Board') !!}</span>
    </a>

    <a href="{{ route('staff_bills') }}" class="menus" onclick="return false;">
      <div class="img_menus img_menus_staff">
        <img class="my_staff" src="{!! url('img/staff/factures_icon.svg') !!}"></img>
      </div>
      <span class="title_menu">{!! trans('header_compte.Invoices') !!}</span>
    </a>

    <a href="{{ route('evaluate') }}" class="menus" onclick="return false;">
      <div class="img_menus img_menus_staff">
        <img class="my_staff" src="{!! url('img/staff/evaluations_icon.svg') !!}"></img>
      </div>
      <span class="title_menu">{!! trans('header_compte.Ratings_Reviews') !!}</span>
    </a>

  </div>
<!-- End liste des menus -->

  <!-- event version mobile -->
  <div class="responsive_menus_tools">
    <div class="menus_responsive_btn">
      <span class="click_menus"></span>
      <span class="click_menus_1"></span>
      <span class="click_menus"></span>
    </div>
  </div>
  <!-- event version mobile -->

</div>
