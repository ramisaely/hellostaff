<!DOCTYPE html>
<html>
<head>
	<title>Hello Staff | Inscription</title>
	<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	{!! Html::style('css/Front/generale/hello_staff.css') !!}
	{!! Html::style('css/Front/generale/modal.css') !!}
	{!! Html::style('css/Front/generale/range_slider.css') !!}
	{!! Html::style('css/Front/agency/sign_up/agency_registration.css') !!}
	{!! Html::style('css/Front/generale/sprite.css') !!}
	{!! Html::style('css/Front/agency/sign_up/agency_responsive.css') !!}
	{!! Html::style('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css') !!}
	{!! Html::style('https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css') !!}
	<meta name="csrf-token" content="{{ csrf_token() }}">
	@yield('additional-css')
	@toastr_css
</head>
<body>
	<div class="master">
		<div class="sidebar">
			@include('front.agency.layout.sidebar_registration')
		</div>
		<div class="content_wrap" id="content_agency">
			<div class="step_head">
				@include('front.agency.layout.step_nav_registration')
			</div>
			
			<div class="content">
				@include('notifications.alert')
				@yield('content')
				@include('front.agency.layout.footer_registration')
			</div>
		</div>
		
	</div>
	<!--modal-->
	@include('modals.agency.layout.agency_registration_finish')
	@include('modals.agency.layout.term_and_condition')
	@include('modals.agency.layout.corporative_validation')
	@include('modals.agency.layout.description_validation')
	@include('modals.agency.layout.company_logo_validation')
	@include('modals.agency.layout.corporative_validation_en')
	@include('modals.agency.layout.fill')
	@include('modals.waiting.modal_wait')
	<!--End modal-->

	<script type="text/javascript">
		var title_entreprise = "<?php echo trans('agency_register.title_entreprise') ?>";
		var title_identity = "<?php echo trans('agency_register.title_identity') ?>";
		var title_user = "<?php echo trans('agency_register.title_user') ?>";
		
		var text_entreprise = "<?php echo trans('agency_register.text_entreprise') ?>";
		var text_identity = "<?php echo trans('agency_register.text_identity') ?>";
		var text_user = "<?php echo trans('agency_register.text_user') ?>";
		var steve_jobs = "<?php echo trans('agency_register.steve_jobs') ?>";
		var text_user2 = "<?php echo trans('agency_register.text_user2') ?>";
		
		var next = "<?php echo trans('agency_register.next') ?>";
		var finish = "<?php echo trans('agency_register.finish') ?>";
		var image_valid = "<?php echo trans('staff_register.image_valid') ?>";
		
		var varurl;
		
		var textfelicitation = "<?php echo trans('agency_register.textfelicitation') ?>"
		
		var agency_registration_agency = [title_entreprise , title_identity , title_user];
		var text_registration = [text_entreprise,text_identity,text_user];
		var steve_jobs_registration = ['','',steve_jobs];
		var text_user2 = ['','',text_user2];
		console.log(agency_registration_agency);
		
	</script>

	<!-- <script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.min.js"></script> -->

	<!-- jsmin -->
	{!! Html::script('js/Front/jsmin/jquery-3.2.1.min.js') !!}
	{!! Html::script('js/Front/jsmin/jquery.validate.min.js') !!}

	<script src='https://www.google.com/recaptcha/api.js'></script>
	
	{!! Html::script('js/Front/generale/element.js') !!}
	{!! Html::script('js/Front/agency/step_page_agency.js') !!}
	{!! Html::script('js/Front/agency/agency_registration.js') !!}
	{!! Html::script('js/Front/generale/dropzone.js') !!}
	@toastr_js
	@toastr_render
	
	@yield('additional-script')
</body>

</html>
