<html>
<head>
	<title>Hello Staff</title>
	<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- Style CSS -->
	{!! Html::style('css/Front/generale/header_mobile.css') !!}
	{!! Html::style('css/Front/generale/sprite.css') !!}
	{!! Html::style('css/Front/generale/hello_staff.css') !!}
	{!! Html::style('css/Front/generale/modal.css') !!}
	{!! Html::style('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css') !!}
	{!! Html::style('https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css') !!}
	<!-- Script -->
	{!! Html::script('js/Front/jsmin/jquery-3.2.1.min.js') !!}
	{!! Html::script('js/Front/generale/element.js') !!}
	{!! Html::script('js/Front/home/home.js') !!}

</head>
<body>
	@include('modals.agency.home.connection_home')
<div class="container">
    <section class="content_logo_staff">
        <div class="container_logo">
            <div class="avatar border_first_letter">
                <!-- <img class="logo" src=""></img> -->
								<div class="content_first_letter background_first_letter">
										<label for="" class="color_first_letter first_letter_big"> {{Auth::user()->last_name[0]}} </label>
								</div>
            </div>
            <a href="{{ route('home_agency') }}"><img class="logo_hello_staff" src="{!! url('img/logo_hello_staff/logo_hello_staff_01.svg') !!}"></img></a>
            <ul class="dropdown_login drop_login">
                <li>
                    <img src="{!! url('img/agency/icones_pages_agency/profil.svg') !!}"></img>
                    <a href="{{ route('edit_agency') }}">{!! trans('agency_home.Agency_Profil') !!}</a>
                </li>
                <li>
                    <img src="{!! url('img/agency/icones_pages_agency/logout.svg') !!}"></img>
                    <a href="{{ route('logout_agency') }}">{!! trans('agency_home.Sign_out') !!}</a>
                </li>
            </ul>
        </div>
    </section>
    <div class="mobile_container">
            <div class="header_mobile_calendar">
                <div class="mobile_calendar">
                    <div class="redirect_link calendar">
                        <img src="{!! url('img/icones_homes_pages/calendrier_icon.svg') !!}"></img>
                    </div>
                    <div class="href_link calendrier">
                         <a href="{{route('calendar')}}">{!! trans('agency_home.calendar') !!}</a>
                    </div>
                </div>
            </div>
            <div class="header_event_finish">
                <div class="mobile_event_finish">
                    <div class="redirect_link finish">
                        <img src="{!! url('img/icones_homes_pages/termines_icon.svg') !!}"></img>
                    </div>
                    <div class="href_link finish_new">
                        <a href="{{route('finished_event')}}">{!! trans('agency_home.Event_Finished') !!}</a>
                    </div>
                </div>
            </div>
            <div class="header_mobile_folder">
                <div class="mobile_folder">
                    <div class="redirect_link mobile_folder_open">
                        <img src="{!! url('img/icones_homes_pages/a_venir_icon.svg') !!}"></img>
                    </div>
                    <div class="href_link open">
                        <a href="{{route('future_event')}}">{!! trans('agency_home.Upcoming_Event') !!}</a>
                    </div>
                </div>
            </div>
            <div class="header_event_users">
                <div class="mobile_event_users">
                    <div class="redirect_link mobile_users">
                        <img src="{!! url('img/icones_homes_pages/icon staff.svg') !!}"></img>
                    </div>
                    <div class="href_link users">
                        <a href="{{ route('my_staff') }}">{{-- {!! Auth::user()->agency->first()->name !!}  --}} {!! trans("agency_home.My_staff") !!}</a>
                    </div>
                </div>
            </div>
            <div class="header_mobile_folder">
                <div class="mobile_folder">
                    <div class="redirect_link mobile_folder_open_creat_event">
                        <img src="{!! url('img/icones_homes_pages/btn_creation_event.svg') !!}"></img>
                    </div>
                    <div class="href_link open">
                        <a href="{{ route('create_event') }}">{!! trans('agency_home.Create_event') !!}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
