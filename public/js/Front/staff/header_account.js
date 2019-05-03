$(document).ready(function() {
	//add active menu
    var url = window.location.pathname,
    urlRegExp = new RegExp(url.replace(/\/$/,'') + "$");
    $('.menus').each(function(){
        if(urlRegExp.test(this.href.replace(/\/$/,''))){
            $(this).addClass('active');
        }
    });
})