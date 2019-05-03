$(document).ready(function() {

    var url = location.href.split('/');
    var langue= url[3];

    /* Erreur enregistrement */
    var class_error = $('.master').find('.alert_notification');
    if (class_error!="") {
        $('div.alert_notification').css('position','relative');
        $('div.alert.danger').css('background-color','transparent');
        $('div.alert.danger').css('color','red');
        $('div.alert.danger').css('border','1px solid red');
        $('div.alert.danger').children('ul').css('margin-left','-36px');
    }else{
      console.log("tsita children");
    }
    /* Fin Erreur enregistrement */

    /*Start Validation Phone*/
    $('.contact_information').on('keyup', '#phone', function(){
        $(this).css('border', '');
    });
    $('.contact_information').on('change', '#phone', function(){
        var phone = $(this).val();
        if (phone.length < 10) {
            if (langue == "en") {
                toastr.warning('Your Telephone Number is not valid, Please enter 10 digit minimum!');
                $(this).css('border', '1px solid red');
                $('#nextBtn').attr("disabled", true);
            }else{
                toastr.warning('Votre Numéro Telephone n\'est pas valide, Veuillez entrer 10 chiffre minimum SVP!');
                $(this).css('border', '1px solid red');

            }
        }else{
            $(this).css('border', '');
        }
    });
    /*End Validation Phone*/

    /*** Session input ***/

    $(document).on('change', 'input', function(e) {
        var list_language = $('.list_language').find('.checkbox_wrap').length;
        var dataForm = $('#regForm').serializeArray();
        var dataVal = {};
        dataForm.forEach(function(field){
            if ((field.name != "attributs[]") && (field.name != "job_experience[]") && (field.name != "job_id[]") && (field.name!= "job_checked[]") && (field.name!= "language[]") && (field.name!= "language_level[]") && (field.name!= "attribute[]") && (field.name!= "attribute_option[]") && (field.name!= "attribute_option_id[]")){
                dataVal[field.name] = field.value;
            }
        });

        $("input[name='language_level[]']").each(function(i,field){
            dataVal[field.id] = field.value;
        });

        $("input[name='job_experience[]']").each(function(i,field){
              dataVal[field.id] = field.value;
        });

        $("input[name='job_checked[]']").each(function(i,field){
            dataVal["exp_"+(i+77)] = field.value;
        });

        $(".certification").find(".checkbox input[type='checkbox']").each(function(i,field){
            if($(field).siblings('.checkbox_label').hasClass('active')){
              dataVal[field.id] = 1;
            }else{
              dataVal[field.id] = 0;
            }
        });

        $(".certification").find(".checkbox input[type='radio']").each(function(i,field){
            if($(field).siblings('.checkbox_label').hasClass('active')){
              dataVal[field.id] = 1;
            }else{
              dataVal[field.id] = 0;
            }
        });

        $(".contact_information").find(".checkbox input[type='radio']").each(function(i,field){
            if($(field).siblings('.checkbox_label').hasClass('active')){
              dataVal[field.id] = "checked";
            }else{
              dataVal[field.id] = "";
            }
        });

        $(".attributs_wrap").find(".select_attributs").each(function(i,field){
            dataVal[field.id] = field.value;
        });

        $("input[name='attribute_option[]']").each(function(i,field){
            dataVal[field.id] = field.value;
        });

        $("input[name='mobility[]']").each(function(i,field){
            if($(field).siblings().hasClass('active')){
              dataVal[field.id] = field.value;
            }else{
              dataVal[field.id] = "";
            }
        });

        var url = $('#regForm').data('session-staff');
        $.ajax({
            type : 'GET',
            url : url,
            dataType : 'json',
            data: dataVal,
            success : function(response){ // success est toujours en place, bien sûr !
                /*console.log("Adding the new input value to session done with success");*/
            },
            error : function(resultat, statut, erreur){
              console.log(url);
              console.log("Error for adding the new input value to session with :");
              console.log("     status = " + statut);
              console.log("     status of result = "+resultat.status);
              console.log("     error = "+erreur);
            }
        });
    });
    /*** End session input ***/

    /*** start job experience ***/
    var xp_input = "";

    $('.job_experience').on('click','.job', function() {
        var jobPosition = window.pageYOffset;
        idInput  = $(this).find('.launch_modal').next().attr('id');
        idInput = '#' + idInput;
        valueInput = $(this).find('.launch_modal').next().attr('value');
        $(this).toggleClass('active');

        if($(this).hasClass('active')) {
            activate_inline_svg('.job img');
            $(this).find('.job_checked').val('yes');
            $('html, body').scrollTop(0);
            launch_modal('define_experience');

            $('.post').html($(this).find('.title').html());
            var src_icon = $(this).find('.launch_modal').attr('data-src-img');
            $('.title-icon-modal').html('<img class="title-icon" src="'+src_icon+'"/>');

            $(".experience").html(0).addClass('experience_null');
            $(".experience_wrap_sup").addClass('hidden_experience');
            $(".experience_wrap").addClass('hidden_experience');
            $('p.foot_paragraph').text(post_position);

            $('.job_experience_range_labels li').removeClass('active selected');
            var li_num = $('.job_experience_range_labels').find('li[data-value="'+valueInput+'"]');
            if (li_num !== ''){
                li_num.addClass('active selected');
                li_num.prevAll().removeClass('selected');
            }


            switch (valueInput) {
                case 'no':
                    $(".experience").html('0').addClass('experience_null');
                    $(".experience_wrap_sup").addClass('hidden_experience');
                    $(".experience_wrap").addClass('hidden_experience');
                    $(this).removeClass('active');
                    $('p.foot_paragraph').text("");
                    break;

                case 0:
                    $(".experience").html(valueInput).addClass('experience_null');
                    $(".experience_wrap_sup").addClass('hidden_experience');
                    $(".experience_wrap").addClass('hidden_experience');
                    $('p.foot_paragraph').text(post_position);
                    break;

                case 1:
                    $(".experience").html(valueInput).removeClass('experience_null');
                    $(".experience_wrap_sup").addClass('hidden_experience');
                    $(".experience_wrap").addClass('hidden_experience');
                    $('p.foot_paragraph').text("");
                    break;

                case 2:
                    $(".experience").html(valueInput).removeClass('experience_null');
                    $(".experience_wrap_sup").addClass('hidden_experience');
                    $(".experience_wrap").removeClass('hidden_experience');
                    $('p.foot_paragraph').text("");
                    break;

                case "3+":
                    $(".experience").html(valueInput).removeClass('experience_null');
                    $(".experience_wrap_sup").removeClass('hidden_experience');
                    $(".experience_wrap").removeClass('hidden_experience');
                    $('p.foot_paragraph').text("");
                    break;
            }
            //$("#expSup").attr('data-value',"3+");
        } else {
            $(this).find('.job_checked').val('no');
            $(this).find('.job_experience').val('');
        }


        /* Job exp Benja*/
        $('.modal_footer1').click(function(){
            $data_value = $(".experience").text();
            $(idInput).prev().text($data_value);
            $(idInput).val($data_value);
            var modal = $(this).closest('.modal');
            modal.addClass('is_hidden is_visually_hidden');
            $('.master').removeClass('is_blurred');
            $('html, body').removeClass('no_scroll');
            /**end close modal*/
            $('html, body').scrollTop(jobPosition);
        });
        /* End Job exp Benja*/
    });

    // start Activate svg inline to change color
    if($('.job_experience .job').hasClass('active')) {
        activate_inline_svg('.job img');
    }
    // end Activate svg inline to change color

    // Check the checkbox before select a language in << Quelles language parles-tu? >>

    $('.language_choice li').click(function(){
        $(this).closest('.dropdown-menu').find('.all_language_choice_id').val($(this).data('id'));
        if (!$(this).closest(".form_item").find(".checkbox_label").hasClass("active")){
            $(this).closest(".form_item").find(".checkbox_label").addClass("active");
            $(this).closest(".form_item").find(".with_check").prop("checked", true);
        }
    });

    $('#yearID li').click(function(){
        var staffYear = parseInt($(this).text());
        var currentDate = new Date();
        var yearCurrentDate = parseInt(currentDate.getFullYear());
        var ages = yearCurrentDate-staffYear;
        $(this).closest('.dropdown-menu').find('.staff_ages').val(ages);
    });

    if ($('#year').val() != "") {
        var staffYear = parseInt($('#year').val());
        var currentDate = new Date();
        var yearCurrentDate = parseInt(currentDate.getFullYear());
        var ages = yearCurrentDate-staffYear;
        $('.staff_ages').val(ages);
    }

    /* Condition numero NAS */
    /*$('#nas').keyup(function () {
      var max = 9;
      var len = $(this).val().length;
      if (len = max) {
        console.log("c'est plus haut");
      }
      else {
        console.log("c'est encore petit que 9 ");
      }
    });*/
    /* end Condition numero NAS */

    /* Language Site Mobile*/
    

    $(function() {
      	var windowHeight= $(window).height();
      	if(windowHeight < 480){
        		// language Fr
        		$(".french").html("Fr");
        		// language En
        		$(".english").html("En");
      	}
    });
    /* End Language Site Mobile*/

    $(document).on('change', '.zip_staff',function(){
        var value = $('.zip_staff').val();
        var zipCode = /^[a-zA-Z][0-9][a-zA-Z]\s*[0-9][a-zA-Z][0-9]/;

        if(zipCode.test(value)){
            $(this).css("border", "");
            $('#nextBtn').attr('onclick', 'nextPrev(1)');
        } else {
            $(this).css("border", "1px solid red");
            $('#nextBtn').attr('onclick', '');
            if(langue == "fr"){
                toastr.error('Please enter a valid zip code');
            } else {
                toastr.error('Veuillez entrer un Code Postal Valide')
            }
        }
    });

    /* start confirmation password */
    $('#confirm_password').change(function(){
        if ($('#password').val() != $(this).val()){
            $('#password').closest('.account').addClass('error');
            $('#confirm_password').closest('.account').addClass('error');
            $('#error_confirm').show();
        } else {
            $('#password').closest('.account').removeClass('error');
            $('#confirm_password').closest('.account').removeClass('error');
            $('#error_confirm').hide();
        }
    });
    /* end confirmation password */
});

function activate_inline_svg(string){
    jQuery(string).each(function(){
        var $img = jQuery(this);
        var imgID = $img.attr('id');
        var imgClass = $img.attr('class');
        var imgURL = $img.attr('src');

        jQuery.get(imgURL, function(data) {
            // Get the SVG tag, ignore the rest
            var $svg = jQuery(data).find('svg');

            // Add replaced image's ID to the new SVG
            if(typeof imgID !== 'undefined') {
              $svg = $svg.attr('id', imgID);
            }
            // Add replaced image's classes to the new SVG
            if(typeof imgClass !== 'undefined') {
              $svg = $svg.attr('class', imgClass+' replaced-svg');
            }

            // Remove any invalid XML tags as per http://validator.w3.org
            $svg = $svg.removeAttr('xmlns:a');

            // Replace image with new SVG
            $img.replaceWith($svg);
        }, 'xml');
    });
}

$('ul.jacket_drop li').click(function(){
    $(this).closest('.dropdown-menu').find('.attribute_option_id').val($(this).data('id'));
});