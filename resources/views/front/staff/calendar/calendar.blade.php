@extends('front.staff.layout.master_account')
@section('additional-css')
	{!! Html::style('https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css') !!}
	{!! Html::style('https://use.fontawesome.com/releases/v5.7.0/css/all.css') !!}

	{!! Html::style('css/Front/calendar/pickmeup.css') !!}

	{!! Html::style('css/Front/calendar/fullcalendar.css') !!}
	{!! Html::style('css/Front/calendar/calendar.css') !!}
	{!! Html::style('css/Front/calendar/fullcalendar_responsive.css') !!}
	{!! Html::style('css/Front/fontawesome/fontawesome.min.css') !!}
@endsection
@section('content')

	<section class="calendar_content" data-all_events="{{ route('get_events_by_staff') }}">
		<div id='calendar'></div>
	</section>

@endsection
@section('additional-scripts')
	{!! Html::script('js/Front/calendar/lib/moment.min.js') !!}
	{!! Html::script('js/Front/calendar/lib/fullcalendar.js') !!}
	{!! Html::script('js/Front/calendar/lib/locale-all.js') !!}

	{!! Html::script('js/Front/calendar/jquery.pickmeup.js') !!}

	<script>
	  	$(document).ready(function() {
	  		var pathname = location.href;
		    var url = pathname.split('/');
		    var langue= "fr";
		    if(url[3] == "en"){
		        langue = "en";
		    }
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
					        	image: event.agency.logo,
						        address: address,
						        description: event.description_fr_event
					        });
					    });
					    $('#calendar').fullCalendar('addEventSource', allEvents);
				    }
				    else {
				    	console.log("Sorry, the database haven't returned any events!")
				    }
				},
			    error : function(results, statut, erreur){
				    console.log("Failed to request all events form database with : "+erreur);
				    console.log(results);
			    },
			});

			/* Fullcalendar initialization */
			var calendarView = (window.matchMedia("(max-width: 1023px)").matches)? 'listWeek month' : 'agendaWeek month';

	        $('#calendar').fullCalendar({
	            header: {
	                left: 'prev next today',
	                center: 'title',
	                right: calendarView
	            },
	            editable: false,
	            eventLimit: 2,
	            locale: langue,
	            views: {
	                day:{
	                  titleFormat : "MMMM DD, YYYY"
	                }
	            },
	            eventRender: function (event, element, view) {
				      	element.css({"background-image" : "linear-gradient(83deg, #559bf7, #36ccb5)", "height": "40px"});
				      	element.html('<p class="fc-title">'+ event.title +'</p>');
				      	element.find(".fc-title").css({"padding-top": "8px", "padding-left": "8px"});
				}
			});
			/*End of fullcalendar initialization*/
		});
	</script>
@endsection
