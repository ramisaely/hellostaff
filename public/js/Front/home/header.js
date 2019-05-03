$( document ).ready(function(){
  /* Responsivite header */
    $('.menus_responsive_btn').on('click', function() {
      $('.list_menu_page').toggleClass('active');
      $('.popup_menus').removeClass('visible_drop_login'); /**on desactive le popup de deconnexion*/
      $('body').toggleClass('no_scroll_body');
      $('.list_menu_page').toggleClass('scroll_header');
    });
  /* End Responsivite header */
    /* Dropdown login */
    $('.avatar_home').on('click', function() {
        console.log("clic avatar");
        if(!$('.dropdown_login').hasClass('visible_drop_login')) {
            console.log("add class visible");
            $('.dropdown_login').addClass('visible_drop_login');
        }
        else {
            console.log("remove class visible");
            $('.dropdown_login').removeClass('visible_drop_login');
        }
    });

    $(".dropdown_login").mouseleave(function(){
	  $(this).removeClass('visible_drop_login');
	});
    /* End dropdown login */

    /*$('.logo_hello_staff').on('click', function() {
        var location = $(this).data('href');
        window.location.replace(location);
    });*/

    $('.list_menu_page .img_menus_agency').on('click', function() {
        var url = window.location.pathname;
        urlRegExp = new RegExp(url.replace(/\/$/,'') + "$");
        var location_href = $(this).siblings('.title_menu').attr('href');
        var event_href = $('.color_responsive_create_event').find('.title_menu').attr('href');
        var event_href_update = $('.update_profile').find('.title_menu').attr('href');
        var event_href_event_future = $('.upcoming_event').find('.title_menu').attr('href');

        if(urlRegExp.test(event_href.replace(/\/$/,''))){
            launch_modal('modal_change_creat_event');
            $('.modal').on('click','.check_modal',function(){
                var location = $('.img_menus').siblings('.title_menu').attr('href');
                window.location.replace(location_href);
            });
            $('.modal').on('click','.check_modal_crois',function(){
                var modal = $(this).closest('.modal');
                modal.addClass('is_hidden is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');

            });
        }else if(urlRegExp.test(event_href_update.replace(/\/$/,'')) || (urlRegExp.test(event_href_event_future.replace(/\/$/,'')) && ($(".master").find(".content_future_event").length > 0))){
            launch_modal('modal_change_update_profil');
            $('.modal').on('click','.check_modal',function(){
                var location = $('.img_menus').siblings('.title_menu').attr('href');
                window.location.replace(location_href);
            });
            $('.modal').on('click','.check_modal_crois',function(){
                var modal = $(this).closest('.modal');
                modal.addClass('is_hidden is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');

            });
        }else{
            window.location.replace(location_href);
        }
    });

    $('.logo_page_for_agency').on('click', function() {
        var url = window.location.pathname;
        urlRegExp = new RegExp(url.replace(/\/$/,'') + "$");
        var location_href = $('.logo_hello_staff').attr('data-href');
        var event_href = $('.color_responsive_create_event').find('.title_menu').attr('href');
        var event_href_update = $('.update_profile').find('.title_menu').attr('href');
        var event_href_event_future = $('.upcoming_event').find('.title_menu').attr('href');

        if(urlRegExp.test(event_href.replace(/\/$/,''))){
            /*return false;*/
            launch_modal('modal_change_creat_event');
            $('.modal').on('click','.check_modal',function(){
                var location = $('.img_menus').siblings('.title_menu').attr('href');
                window.location.replace(location_href);
            });
            $('.modal').on('click','.check_modal_crois',function(){
                var modal = $(this).closest('.modal');
                modal.addClass('is_hidden is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');

            });
        }else if(urlRegExp.test(event_href_update.replace(/\/$/,'')) || urlRegExp.test(event_href_event_future.replace(/\/$/,''))){
            /*event.preventDefault();*/
            launch_modal('modal_change_update_profil');
            $('.modal').on('click','.check_modal',function(){
                var location = $('.img_menus').siblings('.title_menu').attr('href');
                window.location.replace(location_href);
            });
            $('.modal').on('click','.check_modal_crois',function(){
                var modal = $(this).closest('.modal');
                modal.addClass('is_hidden is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');

            });
        }else{
            window.location.replace(location_href);
        }
    });

    $('.content_users .agency_modifiers').on('click', function() {
        var url = window.location.pathname;
        urlRegExp = new RegExp(url.replace(/\/$/,'') + "$");
        var location_href = $(this).find('.title_menu').attr('href');
        var event_href = $('.color_responsive_create_event').find('.title_menu').attr('href');
        var event_href_update = $('.update_profile').find('.title_menu').attr('href');
        var event_href_event_future = $('.upcoming_event').find('.title_menu').attr('href');

        if(urlRegExp.test(event_href.replace(/\/$/,''))){
            launch_modal('modal_change_creat_event');
            $('.modal').on('click','.check_modal',function(){
                var location = $('.img_menus').siblings('.title_menu').attr('href');
                window.location.replace(location_href);
            });
            $('.modal').on('click','.check_modal_crois',function(){
                var modal = $(this).closest('.modal');
                modal.addClass('is_hidden is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');

            });
        }else if(urlRegExp.test(event_href_update.replace(/\/$/,'')) || urlRegExp.test(event_href_event_future.replace(/\/$/,''))){
            launch_modal('modal_change_update_profil');
            $('.modal').on('click','.check_modal',function(){
                var location = $('.img_menus').siblings('.title_menu').attr('href');
                window.location.replace(location_href);
            });
            $('.modal').on('click','.check_modal_crois',function(){
                var modal = $(this).closest('.modal');
                modal.addClass('is_hidden is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');

            });
        }else{
            window.location.replace(location_href);
        }
    });

    var profil_hidden =$('.update_profil_staff').find('.bool');
    profil_hidden.val('0');
    var profil_update =$('.update_profil_staff').find('input');
    profil_update.addClass('inputChange')
    console.log(profil_update)
    console.log(profil_hidden.val());
    var profil_value = profil_update.html();
    $('.inputChange').on('change',function () {
        profil_hidden.val('1')
        console.log(profil_hidden.val());
    })

    /*Start Validation for Staff*/
    $('.logo_page_for_staff').on('click', function() {
        var profil_values = profil_update.html()

        var url = window.location.pathname;
        urlRegExp = new RegExp(url.replace(/\/$/,'') + "$");
        var location_href = $('.logo_hello_staff').attr('data-href');
        var event_href_update = $('.update_profile_staff').find('.title_menu').attr('href');

         if(urlRegExp.test(event_href_update.replace(/\/$/,'')) && profil_hidden.val()=='1'){
            /*event.preventDefault();*/
            launch_modal('modal_change_update_profil');
            $('.modal').on('click','.check_modal',function(){
                var location = $('.img_menus').siblings('.title_menu').attr('href');
                window.location.replace(location_href);
            });
            $('.modal').on('click','.check_modal_crois',function(){
                var modal = $(this).closest('.modal');
                modal.addClass('is_hidden is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');

            });
        }else{
            window.location.replace(location_href);
        }


    });
    $('.list_menu_page .img_menus_staff').on('click', function() {
        var url = window.location.pathname;
        urlRegExp = new RegExp(url.replace(/\/$/,'') + "$");
        var location_href = $(this).closest('.menus').attr('href');

        var event_href_update = $('.update_profile_staff').find('.title_menu').attr('href');

        if(urlRegExp.test(event_href_update.replace(/\/$/,''))){
            launch_modal('modal_change_update_profil');
            $('.modal').on('click','.check_modal',function(){
                var location = $('.img_menus').closest('.menus').attr('href');
                window.location.replace(location_href);
            });
            $('.modal').on('click','.check_modal_crois',function(){
                var modal = $(this).closest('.modal');
                modal.addClass('is_hidden is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');

            });
        }else{
            window.location.replace(location_href);
        }
    });

    $('.content_users .staff_modifiers').on('click', function() {
        var url = window.location.pathname;
        urlRegExp = new RegExp(url.replace(/\/$/,'') + "$");
        var location_href = $(this).find('.title_menu').attr('href');
        var event_href_update = $('.update_profile_staff').find('.title_menu').attr('href');

        if(urlRegExp.test(event_href_update.replace(/\/$/,''))){
            launch_modal('modal_change_update_profil');
            $('.modal').on('click','.check_modal',function(){
                var location = $('.img_menus').siblings('.title_menu').attr('href');
                window.location.replace(location_href);
            });
            $('.modal').on('click','.check_modal_crois',function(){
                var modal = $(this).closest('.modal');
                modal.addClass('is_hidden is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');

            });
        }else{
            window.location.replace(location_href);
        }
    });
    /*End Validation for Staff*/

    //add active menu
    var url = window.location.pathname,
    urlRegExp = new RegExp(url.replace(/\/$/,'') + "$");
    $('.menus a').each(function(){
        if(urlRegExp.test(this.href.replace(/\/$/,''))){
            $(this).closest('.menus').addClass('active');
        }
    });
/*Start Change on Update Profile*/
    
/*End Change on Update Profile*/

});
