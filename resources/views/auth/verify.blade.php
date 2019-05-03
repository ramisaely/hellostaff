@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <?php 
            if(Session::has('agencyData')) {
                $agency_data = Session::get('agencyData');
            }
          ?>
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{!! trans('verify_mail.email_verify') !!}</div>
                <a class="dropdown-item" href="{{ route('logout_agency') }}">{!! trans('verify_mail.logout') !!}</a>
                <div class="card-body">
                    @if (session('resent'))
                        <div class="alert alert-success" role="alert">
                            {!! trans('verify_mail.link_verification') !!}
                        </div>
                    @endif
                    {!! trans('verify_mail.first_verification') !!}
                    {!! trans('verify_mail.second_verification') !!}, <a href="{{ route('verification.resend') }}" id="no_modal_click">{!! trans('verify_mail.click_verification') !!}</a>.
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('additionnal_script')
    @if(!(\Cache::has(Auth::user()->user_id)))
        <script type="text/javascript">
            var nameentreprise = $('#data_name_entreprise').val(); 
            $('#entreprise_name_modal').text('' +nameentreprise+ '');
            var pathname2 =  document.referrer;
            var pathname =  location.href;
            console.log("path 1: "+pathname);
            console.log("path 2: "+pathname2);
            var url = pathname.split('/');
            
            if (url[4] == "staff") {
                console.log("staff modal");
                launch_modal('staff_registration_finish');
            }
            if (url[4] == "agency") {
                console.log("agency modal");
                launch_modal('agency_registration_finish');
            
                $('#confirm_agency').click(function() {
                    var route = $('#confirm_agency').attr('data-remove_session');
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        url: route,
                        type : 'GET',
                        success: function(results) { // si l'appel a bien fonctionné
                        }
                    });
                        
                    var modal = $('.footer_modal_finish').closest('.modal');
                	modal.addClass('is_hidden is_visually_hidden');
                	$('.master').removeClass('is_blurred');
                    $('html, body').removeClass('no_scroll');
                        
                    return false; 
                });
            }
        </script>
        <?php \Cache::add(Auth::user()->user_id ,true, now()->addMinutes(1440)); ?>
        @else
        <script>console.log("condition false");</script>
    @endif
@endsection
