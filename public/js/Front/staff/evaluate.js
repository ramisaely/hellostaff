$(document).ready(function(){
	$('.evaluation_staff_content').find('.ratingResponse').each(function(){
	    switch($(this).val()) {
          case "0.5":
            $(this).closest('.evaluation_note').find('.rating label[data-value="0.5"]').trigger('click');
            break;
          case "1":
            $(this).closest('.evaluation_note').find('.rating label[data-value="1"]').trigger('click');
	         $(this).closest('.evaluation_note').find('.rating label[data-value="0.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1"]').css('color', '#36ccb5');
            break;  
          case "1.5":
            $(this).closest('.evaluation_note').find('.rating label[data-value="1.5"]').trigger('click');
            $(this).closest('.evaluation_note').find('.rating label[data-value="1"]').css('color', '#36ccb5');
	         $(this).closest('.evaluation_note').find('.rating label[data-value="0.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1.5"]').css('color', '#36ccb5');
            break;
          case "2":
            $(this).closest('.evaluation_note').find('.rating label[data-value="2"]').trigger('click');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2"]').css('color', '#36ccb5');
	         $(this).closest('.evaluation_note').find('.rating label[data-value="0.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1.5"]').css('color', '#36ccb5');
            break;
          case "2.5":
            $(this).closest('.evaluation_note').find('.rating label[data-value="2.5"]').trigger('click');
            $(this).closest('.evaluation_note').find('.rating label[data-value="1"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2"]').css('color', '#36ccb5');
	         $(this).closest('.evaluation_note').find('.rating label[data-value="0.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2.5"]').css('color', '#36ccb5');
            break;  
          case "3":
            $(this).closest('.evaluation_note').find('.rating label[data-value="3"]').trigger('click');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="3"]').css('color', '#36ccb5');
	         $(this).closest('.evaluation_note').find('.rating label[data-value="0.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2.5"]').css('color', '#36ccb5');
            break;
          case "3.5":
            $(this).closest('.evaluation_note').find('.rating label[data-value="3.5"]').trigger('click');
            $(this).closest('.evaluation_note').find('.rating label[data-value="1"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="3"]').css('color', '#36ccb5');
	         $(this).closest('.evaluation_note').find('.rating label[data-value="0.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="3.5"]').css('color', '#36ccb5');
            break;
          case "4":
            $(this).closest('.evaluation_note').find('.rating label[data-value="4"]').trigger('click');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="3"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="4"]').css('color', '#36ccb5');
	         $(this).closest('.evaluation_note').find('.rating label[data-value="0.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="3.5"]').css('color', '#36ccb5');
            break;
          case "4.5":
            $(this).closest('.evaluation_note').find('.rating label[data-value="4.5"]').trigger('click');
            $(this).closest('.evaluation_note').find('.rating label[data-value="1"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="3"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="4"]').css('color', '#36ccb5');
	         $(this).closest('.evaluation_note').find('.rating label[data-value="0.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="3.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="4.5"]').css('color', '#36ccb5');
            break;  
          case "5":
            $(this).closest('.evaluation_note').find('.rating label[data-value="5"]').trigger('click');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="3"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="4"]').css('color', '#36ccb5');
	         $(this).closest('.evaluation_note').find('.rating label[data-value="0.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="1.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="2.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="3.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="4.5"]').css('color', '#36ccb5');
	        $(this).closest('.evaluation_note').find('.rating label[data-value="5"]').css('color', '#36ccb5');
            break; 
        }
	 });

	/*$('.evaluation_staff_content').find('.dateEvaluation').each(function(){
		var date = $(this).text();
		var dateSplit = date.split(' ');
		$(this).text(dateSplit[0]);
	});
*/


});