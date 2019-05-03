$(document).ready(function(){
  /** Developper les svg */
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
  var intervalColorSvg = setInterval(function(){
      if($('svg.svg-inline')) {
          colorSvg();
          clearInterval(intervalColorSvg);
      }
  }, 1000);
  /** End Developper les svg */
    /* drop down event create by */
    $('.content').on('click','.input_drop_user',function(){
        $(this).siblings('ul.dropdown_users').toggle();
        $(this).siblings('ul.dropdown_users').removeClass('is_hidden');

    });

    $('.content').on({
      mouseleave: function(){
          $('ul.dropdown_users').addClass('is_hidden');
      }
    }, 'ul.dropdown_users');

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    /** language site*/
    var langue = getLanguage();
  	if(langue == "fr"){
        $('#fr_site').prop('checked', true);
        $('#fr_site').closest('.checkbox').find('.checkbox_label').addClass('active');
        $('.fr_checkbox').attr('checked', 'checked');
        $('.fr_checkbox').siblings('.checkbox_label').toggleClass('active');
  	} else {
        $('#en_site').prop('checked', true);
        $('#en_site').closest('.checkbox').find('.checkbox_label').addClass('active');
        $('.en_checkbox').attr('checked', 'checked');
        $('.en_checkbox').siblings('.checkbox_label').toggleClass('active');
  	}

    $('.change_language').click(function() {
        var language_code = $(this).data('val');
      	$('.language_site .checkbox_label').removeClass('active');
        var pathname = location.href;
        var url = pathname.split('/');
      	url[3]=language_code;
      	location.href = url.join('/');
    });
    /** End Language site*/

    /* Language site Mobile */
    if(window.matchMedia("(max-width:480px)").matches) {
        $(".language_type_radio_fr").text("Fr");
        $(".language_type_radio_en").text("En");
        $(".language_not_radio_fr").text("Fr");
        $(".language_not_radio_en").text("En");
    }
    /* Language site Mobile */

    /** start dropdown input **/
    $(".label_select").click(function() {
        /*** différence entre les dropdown large et dropdown simple ***/
        if(!$(this).hasClass("disabled")) {
            $(this).removeClass('active');
            if($('div.list_attributs').find('ul').hasClass('visible')){
                var dropdown =  $(this).attr('data-dropdown');
                $('div.list_attributs').find('ul:not(.'+dropdown+')').removeClass('visible');  //ul:not(.taille)
            }
            if($(this).closest('.dropdown-menu').hasClass('large')) {
                var dropdown =  $(this).attr('data-dropdown');
                if($('.' + dropdown).hasClass('visible'))
                    $('.' + dropdown).removeClass('visible');
                else
                    $('.' + dropdown).addClass('visible');
                //$(this).closest('.dropdown-menu').siblings("ul").removeClass("visible");
            } else {
                $(this).siblings("ul").toggleClass("visible");
                if ($(this).children().hasClass("year") && $(this).siblings("ul").hasClass("visible") && $(this).children().val()==""){
                    $(this).siblings("ul").scrollTop(1038);
                }
            }
        }
    });

    /*Dropdown selected*/
    $('ul.dropdown:not(.multiple) li').click(function(){
      	var data_input = $(this).closest('.dropdown').attr('data-input');
        var select_li = $(this).text();
        if($(this).closest('.dropdown').hasClass('large')){
            $(this).closest('.dropdown').siblings('.dropdown-menu').find(".label_select #"+data_input).val(select_li).keyup(); //we need keyup() to remove error in validation
            $(".dropdown").removeClass('visible');
            $(this).closest('.dropdown').siblings('.dropdown-menu').find('.label_select').removeClass('active');
        }
        else {
            $(this).closest('.dropdown-menu').find(".label_select #"+data_input).val(select_li).keyup(); //we need keyup() to remove error in validation
            $(".dropdown").removeClass('visible');
            $(this).closest('.dropdown').siblings('.label_select').removeClass('active');
        }
    });

    /** mouse leave dropdown */
    $(".dropdown").mouseleave(function(){
        $(this).removeClass('visible');
        // change arrow down icon
        if($(this).hasClass('large'))
            $(this).siblings('.dropdown-menu').find('.label_select').removeClass('active');
        else
            $(this).siblings('.label_select').removeClass('active');
    });

    $("a.extend").click(function() {
        var element = $(this).attr('data-element');
        var label = $(this).siblings('.with_fake_out_in').find('span').text();
        if($(this).siblings('.with_fake_out_in').find('.id_parent').hasClass('active')){
            $('#'+element).toggleClass('is_hidden');
        } else {
            if(langue == "en"){
                toastr.warning('Please checked '+label);
            } else {
              toastr.warning('Veuillez séléctionner '+label);
            }
        }
    });
    /** end mouse leave */

    /** start dropdown input **/
    /*** modal ***/
    $(document).on('click','.launch_modal',function(event){
        var modal = $(this).attr('data-modal');
        launch_modal(modal);
        var src_icon = $(this).data('src-img');
        $('.title-icon-modal').html('<img class="title-icon" src="'+src_icon+'"/>');
        //$('.title-icon-modal > img').attr('src', src_icon);
        //activate_inline_svg('.title-icon-modal > img');
    });

    // Close the modal
  	$(document).on('click','.close_modal', function() {
    	  var modal = $(this).closest('.modal');
        modal.addClass('is_hidden is_visually_hidden');
        $('.master').removeClass('is_blurred');
        $('html, body').removeClass('no_scroll');
        if(typeof idInput !== 'undefined'){
            $(idInput).parent().removeClass('active');
            $(idInput).val('no');
        }
        if(window.window_position > 0)
            $('html, body').scrollTop(window.window_position);
  	});

    // pop home after connexion
    $('.close_modal_home').click(function() {
        var modal = $(this).closest('.modal');
        modal.addClass('is_hidden is_visually_hidden');
        $('.master').removeClass('is_blurred');
        $('html, body').removeClass('no_scroll');
    });

// 	// When the user clicks anywhere outside of the modal, close it
//     $(':not(.modal_content)').click(function(event) {
// 	    if ($('.master').hasClass('is_blurred')) {
// 	      $('.modal').addClass('is_hidden is_visually_hidden');
// 	    	$('.master').removeClass('is_blurred');
//         $('html, body').removeClass('no_scroll');
// 	    }
// 	});
	/*** end modal ***/

  /** Modal job experience **/

  $('.modal_footer').click(function(){
    /**Action eregistrement*/
    /** end action enregistrement*/
    /**close modal*/
    $(idInput).prev().text($data_value);
    var modal = $(this).closest('.modal');
    modal.addClass('is_hidden is_visually_hidden');
    $('.master').removeClass('is_blurred');
    $('html, body').removeClass('no_scroll');
    /**end close modal*/
  });

  $('.footer_modal_finish').click(function(){
    var modal = $(this).closest('.modal');
    modal.addClass('is_hidden is_visually_hidden');
    $('.master').removeClass('is_blurred');
    $('html, body').removeClass('no_scroll');
  });
	/** End Modal job experience **/

  /*** Start input group  ***/
  $('.input_group input').focus(function() {
  	$(this).siblings('span').addClass('focused');
  });
  $('.input_group input').focusout(function() {
  	$(this).siblings('span').removeClass('focused');
  });
  /*** End input group  ***/

  /*** start checkbox ***/
  $('[type="checkbox"]').change(function() {
    change_checkbox(this);
  });
  $('[type="radio"]').change(function() {
    change_checkbox(this);
  });
  /*** end checkbox ***/

  /* limit of NAS */
  $("input#nas").on('input', function() {
    if ($(this).val().length>9) {
        $(this).val($(this).val().slice(0, -1));
    }
  });

  /* end limit of NAS */

  /* close alert notification */
  $('div.alert_notification span.close').click(function() {
    $('div.alert_notification').remove();
  });
  /* end close alert notification */



});

