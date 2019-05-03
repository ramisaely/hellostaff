var currentTab = 0; // Current tab is set to be the first tab (0)

$(document).ready(function(){
    var langue = getLanguage();
  	/*** start change page in each step ***/
  	showTab(currentTab); // Display the crurrent tab
  	/*** end change page in each step ***/

    /* start cform validation */
  	$('.contact_principal .confirm_password').parent().next().hide();

    $('.contact_principal').on('keyup','.last_name',function(){
        var range = $(this).closest(".personal_plus").data('range');
        $('.contact_principal').find('.boolean').val("1");
        $(this).closest('.personal_plus').find('.ajout'+range).css('background-color', '#36ccb5');
        if($(this).val()==""){
            $(this).css('border','1px solid red');
        }else{
            $(this).css('border','');
        }
    });
    $('.contact_principal').on('keyup','.first_name',function(){
        var range = $(this).closest(".personal_plus").data('range');
        $('.contact_principal').find('.boolean').val("1");
        $(this).closest('.personal_plus').find('.ajout'+range).css('background-color', '#36ccb5');
        if($(this).val()==""){
            $(this).css('border','1px solid red');
        }else{
            $(this).css('border','');
        }
    });
    $('.contact_principal').on('keyup','.phone_personal',function(){
        var range = $(this).closest(".personal_plus").data('range');
        $('.contact_principal').find('.boolean').val("1");
        $(this).closest('.personal_plus').find('.ajout'+range).css('background-color', '#36ccb5');
        if($(this).val()==""){
            $(this).css('border','1px solid red');
        }else{
            $(this).css('border','');
        }
    });
    $('.contact_principal').on('keyup','.adress_personal',function(){
        var range = $(this).closest(".personal_plus").data('range');
        $('.contact_principal').find('.boolean').val("1");
        $(this).closest('.personal_plus').find('.ajout'+range).css('background-color', '#36ccb5');
        if($(this).val()==""){
            $(this).css('border','1px solid red');
        }else{
            $(this).css('border','');
        }
    });
    $('.contact_principal').on('keyup','.password',function(){
        var range = $(this).closest(".personal_plus").data('range');
        $('.contact_principal').find('.boolean').val("1");
        $(this).closest('.personal_plus').find('.ajout'+range).css('background-color', '#36ccb5');
        if($(this).val()==""){
            $(this).css('border','1px solid red');
            $(this).siblings('.background_no_view').css('border','1px solid red');
        }else{
            $(this).css('border','');
            $(this).siblings('.background_no_view').css('border','');
        }
    });
    $('.contact_principal').on('keyup','.confirm_password',function(){
        var range = $(this).closest(".personal_plus").data('range');
        $('.contact_principal').find('.boolean').val("1");
        $(this).closest('.personal_plus').find('.ajout'+range).css('background-color', '#36ccb5');
        if($(this).val()==""){
            $(this).css('border','1px solid red');
            $(this).siblings('.background_no_view').css('border','1px solid red');
        }else{
            $(this).css('border','');
            $(this).siblings('.background_no_view').css('border','');
        }
    });


    $('.contact_principal').on('change', '.confirm_password', function(){
      if ($(this).val() != $(this).closest('.contact_user').find('.password').val()){
        $(this).closest('.contact_user').siblings().addClass('error');
        $(this).closest('.personal').addClass('error');
        $(this).parent().next().show();
      }else{
        $(this).closest('.contact_user').siblings().removeClass('error');
        $(this).closest('.personal').removeClass('error');
        $(this).parent().next().hide();
      }
    });

    $('.contact_principal').on('click', '.ajouter', function(){
        if($(this).closest('.personal_plus').find('.phnPers').html() != "" || $(this).closest('.personal_plus').find('.emailPers').html() != "" || $(this).closest('.personal_plus').find('.last_name').val() == "" || $(this).closest('.personal_plus').find('.first_name').val() == "" || $(this).closest('.personal_plus').find('.password').val() == "" || $(this).closest('.personal_plus').find('.confirm_password').val() != $(this).closest('.personal_plus').find('.password').val()) {
            if (langue == "en") {
                toastr.warning('Please complete the required fields!');
            }else{
                toastr.warning('Veuillez completer les champs requis!');
            }
        }else{
            $(this).css('background-color', '#F3F1F0');
            $('.contact_principal').find('.boolean').val("0");
        }
    });

    $(document).on('change', '.zip_agency',function(){
        var value = $('.zip_agency').val();
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

    /*Verifier Unique Agency&Phone*/
    $(document).on('change', '#phone_agence', function(e) {
        var value = $('#phone_agence').val();
        var url = $('#msgbox').data('verify_unique');
        var data = $(this).val();
        $.ajax({
            url: url,
            type : 'POST',
            dataType : 'json',
            data: {phone: data},
            success: function(results){ // si l'appel a bien fonctionné
                if(results['result'] == true) {// si la connexion en php a fonctionnée
                    if(langue == "fr"){
                        $("#msgbox").html("Ce numéro est dejà utilisé");
                        toastr.warning('Veuillez entrer un autre numéro')
                        $('#phone_agence').css("border", "1px solid red");
                    } else {
                        $("#msgbox").html("This number is already used");
                        toastr.warning('Please enter an other phone number')
                        $('#phone_agence').css("border", "1px solid red");
                    }
                } else {
                  $("#msgbox").html("");
                  $('#phone_agence').css("border", "");
                }
            }
        });
    });

    /*Verifier Unique AgencyMail*/
    $(document).on('change', '#mail_agence', function(e) {
        var value = $('#mail_agence').val();
        var url = $('#mailmsg').attr('data-verifyUniqueMail');
        var data = $(this).val();
        $.ajax({
            url: url,
            type : 'POST',
            dataType : 'json',
            data: {email: data},
            success: function(results){ // si l'appel a bien fonctionné
                if(results['result'] == true) {// si la connexion en php a fonctionnée
                    if(langue == "fr"){
                        $('#mail_agence').css("border", "1px solid red");
                        $("#mailmsg").html("Cet e-mail est dejà utilisé");
                        toastr.warning('Veuillez entrer une autre e-mail')
                    } else {
                        $('#mail_agence').css("border", "1px solid red");
                        $("#mailmsg").html("This e-mail is already used");
                        toastr.warning('Please enter an other e-mail')
                    }
                } else {
                  $("#mailmsg").html("");
                  $('#mail_agence').css("border", "");
                }
            }
        });
    });

    /*Verifier Unique UsersPhone*/
    $(document).on('change', '.phone_personal', function(e) {
        var value = $('.phone_personal').val();
        var url = $(this).siblings('.phnPers').attr('data-verify_uniquePhnPers');
        var data = $(this).val();
        $.ajax({
            url: url,
            type : 'POST',
            dataType : 'json',
            context: this,
            data: {phones: data},
            success: function(results){ // si l'appel a bien fonctionné
                jQuery.fn.extend({
                    disable: function(etat){
                        return this.each(function(){ this.disabled = etat; });
                    }
                });
                if(results['resultat'] == true) {// si la connexion en php a fonctionnée
                    if(langue == "fr"){
                        $(this).css("border", "1px solid red");
                        $(this).siblings('.phnPers').html("Ce numéro est dejà utilisé");
                        toastr.warning('Veuillez entrer un autre numéro')
                    }else{
                        $(this).css("border", "1px solid red");
                        $(this).siblings('.phnPers').html("This number is already used");
                        toastr.warning('Please enter an other phone number')
                    }
                    $('.btn_make_user').disable(true);
                }
                else{
                    $(this).siblings('.phnPers').html("");
                    $(this).css("border", "");
                    $('.btn_make_user').disable(false);
                   /*$('.footer').on('click','.step_next_btn');*/
                }
            }
        });
    });

    /*Verifier Unique UsersEmail*/
    $(document).on('change', '.adress_personal', function(e) {
        var value = $('.adress_personal').val();
        var url = $('.emailPers').attr('data-verify_uniqueEmailPers');
        var data = $(this).val();
        $.ajax({
            url: url,
            type : 'POST',
            dataType : 'json',
            context: this,
            data: {emails: data},
            success: function(results){ // si l'appel a bien fonctionné
                jQuery.fn.extend({
                    disable: function(etat) {
                        return this.each(function() { this.disabled = etat; });
                    }
                });
                if(results['resultat'] == true){ // si la connexion en php a fonctionnée
                    if(langue == "fr"){
                        $(this).css("border", "1px solid red");
                        $(this).siblings('.emailPers').html("Cet e-mail est dejà utilisé");
                        toastr.warning('Veuillez entrer une autre e-mail')
                    } else {
                        $(this).css("border", "1px solid red");
                        $(this).siblings('.emailPers').html("This e-mail is already used");
                        toastr.warning('Please enter an other e-mail')
                    }
                    $('.btn_make_user').disable(true);
                } else {
                    $(this).siblings('.emailPers').html("");
                    $(this).css("border", "");
                    $('.btn_make_user').disable(false);
                }
            }
        });
    });
    /* End verify unique email and phone of agency and user */
});

function showTab(n) {
    // This function will display the specified tab of the form...
    var x = document.getElementsByClassName("page");
    x[n].style.display = "block";
    //... and fix the Previous/Next buttons:
    if (n==0){
        $('.footer #prevBtn').hide();
    } else {
        $('.footer #prevBtn').show();
    }

    if (n == (x.length - 1)) {
        document.getElementById("nextBtn").innerHTML = finish;
    } else {
        document.getElementById("nextBtn").innerHTML = next;
    }
}

function nextPrev(n) {
    $('html,body').animate({scrollTop: $("#content_agency").offset().top}, 10);
    // Validation form staff registration
    if (currentTab ==2){
        $('.contact_principal').find('.confirm_password').each(function(i,field){
            if($(field).val()==""){
                $(this).focus();
                $(this).css('border','1px solid red');
                $(this).siblings('.background_no_view').css('border','1px solid red');
            }
        });
        $('.contact_principal').find('.password').each(function(i,field){
            if($(field).val()==""){
                $(this).focus();
                $(this).css('border','1px solid red');
                $(this).siblings('.background_no_view').css('border','1px solid red');
            }
        });
        $('.contact_principal').find('.adress_personal').each(function(i,field){
            if($(field).val()==""){
                $(this).focus();
                $(this).css('border','1px solid red');
            }
        });
        $('.contact_principal').find('.phone_personal').each(function(i,field){
            if($(field).val()==""){
                $(this).focus();
                $(this).css('border','1px solid red');
            }
        });
        $('.contact_principal').find('.last_name').each(function(i,field){
            if($(field).val()==""){
                $(this).focus();
                $(this).css('border','1px solid red');
            }
        });
        $('.contact_principal').find('.first_name').each(function(i,field){
            if($(field).val()==""){
                $(this).focus();
                $(this).css('border','1px solid red');
            }
        });
    }
    $("#regForm").validate({
        rules: {
            name_entreprise: {
                required: true,
                minlength: 3
            },
            tps:{
                //required: true,
                number:true,
                //exactlength: 15
                rangelength: [15, 15]
            },
            tvq:{
                //required: true,
                number: true,
                //exactlength: 16
                rangelength: [16, 16]
            },
                phone_agence:{
                required: true,
                //digits: true,
                number: true,
            },
            mail_agence:{
                required: true,
                email: true
            },
        },
        highlight : function(element) {
    		$(element).closest('.form_item').addClass('error');
    	},
    	unhighlight : function(element) {
    		$(element).closest('.form_item').removeClass('error');
    	},
    });

    if($('#regForm').valid()) {
        changePage(n);
    }
    $('form .input_group').each(function(i, el) {
        if($(el).find('input').hasClass('error'))
            $(el).find('.input_addon').addClass('error');
    });
}

function prevPrev(n){
    retournPage(n)
}

function retournPage(n){
    var x = document.getElementsByClassName("page");
    x[currentTab].style.display = "none";
    currentTab = currentTab + n;
    /*** start change current step style ***/
    var currentLabel = $('.agency_reg_step_range_labels').find('li[data-value="'+currentTab+'"]');
    $('.agency_reg_step_range_labels li').removeClass('current');
    currentLabel.addClass('active selected current');
    currentLabel.prevAll().addClass('selected');
    /*** end change current step style ***/
  	$("p.header_title").html(agency_registration_agency[currentTab]);
  	$("p.paragraph").html(text_registration[currentTab]);
  	$("p.steve_jobs").html(steve_jobs_registration[currentTab]);
  	$("p.paragraph2").html(text_user2[currentTab]);
    // Otherwise, display the correct tab:
    showTab(currentTab);
}

function changePage(n) {
    // This function will figure out which tab to display
    var x = document.getElementsByClassName("page");
    // Hide the current tab:
    x[currentTab].style.display = "none";

    // page number 2
    if (currentTab == 1){
        if ($('#company_logo').val() == ""  && $('#description_fr').val() == "" && $('#description_en').val() == ""){
            launch_modal("description_validation");
        } else if ($('#company_logo').val() == ""){
            launch_modal("company_logo_validation");
        } else if ($('#description_fr').val() == "" && $('#description_en').val() == ""){
            launch_modal("corporative_validation");
        } else {
            currentTab = currentTab + n;
        }
    } else {
        // Increase or decrease the current tab by 1:
        currentTab = currentTab + n;
    }

    // if you have reached the end of the form...
    if (currentTab >= x.length) {
        // ... the form gets submitted:
        if($('#msgbox').html() != "" || $('#mailmsg').html() != "" || $('.phnPers').html() != "" || $('.emailPers').html() != "")
        {
            currentTab = currentTab -n;
        } else {
            /*launch_modal("agency_registration_finish");*/
            $('#click_me').trigger('click');
            return false;
        }
    }

    /*** start change current step style ***/
    var currentLabel = $('.agency_reg_step_range_labels').find('li[data-value="'+currentTab+'"]');

    $('.agency_reg_step_range_labels li').removeClass('current');
    currentLabel.addClass('active selected current');
    currentLabel.prevAll().addClass('selected');
    /*** end change current step style ***/

  	$("p.header_title").html(agency_registration_agency[currentTab]);
  	$("p.paragraph").html(text_registration[currentTab]);
  	$("p.steve_jobs").html(steve_jobs_registration[currentTab]);
  	$("p.paragraph2").html(text_user2[currentTab]);
    // Otherwise, display the correct tab:
    showTab(currentTab);
}

function selectionPage(n){
    var x = document.getElementsByClassName("page");
    x[currentTab].style.display = "none";
    currentTab = n;
    // if you have reached the end of the form...
    if (currentTab >= x.length) {
        // ... the form gets submitted:
        if($('#msgbox').html() != "" || $('#mailmsg').html() != "" || $('.phnPers').html() != "" || $('.emailPers').html() != "")
        {
            currentTab = currentTab -n;
        } else {
            /*launch_modal("staff_registration_finish");*/
            $('#click_me').trigger('click');
            return false;
        }
    }
    /*** start change current step style ***/
    var currentLabel = $('.agency_reg_step_range_labels').find('li[data-value="'+currentTab+'"]');

    $('.agency_reg_step_range_labels li').removeClass('current');
    currentLabel.addClass('active selected current');
    currentLabel.prevAll().addClass('selected');
    /*** end change current step style ***/

    // Otherwise, display the correct tab:
    showTab(currentTab);
}

$('.agency_reg_step_range_labels li').click(function(){
    var classe = $(this).attr('class');
    var index =  $('.agency_reg_step_range_labels li').index(this);
    var numberPage = $(this).attr('data-value');
    if (classe == "active selected"){
        if (index == numberPage){
            selectionPage(index);
            switch (index){
                case 0:
                    $('p.header_title').text(title_entreprise);
                    $('p.paragraph').text(text_entreprise);
                    $('p.steve_jobs').text('');
                    $('p.paragraph2').text('');
                    break;
                case 1:
                    $('p.header_title').text(title_identity);
                    $('p.paragraph').text(text_identity);
                    $('p.steve_jobs').text('');
                    $('p.paragraph2').text('');
                    break;
                case 2:
                    $('p.header_title').text(title_user);
                    $('p.paragraph').text(text_user);
                    $('p.steve_jobs').text(steve_jobs);
                    $('p.paragraph2').text(text_user2);
                    break;
            }
            $(document).scrollTop(0);
        }
    }
});

function validateForm() {
    // This function deals with validation of the form fields
    var x, y, i, valid = true;
    x = document.getElementsByClassName("tab");
    y = x[currentTab].getElementsByTagName("input");
    // A loop that checks every input field in the current tab:
    for (i = 0; i < y.length; i++) {
        // If a field is empty...
        if (y[i].value == "") {
            // add an "invalid" class to the field:
            y[i].className += " invalid";
            // and set the current valid status to false
            valid = false;
        }
    }
    // If the valid status is true, mark the step as finished and valid:
    if (valid) {
        document.getElementsByClassName("step")[currentTab].className += " finish";
    }
    return valid; // return the valid status
}


function recaptchaCallback() {
  	var response = grecaptcha.getResponse(),
  	button = $(".button-register");
  	$("#hidden-grecaptcha").val(response);
  	console.log($("#registerForm").valid());
  	if ($("#registerForm").valid()) {
  		  button.attr("disabled", false);
  	} else {
  		  button.attr("disabled", "disabled");
  	}
}