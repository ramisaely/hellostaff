$(document).ready(function(){

    var langue = getLanguage();

	moment.locale(langue);
	var window_position = window.pageYOffset;
	initializeButtons();

	/* listing users */
	$('.content').on('click','.checkbox_users',function(){
		var users = '';
		var users_id = '';
	    if(!$(this).hasClass('active')){
		    $(this).addClass('me');
		    window_position = window.pageYOffset;
		    launch_modal('modal_creat');
	    }
	    else {
	    	if (!$(this).hasClass('priory')) {
			    $(this).removeClass('active');
			    $(this).closest('ul').find('.checkbox_users').each(function(i, el){
			        if($(this).hasClass('active')){
			        	users = users + $(this).siblings().find('.name_users').text() + ', ';
			        	users_id = users_id + $(this).siblings().find('.name_users').attr('data-id') + ',';
			        }
			    });

			    if(users.length > 0 && users_id.length > 0){
			    	users = users.substring(0, users.length - 2);
			    	users_id = users_id.substring(0, users_id.length - 1);
			    }

		    	$(this).siblings().find('.name_users .active').attr('data-id');
		     	$(this).closest('ul').siblings('.input_drop_user').val(users);
		     	$('.content_future_event').find('.input_drop_user').val(users);
		     	/*val input hidden*/
		     	$(this).closest('ul').siblings('.input_id_user').val(users_id);
		     	$('.content_future_event').find('.input_id_user').val(users_id);
		    }
	    }
	});

	$('#modal_creat').on('click', '.check_modal_user', function(){
	    $('ul').find('.me').addClass('active');
	    $('ul').find('.me').removeClass('me');
	    var users = '';
	    var users_id = '';
	    $('ul.dropdown_users').find('.checkbox_users').each(function(i, el){
	        if($(this).hasClass('active')){
	         	users = users + $(this).siblings().find('.name_users').text() + ', ';
	         	users_id = users_id + $(this).siblings().find('.name_users').attr('data-id') + ',';
	        }
	    });
	    if(users.length > 0 && users_id.length > 0){
	     	users = users.substring(0, users.length - 2);
	     	users_id = users_id.substring(0, users_id.length - 1);
	    }
	    $('.input_drop_user').val(users);
	    $('.input_id_user').val(users_id);
	    close_modal("modal_creat");
	});

  	$('.check_modal_crois').on('click',function(){
	    close_modal("modal_creat");
	});
	/* end listing users */


	var staff_events = [];
	/*var agency_event = [];*/


	/* Fullcalendar initialization */
	var calendarView = (window.matchMedia("(max-width: 1023px)").matches)? 'agendaDay listWeek month' : 'agendaDay agendaWeek month';
    $('#calendar').fullCalendar({
        header: {
            left: 'prev next today',
            center: 'title',
            right: calendarView
        },
        editable: false,
        eventLimit: true,
        locale: langue,
        views: {
            day:{
              titleFormat : "MMMM DD, YYYY"
            }
        },
        eventRender: function (event, element, view) {
        	element.css({'background-image': event.linearGradient, "color": "white"});
        	if (view.type != "listWeek") {
            	var start_hour = ((event.start.format("hh") == "12") && (event.start.format("a") == "am"))? "00:"+event.start.format("mm")+" am" : event.start.format("hh:mm a");
				var end_hour = ((event.end.format("hh") == "12") && (event.end.format("a") == "am"))? "00:"+event.end.format("mm")+" am" : event.end.format("hh:mm a");
            	element.html('<div class="fc-title">' + start_hour + ' - ' + end_hour + '<br>' + event.title + '</div>');
        	}
        }
    });
    /* End Fullcalendar initialization */

    $('.content').on('click','.dropdown-menu',function(){
    	$(this).find('ul').toggle();
    });

    $('.content').on('click','.dropdown-menu-event',function(){
    	$(this).find('ul').toggle();
    });

    $('.content').on('click','ul li', function(){
    	$(this).closest('.dropdown-menu').find('input').val($(this).text());
    	$(this).closest('.dropdown-menu-event').find('input').val($(this).text());
    	validate_dropdown(this);
    });
    $('.content').on({
	    mouseleave: function(){
	        $('.content').find('ul').hide();
	    }
	}, 'ul');

	/* Form validation on change */
	$('.content').on('change', '.input_hidden', function(){
		$(this).closest('.photo_event_content').css('border','');
	});

	$('.content').on('change', '#name', function(){
		/*$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");*/
		if($('#name').val() == "" || $('#name').val().length < 3){
			$('#name').closest('.form_item_create_event').addClass('error');
			$('#name').siblings('.error').removeClass('is_hidden');
			$('#name').focus();
			$(".addition").off("click");
			if(langue == "en"){
    			toastr.error('Please enter at least two letter!');
    		} else {
    			toastr.error('Veuillez entrer au minimum deux lettre!')
    		}
		} else {
			$('#name').closest('.form_item_create_event').removeClass('error');
			$('#name').siblings('.error').addClass('is_hidden');
		}
	});

	$('.content').on('change', '#location_event', function(){
		/*$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");*/
		if($("#location_event").val() == "" || $(this).val().length < 3 ){
			$("#location_event").closest('.form_item_create_event').addClass('error');
			$('#location_event').siblings('.error').removeClass('is_hidden');
			$('#location_event').focus();
			$(".addition").off("click");
			if(langue == "en"){
    			toastr.error('Please enter a valid location!');
    		} else {
    			toastr.error('Veuillez entrer un emplacement valide!')
    		}
		} else {
			$("#location_event").closest('.form_item_create_event').removeClass('error');
			$('#location_event').siblings('.error').addClass('is_hidden');
		}
	});

	$('.content').on('change', '#zip_event', function(){
		var zipCode = /^[a-zA-Z][0-9][a-zA-Z]\s*[0-9][a-zA-Z][0-9]/;
		/*$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");*/
		if(!zipCode.test($('#zip_event').val())){
			$('#zip_event').closest('.form_item_create_event').addClass('error');
			$('#zip_event').closest('.label_create_event ').siblings('.error').removeClass('is_hidden');
			$('#zip_event').focus();
			$(".addition").off("click");
    		if(langue == "en"){
    			toastr.error('Please enter a valid zip code!');
    		} else {
    			toastr.error('Veuillez entrer un code postal valide!')
    		}
		} else {
			$('#zip_event').closest('.form_item_create_event').removeClass('error');
			$('#zip_event').closest('.label_create_event ').siblings('.error').addClass('is_hidden');
		}
	});

	$('.content').on('change','.emplacement',function(){
		/*$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");*/
		if($(this).val() == "" || $(this).val().length <3){
			$(this).closest('.form_item_create_event').addClass('error');
			$(this).siblings('.error').removeClass('is_hidden');
			$(this).focus();
			$(".addition").off("click");
			if(langue == "en"){
    			toastr.error('Please enter a valid location!');
    		} else {
    			toastr.error('Veuillez entrer un emplacement valide!')
    		}
		} else {
			$(this).closest('.form_item_create_event').removeClass('error');
			$(this).siblings('.error').addClass('is_hidden');
		}
	});

	$('.content').on('change','.postal',function(){
		var zipCode = /^[a-zA-Z][0-9][a-zA-Z]\s*[0-9][a-zA-Z][0-9]/;
		/*$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");*/
		if(!zipCode.test($(this).val())){
			$(this).closest('.form_item_create_event').addClass('error');
			$(this).closest('.label_create_event ').siblings('.error').removeClass('is_hidden');
			$(this).focus();
			$(".addition").off("click");
    		if(langue == "en"){
    			toastr.error('Please enter a valid zip code!');
    		}
    		else{
    			toastr.error('Veuillez entrer un code postal valide!')
    		}
		}else{
			$(this).closest('.form_item_create_event').removeClass('error');
			$(this).closest('.label_create_event ').siblings('.error').addClass('is_hidden');
		}
	});

	$('.content').on('change','.text_brief_new',function(){
		/*$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");*/
		if($(this).val() == ""){
			$(this).closest('.description_event').css('border','1px solid red');
			$(this).focus();
			$(".addition").off("click");
			if(langue == "en"){
    			toastr.error('Please enter a description!');
    		}
    		else{
    			toastr.error('Veuillez entrer une description!')
    		}
		}else{
			$(this).closest('.description_event').css('border','');
		}
	});

	$('.content').on('change','.hourly_rate',function(){
		/*$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");*/
		if ($(this).val() < 12) {
			$(this).val(12);
			if(langue == "fr")
				toastr.warning('Veuillez entrer un nombre supérieur à 12!');
			else
				toastr.warning('Please enter a number greater than 12!');
		} else {
			$(this).closest('.dropdown_cage').css('border','');
		}
	});
	/* End Form validation on change */

	/* Reactive the Validate button on change of all input in staff necessary */
	$('.content').on('change','.staff_necessary input',function(){
		$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");
	});

	$('.content').on('change','.staff_necessary textarea',function(){
		$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");
	});

	$(".content").on("click", ".staff_necessary li", function(){
		$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");
	});
	/* End of reactiving the Validate button */

	/* Action bouton terminer */
	$(document).on('click','.finish', function(){
		var isValid = true;
		if (!validateCreateEvent())
			isValid = false;
		if (!validateAllStaff())
			isValid = false;

		if (isValid) {
			launch_modal("confirm_finish");
			/*$('#click_me').trigger('click');*/
		} else {
			if(langue == "en"){
				toastr.error('Error required fields')
			} else {
				toastr.error('Erreur champs requis')
			}
		}
	});
	/* End action bouton "terminer"*/

	$("#confirm_finish").on("click", ".submit", function() {
		$('#click_me').trigger('click');
	});

	$(".content").on("click", ".validate", function () {
		if(validateStaff($(this).closest(".staff_necessary"))) {
			if(!$(this).hasClass("isValid")) {
				// if(langue == "en")
				// 	toastr.success('All the necessary information about the positions are valid!')
				// else
				// 	toastr.success('Toutes les informations necessaires sur les postes sont valides!')
				$(this).addClass("isValid");
			}
			if(AllValidateButtonIsValid())
				additionOnClick();
			else {
				if(langue == "en"){
					toastr.info('Please validate all other posts!')
				} else {
					toastr.info('Veuillez valider les autres postes!')
				}
			}
		}
		else {
			if(langue == "en"){
				toastr.error('Please complete the required fields!')
			}else{
				toastr.error('Veuillez completer les champs requis!')
			}
		}
	});

	/** image **/
	$("#img_event").click(function(){
        $('.content').find('.input_hidden').trigger("click");
	});

	 /** drag and drop file **/
	$(document).on('dragenter', '.photo_event', function() {
        $(this).css('border', '2px dashed red');
        return false;
    });

    $(document).on('dragover', '.photo_event', function(e){
        e.preventDefault();
        e.stopPropagation();
        $(this).css('border', '2px dashed red');
        return false;
    });

    $(document).on('dragleave', '.photo_event', function(e) {
        e.preventDefault();
        e.stopPropagation();
        $(this).css('border', '1px dashed #BBBBBB');
    	return false;
    });

    $(document).on('drop', '.photo_event', function(e) {
    	if(e.originalEvent.dataTransfer){
	        if(e.originalEvent.dataTransfer.files.length) {
	            e.preventDefault();
	            e.stopPropagation();
	            $(this).css('border', '1px dashed green');
	            upload(e.originalEvent.dataTransfer.files);
	            //readURLLogo(e.originalEvent.dataTransfer.files);
	        }
    	}
    	else
        	$(this).css('border', '1px dashed #BBBBBB');
      	return false;
	});
    /**End drag and drop file*/

	$('.content').on('click','.content_color_bouton .choose_color',function() {
		var color_code = $(this).data('color');
		var staff_indice = getStaffIndice($(this).closest(".staff_necessary"));
		switch (color_code)	 {
			case "purple":
				$(this).closest('.content_color_bouton').siblings().find('[data-attr=color]').attr('class', 'circle_create_event_purple');
				$(this).attr('class', 'choose_color purple purple-active');
				$(this).siblings().removeClass('blue_sky-active green-active orange-active blue-active');
				$(this).closest('.color_choose').find('.input_color').val(linear_gradient("purple"));
				$(this).closest('.staff_necessary').find('.color_tab').val(linear_gradient("purple"));
				if ((staff_events[staff_indice]) && staff_events[staff_indice].events[0].linearGradient != linear_gradient("purple")){
					$('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
					staff_events[staff_indice].events.forEach( function(item, index, events){
						events[index].linearGradient = linear_gradient("purple");
					});
					$('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
				}
				break;
			case "blue_sky":
				$(this).closest('.content_color_bouton').siblings().find('[data-attr=color]').attr('class', 'circle_create_event_blue');
				$(this).attr('class', 'choose_color blue_sky blue_sky-active');
				$(this).siblings().removeClass('purple-active green-active orange-active blue-active');
				$(this).closest('.color_choose').find('.input_color').val(linear_gradient("blue_sky"));
				$(this).closest('.staff_necessary').find('.color_tab').val(linear_gradient("blue_sky"));
				if ((staff_events[staff_indice]) && staff_events[staff_indice].events[0].linearGradient != linear_gradient("blue_sky")){
					$('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
					staff_events[staff_indice].events.forEach( function(item, index, events){
						events[index].linearGradient = linear_gradient("blue_sky");
					});
					$('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
				}
				break;
			case "green":
				$(this).closest('.content_color_bouton').siblings().find('[data-attr=color]').attr('class', 'circle_create_event_green');
				$(this).attr('class', 'choose_color green green-active');
				$(this).siblings().removeClass('blue_sky-active purple-active orange-active blue-active');
				$(this).closest('.color_choose').find('.input_color').val(linear_gradient("green"));
				$(this).closest('.staff_necessary').find('.color_tab').val(linear_gradient("green"));
				if ((staff_events[staff_indice]) && staff_events[staff_indice].events[0].linearGradient != linear_gradient("green")){
					$('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
					staff_events[staff_indice].events.forEach( function(item, index, events){
						events[index].linearGradient = linear_gradient("green");
					});
					$('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
				}
				break;
			case "orange":
				$(this).closest('.content_color_bouton').siblings().find('[data-attr=color]').attr('class', 'circle_create_event_red');
				$(this).attr('class', 'choose_color orange orange-active');
				$(this).siblings().removeClass('blue_sky-active green-active purple-active blue-active');
				$(this).closest('.color_choose').find('.input_color').val(linear_gradient("orange"));
				$(this).closest('.staff_necessary').find('.color_tab').val(linear_gradient("orange"));
				if ((staff_events[staff_indice]) && staff_events[staff_indice].events[0].linearGradient != linear_gradient("orange")){
					$('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
					staff_events[staff_indice].events.forEach( function(item, index, events){
						events[index].linearGradient = linear_gradient("orange");
					});
					$('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
				}
				break;
			case "blue":
				$(this).closest('.content_color_bouton').siblings().find('[data-attr=color]').attr('class', 'circle_create_event_blue_fonce');
				$(this).attr('class', 'choose_color blue blue-active');
				$(this).siblings().removeClass('blue_sky-active green-active orange-active purple-active');
				$(this).closest('.color_choose').find('.input_color').val(linear_gradient("blue"));
				$(this).closest('.staff_necessary').find('.color_tab').val(linear_gradient("blue"));
				if ((staff_events[staff_indice]) && staff_events[staff_indice].events[0].linearGradient != linear_gradient("blue")){
					$('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
					staff_events[staff_indice].events.forEach( function(item, index, events){
						events[index].linearGradient = linear_gradient("blue");
					});
					$('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
				}
				break;
		}
	});

	/* Add Staff necessary */
	$(".addition").off("click");
	function additionOnClick () {
		$('.content').one('click','.addition', function() {
			if (AllValidateButtonIsValid()) {
				var clone = $('.staff_necessary:last').clone();
				var attr = parseInt($('.staff_necessary:last').find('.number_title').text()) + 1;
				clone.find('.number_title').text(attr);
				clone.find('input').each( function(){
					var nameStr = $(this).attr('name');
					nameStr = nameStr.replace(/[0-9]+/, attr-2);
					$(this).attr('name', nameStr);
					$(this).not(".choose_color").val("");
				});
				clone.find('textarea').each( function(){
					var nameStrText = $(this).attr('name');
					nameStrText = nameStrText.replace(/[0-9]+/, attr-2);
					$(this).attr('name', nameStrText);
					$(this).val("");
				});
				clone.find(".date_horaire_create_event").remove();
				/*clone.find(".post").attr("data-previous_val", "");*/
				clone.find('.validate').removeClass("isValid");
				clone.insertAfter('.staff_necessary:last');
				$('.divspecial').remove();
				initializeButtons();
				var color = getNewStaffColor();
				$("."+color+":last").trigger("click");
		    } else {
				if(langue == "en"){
					toastr.error('Please validate all staffs first!')
				}else{
					toastr.error("Veuillez d'abord valider tous les staffs!")
				}
			}
	    });
    }
    /* End of Staff necessaire addition */

    /* Suppression staff necessaire */
	$('.content').on('click','.delete', function(){
       	if (($('.staff_necessary').length != 1) || $(this).siblings('.validate').hasClass("isValid")){
       		launch_modal("confirm_removing_post");
       		confirmRemoveOnClick($(this).closest(".staff_necessary"));
	    }
	});

	function confirmRemoveOnClick(staff_necessary) {
		$(".check_modal_removing").one("click", staff_necessary, function() {
			var staff_indice = getStaffIndice(staff_necessary);
			var post = staff_necessary.find(".post").val();
	   		if(staff_events) {
	       		$('#calendar').fullCalendar('removeEventSources', staff_events);
	       		staff_events.splice(staff_indice, 1);
	       		staff_events.forEach(function(source, index){
	       			$('#calendar').fullCalendar('addEventSource', source);
	       		});
	        }
	        if ($('.staff_necessary').length == 1){
	        	/*$(".staff_necessary").each(function(){
					$(this).find(".postStaff").each(function(){
						if ($(this).text() == post)
							$(this).show();
					});
				});*/
	        	$('input').each( function(){
					$(this).not(".choose_color").val("");
				});
				$('textarea').each( function(){
					$(this).val("");
				});
				$(".date_horaire_create_event").remove();
				/*$(".post").attr("data-previous_val", "");*/
				$(".validate").removeClass("isValid");
	        } else {
			    staff_necessary.remove();
		        $('.staff_necessary').each(function(i) {
		            $(this).find('.number_title').text(i+2);
		            $(this).find('input').each( function(){
						var nameStr = $(this).attr('name');
						nameStr = nameStr.replace(/[0-9]+/, i);
						$(this).attr('name', nameStr);
					});
					$(this).find('textarea').each( function(){
						var nameStrText = $(this).attr('name');
						nameStrText = nameStrText.replace(/[0-9]+/, i);
						$(this).attr('name', nameStrText);
					});
					/*$(this).find(".postStaff").each(function(){
						if ($(this).text() == post)
							$(this).show();
					});*/
		        });
	        }
	        initializeButtons();
	        if(AllValidateButtonIsValid())
				additionOnClick();
		    close_modal("confirm_removing_post");
		});
	}
    //toggle dropdown list for zone
    $(".content").on("click", ".zone_label", function(){
        $(this).siblings("ul").toggle();
    });

    //Icone down arrow event for zone
    $(".content").on("click", ".icone_down_arrow", function(){
		$(this).siblings(".form_zone").find("ul").toggle();
	});

	//Icone down arrow event for jobs
	$(".content").on("click", ".jobs_icone_down", function(){
		$(this).siblings(".form_zone").find("ul").toggle();
	});

	//Dropdown element function
	$(".content").on("click", 'ul.other_dropdown li', function(){
  	   var data_input = $(this).closest('.dropdown').attr('data-input');
       var select_li = $(this).text();
       $(this).closest('.dropdown-menu').find(".not_label_select #"+data_input).val(select_li).keyup(); //we need keyup() to remove error in validation
       $(this).closest(".dropdown").hide();
  	});

	//Popup daterangerpicker in create event zone
	$(".content").on("click", ".date_icone_down", function(){
		launch_modal("popup_dates");
	});

	//Popup daterangerpicker in create event zone
	$(".content").on("click", ".update_date_hours", function(){
		$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");
		var startDate = $(this).closest(".date_horaire_create_event").find(".startDaily").val();
		var endDate = $(this).closest(".date_horaire_create_event").find(".endDaily").val();
		var startHour = $(this).closest(".date_horaire_create_event").find(".startHourDaily").val().split(" ");
		var endHour = $(this).closest(".date_horaire_create_event").find(".endHourDaily").val().split(" ");
		$('#popup_dates_2').find('.am_pm_input').val(startHour[1]);
		$('#popup_dates_2').find(".second_am_pm").val(endHour[1]);
		startHour = startHour[0].split(":");
		endHour = endHour[0].split(":");
		$('#popup_dates_2').find('.hours_input').val(startHour[0]);
		$('#popup_dates_2').find('.second_hours').val(endHour[0]);
		$('#popup_dates_2').find('.minute_input').val(startHour[1]);
		$('#popup_dates_2').find('.second_minute').val(endHour[1]);
		$('#daterangepicker2').data('daterangepicker').setStartDate(moment(startDate).format("DD/MM/YYYY"));
		$('#daterangepicker2').data('daterangepicker').setEndDate(moment(endDate).format("DD/MM/YYYY"));
		$("#daterangepicker2").data('daterangepicker').updateView();
		$("#daterangepicker2").data('daterangepicker').updateCalendars();
		$(this).closest(".date_horaire_create_event").find(".startDaily").addClass("on_edit");
		$('#daterangepicker2').trigger('apply.daterangepicker');
		window.staff_necessary=$(this).closest('.staff_necessary');
		window.shift_date = startDate;
		setFirstHourMin(window.shift_date, window.staff_necessary);
		launch_modal("popup_dates_2");
		popupDateApplyOnClick($(this).closest(".date_horaire_create_event"), staff_events, "edit");
	});

	/*End the "plus" date boutton click function*/
	$('.content').on('click', ".img_plus", function(){
		if ($(".date_event").val()) {
			$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");
			window.staff_necessary=$(this).closest('.staff_necessary');
	        if(!window.shift_date)
	            window.shift_date = (moment() < moment($("#start").val()))? $("#start").val() : moment().format("YYYY-MM-DD");
	        setFirstHourMin(window.shift_date, window.staff_necessary);
			launch_modal('popup_dates_2');
			popupDateApplyOnClick(staff_necessary, staff_events, "apply");
		} else {
			$(".date_event").focus();
			if(langue == "en"){
				toastr.error('Please give the event date first!')
			} else {
				toastr.error("Veuillez d'abord donner la date de l'évènement!")
			}
		}
	});
	/*End the "plus" date boutton click function*/

	$('.content').on('click', ".delete_date_hours", function(){
		var event_indice = $(this).closest('.date_horaire_create_event').index();
		var staff_indice = getStaffIndice($(this).closest('.staff_necessary'));
		$('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
		/*setFirstHourMin($(this).closest('.staff_necessary'), );*/
		staff_events[staff_indice].events.splice(event_indice, 1);
		$('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
		$(this).closest(".staff_necessary").find('.validate').removeClass("isValid");
		$(this).closest('.date_horaire_create_event').remove();
	});

	$('.content').on('click', ".show_btn_delete", function(){
		$(this).closest(".content_three_divider").find('.delete_date_hours').toggleClass('is_hidden');
	});

	$('.content').on('mouseleave', '.staff_necessary', function(){
		if ($(this).find('.delete_date_hours').not('.is_hidden')){
			$(this).find('.delete_date_hours').addClass('is_hidden');
		}
	});

	/* popup de bienvenu staff&agence */
	$(".step_btn").click(function(){
		launch_modal("popup_staff_agence");
	});


	function readURLLogo(input, div) {
	    if (input.files && input.files[0]) {
	        if (input.files[0].type == "image/jpeg" || input.files[0].type == "image/png" || input.files[0].type == "image/svg+xml"){
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $('#img_event').attr('src', e.target.result);
	                $('#img_event').removeClass('initial_image');
	                if(!$('#img_event').hasClass('final_image')){
	                	$('#img_event').addClass('final_image');
	                }
	            }
	            reader.readAsDataURL(input.files[0]);
	            $('.content').find('.input_hidden').css('border','');
	        } else {
	            $('#img_event').attr('src', 's');
	        }
	    }
	}

	$("#portrait").change(function () {
		readURLLogo(this);
	});
	/* End Upload file logo */

	/* dropdown validation */
	function validate_dropdown(dropdown){
		$(dropdown).closest('.form_item').removeClass('error');
		$(dropdown).closest('.dropdown-menu').siblings('.error').addClass('is_hidden');
		$(dropdown).closest('.dropdown_cage').css('border','');
	}
	/* dropdown validation */

	/*Drag and drop file*/
	function upload(files) {
	    var f = files[0] ;
	    // Only process image files.
	    if (f.type.match('image/jpeg') || f.type.match('image/png') || f.type.match('image/svg+xml')) {// == "image/jpeg" || input.files[0].type == "image/png" || input.files[0].type == "image/svg+xml") {
	       var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#img_event').attr('src', e.target.result);
	        $('#img_event').removeClass('initial_image');
	        if(!$('#img_event').hasClass('final_image')){
	            $('#img_event').addClass('final_image');
	        }
	      }
	      $('.content').find('.input_hidden').css('border','');
	      reader.readAsDataURL(f);
	      return false ;
	    }
	    else {
	      $('#img_event').attr('src', 's');
	    }
	}
	/**ENd drag and drop file*/

	function choosedColor (staff_necessary){
		if(staff_necessary.find(".choose_color").hasClass("purple-active"))
			return "purple";
		else if(staff_necessary.find(".choose_color").hasClass("orange-active"))
			return "orange";
		else if(staff_necessary.find(".choose_color").hasClass("green-active"))
			return "green";
		else if(staff_necessary.find(".choose_color").hasClass("blue-active"))
			return "blue";
		else if(staff_necessary.find(".choose_color").hasClass("blue_sky-active"))
			return "blue_sky";
		else
			return false;
	}

	function getNewStaffColor() {
		var colorNotChoosed = ["purple", "blue_sky", "orange", "green", "blue"];
		$(".content").find(".staff_necessary").each(function(){
			var color = choosedColor($(this));
			if(color)
				colorNotChoosed.splice(colorNotChoosed.indexOf(color), 1);
		});
		if(colorNotChoosed[0])
			return colorNotChoosed[0];
		else
			return "blue_sky";
	}

	function dateScheduleCircleColor (staff_necessary){
		if(staff_necessary.find(".choose_color").hasClass("purple-active"))
			return "circle_create_event_purple";
		else if(staff_necessary.find(".choose_color").hasClass("orange-active"))
			return "circle_create_event_red";
		else if(staff_necessary.find(".choose_color").hasClass("green-active"))
			return "circle_create_event_green";
		else if(staff_necessary.find(".choose_color").hasClass("blue-active"))
			return "circle_create_event_blue_fonce";
		else
			return "circle_create_event_blue";
	}

	function linear_gradient (color){
		if(color == "purple")
			return 'linear-gradient(231deg, #899ED4, #A389D4)';
		else if(color == "orange")
			return 'linear-gradient(60deg, #F44236, #F48F36)';
		else if(color == "green")
			return 'linear-gradient(67deg, #1FA548, #21FFAA)';
		else if(color == "blue")
			return 'linear-gradient(237deg, #48C6EF, #337DE2)';
		else
			return 'linear-gradient(239deg, #1DE9B6, #1DC4E9)';
	}

	/*Start attribution Id dans Input*/
	$('.content').on('click', '.postStaff', function(){
		var staff_necessary = $(this).closest('.staff_necessary');
		var liIdJobStaff = $(this).attr('data-jobIdStaff');
		staff_necessary.find('.input_jobIdStaff').val(liIdJobStaff);
		/*var previousVal = staff_necessary.find(".post").attr("data-previous_val");
		var currentVal = $(this).text();
		$(".staff_necessary").each(function(){
			$(this).find(".postStaff").each(function(){
				if ($(this).text() == previousVal)
					$(this).show();
				else if ($(this).text() == currentVal)
					$(this).hide();
			});
		});
		var post_staff = staff_necessary.find(".post");
		post_staff.attr("data-previous_val", post_staff.val());*/
	});

	$('.content').on('click', '.zoneEventStaff', function(){
		var liIdZoneEventStaff = $(this).attr('data-zoneIdEventStaff');
		$(this).closest('.staff_necessary').find('.input_mobilityIdEventStaff').val(liIdZoneEventStaff);
	});

	$('.content').on('click', '.zoneStaff', function(){
		var liIdZoneStaff = $(this).attr('data-zoneIdStaff');
		$('.input_mobilityIdStaff').attr("value", liIdZoneStaff);
	});
	/*End attribution Id dans Input*/

	function getStaffIndice(staff_necessary){
		return parseInt(staff_necessary.find('.number_title').text()) - 2;
	}

	function addOneDay(date) {
		var newDate = new Date(date);
		return newDate.setDate(newDate.getDate() + 1);
	}

	function incrementDay(dateString) {
		var dateSplit = dateString.split("-");
		dateSplit[2]++;
		return dateSplit.join("-");
	}

	function validateAllStaff() {
		var isValid = true;
		$('.content').find('.staff_necessary').each(function(){
			if(!validateStaff($(this)))
				isValid = false;
		});
		return isValid;
	}

	function validateStaff(staff_necessary) {

		var isValid = true;

		var currentInput = staff_necessary.find('.post');
		if (currentInput.val() == "" || currentInput.val().length < 3){
			isValid = false;
			if (!hasInputFocused (staff_necessary))
				currentInput.focus();
			currentInput.closest('.dropdown_cage').css('border','1px solid red');
		} else {
			currentInput.closest('.dropdown_cage').css('border','');
		}

		currentInput = staff_necessary.find('.necessary_staff');
		if (currentInput.val() == ""){
			isValid = false;
			if (!hasInputFocused (staff_necessary))
				currentInput.focus();
			currentInput.closest('.dropdown_cage').css('border','1px solid red');
		} else {
			currentInput.closest('.dropdown_cage').css('border','');
		}

		currentInput = staff_necessary.find('.emplacement');
		if (currentInput.val() == "" || currentInput.val().length < 3){
			isValid = false;
			if (!hasInputFocused (staff_necessary))
				currentInput.focus();
			currentInput.closest('.form_item_create_event').addClass('error');
			currentInput.siblings('.error').removeClass('is_hidden');
		} else {
			currentInput.closest('.form_item_create_event').removeClass('error');
			currentInput.siblings('.error').addClass('is_hidden');
		}

		currentInput = staff_necessary.find('.postal');
		var zipCode = /^[a-zA-Z][0-9][a-zA-Z]\s*[0-9][a-zA-Z][0-9]/;
		if(!zipCode.test(currentInput.val())){
			isValid = false;
			if (!hasInputFocused (staff_necessary))
				currentInput.focus();
			currentInput.closest('.form_item_create_event').addClass('error');
			currentInput.closest('.label_create_event ').siblings('.error').removeClass('is_hidden');
		} else {
			currentInput.closest('.form_item_create_event').removeClass('error');
			currentInput.closest('.label_create_event ').siblings('.error').addClass('is_hidden');
		}

		currentInput = staff_necessary.find('.province_staff');
		if (currentInput.val() == "" || currentInput.val().length < 3){
			isValid = false;
			if (!hasInputFocused (staff_necessary))
				currentInput.focus();
			currentInput.closest('.form_item').addClass('error');
			currentInput.closest('.dropdown-menu').siblings('.error').removeClass('is_hidden');
		} else {
			currentInput.closest('.form_item').removeClass('error');
			currentInput.closest('.dropdown-menu').siblings('.error').addClass('is_hidden');
		}

		currentInput = staff_necessary.find('.hourly_rate');
		if (currentInput.val() == ""){
			isValid = false;
			if (!hasInputFocused (staff_necessary))
				currentInput.focus();
			currentInput.closest('.dropdown_cage').css('border','1px solid red');
		} else {
			currentInput.closest('.dropdown_cage').css('border','');
		}

		currentInput = staff_necessary.find('.zone_event_staff');
		if (currentInput.val() == "" || currentInput.val().length < 3){
			isValid = false;
			if (!hasInputFocused (staff_necessary))
				currentInput.focus();
			currentInput.closest('.dropdown_cage').css('border','1px solid red');
		} else {
			currentInput.closest('.dropdown_cage').css('border','');
		}

		currentInput = staff_necessary.find('.text_brief_new');
		if (currentInput.val() == ""){
			isValid = false;
			if (!hasInputFocused (staff_necessary))
				currentInput.focus();
			currentInput.closest('.description_staff').css('border','1px solid red');
		} else {
			currentInput.closest('.description_staff').css('border','');
		}

		currentInput = staff_necessary.find('.description_event_tab');
		if(currentInput.children().length > 0){
			currentInput.closest('.content_three_divider').css('border','');
		} else {
			isValid = false;
			currentInput.closest('.content_three_divider').css('border','1px solid red');
		}

		return isValid;
	}

	function hasInputFocused (input_parent) {
		var has = false;
        input_parent.find("input").each(function(){
            if ($(this).is(":focus")){
                has = true;
            }
        });
        input_parent.find("textarea").each(function(){
            if ($(this).is(":focus")){
                has = true;
            }
        });
        return has;
	}

	function validateCreateEvent(){

		var isValid = true;

		if ($('.content').find('.input_hidden').val()=="") {
			isValid=false;
			$('.content').find('.input_hidden').focus();
			$('.content').find('.photo_event_content').css('border','1px solid red');
		}
		else{
			$('.content').find('.photo_event_content').css('border','');
		}

		if ($('#name').val() == "" || $('#name').val().length < 3){
			isValid = false;
			if (!hasInputFocused($(".content_create_event")))
				$('#name').focus();
			$('#name').closest('.form_item_create_event').addClass('error');
			$('#name').siblings('.error').removeClass('is_hidden');
		} else {
			$('#name').closest('.form_item_create_event').removeClass('error');
			$('#name').siblings('.error').addClass('is_hidden');
		}

		if ($('#location_event').val() == "" || $('#location_event').val().length < 3){
			isValid = false;
			if (!hasInputFocused($(".content_create_event")))
				$('#location_event').focus();
			$('#location_event').closest('.form_item_create_event').addClass('error');
			$('#location_event').siblings('.error').removeClass('is_hidden');
		} else {
			$('#location_event').closest('.form_item_create_event').removeClass('error');
			$('#location_event').siblings('.error').addClass('is_hidden');
		}

		if ($('#country').val() == "" || $('#country').val().length < 3){
			isValid = false;
			if (!hasInputFocused($(".content_create_event")))
				$('#country').focus();
			$('#country').closest('.form_item').addClass('error');
			$('#country').closest('.dropdown-menu').siblings('.error').removeClass('is_hidden');
		} else {
			$('#country').closest('.form_item').removeClass('error');
			$('#country').closest('.dropdown-menu').siblings('.error').addClass('is_hidden');
		}

		var zipCode = /^[a-zA-Z][0-9][a-zA-Z]\s*[0-9][a-zA-Z][0-9]/;
		if(!zipCode.test($('#zip_event').val())){
			isValid = false;
			if (!hasInputFocused($(".content_create_event")))
				$('#zip_event').focus();
			$('#zip_event').closest('.form_item_create_event').addClass('error');
			$('#zip_event').closest('.label_create_event ').siblings('.error').removeClass('is_hidden');
		} else {
			$('#zip_event').closest('.form_item_create_event').removeClass('error');
			$('#zip_event').closest('.label_create_event ').siblings('.error').addClass('is_hidden');
		}

		if ($('#zone').val() == "" || $('#zone').val().length < 3){
			isValid = false;
			if (!hasInputFocused($(".content_create_event")))
				$('#zone').focus();
			$('#zone').closest('.dropdown_cage').css('border','1px solid red');
		} else {
			$('#zone').closest('.dropdown_cage').css('border','');
		}

		if ($('#start_date').val() == ""){
			isValid = false;
			if (!hasInputFocused($(".content_create_event")))
				$('.date_event').focus();
			$('#start_date').closest('.dropdown_cage').css('border','1px solid red');
		} else {
			$('#start_date').closest('.dropdown_cage').css('border','');
		}

		if ($('#event_description_fr').val() == ""){
            isValid = false;
            if (!hasInputFocused ($(".content_create_event")))
                $('#event_description_fr').focus();
            $('#event_description_fr').closest('.description_event').css('border','1px solid red');
        } else {
            $('#event_description_fr').closest('.description_event').css('border','');
        }

		return isValid;
	}
	/*Start popup dates apply function*/

    $('#popup_dates').find('.btn_apply').click(function(){
        var window_position=parseInt($(this).data("position"));
        var event_title=$('.content_create_event').find('#name').val();

        var start_date= $('#daterangepicker1').data('daterangepicker').startDate.format('YYYY-MM-DD');
        var end_date = $('#daterangepicker1').data('daterangepicker').endDate.format('YYYY-MM-DD');

        initializeDaterangepicker2($('#daterangepicker1').data('daterangepicker').startDate, $('#daterangepicker1').data('daterangepicker').endDate);

        var val= formatEventDate(start_date, end_date);
        $('.content_create_event').find('#start_date').val(val);
        $('.content_create_event').find('#start').val(start_date);
        $('.content_create_event').find('#end').val(end_date);
        $('.content').find('#start_date').closest('.dropdown_cage').css('border','');
        /* Close popup date */
        close_modal("popup_dates");
    });

	function popupDateApplyOnClick(staff_necessary_or_date_horaire_create_event, staff_events, action) {
		if(action == "apply") {
			var staff_necessary = staff_necessary_or_date_horaire_create_event;
		    $('#popup_dates_2').find('.btn_apply').one('click', {staff_necessary, staff_events}, function(){
		        var staff_indice = getStaffIndice(staff_necessary);
		        var event_title = staff_necessary.find('.post').val();
		        var start_date = $('#daterangepicker2').data('daterangepicker').startDate.format('YYYY-MM-DD');
		         var start_hour = $('#popup_dates_2').find('.hours_input').val()+":"+$('#popup_dates_2').find('.minute_input').val()+" "+$('#popup_dates_2').find('.am_pm_input').val();
		        var start_datetime = new Date(start_date+" "+start_hour);
		        var end_date = $('#daterangepicker2').data('daterangepicker').startDate.format('YYYY-MM-DD');
		        var end_hour=$('#popup_dates_2').find('.second_hours').val()+":"+$('#popup_dates_2').find('.second_minute').val()+" "+$('#popup_dates_2').find('.second_am_pm').val();
		        var end_datetime = new Date(end_date+" "+end_hour);
		        var color = staff_necessary.find('.input_color').val();
		        var address=staff_necessary.find('.emplacement').val()+" "+staff_necessary.find('.postal').val()+" "+staff_necessary.find('.province_staff').val();

		        /* Update staff_ events : events Sources for the fullcalendar */
		        if(staff_events[staff_indice]){
		            $('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
		            var event={
		                title: event_title,
		                start: start_datetime,
		                end: end_datetime,
		                linearGradient: color,
		                address: address
		            };
		            staff_events[staff_indice].events.push(event);
		        }
		        else {
		            staff_events[staff_indice]={
		                events : [{
		                    title: event_title,
		                    start: start_datetime,
		                    end: end_datetime,
		                    linearGradient: color,
		                    address: address
		                }],
		                allday: false,
		                className: event_title.replace(/ /, "_"),
		                textColor: 'white',
		                id : ""+staff_indice
		            };
		        }

		        /*Add the new event  on the fullcalendar*/
		        $('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);

		        /*Add the new event in dates horaires section*/
		        var date_horaire = staff_necessary.find('.date_horaire_create_event');
		        if(date_horaire.length > 0) {
		            var clone = staff_necessary.find('.date_horaire_create_event:last').clone();
		            clone.find('label:first').text(moment(start_datetime).format('MMMM DD'));
		            clone.find('label:last').text(start_hour+" - "+end_hour);
		            clone.find('.startDaily').val(start_date);
		            clone.find('.endDaily').val(end_date);
		            clone.find('.startHourDaily').val(start_hour);
		            clone.find('.endHourDaily').val(end_hour);
		        }
		        else{
		            var clone = '<tr class="date_horaire_create_event" style="display: flex; margin-top: 2rem;">\
		                            <td><div data-attr="color" class=' + dateScheduleCircleColor(staff_necessary) + '></div></td>\
		                            <td><div class="date_create_event"><label class="text_brief opacity_two">'+moment(start_datetime).format("MMMM DD") + '</label></div></td>\
		                            <td><div class="horaire_create_event"><label class="text_brief opacity_two">'+ start_hour+' - '+end_hour + '</label>\
		                            <input type="hidden" name="startDaily['+staff_indice+'][]" class="startDaily" value="'+start_date+'">\
		                            <input type="hidden" name="endDaily['+staff_indice+'][]" class="endDaily" value="'+end_date+'">\
		                            <input type="hidden" name="startHourDaily['+staff_indice+'][]" class="startHourDaily" value="'+start_hour+'">\
		                            <input type="hidden" name="endHourDaily['+staff_indice+'][]" class="endHourDaily" value="'+end_hour+'">\
		                            <input type="hidden" name="color_tab['+staff_indice+'][]" class="color_tab" value="'+linear_gradient("blue_sky")+'"></div></td>\
	                              	<td><div class="update_date_hours"><i class="fa fa-edit" style="color : darkgray"></i></div></td>\
		                            <td><div class="delete_date_hours is_hidden"><i class="fa fa-times"></i></div></td>\
		                        </tr>';
		        }
		        staff_necessary.find('.decription_table_create_event table').append(clone);

		        /*Close the popup date*/
		        staff_necessary.find('.content_three_divider').css('border','');
		        close_modal("popup_dates_2");
		    });

		} else {//~action == "edit"
			var date_horaire_create_event = staff_necessary_or_date_horaire_create_event;
			$('#popup_dates_2').find('.btn_apply').one('click', {date_horaire_create_event, staff_events}, function(){
				var staff_necessary = date_horaire_create_event.closest(".staff_necessary");
				var staff_indice = getStaffIndice(staff_necessary);
				var event_title = staff_necessary.find('.post').val();
				var start_date = $('#daterangepicker2').data('daterangepicker').startDate.format('YYYY-MM-DD');
				var start_hour = $('#popup_dates_2').find('.hours_input').val()+":"+$('#popup_dates_2').find('.minute_input').val()+" "+$('#popup_dates_2').find('.am_pm_input').val();
				var start_datetime = new Date(start_date+" "+start_hour);
				var end_date = $('#daterangepicker2').data('daterangepicker').startDate.format('YYYY-MM-DD');
				var end_hour=$('#popup_dates_2').find('.second_hours').val()+":"+$('#popup_dates_2').find('.second_minute').val()+" "+$('#popup_dates_2').find('.second_am_pm').val();
				var end_datetime = new Date(end_date+" "+end_hour);
				var color = staff_necessary.find('.input_color').val();
				var address=staff_necessary.find('.emplacement').val()+" "+staff_necessary.find('.postal').val()+" "+staff_necessary.find('.province_staff').val();

				/* Update staff_ events : events Sources for the fullcalendar */
				$('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
				var event={
					title: event_title,
					start: start_datetime,
					end: end_datetime,
					linearGradient: color,
					address: address
				};
				staff_events[staff_indice].events[date_horaire_create_event.index()] = event;
		
				/*Add the new event  on the fullcalendar*/
				$('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);

				/*Add the new event in dates horaires section*/
				date_horaire_create_event.find('label:first').text(moment(start_datetime).format('MMMM DD'));
				date_horaire_create_event.find('label:last').text(start_hour+" - "+end_hour);
				date_horaire_create_event.find('.startDaily').val(start_date);
				date_horaire_create_event.find('.endDaily').val(end_date);
				date_horaire_create_event.find('.startHourDaily').val(start_hour);
				date_horaire_create_event.find('.endHourDaily').val(end_hour);
				date_horaire_create_event.find(".startDaily").removeClass("on_edit");
				close_modal("popup_dates_2");
			});
		}
	}
	/*End popup dates apply function*/

	function formatEventDate(dateStart, dateEnd){
	    var start = moment(dateStart);
	    var end = moment(dateEnd);

	    if (start.format("YYYY") == end.format("YYYY")){
	        return ''+start.format("MMMM DD")+' - '+end.format("MMMM DD, YYYY");
	    } else {
	        return ''+start.format("MMMM DD, YYYYY")+' - '+end.format("MMMM DD, YYYY");
	    }
	}

	function initializeButtons () {
	    /*if ($('.delete').length == 1){
	        $('.delete').after('<div class="divspecial"></div>');
	        $('.delete').hide();
	    } else {
	    	$(".delete").show();
	    }*/
	    $(".delete").show();
	    $('.addition').hide();
	    $('.addition:last').show();
	    /*$('.validate').hide();*/
	    $('.validate').show();
	    /*$('.validate:last').removeClass("isValid");*/
	}

	function AllValidateButtonIsValid () {
		var hasClassIsValid = true;
		$(".validate").each(function(){
			if(!$(this).hasClass("isValid"))
				hasClassIsValid = false;
		});
		return hasClassIsValid;
	}
});
