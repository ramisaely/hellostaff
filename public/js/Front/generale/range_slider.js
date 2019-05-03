var  $remuneration_range_input = $('.remuneration_range input');
var $job_exp_range_input = $('.job_experience_range input');

function getTrackStyle(el, range_labels) {  
  var curVal = el.value;
  // Set active label
  $('.'+range_labels+' li').removeClass('active selected');
  
  var curLabel = $('.'+range_labels).find('li[data-value="'+curVal+'"]');
  
  curLabel.addClass('active selected');
  curLabel.prevAll().addClass('selected');
}

$(document).ready(function() {
  // declartion variable
  var title = "";

  /*** start remuneration range ***/
  $remuneration_range_input.on('input', function () {
    getTrackStyle(this, 'remuneration_range_labels');
  });

  $('.remuneration_range_labels li').on('click', function () {
    var val = $(this).attr('data-value');
    
    $remuneration_range_input.val(val).trigger('input');
  });
  /*** end remuneration range ***/
  

  
  // take input id
  $('.launch_modal').click(function(event){
  	idInput = $(this).next().attr('id');
  	var job_name = $(this).prev().text();
  	$('p.post').text(job_name);
  	$("#expSup").attr('data-value',"3+");
  	var currentvalue = $(this).text();
  	
  	idInput = '#' + idInput;
  	valueInput = $(this).next().attr('value');
  	$('.job_experience_range_labels li').removeClass('active selected');
  	
  	var li_num = $('.job_experience_range_labels').find('li[data-value="'+valueInput+'"]');
  	li_num.addClass('active selected');
  	li_num.prevAll().removeClass('selected');
  	
  	if (valueInput == 'no'){
  	  $(".experience").html('0').addClass('experience_null');
  	  $(".experience_wrap_sup").addClass('hidden_experience');
      $(".experience_wrap").addClass('hidden_experience');
  	}
  	if (valueInput == 0){
  	  $(".experience").html(valueInput).addClass('experience_null');
  	  $(".experience_wrap_sup").addClass('hidden_experience');
      $(".experience_wrap").addClass('hidden_experience');
      $('p.foot_paragraph').text(post_position);
      $(idInput).parent().addClass('active xp');
  	}
  	if (valueInput == 1){
  	  $(".experience").html(valueInput).removeClass('experience_null');
  	  $(".experience_wrap_sup").addClass('hidden_experience');
      $(".experience_wrap").addClass('hidden_experience');
      $('p.foot_paragraph').text("");
      $(idInput).parent().addClass('active xp');
  	}
  	if (valueInput == 2){
  	  $(".experience").html(valueInput).removeClass('experience_null');
  	  $(".experience_wrap_sup").addClass('hidden_experience');
      $(".experience_wrap").removeClass('hidden_experience');
      $('p.foot_paragraph').text("");
      $(idInput).parent().addClass('active xp');
  	}
  	if(valueInput == "3+"){
  	  $(".experience").html(valueInput).removeClass('experience_null');
  	  $(".experience_wrap_sup").removeClass('hidden_experience');
      $(".experience_wrap").removeClass('hidden_experience');
      $('p.foot_paragraph').text("");
      $(idInput).parent().addClass('active xp');
  	}
  });
  
  
  /*** start job experience range ***/
  $job_exp_range_input.on('input', function () {
    getTrackStyle(this, 'job_experience_range_labels');
  });


  $('.job_experience_range_labels li').on('click', function () {
    var val = $(this).attr('data-value');
    
    $job_exp_range_input.val(val).trigger('input');
    
    $(this).addClass('active selected').siblings().removeClass('active selected'); 
    
    //recuperation valeur du click
    $data_value = $(this).attr("data-value"); 
    // valeur de input caché
    $(idInput).val($data_value);
    
    
    if ($(this).hasClass('active selected')) {
      $(".experience").html($data_value);
    }
    switch ($data_value) {
      case '0':
        $(".experience").addClass('experience_null');
        $(".experience_wrap_sup").addClass('hidden_experience');
        $(".experience_wrap").addClass('hidden_experience');
        $('p.foot_paragraph').text(post_position);
        $(idInput).parent().addClass('active xp');
        break;
      case '1':
        $(".experience").removeClass('experience_null');
        $(".experience_wrap_sup").addClass('hidden_experience');
        $(".experience_wrap").addClass('hidden_experience');
        $('p.foot_paragraph').text("");
        $(idInput).parent().addClass('active xp');
        break;
      case '2':
        $(".experience").removeClass('experience_null');
        $(".experience_wrap_sup").addClass('hidden_experience');
        $(".experience_wrap").removeClass('hidden_experience');
        $('p.foot_paragraph').text("");
        $(idInput).parent().addClass('active xp');
        break;
      case '3+':
        $(".experience").removeClass('experience_null');
        $(".experience_wrap_sup").removeClass('hidden_experience');
        $(".experience_wrap").removeClass('hidden_experience');
        $('p.foot_paragraph').text("");
        $(idInput).parent().addClass('active xp');
        break;
    }

    $(idInput).prev().text($data_value);
  });
  /*** end job experience range ***/
  
  function readURLPortrait(input, div) {
    if (input.files && input.files[0]) {
      if (input.files[0].type == "image/jpeg" || input.files[0].type == "image/png" || input.files[0].type == "image/svg+xml"){
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#imgPortrait').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        $('p.infoPortrait').text('');
      } else {
        $('p.infoPortrait').text(image_valid);
        $('#imgPortrait').attr('src', 's');
      }
    }
  }
  function readURLPortraitPlain(input, div) {
    if (input.files && input.files[0]) {
      if (input.files[0].type == "image/jpeg" || input.files[0].type == "image/png" || input.files[0].type == "image/svg+xml"){
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#imgPortraitPlain').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        $('p.infoPortraitPlain').text('');
      } else {
        $('p.infoPortraitPlain').text(image_valid);
        ('#imgPortraitPlain').attr('src', 's');
      }
    }
  }
  function readURLcv(input, div) {
    if (input.files && input.files[0]) {
       if (input.files[0].type == "application/pdf"){
        var url = appURL + "/img/step_photo_cv/pdf.jpeg"
        $('#imgCV').attr('src',url);
        $('p.infoCV').text('');
      } else if (input.files[0].type == "application/vnd.openxmlformats-officedocument.presentationml.presentation"){
        var url = appURL + "/img/step_photo_cv/pptx.png"
        $('#imgCV').attr('src',url);
        $('p.infoCV').text('');
      } else if (input.files[0].type == "application/vnd.openxmlformats-officedocument.wordprocessingml.document"){
        var url = appURL + "/img/step_photo_cv/word.png"
        $('#imgCV').attr('src',url);
        $('p.infoCV').text('');
      } /*else if (input.files[0].type == "image/jpeg" || input.files[0].type == "image/png" || input.files[0].type == "imgage/svg+xml"){
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#imgCV').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        $('p.infoCV').text('');
      } */ else {
        $('p.infoCV').text(document_valid);
        $('#imgCV').attr('src', 's');
      }
    }
  }
  
  $("#portrait").change(function () {
    readURLPortrait(this);
    replaceText(this);
  });
  $("#long_portrait").change(function () {
    readURLPortraitPlain(this);
    replaceText(this)
  });
  $("#cv").change(function () {
    readURLcv(this);
    replaceText(this)
  });
 
 /** Utilisation du webcam pour la capture de photo dans P&CV */
 if(window.matchMedia("(min-width:480px)").matches) {
        $(".make_print_photo_desktop").click(function(){
        //$("#portrait").trigger("click");
        launch_modal('appareil_photo');
    });
  }
  else {
    $('#imgPortrait').removeClass('make_print_photo_desktop');
     $("#imgPortrait").click(function(){
      $("#portrait").trigger("click");
  });
  }
  
  if(window.matchMedia("(min-width:480px)").matches) {
        $(".make_print_photo_plain_desktop").click(function(){
        //$("#portrait").trigger("click");
        launch_modal('appareil_photo_plain');
    });
  }
  else {
    $('#imgPortraitPlain').removeClass('make_print_photo_plain_desktop');
    $("#imgPortraitPlain").click(function(){
      $("#long_portrait").trigger("click");
  });
  }
/** End Utilisation du webcam pour la capture de photo dans P&CV */  
  
   $("#imgCV").click(function(){
      $("#cv").trigger("click");
  });
  
});

function replaceText(box) {
  $(box).closest('.mini_title').contents().filter(function() {
    return $(this).nodeType == 3
  }).each(function(i, el){
      $(el).textContent = $(el).textContent.replace('Modifiez vos');
  });
}
