$( document ).ready(function(){ 	
	 $('.thead_two').on('click','.slide_facrure',function(){
	 	console.log("jdklsqjdlq");
       $(this).closest('.label_date_three').next('.litle_table').toggleClass('is_hidden');
       $(this).closest('.label_date_three').find('.icone_play').toggleClass('icone_play_click');
   });
   
});