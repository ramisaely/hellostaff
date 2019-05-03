$(document).ready(function() {

	$('.thumbnail:first').addClass('active');

	$(document).on('click','.menu_head',function() {
		var link = $(this).attr('data-content');
		$('.page').each(function(i, el) {
			if(!$(el).hasClass('is_hidden')) $(el).addClass('is_hidden');
		});
		$('.menu_head').removeClass("active");
		$(this).addClass("active");
		$('#' + link).removeClass('is_hidden');
	});

	/* Fullcalendar initialization */
	$('#calendar').fullCalendar({
	    header: {
	      left: 'prev next today',
	      center: 'title',
	      right: 'agendaDay agendaWeek month'
	    },
	    editable: false,
	    eventLimit: true,
	    locale: 'fr',
	    views: {
	      day:{
	        titleFormat : "MMMM DD, YYYY"
	      }
	    },
	    eventRender : function (event, element, view) {
	      	element.css({
            	"background-image" : "linear-gradient(83deg, #559bf7, #36ccb5)",
            	"height": "40px"
        	});
	      	element.html('<p class="fc-title">'+event.title+'</p>');
	      	element.find(".fc-title").css({
            	"padding-top": "8px",
            	"padding-left": "8px"
	    	});
	    }
	});
	/*End of fullcalendar initialization*/
	
	var allEvents=[];
	var url = $('.calendar_content').attr('data-all_events');
	$.ajax({
	    url: url,
	    type : 'POST',
	    dataType : 'JSON',
	    success: function(results){
	    	if(results['events']) {
			    results['events'].forEach(function(event, index){
			    var address = event.zip_event+" "+event.location_event+" "+event.country_event;
			        allEvents.push({
				        title: event.name,
				        start: event.start_date,
				        end: event.end_date,
				        address: address,
				        description: event.description_fr_event
			        });
			    });
			    $('#calendar').fullCalendar('addEventSource', allEvents);
		    }
		    else {
		    	console.log("Sorry, the database hasn't returned any events!")
		    }
		},
	    error : function(results, statut, erreur){
		    console.log("Failed to request all events form database with : "+erreur);
	    },
	});

	/*Changing the future event content according to the event choosed*/
    $('.header_slider').on('click', '.thumbnail', function() {
        var url = $(this).attr('data-url_event');
        var data = $(this).data('id');
        var dataEventStaff = $(this).attr('data-idEventStaff');
        $(this).addClass('active');
        $(this).siblings().removeClass('active');
        $.ajax({
            url: url,
            type : 'POST',
            /*dataType: 'JSON',*/
            data: {idEvent: data, idEventStaff: dataEventStaff},
            success : function(response){
                $('#staff_future_event_content').html(response["view_event"]);
                console.log('success');
            },
            error : function(resultat, statut, erreur){
                console.log("Ajax error in the Thumbnail click event with : "+erreur);
                console.log(resultat);
            }
        });
    });
    /*End changing the future event content according to the event choosed*/
});

$(window).on('load',function(){
	$('.slackSlider').removeClass('is_hidden');
});