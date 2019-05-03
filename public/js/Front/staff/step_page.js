
var currentTab = 0; // Current tab is set to be the first tab (0)

$( document ).ready(function() {

    var url = location.href.split('/');
    var langue= url[3];

    /** Start verification formulaire unique mail exist **/
    $(document).on('change','#phone',function(e){
        var value = $('#phone').val();
        var url_phone = $('#phone').data('phone_verif');
        $.ajax({
            type: 'POST',
            url :url_phone,
            dataType :'json',
            data : {phone: value},
            success:function (response){
                if(response['phone_result']==true){
                    if(langue == "fr"){
                        $('#phone').css('border', '1px solid red');
                        $('#phoneerror').html('Ce numero est déjà utilisé !');
                        //alert(value +" est dejà existé !")
                    } else {
                        $("#phoneerror").html("This number is already used !");
                        $('#phone').css("border", "1px solid red");
                        //alert(value +" already existed !")
                    }
                } else {
                    $('#phone').css('border', '');
                    $('#phoneerror').html('');
                }
            },
            error : function(e){
                console.log('Error to verify if the phone number is already used, with ' + e);
            }
        });
    });
    /** End verification mail exist **/

    /** Start verification phone exist **/
    $(document).on('change','#email', function(){
        var value = $('#email').val();
        console.log(value);
        var url_email = $('#email').data('email_verif');
        console.log(url_email);
        $.ajax({
            url :url_email,
            type: 'POST',
            /*dataType :'JSON',*/
            data : {email: value},
            success:function (response){
                if(response['email_result']==true){
                    if(langue == "fr"){
                        $('#email').css('border', '1px solid red');
                        $('#emailerror').html('Cet email est déjà utilisé !');
                       // alert(value +" est dejà existé !")
                    }else{
                        $("#emailerror").html("This e-mail is already used !");
                        $('#email').css("border", "1px solid red");
                        //alert(value +" already used !")
                    }
                }else{
                    $('#email').css('border', '');
                    $('#emailerror').html('');
                }
            },
            error : function(response, status, erreur){
                console.log('Error to verify if the e-mail adress is already used, with ' + erreur);
                console.log(response);
            }
        });
    });
    /** End verification phone exist **/

  	/*** start change page in each step ***/
  	showTab(currentTab);// Display the crurrent tab
  	$('#error_confirm').hide();
});

function showTab(n) {
    // This function will display the specified tab of the form...
    var x = document.getElementsByClassName("page");
    x[n].style.display = "block";
    if (n==0){
        $('.footer #prevBtn').hide();
    } else {
        $('.footer #prevBtn').show();
    }
    
    if (n == (x.length - 1)) {
        document.getElementById("nextBtn").innerHTML = btn_finish;
    } else {
        document.getElementById("nextBtn").innerHTML = btn_next;
    }
}


function nextPrev(n) {
    $(".current_tab").val(currentTab);
    // Validation form staff registration
    $(".staff_registration").validate({
        rules: {
          first_name: {
            required: true,
            minlength: 3
          },
          last_name: {
            required: true,
            minlength: 3
          },
          email: {
            required: true,
            email: true
          },
          password: {
            required: true,
            minlength: 6
          },
          confirm_password: {
            equalTo: "#password"
          },
          nas: {
            // required: true,
            number:true,
          //   exactlength: 15
             rangelength: [9, 9]
          }
          //"hidden-grecaptcha": {
            //required: true,
            //minlength: "255"
          //},
          // name_entreprise: {
          //   required: true,
          //   minlength: 3
          // },
          // num_entreprise:{
          //   required: true,
          //   minlength:10
          // },
          // tps:{
          //   required: true,
          //   minlength: 6
          // },
          // tvq:{
          //   required: true,
          //   minlength:6
          // }
        },
        highlight : function(element) {
  				$(element).closest('.form_item').addClass('error');
  			},
  			
  			unhighlight : function(element) {
  				$(element).closest('.form_item').removeClass('error');
  			},
    });
    
    if($('.staff_registration').valid()) { 
        changePage(n);
    }
    $('form .input_group').each(function(i, el) {
        if($(el).find('input').hasClass('error'))
            $(el).find('.input_addon').addClass('error');
    });
    if (currentTab>=6 ){
        console.log(currentTab);
    }
}


function prevPrev(n){
    retournPage(n);
}



function retournPage(n){
  var x = document.getElementsByClassName("page");
  x[currentTab].style.display = "none";
  currentTab = currentTab + n;
  var currentLabel = $('.step_range_labels').find('li[data-value="'+currentTab+'"]');

  $('.step_range_labels li').removeClass('current');
  currentLabel.addClass('active selected current');
  currentLabel.prevAll().addClass('selected');
  /*** end change current step style ***/

	$(".header_title").html(staff_registration_title[currentTab]);
  // Otherwise, display the correct tab:
  showTab(currentTab);
  $(".current_tab").val(currentTab);
  //scroll to the top of window
  $(document).scrollTop(0);
}


function selectionPage(n){
    var x = document.getElementsByClassName("page");

    x[currentTab].style.display = "none";
    currentTab = n;
    // if you have reached the end of the form...
    if (currentTab >= x.length) {
        // ... the form gets submitted:
        $('#click_me').trigger('click');
        //launch_modal("staff_registration_finish");
    }
     /*** start change current step style ***/
    var currentLabel = $('.step_range_labels').find('li[data-value="'+currentTab+'"]');

    $('.step_range_labels li').removeClass('current');
    currentLabel.addClass('active selected current');
    currentLabel.prevAll().addClass('selected');
    /*** end change current step style ***/

  	$("#define_experience .header_title").html(staff_registration_title[currentTab]);
    // Otherwise, display the correct tab:
    showTab(currentTab);
}

