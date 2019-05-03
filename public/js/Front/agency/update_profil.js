$(document).ready(function(){
  var name = [];
  $('.modify_profil').find('.first_name').each(function(i){
    var first_name = $(this).val();
    $(this).closest('.modify_profil').find('.last_name').each(function(a){
      var last_name = $(this).val();
      if (i == a) {
        name.push(first_name+" "+last_name);
      }
    });
  });
  console.log(name);

  $('.modify_profil').find('.btn_valide:first').addClass('btn_valide_first');
  $('.modify_profil').find('.btn_valide_first').removeClass('btn_valide');
  $('.btn_valide_first').css('background-color', '#F3F1F0');

  var langue = getLanguage();
  var window_position = window.pageYOffset;
  var main_user = $('.main_user').val();
  var main_user_split = main_user.split(" ");

  $('.modify_profil').find('.utilisateur_profil_update').each(function(){
      $(this).find('input[disabled="disabled"]').css('background-color', '#F3F1F0');
      $(this).find('.button_update_profil_no_gradient').disable(true);
    var email = $(this).find('.email').val();
    var emailConnecte = $(this).find('.emailConnecte').val();
    var last_name = $(this).find('.last_name').val();
    var first_name = $(this).find('.first_name').val();
    console.log(last_name+"=="+main_user_split[1]);
    if(email == emailConnecte && last_name == main_user_split[1] && first_name == main_user_split[0]){
      $('.button_update_profil_no_gradient').disable(false);
      $('.email').removeAttr('disabled');
      $('.first_name').removeAttr('disabled');
      $('.last_name').removeAttr('disabled');
      $('.phone').removeAttr('disabled');
      $('.password').removeAttr('disabled');
      $('.confirm_password').removeAttr('disabled');
      $('.email').css('background-color', '');
      $('.first_name').css('background-color', '');
      $('.last_name').css('background-color', '');
      $('.phone').css('background-color', '');
      $('.password').css('background-color', '');
      $('.confirm_password').css('background-color', '');
    }else if (email == emailConnecte || last_name == main_user_split[1] || first_name == main_user_split[0]) {
      $(this).find('.button_update_profil_no_gradient').disable(false);
      $(this).find('.email').removeAttr('disabled');
      $(this).find('.first_name').removeAttr('disabled');
      $(this).find('.last_name').removeAttr('disabled');
      $(this).find('.phone').removeAttr('disabled');
      $(this).find('.password').removeAttr('disabled');
      $(this).find('.confirm_password').removeAttr('disabled');
      $(this).find('.email').css('background-color', '');
      $(this).find('.first_name').css('background-color', '');
      $(this).find('.last_name').css('background-color', '');
      $(this).find('.phone').css('background-color', '');
      $(this).find('.password').css('background-color', '');
      $(this).find('.confirm_password').css('background-color', '');
    }
  });

/*Start Validation Update Profil*/
  $("#regFormUpdateProfile").validate({
      rules: {
        name_agency: {
          required: true,
          minlength: 3
        },
        agency_mail:{
          required: true,
          email: true
        },
        agency_phone:{
          required: true,
          number: true,
        },
        first_name:{
          required: true,
          minlength: 3
        },
        last_name:{
          required: true,
          minlength: 3
        },
        phone:{
          required: true,
          number: true,
        },
        email:{
          required: true,
          email: true
        },
        password: {
          minlength: 6
        },
        confirm_password: {
          equalTo: "#password"
        },

      },
      highlight : function(element) {
        $(element).closest('.form_item').addClass('error');
        $(element).closest('.form_item_create_event').addClass('error');
      },

      unhighlight : function(element) {
        $(element).closest('.form_item').removeClass('error');
        $(element).closest('.form_item_create_event').removeClass('error');
      },
  });
/*End Validation Update Profil*/
  var idConnecte = $('.idConnecte').val();
  var profil = $('.modify_profil').find('.img_agency').attr('src');
  $('#modal_update_actual').on('click', '.button_choose', function(){
    if ($('.modify_profil').find('.img_agency').attr('src') != profil) {
      $('.oneOrNull').val("0");
      $('.boolean').val("0");
      $('.btn_validUser:first').css('background-color', 'rgb(54, 204, 181)');
      $('.confirm_password:first').val('');
    }
  });


  $('.modify_profil').on('keyup','.main_user',function(){
    $('.oneOrNull').val("0");
    $('.boolean').val("0");
    $('.btn_validUser:first').css('background-color', 'rgb(54, 204, 181)');
    $('.confirm_password:first').val('');
    
  });
  $('.modify_profil').on('change', '.main_user', function(){
      var data = $(this).val();
      name.forEach(function(dataEl, j){
      var numero = dataEl.indexOf(data);
      var dataLow = dataEl.toLowerCase();
      var numeroLow = dataLow.indexOf(data);
      var dataUp = dataEl.toUpperCase();
      var numeroUp = dataUp.indexOf(data);
      if (numero != -1 || numeroUp != -1 || numeroLow != -1) {
        $('.main_user').val(name[j]);
      }
    });
  });

  $('.modify_profil').on('keyup','.agency_email',function(){
    $('.oneOrNull').val("0");
    $('.boolean').val("0");
    $('.btn_validUser:first').css('background-color', 'rgb(54, 204, 181)');
    $('.confirm_password:first').val('');
  });

  $('.modify_profil').on('keyup','.agency_phone',function(){
    $('.oneOrNull').val("0");
    $('.boolean').val("0");
    $('.btn_validUser:first').css('background-color', 'rgb(54, 204, 181)');
    $('.confirm_password:first').val('');
  });

  $('.modify_profil').on('keyup','.agency_description',function(){
    $('.oneOrNull').val("0");
    $('.boolean').val("0");
    $('.btn_validUser:first').css('background-color', 'rgb(54, 204, 181)');
    $('.confirm_password:first').val('');
  });

  $('.modify_profil').on('keyup','.first_name',function(){
    $(this).css('border', '');
    $('.boolean').val("0");
    $('.oneOrNull').val("0");
    var index = $(this).closest('.utilisateur_profil_update').data('indice');
    $(this).closest('.modify_profil').find('.btn_validUser'+index+'').css('background-color', 'rgb(54, 204, 181)');
    $('.btn_validUser:first').css('background-color', 'rgb(54, 204, 181)');
    $('.confirm_password:first').val('');
  });

  $('.modify_profil').on('change','.first_name',function(){
    if ($(this).val() == "") {
        $(this).css('border', '1px solid red');
        $('.boolean').val("0");
      }
  });

  $('.modify_profil').on('keyup','.last_name',function(){
    $(this).css('border', '');
    $('.oneOrNull').val("0");
    $('.boolean').val("0");
    var index = $(this).closest('.utilisateur_profil_update').data('indice');
    $('.boolean').val("0");
    $(this).closest('.modify_profil').find('.btn_validUser'+index+'').css('background-color', 'rgb(54, 204, 181)');
    $('.btn_validUser:first').css('background-color', 'rgb(54, 204, 181)');
    $('.confirm_password:first').val('');
  });

  $('.modify_profil').on('change','.last_name',function(){
    if ($(this).val() == "") {
        $(this).css('border', '1px solid red');
        $('.boolean').val("0");
      }
  });

  $('.modify_profil').on('keyup','.phone',function(){
    $(this).css('border', '');
    $('.boolean').val("0");
    $('.oneOrNull').val("0");
    var index = $(this).closest('.utilisateur_profil_update').data('indice');
    $(this).closest('.modify_profil').find('.btn_validUser'+index+'').css('background-color', 'rgb(54, 204, 181)');
    $('.btn_validUser:first').css('background-color', 'rgb(54, 204, 181)');
    $('.confirm_password:first').val('');
  });

  $('.modify_profil').on('change','.phone',function(){
    if ($(this).val() == "") {
      $(this).css('border', '1px solid red');
      $('.boolean').val("0");
      }
  });

  $('.modify_profil').on('keyup','.email',function(){
    $(this).css('border', '');
    $('.boolean').val("0");
    $('.oneOrNull').val("0");
    var index = $(this).closest('.utilisateur_profil_update').data('indice');
    $(this).closest('.modify_profil').find('.btn_validUser'+index+'').css('background-color', 'rgb(54, 204, 181)');
    $('.btn_validUser:first').css('background-color', 'rgb(54, 204, 181)');
    $('.confirm_password:first').val('');
  });

  $('.modify_profil').on('change','.email',function(){
    if ($(this).val() == "") {
        $(this).css('border', '1px solid red');
        $('.boolean').val("0");
      }
  });
  $('.modify_profil').on('change','.confirm_password:first',function(){
    //$('.boolean').val("0");
    var index = $(this).closest('.utilisateur_profil_update').data('indice');
    console.log(index);
    if ($(this).closest('.input_update_profil').find('.password'+index+'').val() != "") {
      console.log('mande 1');
      $('.oneOrNull').val("1");
      $('.confirm_password:first').css('border', '');
    }else{
    $('.confirm_password:first').css('border', '');
    var value = $(this).val();
    var userId = $(this).closest('.input_update_profil').find('.userId').val();
    var url = $(this).attr('data-sendValue');

    $.ajax({
  url: url,
  type : 'POST',
  data: {data: value, userId: userId},
  beforeSend: function(){
      launch_modal('modal_wait');
  },
  complete: function(){
      $('#modal_wait').addClass('is_hidden');
      $('#modal_wait').addClass('is_visually_hidden');
      $('.master').removeClass('is_blurred');
      $('html, body').removeClass('no_scroll');
      $('html, body').scrollTop(window_position);
  },
  success: function(results)
    { // si l'appel a bien fonctionné
    console.log(results);
      if(results['resultat'] == true) // si la connexion en php a fonctionnée
      {
        $('.oneOrNull').val("1");
      }else{
        $('.oneOrNull').val("0");
      }
    }
  });
  }


  });

  $('.modify_profil').on('keyup','.confirm_password',function(){
    $(this).css('border', '');
      $('.boolean').val("0");
      $('.oneOrNull').val("0");
      var index = $(this).closest('.utilisateur_profil_update').data('indice');
      $(this).closest('.modify_profil').find('.btn_validUser'+index+'').css('background-color', 'rgb(54, 204, 181)');
  });
  $('.modify_profil').on('change','.confirm_password',function(){
    if ($(this).closest('.parent_pass').siblings().find('.password').val() != "") {
      if ($(this).val() == "" || $(this).val() != $(this).closest('.parent_pass').siblings().find('.password').val()) {
        $(this).css('border', '1px solid red');
        $('.boolean').val("0");
      }else{
        $('.oneOrNull').val('1');
      }
    }else{
      $(this).css('border', '');
    }
    });

    $('.modify_profil').on('keyup','.password',function(){
      $(this).css('border', '');
      $('.boolean').val("0");
      $('.oneOrNull').val("0");
      var index = $(this).closest('.utilisateur_profil_update').data('indice');
      $(this).closest('.modify_profil').find('.btn_validUser'+index+'').css('background-color', 'rgb(54, 204, 181)');
      $('.btn_validUser:first').css('background-color', 'rgb(54, 204, 181)');
      $('.confirm_password:first').val('');
    });


  $('.modify_profil').on('click','.btn_validLast',function(){
      if ($(this).closest('.modify_profil').find('.first_name:last').val() == "") {
        $(this).closest('.modify_profil').find('.first_name:last').css('border', '1px solid red');
      }
      if ($(this).closest('.modify_profil').find('.last_name:last').val() == "") {
        $(this).closest('.modify_profil').find('.last_name:last').css('border', '1px solid red');
      }
      if ($(this).closest('.modify_profil').find('.email:last').val() == "") {
        $(this).closest('.modify_profil').find('.email:last').css('border', '1px solid red');
      }
      if ($(this).closest('.modify_profil').find('.phone:last').val() == "") {
        $(this).closest('.modify_profil').find('.phone:last').css('border', '1px solid red');
      }
      var value = $(this).closest('.modify_profil').find('.password:last').val();
      if ($(this).closest('.modify_profil').find('.password:last').val() == "" || value.length < 6) {
        $(this).closest('.modify_profil').find('.password:last').css('border', '1px solid red');
      }
      if ($(this).closest('.modify_profil').find('.confirm_password:last').val() == "" || $(this).closest('.modify_profil').find('.confirm_password:last').val() !=  $(this).closest('.modify_profil').find('.password:last').val()) {
        $(this).closest('.modify_profil').find('.confirm_password:last').css('border', '1px solid red');
      }
      if ($(this).closest('.modify_profil').find('.first_name:last').val() == "" || $(this).closest('.modify_profil').find('.last_name:last').val() == "" || $(this).closest('.modify_profil').find('.phone:last').val() == "" || $(this).closest('.modify_profil').find('.email:last').val() == "" || $(this).closest('.modify_profil').find('.password:last').val() == "" || value.length < 6 || $(this).closest('.modify_profil').find('.confirm_password:last').val() == "" || $(this).closest('.modify_profil').find('.confirm_password:last').val() !=  value) {
        $('.boolean').val("0");
        if (langue == "en") {
          toastr.warning('Please complete the required fields!');
        }else{
        toastr.warning('Veuillez completer les champs requis!');
        }
        $(this).closest('.modify_profil').find('.button_update_profil_gradient:last').disable(true);
      }else{
        $('.boolean').val("1");
        $(this).closest('.modify_profil').find('.button_update_profil_gradient:last').disable(false);
        $(this).css('background-color', '#F3F1F0');
      }
  });

  $('.modify_profil').on('click','.btn_valide_first',function(){
    var index = $(this).closest('.utilisateur_profil_update').data('indice');
      if ($(this).closest('.modify_profil').find('.first_name'+index+'').val() == "") {
        $(this).closest('.modify_profil').find('.first_name'+index+'').css('border', '1px solid red');
      }
      if ($(this).closest('.modify_profil').find('.last_name'+index+'').val() == "") {
        $(this).closest('.modify_profil').find('.last_name'+index+'').css('border', '1px solid red');
      }
      if ($(this).closest('.modify_profil').find('.email'+index+'').val() == "") {
        $(this).closest('.modify_profil').find('.email'+index+'').css('border', '1px solid red');
      }
      if ($(this).closest('.modify_profil').find('.phone'+index+'').val() == "") {
        $(this).closest('.modify_profil').find('.phone'+index+'').css('border', '1px solid red');
      }
      var value = $(this).closest('.modify_profil').find('.password'+index+'').val();
      if ($(this).closest('.modify_profil').find('.password'+index+'').val() != "") {
        if ($(this).closest('.modify_profil').find('.first_name'+index+'').val() == "" || $(this).closest('.modify_profil').find('.last_name'+index+'').val() == "" || $(this).closest('.modify_profil').find('.phone'+index+'').val() == "" || $(this).closest('.modify_profil').find('.email'+index+'').val() == "" || $(this).closest('.modify_profil').find('.password'+index+'').val() == ""  || $(this).closest('.modify_profil').find('.confirm_password'+index+'').val() == "" || $(this).closest('.modify_profil').find('.confirm_password'+index+'').val() !=  value) {
          $('.boolean').val("0");
          if (langue == "en") {
            toastr.warning('Please complete the required fields!');
          }else{
            toastr.warning('Veuillez completer les champs requis!');
          }
          $(this).closest('.modify_profil').find('.button_update_profil_gradient:last').disable(true);
        }else{
          $('.boolean').val("1");
          $(this).closest('.modify_profil').find('.button_update_profil_gradient:last').disable(false);
          $(this).css('background-color', '#F3F1F0');
        }
      }else{
        if ($(this).closest('.modify_profil').find('.first_name'+index+'').val() == "" || $(this).closest('.modify_profil').find('.last_name'+index+'').val() == "" || $(this).closest('.modify_profil').find('.phone'+index+'').val() == "" || $(this).closest('.modify_profil').find('.email'+index+'').val() == "") {
        $('.boolean').val("0");
          if (langue == "en") {
            toastr.warning('Please complete the required fields!');
          }else{
          toastr.warning('Veuillez completer les champs requis!');
          }
        $(this).closest('.modify_profil').find('.button_update_profil_gradient:last').disable(true);
        }else if($('.oneOrNull').val() == "0"){
          if (langue == "en") {
            toastr.warning('Please confirm your password to validate the changes!');
          }else{
            toastr.warning('Veuillez validez votre mot de passe pour valider les modifications SVP!');
          }
        }else{
          $('.boolean').val("1");
          $(this).closest('.modify_profil').find('.button_update_profil_gradient:last').disable(false);
          $(this).css('background-color', '#F3F1F0');
        }
      }
  });

   $('.modify_profil').on('click','.btn_valide',function(){
    var index = $(this).closest('.utilisateur_profil_update').data('indice');
      if ($(this).closest('.modify_profil').find('.first_name'+index+'').val() == "") {
        $(this).closest('.modify_profil').find('.first_name'+index+'').css('border', '1px solid red');
      }
      if ($(this).closest('.modify_profil').find('.last_name'+index+'').val() == "") {
        $(this).closest('.modify_profil').find('.last_name'+index+'').css('border', '1px solid red');
      }
      if ($(this).closest('.modify_profil').find('.email'+index+'').val() == "") {
        $(this).closest('.modify_profil').find('.email'+index+'').css('border', '1px solid red');
      }
      if ($(this).closest('.modify_profil').find('.phone'+index+'').val() == "") {
        $(this).closest('.modify_profil').find('.phone'+index+'').css('border', '1px solid red');
      }
      var value = $(this).closest('.modify_profil').find('.password'+index+'').val();
      if ($(this).closest('.modify_profil').find('.password'+index+'').val() != "") {
        if ($(this).closest('.modify_profil').find('.first_name'+index+'').val() == "" || $(this).closest('.modify_profil').find('.last_name'+index+'').val() == "" || $(this).closest('.modify_profil').find('.phone'+index+'').val() == "" || $(this).closest('.modify_profil').find('.email'+index+'').val() == "" || $(this).closest('.modify_profil').find('.password'+index+'').val() == "" || value.length < 6 || $(this).closest('.modify_profil').find('.confirm_password'+index+'').val() == "" || $(this).closest('.modify_profil').find('.confirm_password'+index+'').val() !=  value) {
          $('.boolean').val("0");
          if (langue == "en") {
            toastr.warning('Please complete the required fields!');
          }else{
            toastr.warning('Veuillez completer les champs requis!');
          }
          $(this).closest('.modify_profil').find('.button_update_profil_gradient:last').disable(true);
        }else{
          $('.boolean').val("1");
          $(this).closest('.modify_profil').find('.button_update_profil_gradient:last').disable(false);
          $(this).css('background-color', '#F3F1F0');
        }
      }else{
        if ($(this).closest('.modify_profil').find('.first_name'+index+'').val() == "" || $(this).closest('.modify_profil').find('.last_name'+index+'').val() == "" || $(this).closest('.modify_profil').find('.phone'+index+'').val() == "" || $(this).closest('.modify_profil').find('.email'+index+'').val() == "") {
        $('.boolean').val("0");
          if (langue == "en") {
            toastr.warning('Please complete the required fields!');
          }else{
          toastr.warning('Veuillez completer les champs requis!');
          }
        $(this).closest('.modify_profil').find('.button_update_profil_gradient:last').disable(true);
        }else{
          $('.boolean').val("1");
          $(this).closest('.modify_profil').find('.button_update_profil_gradient:last').disable(false);
          $(this).css('background-color', '#F3F1F0');
        }
      }
  });

/* Modifier ptofil ajout utilisateur */
    getIndice();
    $('.button_update_profil_gradient').hide();
    $('.btn_valide').css('background-color', '#F3F1F0');
    $('.button_update_profil_gradient:last').show();

    $('.modify_profil').on('click','.button_update_profil_gradient',function(){
      if ($('.boolean').val() == '0' || $('.oneOrNull').val() == '0') {
        $(this).disable(true);
      }else{
        $(this).disable(false);
        $('.boolean').val('0');
        //$('.oneOrNull').val("0");
        /*$('.btn_validUser'+1+'').css('background-color', 'rgb(54, 204, 181)');*/
        var clone = $('.utilisateur_profil_update:last').clone();
        $(this).hide();
        var attr = $('.utilisateur_profil_update:last').data('indice');
        attr = parseInt(attr)+1;
        clone.attr('data-indice',attr);
        clone.insertAfter('.utilisateur_profil_update:last');
        $('.utilisateur_profil_update:last').find('.police_number').text(attr);
        $('.input_create_event:last').closest('.input_update_profil').find('.input_create_event').val('');
        $('.divspecial').remove();
        if(langue == "en"){
                $('.lbl_pwd:last').text('Password');
            } else {
                $('.lbl_pwd:last').text('Mot de passe');
            }
        $('.btn_valide:last').addClass('btn_validLast');
        $('.btn_validLast:last').removeClass('btn_valide');
        $('.btn_validLast:last').css('background-color', '#36ccb5');
        $('.button_update_profil_no_gradient:last').show();
        $('.email:last').removeAttr('disabled');
        $('.first_name:last').removeAttr('disabled');
        $('.last_name:last').removeAttr('disabled');
        $('.phone:last').removeAttr('disabled');
        $('.password:last').removeAttr('disabled');
        $('.confirm_password:last').removeAttr('disabled');
        $('.email:last').css('background-color', '');
        $('.first_name:last').css('background-color', '');
        $('.last_name:last').css('background-color', '');
        $('.phone:last').css('background-color', '');
        $('.password:last').css('background-color', '');
        $('.confirm_password:last').css('background-color', '');
        $('.button_update_profil_no_gradient:last').disable(false);
      }

    });

    $('.modify_profil').on('click','.button_update_profil_no_gradient',function(){
        //$('.oneOrNull').val('0');
        if ($('.boolean').val() == 1) {
          $('.boolean').val('1');
        }
        if ($('.button_update_profil_no_gradient').length != 1){
            $(this).closest('.utilisateur_profil_update').remove();
            $('.button_update_profil_gradient:last').show();
            getIndice();
        }else if ($('.button_update_profil_no_gradient').length == 1) {
            $('.button_update_profil_no_gradient').after('<div class="divspecial"></div>');
            $('.button_update_profil_no_gradient').hide();
        }
    });
/* Modifier ptofil ajout utilisateur */
function getIndice(){
    var i = 1;
    $('.utilisateur_profil_update').each(function() {
        $(this).attr('data-indice', i);
        $(this).find('.number_title').text(i);
        i++;
    });
}
$('.refrech_background').click(function(){
    /*$('.oneOrNull').val('0');
    $('.boolean').val("0");
    $('.btn_validUser'+1+'').css('background-color', 'rgb(54, 204, 181)');*/
    launch_modal("modal_update_actual");
    if($("#img_update").attr('src', "../../img/input_icons/flech.svg")){
         $(".button_choose").disable(true);
    } else {
        $(".button_choose").disable(false);
    }

});

});

