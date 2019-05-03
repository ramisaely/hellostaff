<!DOCTYPE html>
<html>
<head>
	<title>Hello Staff | Inscription</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="csrf_token" content="{{csrf_token()}}" />
	{!! Html::style('css/Front/generale/hello_staff.css') !!}
	{!! Html::style('css/Front/staff/sign_up/staff_registration.css') !!}
	{!! Html::style('css/Front/generale/modal.css') !!}
	{!! Html::style('css/Front/generale/range_slider.css') !!}
	{!! Html::style('css/Front/generale/sprite.css') !!}
	{!! Html::style('css/Front/staff/sign_up/staff_responsive.css') !!}
	{!! Html::style('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css') !!}
	{!! Html::style('https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css') !!}
	@toastr_css

	@yield('additional-css')
</head>
<body>
	<div class="master">
		<div class="content_wrap">
			@include('front.staff.layout.header_registration')
			@include('front.staff.layout.step_nav_registration')
			<div class="content">
				@yield('content')
			</div>
		</div>
		@include('front.staff.layout.footer_registration')
	</div>
	<!-- modals -->
	@include('modals.staff.layout.term_and_condition')
	@include('modals.staff.layout.staff_registration_finish')
	@include('modals.staff.layout.define_experience')
	@include('modals.staff.layout.validation_message')
	@include('modals.staff.layout.language_validation')
	@include('modals.staff.layout.attribut_validation')
	@include('modals.staff.layout.mobility_validation')
	@include('modals.staff.layout.photo_cv_validation')
	@include('modals.staff.layout.certificat_validation')
	@include('modals.staff.layout.mail_validation')
	@include('modals.staff.layout.remuneration_validation')
	@include('modals.staff.layout.remuneration1_validation')
	@include('modals.staff.layout.appareil_photo')
	@include('modals.staff.layout.appareil_photo_plain')
	
	<!-- scripts -->
	
	<script type="text/javascript">
		var title_contact = "<?php echo trans('staff_register.title_contact_information') ?>";
		var title_jobs = "<?php echo trans('staff_register.title_jobs') ?>";
		var title_language = "<?php echo trans('staff_register.title_language') ?>";
		var title_certification = "<?php echo trans('staff_register.title_certification') ?>";
		var title_attribut = "<?php echo trans('staff_register.title_attribut') ?>";
		var title_remuneration = "<?php echo trans('staff_register.title_remuneration') ?>";
		var title_mobility = "<?php echo trans('staff_register.title_mobility') ?>";
		var title_photo = "<?php echo trans('staff_register.title_photo') ?>";
		
		var staff_registration_title = [title_contact, title_jobs, title_language, title_certification, title_attribut, title_remuneration, title_mobility, title_photo];
		
		var btn_next = "<?php echo trans('staff_register.next') ?>";
		var btn_finish = "<?php echo trans('staff_register.finish') ?>";
		var idInput = "";
		var valueInput = "";
		var $data_value = "no";
		
		var varurl=location.href.split('/');
		
		var post_position = "<?php echo trans('staff_register.post_position_text') ?>";
		
		var image_valid = "<?php echo trans('staff_register.image_valid') ?>";
		var document_valid = "<?php echo trans('staff_register.document_valid') ?>";
		
		var choice_attribut = "<?php echo trans('staff_register.choice') ?>";
		
	</script>
	<!-- <script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.min.js"></script> -->
	<!-- jsmin -->
	{!! Html::script('js/Front/jsmin/jquery-3.2.1.min.js') !!}
	{!! Html::script('js/Front/jsmin/jquery.validate.min.js') !!}
	@toastr_js
	@toastr_render

	<!-- <script src='https://www.google.com/recaptcha/api.js'></script>
	<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/webcamjs/1.0.25/webcam.min.js"></script> -->

	<!-- jsmin -->
	{!! Html::script('js/Front/jsmin/jquery-3.2.1.min.js') !!}
	{!! Html::script('js/Front/jsmin/jquery.validate.min.js') !!}
	<!-- end jsmin -->
	{!! Html::script('js/Front/generale/element.js') !!}
	{!! Html::script('js/Front/staff/step_page.js') !!}
	{!! Html::script('js/Front/generale/range_slider.js') !!}
	{!! Html::script('js/Front/staff/staff_registration.js') !!}
	{!! Html::script('js/Front/modals/appareil_photo.js') !!}
	{!! Html::script('js/Front/modals/appareil_photo_plain.js') !!}
	{!! Html::script('js/Front/generale/ga.js') !!}
	<!--{!! Html::script('js/webcam.js') !!}-->
	<!--{!! Html::script('js/webcam.min.js') !!}-->
	@yield('additional-script')
</body>

</html>
