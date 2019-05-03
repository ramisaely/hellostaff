$( document ).ready(function(){
	$(document).on('click','.icones_dropdown',function(){
		// console.log('ok');
		$(this).closest('.listes_jobs').siblings('.dropdown_liste_jobs').toggleClass('is_hidden');
		$(this).closest('.icones_dropdown').find('.icone_play').toggleClass('icone_play_click');
	});
	//showFullcalendar("#calendar_confirmed");
	/*start candidate card*/
	$(document).on('click','.icones_loupe', function() {
		var staff_id = $(this).data('staff_id');
		var url = $(this).data('url');
		$.ajax({
           type: "POST",
           url: url,
           data: {staff_id: staff_id},
           success: function(response)
           {
           		$('.content_candidate_card').removeClass('is_hidden');
           		$('#content_header_slider').addClass('is_hidden');
           		$('.content_future_event').addClass('is_hidden');
              $('.content_finished').addClass('is_hidden');
           		$('.content_candidate_card').html(response);
              $('.candidates_card').find('.color_proposed_jobs').addClass('is_hidden');
           		sliderCandidate();
						  activate_inline_svg("img.svg-inline");
           },
            error: function(error){
                toastr.error("error with: " + error);
           }
        });
	});
})


function sliderCandidate(){
  $('.post_slider_exp').slick({
    dots: false,
    prevArrow: $('.prev_exp'),
    nextArrow: $('.next_exp'),
    infinite: true,
    speed: 400,
    slidesToShow: 4,
    slidesToScroll: 1,
    responsive: [
      {
       breakpoint: 900,
       settings: {
         slidesToShow: 2,
         slidesToScroll: 1,
         infinite: true,
         dots: true
       }
     },
    ]
  });
}

function activate_inline_svg(string){
  $('img.svg-inline').each(function(){
    var $img = jQuery(this);
    var imgID = $img.attr('id');
    var imgClass = $img.attr('class');
    var imgURL = $img.attr('src');
    jQuery.get(imgURL, function(data) {
        /* Get the SVG tag, ignore the rest */
        var $svg = jQuery(data).find('svg');
        /* Add replaced image's ID to the new SVG */
        if(typeof imgID !== 'undefined') {
            $svg = $svg.attr('id', imgID);
        }
        /* Add replaced image's classes to the new SVG */
        if(typeof imgClass !== 'undefined') {
            $svg = $svg.attr('class', imgClass+' replaced-svg');
        }
        /* Remove any invalid XML tags as per http://validator.w3.org */
        $svg = $svg.removeAttr('xmlns:a');
        /* Replace image with new SVG */
        $img.replaceWith($svg);
    }, 'xml');
  });
}