function readURLLogo(input, div) {
    if (input.files && input.files[0]) {
        if (input.files[0].type == "image/jpeg" || input.files[0].type == "image/png" || input.files[0].type == "image/svg+xml"){
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#img_update').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
            /*$('p.infoLogo').text('');*/
        } else {
            /*$('p.infoLogo').text(image_valid);*/
            $('#img_update').attr('src', 's');
        }
    }
  }

$("#image").change(function () {
    $(".button_choose").disable(false);
    readURLLogo(this);
});
jQuery.fn.extend({
    disable: function(etat) {
       return this.each(function() {
       this.disabled = etat;
       });
    }
      });
$(".button_choose").click(function(){
   $("#img_principal").attr('src', $('#img_update').attr('src'));
});
$("#img_principal").change(function () {
    readURLLogo(this);
    });

var langue = getLanguage();

$('.modify_profil').on('click', '.button_update_profil_footer', function(){
    console.log($('.boolean').val());
    if ($('.boolean').val() == "0" && $('.oneOrNull').val() == "0") {
      if (langue == "en") {
        toastr.warning('Not all required fields are filled in or it is not yet validated, Please validate it!');
      }else{
        toastr.warning('Tous les champs réquis ne sont pas tous remplis ou il n\'est pas encore validé, Veuillez le valider SVP!');
      }

      event.preventDefault();
      $('#click_me').trigger('click');
    } else if($('.oneOrNull').val() == "0"){
      if (langue == "en") {
        toastr.warning('Please confirm your password and confirm your changes!');
      } else {
        toastr.warning('Veuillez validez votre mot de passe et après valider les modifications SVP!');
      }
      event.preventDefault();
      $('#click_me').trigger('click');
    } else if($('.boolean').val() == "0"){
      if (langue == "en") {
        toastr.warning('Not all required fields are filled in, please complete the required fields!');
      } else {
        toastr.warning('Tous les champs réquis ne sont pas tous remplis, Veuillez completer les champs requis SVP!');
      }
      event.preventDefault();
      $('#click_me').trigger('click');
    } else {
      return true;
    }
    $('#piercing_visible').click(function () {
        var value = $('#piercing_visible').val();
        alert(value);
    })
    //r tatou =['#visible','#tatou_not_visible','#aucun'];
    /*$(func*/
});
