$( document ).ready(function(){

	/* Initialize "langue" for the toastr message translation */
    var langue= getLanguage();

	/*evenement proposer job candidates*/
	$(document).on('click','.color_proposed_jobs', function() {
		//data to send for save
		var event_staff_id = $('.filter_candidates').find('.item_jobs_list.active').closest('.description_jobs').data('event_staff_id');
		var staff_id = $(this).data('staff_id');
		//url
		var url = $(this).data('url');
		//make request to offer job
		$.ajax({
            url: url,
            type : 'POST',
            data: {staff_id: staff_id, event_staff_id: event_staff_id},
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
            success: function(response) {
                if (response['notification'] == "success") {
                	$('.candidate_list'+staff_id+'').remove();
                	launch_modal('confirm_proposed_jobs');
                } else {
                	if (langue=="fr")
						toastr.warning('Job déjà proposé pour ce Staff')
					else
						toastr.warning("Job already suggested to this Staff")
                }
            },
            error: function(response, statut, erreur){
                console.log("Error to proposing job to staff " + staff_id + ", with :" + erreur);
                console.log(response);
            }
        });

	});

	$(document).on('click','.filter_candidate_event_results .clic_proposed_more_mystaff', function(e) {
		e.stopPropagation();
		var btn_porposeds = $('.content_future_event').find('.liste_candidates_filter .responsive_liste_candidates_filter_two').find('.color_proposed_jobs');
		all_ids = [];
		btn_porposeds.each(function(index, element) {
			all_ids.push($(element).data('staff_id'));
		});
		var event_staff_id = $('.filter_candidates').find('.item_jobs_list.active').closest('.description_jobs').data('event_staff_id');
		var url = $(this).data('url');
		launch_modal('proposed_more_mystaff');

		$('.check_modal').one('click', function(){
			$.ajax({
	            url: url,
	            type : 'POST',
	            data: {all_staff_id: all_ids, event_staff_id: event_staff_id},
	            success: function(response) {
	                if (response['notification'] == "success") {
	                	if (langue=="fr")
	                		toastr.success('Proposition envoyée à tous les candidats')
	                	else
	                		toastr.success("Proposal sent to all candidates")
	                } else {
	                	if (langue=="fr")
	                		toastr.warning('Erreur de proposition!')
	                	else
	                		toastr.warning("Proposition error!")
	                }
	            },
	            error: function(response, statut, erreur){
	                console.log("error with :" + erreur);
	                console.log(response);
	            }
	        });
		});
	});


	/*$(document).on('click','.filter_candidate_event_results .clic_proposed_more_newstaff', function(e) {
		e.stopPropagation();
		var btn_porposeds = $('.content_future_event').find('.liste_candidates_filter .responsive_liste_candidates_filter_one').find('.color_proposed_jobs');
		all_ids = [];
		btn_porposeds.each(function(index, element) {
			all_ids.push($(element).data('staff_id'));
		});
		var event_staff_id = $('.filter_candidates').find('.item_jobs_list.active').closest('.description_jobs').data('event_staff_id');
		var url = $(this).data('url');
		launch_modal('proposed_more_mystaff');

		$('.check_modal').on('click', function(){
			$.ajax({
	            url: url,
	            type : 'POST',
	            data: {all_staff_id: all_ids, event_staff_id: event_staff_id},
	            success: function(response) {
	                console.log(response);
	                if (response['notification'] == "success") {
	                	if (langue=="fr")
	                		toastr.success('Proposition envoyé à tous les candidats!')
	                	else
	                		toastr.success("Proposition sended to all candidates!")
	                } else {
	                	if (langue=="fr")
	                		toastr.warning('Erreur de proposition!')
	                	else
	                		toastr.warning("Proposition error!")
	                }
	            },
	            error: function(response, statut, erreur){
	                console.log("error with :" + erreur);
	                console.log(response);
	            }
	        });
		});
	});*/
	/*end evenement proposer job candidates*/

	// Slider jobs candidates
	$('.content_future_event').on('click','.description_jobs',function(){
		$(this).find('.item_jobs_list').addClass('active');
		$(this).siblings().find('.item_jobs_list').removeClass('active');
		var hour_rate = $(this).data('hourly_rate');
		$('.horary'+hour_rate).addClass('active');
		$('.horary'+hour_rate).siblings().removeClass('active');
	});

	// Gender
	$('.content_future_event').on('click','.gender_item .checkbox_label',function(){
		$(this).closest('.container_gender').find('.checkbox_label').removeClass('active');
		$(this).addClass('active');
	});

	//Ages
	ageRange();

	// Certifications
	$('.content_future_event').on('click','.filter_candidates .content_certifications .checkbox_label',function(){
		$(this).toggleClass('active');
	});
	// Ecperiences
	$('.content_future_event').on('click','.experiences_item .checkbox_label ',function(){
		$(this).closest('.experiences').find('.checkbox_label').removeClass('active');
		$(this).addClass('active');
	});
	// Languages
	$('.content_future_event').on('click','.languages_item .cadres_langues',function(){
		$(this).toggleClass('active');
	});
	// Attributs
	$('.content_future_event').on('click','.content_attributs .checkbox_label',function(){
		$(this).closest('.content_attributs').find('.checkbox_label').removeClass('active');
		$(this).addClass('active');
	});
	// Taux horaires
	$('.content_future_event').on('click','.horaires_taux_item .value_horaires',function(){
		//changement de la base
		var event_staff_id = $('.filter_candidates').find('.item_jobs_list.active').closest('.description_jobs').data('event_staff_id');
		var text_horary = $(this).text();
		var horary = text_horary.substr(0, 2);
		var url = $(this).closest('.liste_taux_horaires').data('url');
		console.log(url);

		$.ajax({
           type: "POST",
           url: url,
           data: {event_staff_id: event_staff_id, horary: horary},
           success: function(response){
           		console.log('success');
           },
            error: function(error){
                toastr.error("error with: " + error);
        	}
        });

		$(this).addClass('active');
		$(this).siblings().removeClass('active');
	});

	$('.find_candidates_form .slick-active:first').find('.item_jobs_list').addClass('active');
	var first_horary = $('.find_candidates_form .slick-active:first').data('hourly_rate');
	$('.horary'+first_horary).addClass('active');

	/*see candidates*/

	$('.content_future_event').on('click', '.show_candidate_event', function() {
		$('.candidate_event_all_lists').removeClass('is_hidden');
		var urlSeeCandidate = $(this).attr('data-url');
		var job_id = $('.find_candidates_form').find('.item_jobs_list.active').closest('.description_jobs').data('job_id');
		var paginate = $('.content_future_event .see_more_candidate_staff').data('paginate');
		var paginate_number;
		if(paginate)
			paginate_number = paginate;
		else
			paginate_number = 24;
		$.ajax({
           type: "POST",
           url: urlSeeCandidate,
           data: {job_id: job_id, paginate: paginate_number},
           success: function(see_job){
           		$('.candidate_event_all_lists').html(see_job);
           },
            error: function(error){
                toastr.error("error with: " + error);
           }
        });
	});

	$('.content_future_event').on('click','.see_more_candidate_staff', function() {
		$('.content_future_event .show_candidate_event').trigger('click');
	});
	/*end see candidates*/

	/*start candidate card*/
	$('.content_future_event').on('click','.btn_candidat_fiche', function() {
		var staff_id = $(this).data('staff_id');
		var url = $(this).data('url');
		var offer_job = $(this).data('offer_job');
		var url_proposed = $(this).siblings('.color_proposed_jobs').data('url');
		$.ajax({
           type: "POST",
           url: url,
           data: {staff_id: staff_id},
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
           success: function(response)
           {
           		$('.content_candidate_card').removeClass('is_hidden');
           		$('#content_header_slider').addClass('is_hidden');
           		$('.content_future_event').addClass('is_hidden');
           		$('.content_candidate_card').html(response);
           		sliderCandidate();
              activate_inline_svg("img.svg-inline");
           		if (offer_job == 1){
	           		$('.candidates_card').find('.color_proposed_jobs').removeClass('is_hidden');
	           		$('.candidates_card').find('.color_proposed_jobs').attr('data-staff_id', staff_id);
	           		$('.candidates_card').find('.color_proposed_jobs').attr('data-url', url_proposed);
           		}else
	           		$('.candidates_card').find('.color_proposed_jobs').addClass('is_hidden');
           },
            error: function(error){
                toastr.error("error with: " + error);
           }
        });

	});

	/*end candidate card*/

	/* action confirme staff */

	$(document).on('click', '.candidate_event_all_lists button.color_confirmed', function(){
		var idEventCandidat = parseInt($(this).attr('data-idEventCandidat'));
		var urlConfirm = $(this).attr('data-url');
		var urlToReload = $(this).attr('data-urlToReload');
		var number_staff_confirmed = $('.find_candidates_form').find('.item_jobs_list.active').find('.status_jobs').find('.number_jobs:first').text();
		var number_staff_event = $('.find_candidates_form').find('.item_jobs_list.active').find('.status_jobs').find('.number_jobs:last').text();
		/*console.log(number_staff_confirmed);
		console.log(number_staff_event);*/
		if (number_staff_confirmed >= number_staff_event) {
			if (langue=="en")
				toastr.warning("You can not confirm more than " + number_staff_event + " staff!")
			else
				toastr.warning("Tu ne peux pas confirmé des staffs plus de " + number_staff_event + "!")
		} else {
			$.ajax({
	           type: "POST",
	           url: urlConfirm,
	           data: {idEventCandidat: idEventCandidat},
	           success: function(success){
	           		if (langue=="en")
	           			toastr.success("Staff confirmed!")
	           		else
	           			toastr.success("Staff confirmé!")

	           		$('.find_candidates_form').find('.item_jobs_list.active').find('.status_jobs').find('.number_jobs:first').text(parseInt(number_staff_confirmed)+1);
	           		$('.show_candidate_event').trigger('click');
	           		$.ajax({
			           type: "POST",
			           url: urlToReload,
			           success: function(reload){
			           		$('.confirmed_staff').html(reload);
			           },
			            error: function(error){
			                console.log("error with: " + error);
			           }
			        });
	           },
	            error: function(error){
	                console.log("error with: " + error);
	           }
	        });
        }
	});

	/*end action confirme staff */

	$('.content_future_event').on('click', '.filter_candidate_event', function() {
		$(this).closest('.find_candidates_form').addClass('is_hidden');
		$('.filter_candidates').removeClass('is_hidden');
		$('.candidate_event_all_lists').addClass('is_hidden');
		$('.filter_candidate_event_results').addClass('is_hidden');
		$('.post_slider').slick('setPosition');
		var slick_active = $('.find_candidates_form').find('.item_jobs_list.active').closest('.description_jobs').data('slick-index');
		$('.post_slider').slick('slickGoTo', parseInt(slick_active)); //affiche le sdernier slider choisir
		$('.filter_candidates').find('.item_jobs_list').removeClass('active');
		$('.filter_candidates').find('.slick-active:first').find('.item_jobs_list').addClass('active');
	});

	$('.content_future_event').on('click', '.filter_staff', function() {
		dataFilter()
		//hidden first visual front
		if (boolean == "1") {
			$('.filter_candidate_event_results').removeClass('is_hidden');

			//data filter request
			var data = dataFilter();
			var url = $(this).data('url');
			//make request to filter candidate
			$.ajax({
	            url: url,
	            type : 'POST',
	            //dataType : 'JSON',
	            data: {dataFilter: data},
	            success: function(response) {
	            	/*console.log(response);*/
	                $('.filter_candidate_event_results').html(response);
									filterResponsive();
	            },
	            error: function(response, statut, erreur){
	                console.log("error with :" + erreur);
	                console.log(response);
	            }
	        });
		} else {
			if (langue == "fr") {
				toastr.warning('Veuillez sélectionner au moins une langue.');
			} else {
				toastr.warning('Please, select a language. ');
			}
		}
	});

	$('.content_future_event').on('click', '.filter_candidate_event_results .see_more_agency', function() {
		$('.filter_staff').trigger('click');
	});

	$('.content_future_event').on('click', '.confirmed_staff', function() {
		$('.find_candidates_form').removeClass('is_hidden');
		$('.filter_candidate_event_results').addClass('is_hidden');
		$('.filter_candidates').addClass('is_hidden');
		$('.candidate_event_all_lists').removeClass('is_hidden');
		$('.post_slider').slick('setPosition');
		var slick_active = $('.filter_candidates').find('.item_jobs_list.active').closest('.description_jobs').data('slick-index');
		$('.post_slider').slick('slickGoTo', parseInt(slick_active)); //affiche le sdernier slider choisir
		$('.find_candidates_form').find('.item_jobs_list').removeClass('active');
		$('.find_candidates_form').find('.slick-active:first').find('.item_jobs_list').addClass('active');
		$('.content_future_event .show_candidate_event').trigger('click');
	});

	$(document).on('click', '.delete_agency_staff', function(){
		/*var id_myStaff = $(this).data('agency_staff_id');
		var url = $(this).data('url');
		$.ajax({
            url: url,
            type : 'POST',
            dataType : 'json',
            data: {idmyStaff: id_myStaff},
            success: function(response)
            {
            	if (langue=="fr")
            		toastr.success('Staff retiré avec success')
            	else
            		toastr.success("Staff removed successfully")
            },
            error: function(response, statut, erreur){
            	console.log("Error to removing staff from the staffs of the current agency with : "+erreur);
            	console.log(response);
            }
        });*/
        launch_modal("removing_ut_myStaff");
        var idmyStaff = $(this).attr('data-agency_staff_id');
        var idStaff = $(this).attr('data-staff_id');
        var namemyStaff = $(this).closest('.color_back_profil').find('.name').text();
        console.log(namemyStaff);
        $('#removing_ut_myStaff').find('.namemyStaff').text(namemyStaff);
        $('#removing_ut_myStaff').find('.namemyStaff').data('myStaffId', idmyStaff);
        $('#removing_ut_myStaff').find('.namemyStaff').data('staffId', idStaff);
        var imgmyStaff = $(this).closest('.color_back_profil').find('.photo_staff').find('img').attr('src');
        $('#removing_ut_myStaff').find('img').attr('src', imgmyStaff);
	});

	$('#removing_ut_myStaff').on('click', '.delete_staff', function(){
		var id_myStaff = $('#removing_ut_myStaff').find('.namemyStaff').data('myStaffId');
		var id_Staff = $('#removing_ut_myStaff').find('.namemyStaff').data('staffId');

		console.log(id_Staff);
		console.log("Id "+id_myStaff);
		var url = $(this).attr('data-deleteMyStaff');
		$.ajax({
            url: url,
            type : 'POST',
            dataType : 'json',
            data: {idmyStaff: id_myStaff, idStaff: id_Staff,},
            success: function(response)
            {
            	if (langue=="fr"){
                    toastr.success('Staff supprimé avec succès')
                    $('.master').find('.delete_agency_staff').addClass('add_agency_staff');
                    $('.master').find('.add_agency_staff').removeClass('delete_agency_staff');
                    var staffIds = $('.master').find('.add_agency_staff').attr('data-staff_id');
                    var userId = $('.master').find('.add_agency_staff').attr('data-user_id');
                    $('.master').find('.add_agency_staff').attr('data-user_id', staffIds);
                    $('.master').find('.add_agency_staff').attr('data-staff_id', userId);

                    $('.master').find('.add_agency_staff').text('AJOUTER A MON STAFF');
                }else{
                    toastr.success("Staff removed successfully");
                    $('.master').find('.delete_agency_staff').addClass('add_agency_staff');
                    $('.master').find('.add_agency_staff').removeClass('delete_agency_staff');
                    var staffIds = $('.master').find('.add_agency_staff').attr('data-staff_id');
                    var userId = $('.master').find('.add_agency_staff').attr('data-user_id');
                    $('.master').find('.add_agency_staff').attr('data-user_id', staffIds);
                    $('.master').find('.add_agency_staff').attr('data-staff_id', userId);
                    $('.master').find('.add_agency_staff').text('ADD TO MY STAFF');
                }
            },
            error: function(response, statut, erreur){
            }
        });

	});


	$(document).on('click', '.add_agency_staff', function(){
		/*var id_staff = $(this).data('staff_id');
		console.log(id_staff);
		var url = $(this).data('url');
        $.ajax({
            url: url,
            type : 'POST',
            dataType : 'json',
            data: {idStaff: id_staff},
            success: function(response)
            {
            	if(response['resultat'] == true){
            		toastr.warning('Cet Personne a dejà été votre Staff.');
            	}else{
        			toastr.success('Staff ajouter avec success');
        		}
            },
            error: function(response, statut, erreur){
            }
        });*/
        console.log($(this));
		var nameStaff = $(this).closest(".candidates_card").find('.name').text();
		var idStaff = $(this).data('staff_id');
		$('#add_person_myStaff').find('.myStaffName').text(nameStaff);
		$('#add_person_myStaff').find('.myStaffName').data('idStaff', idStaff);
		var imgStaff = $(this).closest(".candidates_card").find('.staff_img_back').attr('src');
		$('#add_person_myStaff').find('img').attr('src', imgStaff);
		console.log(nameStaff + " " + idStaff + " " + imgStaff);
		launch_modal("add_person_myStaff");
	});

	$('#add_person_myStaff').on('click', '.button_add', function(){
		console.log('find candidate');
		var id_staff = $('.myStaffName').data('idStaff');
		var url = $(this).attr('data-addNewMyStaff');
        $.ajax({
            url: url,
            type : 'POST',
            dataType : 'json',
            data: {idStaff: id_staff},
            success: function(response)
            {
            	if(response['resultat'] == true){
                    if(langue=="fr")
                        toastr.warning('Cette personne est déjà votre Staff.');
                    else
                        toastr.warning('This candidat is already your staff');
            	}else{
                    $('.staff'+id_staff+'').remove();
            		if(langue=="fr"){
                        toastr.success('Staff ajouté avec succès');
                        $('.master').find('.add_agency_staff').addClass('delete_agency_staff');
                        $('.master').find('.delete_agency_staff').removeClass('add_agency_staff');
                        $('.master').find('.delete_agency_staff').text('RETIRER DE MON STAFF');
                        var staffIds = $('.master').find('.delete_agency_staff').attr('data-staff_id');
		                var userId = $('.master').find('.delete_agency_staff').attr('data-user_id');
		                $('.master').find('.delete_agency_staff').attr('data-user_id', staffIds);
		                $('.master').find('.delete_agency_staff').attr('data-staff_id', userId);
                    }else{
                        toastr.success("Staff added successfully");
                        $('.master').find('.add_agency_staff').addClass('delete_agency_staff');
                        $('.master').find('.delete_agency_staff').removeClass('add_agency_staff');
                        $('.master').find('.delete_agency_staff').text('REMOVE FROM MY STAFF');
                        var staffIds = $('.master').find('.delete_agency_staff').attr('data-staff_id');
	                    var userId = $('.master').find('.delete_agency_staff').attr('data-user_id');
	                    $('.master').find('.delete_agency_staff').attr('data-user_id', staffIds);
	                    $('.master').find('.delete_agency_staff').attr('data-staff_id', userId);
                    }
                }
            },
            error: function(response, statut, erreur){
            	console.log("Error for adding staff to the current agency with : " + erreur);
            	console.log(response);
            }
        });
	});


	// Filter member hellostaff
    $(document).on('keyup','#staffMemberList', function(){
    	var input, div, name;
    	input = $(this).val().toUpperCase().trim();
    	div = $(document).find('.liste_candidates_filter').find('.staffMemberList').find('.name');
    	for (i = 0; i < div.length; i++) {
    		name = div[i].textContent || div[i].innerText;
    		name = name.trim();
    		if(name.toUpperCase().indexOf(input) > -1){
    			$(div[i]).closest('.staffMemberList').show();
    		}else{
    			$(div[i]).closest('.staffMemberList').hide();
    		}
    	}
    });

    // Filter member hellostaff
    $(document).on('keyup','#myStaffList', function(){
    	var input, div, name;
    	input = $(this).val().toUpperCase().trim();
    	div = $(document).find('.liste_candidates_filter').find('.myStaffList').find('.name');
    	for (i = 0; i < div.length; i++) {
    		name = div[i].textContent || div[i].innerText;
    		name = name.trim();
    		if(name.toUpperCase().indexOf(input) > -1){
    			$(div[i]).closest('.myStaffList').show();
    		}else{
    			$(div[i]).closest('.myStaffList').hide();
    		}
    	}
    });

	/** Developper les svg */
	$('img.svg-inline_jobs').each(function(){
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
	  var intervalColorSvg = setInterval(function(){
	      if($('svg.svg-inline_jobs')) {
	          colorSvg();
	          clearInterval(intervalColorSvg);
	      }
	  }, 1000);
	  /** End Developper les svg */

		/** comptage nombre de slider */
		var length_dom =$('.post_slider .description_jobs').length;
		console.log(length_dom + "lololololololololololol");
		/** End comptage nombre de slider*/
})

function colorSvg() {
    $('svg.svg-inline_jobs').each(function(i, el) {
        $(el).find('[fill]').each(function(i, el) {
            //console.log($(el).attr('fill') + ' ++++++++++++ ')
            if($(el).attr('fill') != '#fff' && $(el).attr('fill') != '#ffffff' && $(el).closest(".item_jobs_list").hasClass("active"))
                // $(el).attr('fill', 'grey');
                $(el).addClass('svg_color_white');
        })
    })
}

	var pathname = location.href;
    var url = pathname.split('/');
    var langue= "fr";
    if(url[3] == "en"){
        langue = "en";
    }
var boolean = "";
function dataFilter() {
	var data = {};
	//jobs
	var job_id = $('.filter_candidates').find('.item_jobs_list.active').closest('.description_jobs').data('job_id');
	data['job_id'] = job_id;
	//gender
	var gender = $('.gender_item').find('.checkbox_label.active').data('value');
	data['gender'] = gender;
	//ages
	var ages  = [];
	var age_start = $('.ages_item').find('.age_start').text();
	ages.push(age_start);
	var age_end = $('.ages_item').find('.age_end').text();
	ages.push(age_end);
	data['ages'] = ages;
	//certifications
	var certifications = {};
	$('.certifications').find('.checkbox_label').each(function( index ) {
	  var value = $( this ).attr('for');
	  if($( this ).hasClass('active')){
	  	certifications[value] = 1;
	  }else{
	  	certifications[value] = 0;
	  }
	});
	data['certifications'] = certifications;
	//experience
	var experience = $('.experiences').find('.checkbox_label.active').data('value');
	data['experience'] = experience;
	//langues
	var language_ids = [];
	$('.languages').find('.cadres_langues').each(function( index ) {
	  if($( this ).hasClass('active')){
	  	language_ids.push($( this ).data('id'));
	  }
	});
	if (language_ids.length == 0) {
		boolean = "0";
	}else{
		boolean = "1";
	}
	data['language_ids'] = language_ids;
	//attributs
	var tattoo = $('.tattoo_attributs').find('.checkbox_label.active').data('value');
	data['tattoo'] = tattoo;
	var piercing = $('.piercing_attributs').find('.checkbox_label.active').data('value');
	data['piercing'] = piercing;
	//price
	var price = $('.liste_taux_horaires').find('.value_horaires.active').text();
	data['price'] = price.substr(0, 2);
	//paginate
	var paginate = $('.filter_candidate_event_results').find('.see_more_agency').data('paginate');
	if (paginate)
		data['paginate'] = paginate;
	else
		data['paginate'] = 12;
	//event staff id
	var event_staff_id = $('.filter_candidates').find('.item_jobs_list.active').closest('.description_jobs').data('event_staff_id');
	data['event_staff_id'] = event_staff_id;

	return data;
}

function ageRange(){
	// Ages
	$(".range-filter-cadidate").asRange({
		range: true,
		limit: true,
		onChange: function(value) {
			$('.title_filter_ages').html('Entre : <label class="age_start">'+ value[0] +'</label> - <label class="age_end">'+ value[1] +'</label>');
		}
	});
}

function filterResponsive() {
	/*responsivite bouton filter candidates*/
	var responsive_icone_play = $(window).width();
	if (responsive_icone_play < 885) {
		$('.search_candidates_one').addClass('is_hidden');
		$('.responsive_liste_candidates_filter_one').addClass('is_hidden');
		$('.icone_responsive_icons_play_one').removeClass('is_hidden');
		$('.search_candidates_two').addClass('is_hidden');
		$('.responsive_liste_candidates_filter_two').addClass('is_hidden');
		$('.icone_responsive_icons_play_two').removeClass('is_hidden');

		$('.icone_responsive_icons_play_one').on('click', function() {
			$('.icone_responsive_icons_play_one').toggleClass('click_icone_responsive_icons_play');
			$('.search_candidates_one').toggleClass('is_hidden');
			$('.responsive_liste_candidates_filter_one').toggleClass('is_hidden');
		});
		$('.icone_responsive_icons_play_two').on('click', function() {
			$('.icone_responsive_icons_play_two').toggleClass('click_icone_responsive_icons_play');
			$('.search_candidates_two').toggleClass('is_hidden');
			$('.responsive_liste_candidates_filter_two').toggleClass('is_hidden');
		});
	}
	/*end responsivite bouton filter candidates*/
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
