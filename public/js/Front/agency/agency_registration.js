$(document).ready(function(){

    $('.supprimer').after('<div class="divspecial"></div>');
    $('.supprimer:last').hide();

    /**** Change input with session***/

   /* Erreur enregistrement */
    var class_error = $('.master').find('.alert_notification')
        if (class_error!="") {
          $('div.alert_notification').css('position','relative');
          $('div.alert.danger').css('background-color','transparent');
          $('div.alert.danger').css('color','red');
          $('div.alert.danger').css('border','1px solid red');
          $('div.alert.danger').children('ul').css('margin-left','-36px');
     }
    /* Fin Erreur enregistrement */
    /*** Session input ***/

    $(document).on('click', 'input', function(e) {
       var data = $('.agency_registration').serializeArray();
       var url = $('.agency_registration').data('url-session');
       var dataVal = {};
        data.forEach(function(field){
          if(field.name!= "last_name_personal[]" && field.name!= "first_name_personal[]" && field.name!= "phone[]" && field.name!= "password[]" && field.name!= "confirm_password[]" && field.name!= "email[]"){
            dataVal[field.name] = field.value;
          }
        });
       /*$('.agency_registration').find('#img_entreprise').each(function(i,field){
          dataVal[field.id]= field.src;
       });*/
       $('.agency_registration').find('input[name="last_name_personal[]"]').each(function(i,field){
            dataVal[field.id]=field.value;
       });
       $('.agency_registration').find('input[type="file"]').each(function(i,field){
            dataVal[field.id]=field.value;
       });

       $('.agency_registration').find('input[name="email[]"]').each(function(i,field){
            dataVal[field.id]=field.value;
       });
       $('.agency_registration').find('input[name="first_name_personal[]"]').each(function(i,field){
            dataVal[field.id]=field.value;
       });
       $('.agency_registration').find('input[name="phone[]"]').each(function(i,field){
            dataVal[field.id]=field.value;
       });
       $('.agency_registration').find('.texts').children().each(function(i,field){
            dataVal[field.name]=field.value;
       });


       $.ajax({
           url : url,
           type : 'GET',
           dataType : 'JSON',
           //data: {data: data},
           data: dataVal,
           success : function(response){ // success est toujours en place, bien sûr !
               console.log(response);
           },
           error : function(resultat, statut, erreur){
                console.log("erreur");
           }
        });
    });
      
    $(".label_select").click(function(){
      /*** différence entre les dropdown large et dropdown simple ***/
      if($(this).hasClass("disabled")) {
          $(this).removeClass("disabled").siblings("ul").toggleClass("visible");
      }
    });
    /** End First Page Agency */

    /** Page Identity coperation */
    $("#img_entreprise").click(function(){
        $("#company_logo").trigger("click");
      });
    /** End page identity coperation */

    $(document).on('dragenter', '#dropfile', function() {
        $(this).css('border', '2px dashed red');
        return false;
    });

    $(document).on('dragover', '#dropfile', function(e){
        e.preventDefault();
        e.stopPropagation();
        $(this).css('border', '2px dashed red');
        return false;
    });

    $(document).on('dragleave', '#dropfile', function(e) {
        e.preventDefault();
        e.stopPropagation();
        $(this).css('border', '1px dashed #BBBBBB');
        return false;
    });


    $(document).on('drop', '#dropfile', function(e) {
        if(e.originalEvent.dataTransfer){
            if(e.originalEvent.dataTransfer.files.length) {
                e.preventDefault();
                e.stopPropagation();
                $(this).css('border', '1px dashed green');
                upload(e.originalEvent.dataTransfer.files);
                //readURLLogo(e.originalEvent.dataTransfer.files);
            }
        }
        else {
            $(this).css('border', '1px dashed #BBBBBB');
        }
        return false;
  });
    /**ENd drag and drop file*/

});



