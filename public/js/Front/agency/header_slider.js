$( document ).ready(function(){
	$('.header_slider').slick({
		dots: false,
		prevArrow: $('.prev'),
		nextArrow: $('.next'),
		infinite: true,
		speed: 400,
		slidesToShow: 7,
		slidesToScroll: 1,
		responsive: [
			{
	      breakpoint: 1024,
	      settings: {
	        slidesToShow: 6,
	        slidesToScroll: 1,
	        infinite: true,
	        dots: false
	      }
	    },
			{
	      breakpoint: 900,
	      settings: {
	        slidesToShow: 5,
	        slidesToScroll: 1,
	        infinite: true,
	        dots: false
	      }
	    },
			{
				breakpoint: 600,
				settings: {
					slidesToShow: 4,
					slidesToScroll: 1,
					infinite: true,
					dots: false
				}
			},
			{
				breakpoint: 400,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1,
					infinite: true,
					dots: false
				}
			},
		]
	});
});

$(window).on('load',function(){
	$('.slackSlider').removeClass('is_hidden');
});