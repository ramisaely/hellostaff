$( document ).ready(function(){
    $('.mobile_toggle_menu').click(function() {
        $('.menu_bar .menu').toggleClass('active');
        if($('.menu_bar .menu').hasClass('active')) {
            $('.menu_bar').css('height', '100vh');
            $('.menu_bar .logo').css('height', '13vh');
        }
        else {
            $('.menu_bar').css('height', '13vh');
            $('.menu_bar .logo').css('height', '100vh');
        }
    })
})