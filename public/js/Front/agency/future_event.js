
$( document ).ready(function(){

  var longueur = $('.statement_agency').find('.wth_description_statement_question').length;
    var long = $('.content_future_event').find('.staff_necessary_update').length;
     window.number_staff_initial = long;
     window.number_question_initial = longueur;

    $('.content_future_event').attr("data-longueur", long);

   /*Changing the future event content according to the event choosed*/
    $('.header_slider').on('click', '.thumbnail', function() {
        var url = $('.content_future_event').attr('data-eventPost');
        var data = $(this).data('id');
        $(this).addClass('active');
        $(this).siblings().removeClass('active');
        $.ajax({
            url: url,
            type : 'POST',
            /*dataType: 'JSON',*/
            data: {idEvent: data},
            beforeSend: function(){
                launch_modal('modal_wait');
            },
            complete: function(){
                $('#modal_wait').addClass('is_hidden');
                $('#modal_wait').addClass('is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');
                $('html, body').scrollTop(window.window_position);
            },
            success : function(response){
                longueur = $('.statement_agency').find('.wth_description_statement_question').length;
                long = $('.content_future_event').find('.staff_necessary_update').length;
                console.log(long);
            },
            error : function(resultat, statut, erreur){
                console.log("Ajax error in the Thumbnail click event with : "+erreur);
            }
        });
    });
    /*End hanging the future event content according to the event choosed*/

    var window_position = window.pageYOffset;

    $('.content_future_event').on('click', '.delete_staff', function(){
        launch_modal("removing_staff_confirmed");
        var candidatId = $(this).closest('.box_shadow_filter').find('.content_liste_staff').data('id');
        var nameStaff = $(this).closest('.action_staff').siblings('.content_liste_staff').find('.name_staff').text();
        var imgStaff = $(this).closest('.action_staff').siblings('.content_liste_staff').find('img').attr('src');
        $('#removing_staff_confirmed').find('.nameStaff').text(nameStaff);
        $('#removing_staff_confirmed').find('.nameStaff').data('candidateId', candidatId);
        $('#removing_staff_confirmed').find('.img_Staff').attr('src', imgStaff);

    });

    $('#removing_staff_confirmed').on('click', '.delete_staff', function(){
        var id_candidate = $('.nameStaff').data('candidateId');
        var url = $(this).data('deletecandidate');
        $.ajax({
            url: url,
            type : 'POST',
            dataType : 'json',
            data: {idCandidate: id_candidate},
            beforeSend: function(){
                launch_modal('modal_wait');
            },
            complete: function(){
                $('#modal_wait').addClass('is_hidden');
                $('#modal_wait').addClass('is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');
                $('html, body').scrollTop(window_position);
            },
            success: function(response)
            {
                // toastr.success('Staff supprimer avec success');
                $('#staff'+id_candidate).remove();
            },
            error: function(response, statut, erreur){
            }
        });
    });

    $('.thumbnail:first').addClass('active');

    var staff_events = [];
    var agency_event = [];

    var content_statement = [];
    $('.content_statement').each(function(i){
      content_statement[i] = $(this).html();
    });
    var content_event_form = $('.content_event_form').html();


    $('.master').on('change', '.input_drop_user', function(){
         $('.statement_agency').find('.boolean').val('1');
    });
    $('.master').on('keyup', '.wth_description_statement_question', function(){
         $('.statement_agency').find('.boolean').val('1');
    });

    $('.master').on('keyup', '.text_drop_new', function(){
         $('.content_event_form').find('.trueOrFalse').val('1');
    });

    $('.master').on('keyup', '.input_create_event', function(){
         $('.content_event_form').find('.trueOrFalse').val('1');
    });

    $('.master').on('keyup', '.text_brief_new', function(){
         $('.content_event_form').find('.trueOrFalse').val('1');
    });

    $('.master').on('click', '.get_btn', function(){
         $('.content_event_form').find('.trueOrFalse').val('1');
    });

    $('.master').on('click', '.separate_icones', function(){
         $('.content_event_form').find('.trueOrFalse').val('1');
    });

    $('.master').on('click', '.choose_color', function(){
         $('.content_event_form').find('.trueOrFalse').val('1');
    });

    postSliderFutureEvent();
    //dateSliderFutureEvent();
    var dataHead = "";
    var dataLong = 0;
	$('.content_future_event').on('click', '.menu_head', function(){

    long =  window.number_staff_initial;
    longueur = window.number_question_initial;

    var dataClass = $(this).data('content');
    console.log(dataClass);
		$('.menu_head').removeClass('active');
		$(this).addClass('active');
    if (dataHead == "event_form" && $('.content_event_form').find('.trueOrFalse').val() == "1" || $('.content_future_event').find('.staff_necessary_update').length != long) {
      if (dataClass != "event_form") {
        launch_modal('modal_change_future_event');
        $('#modal_change_future_event').on('click', '.check_modal_crois', function(){
        $('.master').find('.menu_head').removeClass('active');
        $('.master').find('.event_form_menu').addClass('active');
        $('.future_event>div').addClass('is_hidden');
        $('.event_form_menu').removeClass('is_hidden');
        dataHead = "event_form";
        });
        $('#modal_change_future_event').on('click', '.check_modal', function(){
          $('.master').removeClass('is_blurred');
         $('#modal_change_future_event').addClass('is_hidden is_visually_hidden');
         $('html, body').removeClass('no_scroll');
         $('html, body').scrollTop(window_position);
          dataHead = $('.'+dataClass).data('content');
          $('.content_event_form').html(content_event_form);
          var dataContent = $('.'+dataClass+"_menu").data('content');
          console.log(dataContent);
          $('.future_event>div').addClass('is_hidden');
          $('.'+dataContent).removeClass('is_hidden');
          $('.post_slider').slick('setPosition');
          var slick_active = $('.find_candidates_form').find('.item_jobs_list.active').closest('.description_jobs').data('slick-index');
          $('.post_slider').slick('slickGoTo', parseInt(slick_active));
        });
      }
    }else if (dataHead == "statement" && $('.statement_agency').find('.boolean').val() == "1" || $('.statement_agency').find('.wth_description_statement_question').length != longueur) {
      if (dataClass != "statement") {
        console.log(dataHead);
        console.log("state");
        launch_modal('modal_change_future_event');
        $('#modal_change_future_event').on('click', '.check_modal_crois', function(){
          $('.master').find('.menu_head').removeClass('active');
          $('.master').find('.statement_menu').addClass('active');
          $('.future_event>div').addClass('is_hidden');
          $('.statement_menu').removeClass('is_hidden');
          dataHead = "statement";
        });
        $('#modal_change_future_event').on('click', '.check_modal', function(){
          $('.master').removeClass('is_blurred');
         $('#modal_change_future_event').addClass('is_hidden is_visually_hidden');
         $('html, body').removeClass('no_scroll');
         $('html, body').scrollTop(window_position);
          dataHead = $('.'+dataClass).data('content');
          $('.content_statement').html(content_statement);
          var dataContent = $('.'+dataClass+"_menu").data('content');
          $('.future_event>div').addClass('is_hidden');
          $('.'+dataContent).removeClass('is_hidden');
          $('.post_slider').slick('setPosition');
          var slick_active = $('.find_candidates_form').find('.item_jobs_list.active').closest('.description_jobs').data('slick-index');
          $('.post_slider').slick('slickGoTo', parseInt(slick_active));
          $('.statement_agency').find('.boolean').val("0");
        });
      }
    }else{
    dataHead = $(this).data('content');
    console.log(dataHead);
		var dataContent = $(this).data('content');
		$('.future_event>div').addClass('is_hidden');
		$('.'+dataContent).removeClass('is_hidden');
        $('.post_slider').slick('setPosition');
        var slick_active = $('.find_candidates_form').find('.item_jobs_list.active').closest('.description_jobs').data('slick-index');
        $('.post_slider').slick('slickGoTo', parseInt(slick_active));
    }
	});

});

$(window).on('load',function(){
    $('.container_slider_jobs').removeClass('is_hidden');
});

function postSliderFutureEvent(){
	$('.post_slider').slick({
        prevArrow: $('.prev_post'),
        nextArrow: $('.next_post'),
        infinite: true,
        speed: 300,
        slidesToShow: 2,
        slidesToScroll: 1,
        responsive: [
          {
           breakpoint: 1580,
           settings: {
             slidesToShow: 1,
             slidesToScroll: 1,
             infinite: true,
             dots: false
           }
         },
          {
           breakpoint: 885,
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
function dateSliderFutureEvent(){
    $('.thead_two').slick({
        dots: false,
        prevArrow: $('.prev_facture'),
        nextArrow: $('.next_facture'),
        infinite: true,
        speed: 300,
        slidesToShow: 2,
        slidesToScroll: 1
    });
}