function colorSvg() {
    $('svg.svg-inline').each(function(i, el) {
        $(el).find('[fill]').each(function(i, el) {
            //console.log($(el).attr('fill') + ' ++++++++++++ ')
            if($(el).attr('fill') != '#fff' && $(el).attr('fill') != '#ffffff')
                // $(el).attr('fill', 'grey');
                $(el).addClass('svg_color_white');
        })
    })
}

function launch_modal(modal) {
    window.window_position = window.pageYOffset;
    $('#' + modal).removeClass("is_hidden");
    setTimeout(function() {
        $('.master').addClass('is_blurred');
        $('html, body').addClass('no_scroll');
        $('#' + modal).removeClass("is_visually_hidden");
        $('#' + modal).scrollTop(0);
    }, 100);
}

function showPassword(box) {
	var input = $(box).siblings('input');
	var type = input.attr('type');
	if(input.val() != "") {
  	if(type == 'password') {
  	  input.attr('type', 'text');
  	  $(box).attr('class', 'input_addon background_view');
  	}
  	else {
  	  input.attr('type', 'password');
  	  $(box).attr('class', 'input_addon background_no_view');
  	}
	}
}

function showPassword_input_update_profil(box) {
  var input = $(box).siblings('input');
  var type = input.attr('type');
  if(input.val() != "") {
    if(type == 'password') {
      input.attr('type', 'text');
      $(box).attr('class', 'input_addon_update_profil background_view_noir');
    }
    else {
      input.attr('type', 'password');
      $(box).attr('class', 'input_addon_update_profil background_no_view_noir');
    }
  }
}

function change_checkbox(box) {
    if($(box).hasClass("with_check")) {
        if($(box).siblings('.checkbox_label').hasClass('active')){
            $(box).siblings('.checkbox_label').removeClass('active');
            $(box).closest(".form_item").find(".select").val("");
            $(box).prop("checked", false);
        } else {
            $(box).closest('.form_item').find('.label_select').trigger('click');
        }
    } else {
        if($(box).attr('type') == 'radio') {
            $(box).siblings('.checkbox_label').addClass('active');
            $(box).closest('.checkbox').siblings('.checkbox').each(function(i, el) {
                $(el).find('.checkbox_label').removeClass('active');
            });
        } else {
            if($(box).siblings('.checkbox_label').hasClass('active')){
                $(box).siblings('.checkbox_label').removeClass('active');
                $(box).prop("checked", false);
            } else {
                $(box).siblings('.checkbox_label').addClass('active');
                $(box).prop("checked", true);
            }
        }
    }
}

function load_gender(box){
  if($(box).attr('id') == 'man'){
    $('.gender1').removeClass('is_hidden');
    $('.gender2').addClass('is_hidden');
  } else {
    $('.gender2').removeClass('is_hidden');
    $('.gender1').addClass('is_hidden');
  }
}

function getLanguage(){
    var pathname = location.href;
    var url = pathname.split('/');
    var langue= "fr";
    if(url[3] == "en" || url[5] == "en"){
        langue = "en";
    }
    return langue;
}

function close_modal (modal) {
    $('#'+modal).addClass('is_hidden is_visually_hidden');
    $('.master').removeClass('is_blurred');
    $('html, body').removeClass('no_scroll');
    $('html, body').scrollTop(window.window_position);
}
