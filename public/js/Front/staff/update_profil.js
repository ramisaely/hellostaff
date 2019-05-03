$( document ).ready(function() {

	var langue = getLanguage();
	if(langue == "fr"){
	    $('#fr_language_update').prop('checked', true);
	    $('#fr_language_update').closest('.with_fake_out_in').addClass('active');
	    $('#en_language_update').prop('checked', false);
	    $('#en_language_update').closest('.with_fake_out_in').removeClass('active');
	}
	else{
	    $('#en_language_update').prop('checked', true);
	    $('#en_language_update').closest('.with_fake_out_in').addClass('active');
	    $('#fr_language_update').prop('checked', false);
	    $('#fr_language_update').closest('.with_fake_out_in').removeClass('active');
	}

	$('.master').on('click','.withOutChild',function(){
		var inputPreview = "";
		$(this).closest('ul').find('.withOutChild.active').each(function(i, el){
			inputPreview = inputPreview + $(el).siblings('span').text().trim() + ', ';
		});
		if (inputPreview != "")
			inputPreview = inputPreview.slice(0, -2);
		$(this).closest('.dropdown-menu').find('input.select.required').val(inputPreview);
		if ($(this).hasClass('active')) {
			$(this).siblings('.out_check').find('span').addClass('in_check');
		}else{
			$(this).siblings('.out_check').find('span').removeClass('in_check');
		}
	});

	$('.master').on('click','.id_parent',function(){
		$(this).toggleClass('active');
		var resp = $(this).val();
		if($(this).hasClass('active')){
			var id= $(this).val();
			var staff_langue = parseInt($(this).siblings('.staff_langue_id').val());
			if(isNaN(staff_langue)){
				$(this).siblings('.creat_langue').val(id);
			}else{
				$(this).siblings('.remove_langue').val('');
			}
			$(this).closest('.with_fake_out_in').siblings('.job_id').val(resp);
			$(this).closest('.parent_element').siblings().removeClass('is_hidden');
			$(this).siblings('.out_check').find('span').addClass('in_check');
		}else{
			var staff_langue = parseInt($(this).siblings('.staff_langue_id').val());
			if(!isNaN(staff_langue) && staff_langue!=""){
				$(this).siblings('.remove_langue').val(staff_langue);
			}else{
				$(this).siblings('.creat_langue').val('');
			}
			$(this).closest('.with_fake_out_in').siblings('.job_id').val('');
			$(this).closest('.parent_element').siblings().addClass('is_hidden');
			$(this).siblings('.out_check').find('span').removeClass('in_check');
		}

		//preview input coté JS
		var inputPreview = "";
		$(this).closest('ul').find('input.id_parent.active').each(function(i, el){
			inputPreview = inputPreview + $(el).siblings('span').text().trim() + ', ';
		});
		if (inputPreview != "")
			inputPreview = inputPreview.slice(0, -2);
		$(this).closest('.dropdown-menu').find('input').val(inputPreview);

	});
	$('.master').find('.extended_element').on('click','.checkbox',function(){
		var value = $(this).find('input').val();
		var elem = $(this).closest('.extended_element').siblings('.parent_element');
		$(this).find('input').prop('checked',true);
		$(this).siblings().find('input').prop('checked',false);
		$(this).siblings('.level').val(value);
		var level_langue = $(this).closest('.extended_element').siblings('.parent_element').find('.update_langue');
		var input_parent = $(this).closest('.extended_element').siblings('.parent_element').find('.id_parent');
		var langue_id = input_parent.val();
		var update_id = $(this).closest('.extended_element').siblings('.parent_element').find('.update_id');
		var creat_langue = $(this).closest('.extended_element').siblings('.parent_element').find('.creat_langue');
		var staff_langue_id = $(this).closest('.extended_element').siblings('.parent_element').find('.staff_langue_id');
		var level = parseInt($(this).siblings('.level').val());
		if(input_parent.hasClass('active') && creat_langue.val()==""){
			if(!isNaN(parseInt(staff_langue_id.val()))){
				level_langue.val(parseInt(staff_langue_id.val()));
				update_id.val(parseInt(langue_id));
				if(!isNaN(level)){
					$(this).siblings('.update_level').val(level);
				}
			}
		}
	});
	$('.master').find('.car_certification').on('click','input[type="radio"]',function(){
		var val = $(this).val();
		$(this).closest('.checkbox').siblings('input').val(val);
	});
	$('.master').find('.staff_certification').on('click','input[type="checkbox"]',function(){
		$(this).toggleClass('active');
		if($(this).hasClass('active')){
			$(this).closest('.checkbox').siblings('input').val(1);
		}else{
			$(this).closest('.checkbox').siblings('input').val(0);
		}
	});
	$('.master').find('.staff_mobility').on('click','input[type="checkbox"]',function(){
		$(this).toggleClass('active');
		if($(this).hasClass('active')){
			var id = $(this).val();
			var staff_mob = parseInt($(this).closest('.checkbox').siblings('.id_now').val());
			if(isNaN(staff_mob)){
				$(this).closest('.checkbox').siblings('.id_create').val(id);
			}else{
				$(this).closest('.checkbox').siblings('.id_remove').val('');
			}
		}else{
			var staff_mob = parseInt($(this).closest('.checkbox').siblings('.id_now').val());
			if(staff_mob !='' && !isNaN(staff_mob)){
				$(this).closest('.checkbox').siblings('.id_remove').val(staff_mob);
			}else{
				$(this).closest('.checkbox').siblings('.id_create').val('');
			}

		}
	});


	$('.modal_content').on('click','.choose_file',function(){
		var src = $(this).siblings('.image_file').find('img');
		var id = $(this).closest('.modal').attr('id');
		var head_shot_photo = $('.photo_cv_files_content').find('.head_shot_photo .sp').val();
		var upper_body_photo = $('.photo_cv_files_content').find('.upper_body_photo .up').val();
		var resume = $('.photo_cv_files_content').find('.resume .rm').val();
		switch(id){
			case "upload_head_shot_photo":
				$('.photo_cv_files_content').find('.head_shot_photo img').attr('src', src.attr('src'));
				$('.photo_cv_files_content').find('.head_shot_photo .shot_photo').val(1);
				break;
			case "upload_upper_body_photo":
				$('.photo_cv_files_content').find('.upper_body_photo img').attr('src', src.attr('src'));
				$('.photo_cv_files_content').find('.upper_body_photo .body_photo').val(1);
				break;
			case "upload_resume_file" :
				$('.photo_cv_files_content').find('.resume img').attr('src', src.attr('src'));
				$('.photo_cv_files_content').find('.resume .resume_photo').val(1);
				break;
		}
      	var modal = $(this).closest('.modal');
	    modal.addClass('is_hidden is_visually_hidden');
	    $('.master').removeClass('is_blurred');
	    $('html, body').removeClass('no_scroll');
	});
})

