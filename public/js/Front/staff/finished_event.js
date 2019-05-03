$(document).ready(function() {

	$('.thumbnail:first').addClass('active');

	$(document).on('click','.menu_head',function() {
		var link = $(this).attr('data-content');
		$('.page').each(function(i, el) {
			if(!$(el).hasClass('is_hidden')) $(el).addClass('is_hidden');
		})
		$('#' + link).removeClass('is_hidden');
		if(!$('#' + link).hasClass('is_hidden')) {
			$('.menu_head.active').removeClass('active');
			$(this).addClass('active');
		}
	})

	/*Changing the finished event content according to the event choosed*/
    $('.header_slider').on('click', '.thumbnail', function() {
        var url = $(this).attr('data-finished_event');
        var data = $(this).data('id');
        var dataEventStaff = $(this).attr('data-idEventStaff');
        console.log(dataEventStaff);
        console.log('mande');
        $(this).addClass('active');
        $(this).siblings().removeClass('active');
        $.ajax({
            url: url,
            type : 'POST',
            /*dataType: 'JSON',*/
            data: {idEvent: data, idEventStaff: dataEventStaff},
            success : function(response){
                $('#staff_finished_event_content').html(response["view_event"]);
                console.log('success');
            },
            error : function(resultat, statut, erreur){
                console.log("Ajax error in the Thumbnail click event with : "+erreur);
                console.log(resultat);
            }
        });
    });
    /*End changing the finished event content according to the event choosed*/



})
	/*function fileReport(input, div) {

    if (input.files && input.files[0]) {
        if (input.files[0].type == "application/pdf"){
	       $('.attachment_file_content').find('.format').addClass('pdf');
	       $('.attachment_file_content').find('.format').text('pdf');
	    } else if (input.files[0].type == "application/vnd.openxmlformats-officedocument.presentationml.presentation"){
	       $('.attachment_file_content').find('.format').addClass('pptx');
	       $('.attachment_file_content').find('.format').text('pptx');
	    } else if (input.files[0].type == "application/vnd.openxmlformats-officedocument.wordprocessingml.document"){
	       $('.attachment_file_content').find('.format').addClass('word');
	       $('.attachment_file_content').find('.format').text('word');
	    } else if (input.files[0].type == "application/jpg"){
	       $('.attachment_file_content').find('.format').addClass('jpg');
	       $('.attachment_file_content').find('.format').text('jpg');
	    }  else {
	        $('.modal_content').find('#resume').attr('src', 's');
	    }
    }
}*/

	$('#staff_finished_event_content').on('click', '.inputFile', function(){
		$(this).closest('.join_files').siblings('.attachment_file_content').find('.fileResponse:last').trigger("click");
	});

	function readImage(file, attachment_file_content, key) {
	  var reader = new FileReader();
	  var image  = new Image();

	  reader.readAsDataURL(file);
	  reader.onload = function(_file) {
	    /*image.src = _file.target.result; // url.createObjectURL(file);
	    image.onload = function() {*/
	      var n = file.name;
	      var temp =n.split(".");
	      var nameIcon = temp[temp.length-1].toUpperCase();
	      var t = file.type;
	      var clone = '<div class="attachment_file_item in_progress file_place">\
					<span class="format pdf">'+nameIcon+'</span>\
					<span class="document_name">'+n+'</span>\
					<small class="remove_file"><svg><use xlink:href="#icon-cross"></svg></small>\
					<div class="progress">\
					<span class="bar"></span>\
					</div>\
					</div>';
	      attachment_file_content.find('.content_file:last').append(clone);
	      var copie = '<div class="content_file">\
	      <input type="file" class="input_hidden fileResponse" name="fileResponse['+key+'][]"/>\
	      </div>';
	      attachment_file_content.append(copie);
	    };


	}

	$('#staff_finished_event_content').on('change', '.fileResponse', function(e){
	  if(this.disabled) {
	    return alert('File upload not supported!');
	  }

	  var F = this.files;
	  if (F && F[0]) {
	    for (var i = 0; i < F.length; i++) {
	      readImage(F[i], $(this).closest('.attachment').find('.attachment_file_content'), $(this).closest('.attachment_file_content').siblings('.join_files').find('.separator').data('key'));
	    }
	  }
	  console.log($(this).val());
	});

	$('#staff_finished_event_content').on('click', '.remove_file', function(){
		$(this).closest('.content_file').remove();
		var idToRemove = $(this).siblings('.idEvaluation').val();
		idToRemove = $(this).closest('.attachment_file_content').find('.idToRemove').val()+idToRemove+",";
    	$(this).closest('.attachment_file_content').find('.idToRemove').val(idToRemove);
		$(this).closest('.file_place').remove();

	});


	$('#staff_finished_event_content').on('click', '.staff_report_container .sending_report', function(){
		var langue= getLanguage();
		var idQuestion = $(this).closest('.staff_report_content').find('.idQuestion').val();
		var form_data = new FormData($("#regFormReport")[0]);
		var url = $(this).data('answer');
		$.ajax({
            url: url,
            type : 'POST',
            data: form_data,
            processData: false,
            contentType: false,
            success: function(response) {
								if (langue == "fr") {
		                toastr.success('Enregistrement compte rendu réussi');
		            }else{
		                toastr.success('Report successfully saved');
		            }
                $('.idToRemove').each(function(){
                	$(this).val("");
                });
            },
            error: function(response, statut, erreur){
								if (langue == "fr") {
										toastr.error('Erreur d’enregistrement compte rendu');
								}else{
										toastr.error('Report saving failed');
								}
                // console.log("Applying modification error (Ajax) with : " + erreur);
                // console.log(response);
            }
        });
	});


/*$('.launch_modal').find("#resume").change(function () {
	fileReport(this);
});*/

$(window).on('load',function(){
	$('.slackSlider').removeClass('is_hidden');
});