/* Gestion FR et EN dans description breve */
$('#description_en_check').change(function() {
    if (!$(this).next().hasClass('active')){
        $('#description_fr_check').next().removeClass('active');
        $('#description_fr').addClass('input_hidden');
        $('#description_en').val($('#description_fr').val());
        $('#description_en').removeClass('input_hidden');
        $('div.heading span.description_label').text('Brief description');
    }
});
$('#description_fr_check').change(function() {
    if (!$(this).next().hasClass('active')){
        $('#description_en_check').next().removeClass('active');
        $('#description_en').addClass('input_hidden');
        $('#description_fr').val($('#description_en').val());
        $('#description_fr').removeClass('input_hidden');
        $('div.heading span.description_label').text('Brève description');
    }
});


/* Ein Gestion FR et EN dans description breve */

/* Upload file logo */
function readURLLogo(input, div) {
    var langue = getLanguage();
    if (input.files && input.files[0]) {
        if (input.files[0].type == "image/jpeg" || input.files[0].type == "image/png" || input.files[0].type == "image/svg+xml"){
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#img_entreprise').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
            $('p.infoLogo').text('');
        } else {
            if(langue == "fr"){
                toastr.warning("Erreur image.");
            } else {
                toastr.warning("Image error");
            }
            $('p.infoLogo').text(image_valid);
            $('#company_logo').val('');
            //$('#img_entreprise').attr('src', 's');
        }
    }
}

$("#company_logo").change(function () {
    readURLLogo(this);
});
/* End Upload file logo */


/* Start ajout utilisateur */
$('.contact_principal').on('click','.btn_make_user', function() {
    var i=0;
    var fill_complet_form = false;
    $('.input_contact_user:last').closest('.contact_user').find('.input_contact_user').each(function(){
       if($(this).val()!=""){
           fill_complet_form = true;
       }else{
           fill_complet_form = false;
       }
    });

    if(fill_complet_form == true && $('.contact_principal').find('.boolean').val() == "0"){
        var clone = $('.personal_plus:last').clone();
        $(this).hide();
        var attr = $('.personal_plus:last').attr('data-range');
        attr = parseInt(attr)+1;
        clone.attr('data-range',attr);
        clone.find('.ajouter').removeClass('ajout1');
        clone.find('.ajouter').addClass('ajout'+attr);
        clone.find('.ajouter').css('background-color', '#36ccb5');
        clone.insertAfter('.personal_plus:last');
        $('.input_contact_user:last').closest('.personal_plus').find('.input_contact_user').val('');
        $('.input_contact_user:last').closest('.personal_plus').find('.password').val('');
        $('.input_contact_user:last').closest('.personal_plus').find('.confirm_password').val('');
        $('.divspecial').remove();
        $('.supprimer').show();

        /* focus pour le oeil dans input password */
        $('.input_group input').focus(function() {
    	    $(this).siblings('span').addClass('focused');
        });
        $('.input_group input').focusout(function() {
        	$(this).siblings('span').removeClass('focused');
        });
        /* End focus pour le oeil dans input password */
    }else{
        launch_modal('fill');
    }


});
/* End ajout utilisateur */
/* Start suppression utilisateur */
$('.contact_principal').on('click','.supprimer', function(){
    if ($('.supprimer').length != 1){
        $(this).parent().parent().parent().parent().parent().remove();
        $('.btn_make_user:last').show();
        var i = 1;
        $('.personal_plus').each(function() {
            $(this).attr('data-range', i);
            i++;
        });
    }
    if ($('.supprimer').length == 1){
        $('.supprimer').after('<div class="divspecial"></div>');
        $('.supprimer').hide();
    }
});
/* End suppression utilisateur */


/*Drag and drop file*/
function upload(files) {
    var f = files[0] ;
    // Only process image files.
    if (f.type.match('image/jpeg') || f.type.match('image/png') || f.type.match('image/svg+xml')) {
    // == "image/jpeg" || input.files[0].type == "image/png" || input.files[0].type == "image/svg+xml") {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#img_entreprise').attr('src', e.target.result);

        }
        reader.readAsDataURL(f);
        $('p.infoLogo').text('');
            // alert("The file must be a jpeg image") ;
            return false ;
    }
    else {
            $('p.infoLogo').text(image_valid);
            $('#img_entreprise').attr('src', 's');
        }
}
/**ENd drag and drop file*/