function headPhoto(input, div) {
    if (input.files && input.files[0]) {
        if (input.files[0].type == "image/jpeg" || input.files[0].type == "image/png" || input.files[0].type == "image/svg+xml"){
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.modal_content').find('#head_shot_photo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        } else {
            $('.modal_content').find('#upper_body_photo').attr('src', 's');
        }
    }
}
$('.launch_modal').find("#head_shot_photo").change(function () {
	headPhoto(this);
});

function bodyPhoto(input, div) {
    if (input.files && input.files[0]) {
        if (input.files[0].type == "image/jpeg" || input.files[0].type == "image/png" || input.files[0].type == "image/svg+xml"){
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.modal_content').find('#upper_body_photo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        } else {
            $('.modal_content').find('#upper_body_photo').attr('src', 's');
        }
    }
}
$('.launch_modal').find("#upper_body_photo").change(function () {
	bodyPhoto(this);
});

function cvPhoto(input, div) {

    if (input.files && input.files[0]) {
        if (input.files[0].type == "application/pdf"){
	       var url = appURL+"/img/step_photo_cv/pdf.jpeg"
	       $('.modal_content').find('#resume').attr('src',url);
	    } else if (input.files[0].type == "application/vnd.openxmlformats-officedocument.presentationml.presentation"){
	       var url = appURL+"/img/step_photo_cv/pptx.png"
	       $('.modal_content').find('#resume').attr('src',url);
	    } else if (input.files[0].type == "application/vnd.openxmlformats-officedocument.wordprocessingml.document"){
	        var url = appURL+"/img/step_photo_cv/word.png"
	        $('.modal_content').find('#resume').attr('src',url);
	    } else {
	        $('.modal_content').find('#resume').attr('src', 's');
	    }
    }
}
$('.launch_modal').find("#resume").change(function () {
	cvPhoto(this);
});

$(document).ready(function () {
    // var profil_hidden =$('.update_profil_staff').find('.bool');
    // profil_hidden.val('0');
    // var profil_update =$('.update_profil_staff').find('input');
    // profil_update.addClass('inputChange')
    // console.log(profil_hidden.val());
    // var profil_value = profil_update.html();
    // $('.inputChange').on('change',function () {
    //     profil_hidden.val('1')
    //     console.log(profil_hidden.val());
    // })



    $('#save_profil_staff').click(function () {
		var tatou_visible = document.getElementsByName('tatou_visible[]');
		add_method_checkbox(tatou_visible);
		var piercing = document.getElementsByName('piercing_visible[]');
		add_method_checkbox(piercing);
		var sizeAttribute1 = document.getElementsByName('sizeAttribute1[]');
		add_method_checkbox(sizeAttribute1);
		var sizeAttribute2 = document.getElementsByName('sizeAttribute2[]');
		add_method_checkbox(sizeAttribute2);
		var sizeAttribute3 = document.getElementsByName('sizeAttribute3[]');
		add_method_checkbox(sizeAttribute3);
		var xp = document.getElementsByName('xp[]');
		add_method_checkbox(xp);
	})
	function add_method_checkbox(valeur){
		for (var i=0;i<valeur.length;i++){
			console.log(valeur[i]);
			if (valeur[i].checked ==false){
				valeur[i].value =0;
				console.log('default value: '+valeur[i].value);
			}else{
				console.log('exact value: '+valeur[i].value);
			}
		}

	}


})
