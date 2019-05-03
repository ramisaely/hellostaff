$(document).ready(function() {

	/* Start action btn connection*/
	$('.is_hidden').hide();
	$('#nextBtn').click(function(e){
		e.preventDefault();
			//$('.input_login_user').addClass('error');
		$('.form_login').validate({
			rules:{
				email: {
					required : true,
					email : true
				},
				password:{
					required:true,
				}

			},
      		highlight : function(element) {
				$('.form_item_login').addClass('error');
				// $('.input_group').addClass('error');
			},
			
			unhighlight : function(element) {
				$('.form_item_login').removeClass('error');
				// $('.input_group').removeClass('error');
			},

		});
		$('#click_me').trigger('click');
		
	});
	/* End action btn connection*/
    /* popup de bienvenu staff&agence */
	 $(".step_btn").click(function(){
		launch_modal("popup_staff_agence");
	});
	 
	/* popup fin  staff&agence */
});

