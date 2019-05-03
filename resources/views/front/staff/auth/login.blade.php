<!DOCTYPE html>
<html class="full_vh">
<head>
	<title>Hello Staff | Login</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	{!! Html::style('css/Front/generale/hello_staff.css') !!}
	{!! Html::style('css/Front/generale/sprite.css') !!}
	{!! Html::style('css/Front/login/login.css') !!}
	{!! Html::style('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css') !!}
	{!! Html::style('https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css') !!}
	@toastr_css
</head>
<body class="full_vh">
	<span class="language_site">
		<div class="checkbox">
			<input type="checkbox" id="fr_site" data-val="fr" class="change_language">
			<label class="french checkbox_label language_not_radio_fr" for="fr_site">Français</label>
		</div>
		<div class="checkbox">
			<input type="checkbox" id="en_site" data-val="en" class="change_language">
			<label class="english checkbox_label language_not_radio_en" for="en_site">English</label>
		</div>
	</span>
	<div class="login full_vh">
		<a class="logo" href="{{ url('/') }}"><img src="{!! url('img/logo_hello_staff/logo_hellostaff_index.svg') !!}"></img></a>
	    <!-- <a class="logo" href="{{ url('/') }}"><img src="{!! url('img/logo-helloStaff.svg') !!}"></img></a> -->
	    <section class="login_title">
	        <h1>{!! trans('auth.login') !!}</h1>
	        <p>{!! trans('auth.new_user') !!}&nbsp;&nbsp;&nbsp; <a href="{{ route('register_staff') }}" class="green">{!! trans('auth.sign_up') !!}</a></p>
	    </section>

	    @include('notifications.alert')

	    <div class="content_login_user">
	    	<section class="btn_reso_socio">
				<div class="login_fb">
					<div class="login_icon f_fb">
						f
					</div>
					<div class="text_fb">
						<span>{!! trans('auth.continue') !!}&nbsp; </span><span> {!! trans('auth.with') !!}&nbsp; </span><span> Facebook</span>
					</div>
				</div>
				<div class="login_gplus">
					<div class="login_icon g_gplus">
						G+
					</div>
					<div class="text_gplus">
						<span>{!! trans('auth.continue') !!}&nbsp;</span><span> {!! trans('auth.with') !!}&nbsp;</span><span> Google</span>
					</div>
				</div>
			</section>
			<section class="or_separation">
				<fieldset><legend>{!! trans('auth.or') !!}</legend></fieldset>
			</section>

			<section class="form_login_user">
				<form action="{{ route('post_login_staff') }}" method="POST" class="form_login">
					@csrf
					<div class="form_item_login">
						<label class="green" for="">Email</label>
						<input type="text" class="input_login_user required" name="email" placeholder="{!! trans('auth.your_mail') !!}" autocomplete="off" data-msg="{!! trans('staff_register.invalid_field') !!}"/>
					</div>
					<!--<div class="form_item_login">
						<label class="green" for="">Mot de passe</label>
						<input type="password" class="input_login_user" name="password" placeholder="Votre mot de passe" autocomplete="off"/>
					</div>-->
					<div class="form_item_login">
						<label class="green" for="">{!! trans('auth.password') !!}</label>
						<div class="input_group">
							<input class="green" type="password" placeholder="{!! trans('auth.your_password') !!}" name="password" id="password" data-msg="{!! trans('staff_register.invalid_field') !!}">
							<span class="input_addon background_no_view" onclick="showPassword(this)"></span>
						</div>
					</div>
					<section class="action_password">
						<div class="checkbox">
							<input type="checkbox" id="remember_me" class="remember_me">
							<label class="checkbox_label" for="remember_me">{!! trans('auth.remember_me') !!}</label>
						</div>
						<a href="{{ route('password.request') }}">{!! trans('auth.forgot_pass') !!}</a>
					</section>
					<div class="footer">
				    	<button  class="step_btn" id="nextBtn" >{!! trans('auth.login') !!}</button>
				    	<button type="submit" id="click_me" class="is_hidden"></button>
				    </div>
				</form>
			</section>
	    </div>


	<section><div class="scroll_view_login"></div></section>
	</div>
	<!-- <script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script> -->
	{!! Html::script('js/Front/jsmin/jquery-3.2.1.min.js') !!}
	{!! Html::script('js/Front/jsmin/jquery.validate.min.js') !!}
	{!! Html::script('js/Front/generale/element.js') !!}
	{!! Html::script('js/Front/login/login.js') !!}
	@toastr_js
	@toastr_render
</html>
