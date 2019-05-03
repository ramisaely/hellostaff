$( document ).ready(function(){
    /** Popup after se connecter */
    launch_modal('connection_home');
    /** End Popup after se connecter */

    /* Dropdown login */
    $('.avatar').on('click', function() {
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

    $('.redirect_link').on('click', function() {
        var location = $(this).siblings('.href_link').find('a').attr('href');
        window.location.replace(location);
    });
});
