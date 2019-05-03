$( document ).ready(function(){


	/* Initialize "langue" for the toastr message translation */
    var langue= getLanguage();

	$('.mystaff').on('click','.input_creat_one ',function(){
	    $(this).find('.message_myStaff').siblings('.dropdown_liste_jobs').toggleClass('is_hidden');
	});
	var dataLi = [];
	var key = [];
	$('.content_my_staff').find('.name_staff').each(function(){
			dataLi.push($(this).text());

		});
	$('.content_my_staff').find('.box_shadow_filter').each(function(){
			key.push($(this).data('key'));

		});
	$('.content_my_staff').on('keyup', '.backgroung', function(){
		$(this).siblings('.dropdown_liste_jobs').removeClass('is_hidden');
		var data = $(this).val();
		var position = [];

		$('.content_my_staff').find('.box_shadow_filter').css('display', 'none');
		dataLi.forEach(function(dataEl, index){
			var numero = dataEl.indexOf(data);
			var dataLow = dataEl.toLowerCase();
			var numeroLow = dataLow.indexOf(data);
			var dataUp = dataEl.toUpperCase();
			var numeroUp = dataUp.indexOf(data);
			if (numero != -1 || numeroUp != -1 || numeroLow != -1) {
				position.push(index);
				$('.content_my_staff').find('.box_shadow_filter[data-key="'+index+'"]').css('display', 'flex');
			}
			if (data == "") {
				$('.content_my_staff').find('.box_shadow_filter').css('display', 'flex');
			}
		});

	});

	$('.content_my_staff').on('click', '.avatar_on_myStaff', function(){
		var idStaff = $(this).closest('.content_liste_staff').find('.name_staff').data('id');
		var url = $(this).attr('data-showStaff');

		$.ajax({
            url: url,
            type : 'POST',
            //dataType : 'json',
            data: {idStaff: idStaff},
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
            	$('.content_my_staff').addClass('is_hidden');
            	$('.content_candidate_card').removeClass('is_hidden');
            	$('.content_candidate_card').append(response);
            	sliderCandidate();
              activate_inline_svg("img.svg-inline");
            },
            error: function(response, statut, erreur){
            }
        });

	});

	$('.content_my_staff').on('click', '.name_staff', function(){
		var idStaff = $(this).data('id');
		var url = $(this).closest('.content_liste_staff').find('.avatar_on_myStaff').attr('data-showStaff');

		$.ajax({
            url: url,
            type : 'POST',
            //dataType : 'json',
            data: {idStaff: idStaff},
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
            	$('.content_my_staff').addClass('is_hidden');
            	$('.content_candidate_card').removeClass('is_hidden');
            	$('.content_candidate_card').append(response);
            	sliderCandidate();
            },
            error: function(response, statut, erreur){
            }
        });

	});

	$('.content_my_staff').on('click', '.avatar_myStaff', function(){
		var idStaff = $(this).closest('.flex_avatar_name').find('.table_modify_start_name').data('staffid');
		var url = $(this).attr('data-show_staff_for_my_staff');

		$.ajax({
            url: url,
            type : 'POST',
            //dataType : 'json',
            data: {idStaff: idStaff},
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
                console.log(response);
            	$('.content_my_staff').addClass('is_hidden');
            	$('.content_candidate_card').removeClass('is_hidden');
            	$('.content_candidate_card').append(response);
            	sliderCandidate();
              activate_inline_svg("img.svg-inline");

            },
            error: function(response, statut, erreur){
            }
        });
	});

	$('.content_my_staff').on('click', '.table_modify_start_name', function(){
		var idStaff = $(this).attr('data-staffid');
		var url = $(this).closest('.flex_avatar_name').find('.avatar_myStaff').attr('data-show_staff_for_my_staff');

		$.ajax({
            url: url,
            type : 'POST',
            //dataType : 'json',
            data: {idStaff: idStaff},
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
            	$('.content_my_staff').addClass('is_hidden');
            	$('.content_candidate_card').removeClass('is_hidden');
            	$('.content_candidate_card').append(response);
            	sliderCandidate();
            },
            error: function(response, statut, erreur){
            }
        });
	});

	$('.content_candidate_card').on('click', '.btn_presedent', function(){
		$('.content_my_staff').removeClass('is_hidden');
        $('.content_candidate_card').addClass('is_hidden');
        $('.content_candidate_card').find('.candidates_card').remove();
	});

	$('.content_my_staff').on('click', '.action_staff', function(){
		launch_modal("add_person_myStaff");
		var nameStaff = $(this).siblings().find('.name_staff').text();
		var idStaff = $(this).siblings().find('.name_staff').data('id');
		$('#add_person_myStaff').find('.myStaffName').text(nameStaff);
		$('#add_person_myStaff').find('.myStaffName').data('idStaff', idStaff);
		var imgStaff = $(this).siblings().find('img').attr('src');
		$('#add_person_myStaff').find('img').attr('src', imgStaff);
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
        var nameStaff = $(this).closest(".candidates_card").find('.name').text();
        var idStaff = $(this).data('staff_id');
        console.log(idStaff);
        $('#add_person_myStaff').find('.myStaffName').text(nameStaff);
        $('#add_person_myStaff').find('.myStaffName').data('idStaff', idStaff);
        var imgStaff = $(this).closest(".candidates_card").find('.staff_img_back').attr('src');
        $('#add_person_myStaff').find('img').attr('src', imgStaff);
        console.log(nameStaff + " " + idStaff + " " + imgStaff);
        launch_modal("add_person_myStaff");
    });


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
                    launch_modal('confirm_proposed_jobs');
                } else {
                    if (langue=="fr")
                        toastr.warning('Staff déjà enregistré dans la base de données')
                    else
                        toastr.warning("Staff already registered in the database")
                }
            },
            error: function(response, statut, erreur){
                console.log("Error to proposing job to staff " + staff_id + ", with :" + erreur);
                console.log(response);
            }
        });

    });


	$('#add_person_myStaff').on('click', '.button_add_my_staff', function(){
		var id_staff = $('.myStaffName').data('idStaff');
        console.log(id_staff);
		var url = $(this).attr('data-addNewMyStaff');
        $.ajax({
            url: url,
            type : 'POST',
            dataType : 'json',
            data: {idStaff: id_staff},
            success: function(response)
            {

            	if(response['resultat'][0] == true){
                    if(langue=="fr")
                        toastr.warning('Cette personne est déjà votre Staff.');
                    else
                        toastr.warning('This candidat is already your staff');
            	}else{
                    console.log(response['resultat'][response['resultat'].length-1]['id']);
                    $('.staff'+id_staff+'').remove();
            		if(langue=="fr"){
                        toastr.success('Staff ajouté avec succès');
                        $('.master').find('.add_agency_staff').addClass('delete_agency_staff');
                        $('.master').find('.delete_agency_staff').removeClass('add_agency_staff');
                        $('.master').find('.delete_agency_staff').text('RETIRER DE MON STAFF');
                        $('.master').find('.delete_agency_staff').attr('data-agency_staff_id', response['resultat'][response['resultat'].length-1]['id']);
                    }else{
                        toastr.success("Staff added successfully");
                        $('.master').find('.add_agency_staff').addClass('delete_agency_staff');
                        $('.master').find('.delete_agency_staff').removeClass('add_agency_staff');
                        $('.master').find('.delete_agency_staff').text('REMOVE FROM MY STAFF');
                        $('.master').find('.delete_agency_staff').attr('data-agency_staff_id', response['resultat'][response['resultat'].length-1]['id']);
                    }
            		var clone = '<tr class="table_myStaff_color" id="staff'+response["staff"]["id"]+'">\
                        <td class="table_modify table_modify_one table_modify_start_avatar data_label" data-label="Nom du candidat">\
                        <div class=" flex_avatar_name"><div class="avatar_myStaff">\
                        <img  class="img_Staff" src="'+response["staffImage"]+'"></div><div class="table_modify_start_name" data-staffId="'+response["staff"]["id"]+'" data-idStaff="'+response["myStaff"]["id"]+'">\
                        <label class="modify">'+response["user"]["first_name"]+' '+response["user"]["last_name"]+'</label>\
                        </div></div></td><td class="table_modify" data-label="Ville">\
                        <label class="modify">'+response["staff"]["city"]+'</label></td>\
                        <td class="table_modify" data-label="Téléphone">\
                        <label class="modify">'+response["user"]["phone"]+'</label></td>\
                        <td class="table_modify couriel_modify" data-label="Courriel">\
                        <label class="modify ">'+response["user"]["email"]+'</label></td>\
                        <td class="table_modify couriel_modify" data-label="NAS">\
                        <label class="modify">'+response["staffRemuneration"]["nas"]+'</label>\
                        </td><td class="table_modify couriel_modify_ambassad" data-label="Job">\
                        <label class="modify"></label><label class="input_addon_update_profil background_view_noir bacck">\
                        </label></td>\
                        <td class="table_modify_etoile table_modify couriel_modify_etoile" data-label="Appréciation">\
                        <label class="background_icon_etoile_color background_etoile_full etoile"></label>\
                        <label class="label_chiffre">4.1</label></td>\
                        <td class="table_modify table_modify_color deletemyStaff" data-label="Retirer de la liste">\
                        <label class="background_moins input_addon_update_profil input_addon_update_profil_mystaff_color">\
                        </label></td></tr>';
                    $('.content_table>tbody').prepend(clone);
                    $('.staff'+id_staff+'').remove();
            	}
            },
            error: function(response, statut, erreur){
            }
        });
	});

    $(document).on('click', '.delete_agency_staff', function(){
        launch_modal("removing_ut_myStaff");
        var idmyStaff = $(this).attr('data-agency_staff_id');
        var idStaff = $(this).attr('data-user_id');
        var namemyStaff = $(this).closest('.color_back_profil').find('.name').text();
        console.log(namemyStaff);
        $('#removing_ut_myStaff').find('.namemyStaff').text(namemyStaff);
        $('#removing_ut_myStaff').find('.namemyStaff').data('myStaffId', idmyStaff);
        $('#removing_ut_myStaff').find('.namemyStaff').data('staffId', idStaff);
        var imgmyStaff = $(this).closest('.color_back_profil').find('.photo_staff').find('img').attr('src');
        $('#removing_ut_myStaff').find('img').attr('src', imgmyStaff);

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
    });

	$('.content_table').on('click', '.background_moins', function(){
		launch_modal("removing_ut_myStaff");
		var idmyStaff = $(this).closest('.deletemyStaff').siblings('.table_modify_start_avatar').find('.table_modify_start_name').attr('data-idStaff');
		var idStaff = $(this).closest('.deletemyStaff').siblings('.table_modify_start_avatar').find('.table_modify_start_name').attr('data-staffId');
		var namemyStaff = $(this).closest('.deletemyStaff').siblings('.table_modify_start_avatar').find('.table_modify_start_name').text();
		console.log(namemyStaff);
		$('#removing_ut_myStaff').find('.namemyStaff').text(namemyStaff);
		$('#removing_ut_myStaff').find('.namemyStaff').data('myStaffId', idmyStaff);
		$('#removing_ut_myStaff').find('.namemyStaff').data('staffId', idStaff);
		var imgmyStaff = $(this).closest('.deletemyStaff').siblings('.table_modify_start_avatar').find('img').attr('src');
		$('#removing_ut_myStaff').find('img').attr('src', imgmyStaff);

	});

	$('#removing_ut_myStaff').on('click', '.delete_staff', function(){
		var id_myStaff = $('#removing_ut_myStaff').find('.namemyStaff').data('myStaffId');
		var id_Staff = $('#removing_ut_myStaff').find('.namemyStaff').data('staffId');

		console.log(id_Staff);
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
                    $('.master').find('.add_agency_staff').text('AJOUTER A MON STAFF');
                }else{
                    toastr.success("Staff removed successfully");
                    $('.master').find('.delete_agency_staff').addClass('add_agency_staff');
                    $('.master').find('.add_agency_staff').removeClass('delete_agency_staff');
                    $('.master').find('.add_agency_staff').text('ADD TO MY STAFF');
                }

            	var index = $('.box_shadow_filter:last').data('key');
            	var key = index + 1;
            	var clone = '<li class="box_shadow_filter staff'+response["user"]["id"]+'" data-key="'+key+'">\
                              <div class="content_liste_staff">\
                                      <div class="avatar_staff">\
                                        <div class="avatar avatar_on_myStaff" data-showStaff="{{ route("showStaff") }}">\
                                          <img src="'+response['image']+'" alt="">\
                                        </div>\
                                      </div>\
                                      <div class="description_staffs">\
                                        <label for="" class="name_staff" data-id="'+response["user"]["id"]+'">'+response["user"]["first_name"]+' '+response["user"]["last_name"]+'</label>\
                                      </div>\
                               </div>\
                                  <div class="action_staff">\
                                    <span class="delete_staff">\
                                         <div class="litle_separator">+</div>\
                                    </span>\
                                  </div>\
                           </li>';

                $('.dropdown_liste_jobs').append(clone);
            	$('#staff'+id_Staff).remove();
            	$('.content_my_staff').find('.name_staff').each(function(){
					dataLi.push($(this).text());
				});
            },
            error: function(response, statut, erreur){
            }
        });

	});

	$('.content_table').on('click', '.background_view_noir', function(){
		launch_modal("view_post_my_staff");
		var imgmyStaff = $(this).closest('.couriel_modify_ambassad').siblings('.table_modify_start_avatar').find('img').attr('src');
		var id_Staff = $(this).closest('.couriel_modify_ambassad').siblings('.table_modify_start_avatar').find('.table_modify_start_name').attr('data-staffId');
		$('#view_post_my_staff').find('img').attr('src', imgmyStaff);
		var url = $(this).closest('tbody').attr('data-showPost');
		$.ajax({
            url: url,
            type : 'POST',
            dataType : 'json',
            data: {idStaff: id_Staff},
            success: function(response){
            	var jobNames = response['jobNames'];
            	$('#view_post_my_staff').find('.view_post').html("");
                if (jobNames.length >= 2) {
                    if (langue == "en") {
                        $('#view_post_my_staff').find('.label_little').text('Post busy');
                    }else{
                        $('#view_post_my_staff').find('.label_little').text('Postes occupés');
                    }
                }else{
                    if (langue == "en") {
                        $('#view_post_my_staff').find('.label_little').text('Post busy');
                    }else{
                        $('#view_post_my_staff').find('.label_little').text('Poste occupé');
                    }
                }
                for (var i = 0; i < jobNames.length; i++) {
                 	var clone = '<div class="model">\
                 				 <div class="color">\
                 				 <label class="label_little_poste_color" >'+jobNames[i]+'</label>\
                 				 </div>\
                 				 </div>';
                 	$('#view_post_my_staff').find('.view_post').append(clone);
                }
            },
            error: function(response, statut, erreur){
            }
        });
	});
});

/*Start Slider IMage*/
/*var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
    showDivs(slideIndex += n);
}

function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("image_staff");
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length}
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    x[slideIndex-1].style.display = "block";
}*/
/*End Slider Image*/
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