var url = location.href.split('/');
var langue= url[3];

function changePage(n) {
    var x = document.getElementsByClassName("page");
    // Hide the current tab:
    x[currentTab].style.display = "none";
    
    // Increase or decrease the current tab by 1:
    if($('#phoneerror').html() != "" || $('#emailerror').html() != "") 
        currentTab = currentTab - n;

    // validation page by page
    switch(currentTab){
        case 0:
        var phone = $('#phone').val();
            if (phone.length >= 10) {
            currentTab = currentTab + n;
            }else{
               if (langue == "en") {
                    toastr.warning('Your Telephone Number is not valid, Please enter 10 digit minimum!');
                    $(this).css('border', '1px solid red');
                }else{
                    toastr.warning('Votre Numéro Telephone n\'est pas valide, Veuillez entrer 10 chiffre minimum SVP!');
                    $(this).css('border', '1px solid red');

                }
            }
            break;

        case 1:
            if ($('div.job_experience div.job.active').length != 0)
                currentTab = currentTab + n;
            else
                launch_modal('validation_message');
            break;

        case 2:
            var choice = false;
            $('div.list_language.grid').find('[type="checkbox"]').each(function(){
                if ($(this).siblings('.checkbox_label').hasClass('active') && $(this).closest(".form_item").find(".select").val() != '')
                    choice = true;
            });
            if (choice == true)
                currentTab = currentTab + n;
            else
                launch_modal('language_validation');
            break;

        case 3:
            if (($("#car_no").siblings().hasClass('active') || $("#car_yes").siblings().hasClass('active')) &&
               ($("#truck_no").siblings().hasClass('active') || $("#truck_yes").siblings().hasClass('active')) ||
               ($("#drive_no").siblings().hasClass('active') || $("#drive_yes").siblings().hasClass('active')) &&
               ($("#car_no").prop("checked") == true || $("#car_yes").prop("checked") == true ) &&
               ($("#drive_no").prop("checked") == true || $("#drive_yes").prop("checked") == true) &&
               ($("#truck_no").prop("checked") == true || $("#truck_yes").prop("checked") == true))
                currentTab = currentTab + n;
            else
               launch_modal('certificat_validation');
            break;

        case 4:
            // pas de validation
            currentTab = currentTab + n;
            break;

        case 5:
            if ($('input#nas').val() == '')
                currentTab = currentTab + n;
            else {
                var nas = $('input#nas').val();
                if((nas != '') && (nas.length == 9) && (/^[0-9]*$/gm.test(nas)))
                    currentTab = currentTab + n;
                else
                  launch_modal('remuneration1_validation');
            }
            break;

        case 6:
            var choice = false;
            $('div.mobility div.form_item div.checkbox').find('[type="checkbox"]').each(function(){
                if ($(this).prop('checked') == true)
                    choice = true;
            });
            if (choice == true)
                currentTab = currentTab + n;
            else
                launch_modal('mobility_validation');
            break;

        case 7:
            if (($('#portrait').val() == '') && ($('#long_portrait').val() == ''))
                launch_modal('photo_cv_validation');
            else
                currentTab = currentTab + n;
            break;
    }

    // if you have reached the end of the form...
    if (currentTab >= x.length) {
        // ... the form gets submitted:
        $('#click_me').trigger('click');
    }
  
    /*** start change current step style ***/
    var currentLabel = $('.step_range_labels').find('li[data-value="'+currentTab+'"]');

    $('.step_range_labels li').removeClass('current');
    currentLabel.addClass('active selected current');
    currentLabel.prevAll().addClass('selected');
    /*** end change current step style ***/

  	$(".header_title").html(staff_registration_title[currentTab]);
    // Otherwise, display the correct tab:
    showTab(currentTab);
    //scroll to the top of window
    $(document).scrollTop(0);
}

// back to the page already selected
$('.step_range_labels li').click(function(){
    var classe = $(this).attr('class');
    var index =  $('.step_range_labels li').index(this);
    var numberPage = $(this).attr('data-value');
    if (classe == "active selected"){
        if (index == numberPage){
            selectionPage(index);
            switch (index){
                case 0:
                    $('p.header_title').text(title_contact);
                    break;
                case 1:
                    $('p.header_title').text(title_jobs);
                    break;
                case 2:
                    $('p.header_title').text(title_language);
                    break;
                case 3:
                    $('p.header_title').text(title_certification);
                    break;
                case 4:
                    $('p.header_title').text(title_attribut);
                    break;
                case 5:
                    $('p.header_title').text(title_remuneration);
                    break;
                case 6:
                    $('p.header_title').text(title_mobility);
                    break;
                case 7:
                    $('p.header_title').text(title_photo);
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

/*function recaptchaCallback() {
	var response = grecaptcha.getResponse(),
		$button = jQuery(".button-register");
	jQuery("#hidden-grecaptcha").val(response);
	console.log(jQuery("#registerForm").valid());
	if (jQuery("#registerForm").valid()) {
		$button.attr("disabled", false);
	}
	else {
		$button.attr("disabled", "disabled");
	}
}*/