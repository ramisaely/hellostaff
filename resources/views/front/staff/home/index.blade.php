<html>
<head>
    <title>Hello Staff</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- Style CSS -->
    {!! Html::style('css/Front/generale/header_mobile.css') !!}
    {!! Html::style('css/Front/staff/home/home.css') !!}
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
    @include('modals.staff.home.connection_home')
<div class="container staff_home">
    <section class="content_logo_staff">
        <div class="container_logo">
            <div class="avatar avatar_home">
                <img class="logo" src="{!! isset(Auth::user()->staff->portrait_pic) ? Auth::user()->staff->getImagePortraitPath() : url('img/login/users_profil.JPG') !!}"></img>
            </div>
            <a href="#"><img class="logo_hello_staff" src="{!! url('img/logo_hello_staff/logo_hello_staff_01.svg') !!}"></img></a>
            <ul class="dropdown_login drop_login">
                <li>
                    <img src="{!! url('img/agency/icones_pages_agency/profil.svg') !!}"></img>
                    <a href="{{ route('update_profil_staff') }}">{!! trans('header_compte.Candidate_Profile') !!}</a>
                </li>
                <li>
                    <img src="{!! url('img/agency/icones_pages_agency/logout.svg') !!}"></img>
                    <a href="{{route('logout_staff')}}">{!! trans('header_compte.Sign_Out') !!}</a>
                </li>
            </ul>
        </div>
    </section>
    <div class="mobile_container">
            <div class="staff_home_menu_item">
                <div class="staff_home_menu_item_content">
                    <div class="redirect_link">
                        <img src="{!! url('img/icones_homes_pages/calendrier_icon.svg') !!}"></img>
                    </div>
                    <div class="href_link">
                         <a href="{{route('staff_calendar')}}">{!! trans('staff_home.Calendar') !!}</a>
                    </div>
                </div>
            </div>
            <div class="staff_home_menu_item">
                <div class="staff_home_menu_item_content">
                    <div class="redirect_link">
                        <img src="{!! url('img/icones_homes_pages/termines_icon.svg') !!}"></img>
                    </div>
                    <div class="href_link">
                        <a href="{{route('finished_event_staff')}}">{!! trans('staff_home.Event_Finished') !!}</a>
                    </div>
                </div>
            </div>
            <div class="staff_home_menu_item">
                <div class="staff_home_menu_item_content">
                    <div class="redirect_link">
                        <img src="{!! url('img/icones_homes_pages/a_venir_icon.svg') !!}"></img>
                    </div>
                    <div class="href_link">
                        <a href="{{route('future_event_staff')}}">{!! trans('staff_home.Upcoming_Event') !!}</a>
                    </div>
                </div>
            </div>
            <div class="staff_home_menu_item">
                <div class="staff_home_menu_item_content">
                    <div class="redirect_link">
                        <img src="{!! url('img/staff/jobs_icon.svg') !!}"></img>
                    </div>
                    <div class="href_link users">
                        <a href="{{ route('job_offer') }}">{!! trans('staff_home.Job_Board') !!}</a>
                    </div>
                </div>
            </div>
            <div class="staff_home_menu_item">
                <div class="staff_home_menu_item_content">
                    <div class="redirect_link">
                        <img src="{!! url('img/staff/factures_icon.svg') !!}"></img>
                    </div>
                    <div class="href_link">
                        <a href="{{ route('staff_bills') }}">{!! trans('staff_home.Invoices') !!}</a>
                    </div>
                </div>
            </div>
            <div class="staff_home_menu_item">
                <div class="staff_home_menu_item_content">
                    <div class="redirect_link">
                        <img src="{!! url('img/staff/evaluations_icon.svg') !!}"></img>
                    </div>
                    <div class="href_link">
                        <a href="{{ route('evaluate') }}">{!! trans('staff_home.Ratings_Reviews') !!}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
