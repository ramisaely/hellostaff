$(document).ready(function() {

    var langue = getLanguage();
    $('.job_offers').on('click', '.infoEvent', function(){
        var key = $(this).closest('.tr_job').attr('data-key');
        $(this).closest('.pages').find('.apply_for_job_event').attr('data-index', key);
        var idEvent = $(this).siblings('.idEvent').val();
        var idEventStaff = $(this).closest('.tr_job').find('.idEventStaff').val();
        var url = $(this).siblings('.idEvent').attr('data-getEvent');
        $.ajax({
            url: url,
            type : 'POST',
            dataType: 'JSON',
            data: {idEvent: idEvent, idEventStaff: idEventStaff},
            success : function(response){
                var events = response['resultat'];
                $('.imgEvent').attr('src', response['image']);
                $('.job_offers ').addClass('is_hidden');
                $('.event_card_page').removeClass('is_hidden');
                $('.name_event').val(events['name']);
                $('.customer').val(events['customer']);
                $('.location').val(events['location_event']);
                $('.zip').val(events['zip_event']);
                $('.country').val(events['country_event']);
                $('.zone').text(events['zone_event']);
                var dateStart = events['start_date'];
                var startSplit = dateStart.split('-');
                var dateEnd = events['end_date'];
                var endSplit = dateEnd.split('-');
                if (startSplit[2] >= 0 && startSplit[2]<10 || endSplit[2] >= 0 && endSplit[2]<10) {
                    endSplit[2] = endSplit[2];
                    startSplit[2] = startSplit[2];
                }
                if(langue == "fr")
                    $('.date').text("De "+startSplit[2]+"/"+startSplit[1]+" - A "+endSplit[2]+"/"+endSplit[1]);
                else
                    $('.date').text("From "+startSplit[2]+"/"+startSplit[1]+" - "+"To "+endSplit[2]+"/"+endSplit[1]);
                $('.text_brief').text(events['description_fr_event']);
                var totalHour = 0;
                var totalInHour = 0;
                var totalWithHour = 0;
                var nbDate = 0;
                var hourlyRate = 0;
                var totalPerdiem = 0;
                var perDiem = 0;
                var remuneration = 0;
                var distance = 0;
                events.event_staffs.forEach(function(event_staff){
                    $('.post').text(event_staff.post);
                    $('.necessary_staff').text(event_staff.necessary_staff);
                    $('.location_event_staff').val(event_staff.location_event_staff);
                    $('.zip_event_staff').val(event_staff.zip_event_staff);
                    $('.country_event_staff').val(event_staff.country_event_staff);
                    $('.zone_event_staff').text(event_staff.zone_event_staff);
                    hourlyRate = event_staff.hour_rate;
                    distance = event_staff.distance;
                    perDiem = event_staff.per_diem;
                    $('.hourly_rate').text(event_staff.hour_rate+" $/Hr");
                    $('.distance').text(event_staff.distance);
                    $('.per_diem').text(event_staff.per_diem);
                    $('.description_fr_event_staff').text(event_staff.description_fr_event_staff);

                    event_staff.event_staff_dates.forEach(function(event_staff_date){
                        var startDate = event_staff_date.date_start;
                        var splitStart = startDate.split('-');
                        var startHour = event_staff_date.start_hour_event_staff_date;
                        var splitStartHour = startHour.split(':');
                        var endHour = event_staff_date.end_hour_event_staff_date;
                        var splitEndHour = endHour.split(':');
                        if (splitStart[2] >= 0 && splitStart[2]<10) {
                          splitStart[2] = "0"+splitStart[2];
                        }
                        totalHour = splitEndHour[0] - splitStartHour[0];
                        totalInHour += totalHour;

                        var startAmPm = (splitStartHour[0] < 12)? " AM" : " PM";
                        var endAmPm = (splitEndHour[0] < 12)? " AM" : " PM";
                        if (splitEndHour[0] > 12)
                            splitEndHour[0] = splitEndHour[0] - 12;
                        if (splitStartHour[0] > 12)
                            splitStartHour[0] = splitStartHour[0] - 12;
                        var clone = '<div class="item event_staff_date">\
                                        <span class="puce" style="background-image: '+event_staff_date.color_event_staff_date+';"></span>\
                                        <div class="date_content">\
                                            <span class="text day">'+splitStart[2]+"/"+splitStart[1]+'</span>\
                                            <span class="text time">'+splitStartHour[0]+":"+splitStartHour[1]+startAmPm+" - "+splitEndHour[0]+":"+splitEndHour[1]+endAmPm+'</span>\
                                        </div>\
                                    </div>';
                        /*var clone = '<div class="item event_staff_date">\
                                        <span class="puce" style="background-image: '+event_staff_date.color_event_staff_date+';"></span>\
                                        <div class="date_content">\
                                            <span class="text day">'+moment(event_staff_date.date_start).format("DD/MM")+'</span>\
                                            <span class="text time">'+moment(event_staff_date.start_hour_event_staff_date, "HH:mm:ss").format("hh:mm A")+" - "+moment(event_staff_date.end_hour_event_staff_date, "HH:mm:ss").format("hh:mm A")+'</span>\
                                        </div>\
                                    </div>';*/
                        $('.date_list').append(clone);
                    });
                    totalWithHour = totalInHour * hourlyRate;
                    console.log(event_staff.event_staff_dates);
                    nbDate = event_staff.event_staff_dates.length;
                    totalPerdiem = nbDate * perDiem;
                    remuneration = totalWithHour/* + distance + totalPerdiem*/;
                });
                $('.amount').html("&nbsp;"+remuneration+"$");
                var index = $('.event_card_page').find('.apply_for_job_event').data('index');
                status = $('.job_offers').find('.tr_job[data-key="'+index+'"]').find('.status_job').data('status-id');
                if (status == 4){
                    $(".master").off("click", ".apply_for_job_event");
                    if (langue == "fr")
                        $(".event_card_page").find(".apply_for_job_event").text("Appliqué");
                    else
                        $(".event_card_page").find(".apply_for_job_event").text("Pending");
                }
            },
            error : function(resultat, statut, erreur){
                console.log("Ajax error in the Thumbnail click event with : "+erreur);
                console.log(resultat);
            }
        });

  });

  $('.master').on('click', '.go_back_grey', function(){
    $(this).closest('.master').find('.job_offers ').removeClass('is_hidden');
    $(this).closest('.master').find('.event_card_page').addClass('is_hidden');
    $('.event_staff_date').remove();
  });

  var input = "";
  var status = "";
  $('.master').on('click', '.apply_for_job_event',function(){



    var index = $(this).attr("data-index");
    input = $(this).closest('.event_card_page').siblings('.job_offers').find('.tr_job[data-key="'+index+'"]').find('.apply_for_job');
    status = $(this).closest('.event_card_page').siblings('.job_offers').find('.tr_job[data-key="'+index+'"]').find('.status_job').attr('data-status-id');
    jQuery.fn.extend({
        disable: function(etat) {
           return this.each(function() {
           this.disabled = etat;
           });
        }
      });
    if (status == "2") {
      $(this).disable(true);
    }else{
      $(this).disable(false);
    switch (status){
      case '1':
        launch_modal('congrate_job_application_success');
        break;

      case '2':
        launch_modal('modal_applicant_available');
        break;

      case '3':
        launch_modal('modal_applicant_available');
        break;

      case '4':
        launch_modal("warning_for_confirmed_application");
        break;
    }
  }
  });


	$('.tr_job').on('click', 'label.switch_out.label_appy_for_job', function(e) {
		input = $(this).siblings('input');
		status = $(this).closest('.parent_for_apply_job').siblings('.status_job').attr('data-status-id');
		switch (status){
			case '1':
				launch_modal('congrate_job_application_success');
				break;

      case '2':
        launch_modal('modal_applicant_available');
        break;

			case '3':
				launch_modal('modal_applicant_available');
				break;

      case '4':
        launch_modal("warning_for_confirmed_application");
        break;
		}
	})



	$('.tr_job').on('click', 'label.switch_out.label_decline_job', function(e) {
		input = $(this).siblings('input');
		status = $(this).closest('.parent_for_decline_job').siblings('.status_job').attr('data-status-id');
		switch (status){
			case '1':
				launch_modal('decline_new_job_application');
				break;

			case '2':
				launch_modal('decline_pending_job_application');
				break;

      case '3':
        launch_modal('decline_pending_job_application');
        break;

			case '4':
				launch_modal("warning_for_confirmed_application");
				break;

		}
	});

    $('.confirm_action').click(function(){
    	var url = input.attr('data-url');
    	var action = input.attr('class');
    	var event_candidat_id = input.attr('data-event-candidat-id');
    	var language_id = input.closest('.tr_job').attr('data-language');
    	var status_event_id = 0;

    	switch (status){
    		case '1':
    			if (action == "apply_for_job")
    				status_event_id = 2;
    			else
    				status_event_id = 3;
    			break;

  			case '2':
          if (action == "apply_for_job")
  				  status_event_id = 1;
          else
            status_event_id = 3;
  				break;

  			case '3':
          if (action == "apply_for_job")
            status_event_id = 2;
          else
            status_event_id = 1;
          break;
    	}

        $.ajax({
           type: "POST",
           url: url,
           data: {id: event_candidat_id, status_event_id: status_event_id, language_id: language_id},
           success: function(status_job)
           {
               if (status_job == 'error'){
               		toastr.error("error"); 
               } else {
               		toastr.success("success");
               		input.prop('checked', true);
               		input.closest('.tr_job').find('.status_job').attr('data-status-id', status_job[0].status_event_id);

               		input.closest('.tr_job').find('.status_job b').text(status_job[1]);
               		if (status_job[0].status_event_id == '2' || status_job[0].status_event_id == '3'){
               			input.closest('.tr_job').find('input').not(input).prop('checked', false);	
               		} else {
                    input.prop('checked', false);
                  }
               }
           }
           ,
            error: function(status_job){
                toastr.error("error"); 
           }
        });

    });



    // Filter Job Offer
    $('#filter_job_offer').keyup(function(){
      var input, table, tr, event, date, job, city, i , eventValue, dateValue, jobValue, cityValue;
      input = $(this).val().toUpperCase().trim();
      table = document.getElementById("table_job_offer_to_filter");
      tr = table.getElementsByTagName("tr");

      for (i = 0; i < tr.length; i++) {
        event = tr[i].getElementsByTagName("td")[0];
        date = tr[i].getElementsByTagName("td")[1];
        job = tr[i].getElementsByTagName("td")[2];
        city = tr[i].getElementsByTagName("td")[3];
        if (event && date && job && city) {
          eventValue = event.textContent || event.innerText;
          eventValue = eventValue.trim();
          dateValue = date.textContent || date.innerText;
          dateValue = dateValue.trim();
          jobValue = job.textContent || job.innerText;
          jobValue = jobValue.trim();
          cityValue = city.textContent || city.innerText;
          cityValue = cityValue.trim();

          if (eventValue.toUpperCase().indexOf(input) > -1 || dateValue.toUpperCase().indexOf(input) > -1 || jobValue.toUpperCase().indexOf(input) > -1 || cityValue.toUpperCase().indexOf(input) > -1) {
            tr[i].style.display = "";
          } else {
            tr[i].style.display = "none";
          }
        }   
      }

    });



})


