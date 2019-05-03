<!DOCTYPE html>
<html>
<head>
	<title>Hello Staff | Agency pages</title>
	<meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Style CSS SCSS -->
    {!! Html::style('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css') !!}
	{!! Html::style('https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css') !!}
	<!-- Generles -->
	{!! Html::style('css/Front/generale/hello_staff.css') !!}
	{!! Html::style('css/Front/generale/modal.css') !!}
	{!! Html::style('css/Front/generale/range_slider.css') !!}
	{!! Html::style('css/Front/generale/sprite.css') !!}
	{!! Html::style('css/Front/agency/Header/header.css') !!}
	{!! Html::style('css/Front/agency/Header/header_responsive.css') !!}
	{!! Html::style('css/Front/agency/Header/header_slider.css') !!}
	{!! Html::style('css/Front/agency/slider_round/roundslider.min.css') !!}
	<!-- End Generales -->

  	{!! Html::style('https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick.min.css') !!}
  	@toastr_css

	<meta name="csrf-token" content="{{ csrf_token() }}">

	@yield('additional-css')

</head>
<body>
	<div class="master">
	    <div class="head_page">
	      @include('front.agency.layout.header')
	    </div>
	    <div class="pages">
	       @yield('content')
	    </div>
	</div>


	<!--modal-->
		@yield('modal')
	<!--End modal-->

	{!! Html::script('js/Front/jsmin/jquery-3.2.1.min.js') !!}
	{!! Html::script('js/Front/jsmin/jquery.validate.min.js') !!}
  {!! Html::script('https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick.min.js') !!}
	{!! Html::script('js/Front/generale/element.js') !!}
	{!! Html::script('js/Front/home/header.js') !!}
	{!! Html::script('js/Front/generale/jquery-asRange.js') !!}
	{!! Html::script('js/Front/agency/roundslider.min.js') !!}
	@toastr_js
	@toastr_render

	@yield('additional-scripts')

    <script type="text/javascript">
		$( document ).ready(function(){

			$("#language_en").roundSlider({
					value: 10,
					sliderType: "min-range"
			});
			$("#language_fr").roundSlider({
					value: 50,
					sliderType: "min-range"
			});
		});
  	</script>

		@yield('modals')
</body>
</html>
