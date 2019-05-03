  $( document ).ready(function(){

  var event_repport_max = $(document).find('.statement_agency').find('.dropdown_users:first').find('li').length;
  var eventTranslate = $(document).find('.statement_agency').find('.modify:first').text().trim();
  eventTranslate = eventTranslate.substring(0, eventTranslate.length - 1);

  $(document).on('click','.statement_agency .span_dropdown',function(){
      $(this).siblings('ul.dropdown_users').toggle();
      $(this).siblings('ul.dropdown_users').removeClass('is_hidden');

  });

   $(document).find('.statement_agency').on({
    mouseleave: function(){
        $(document).find('.statement_agency').find('ul.dropdown_users').addClass('is_hidden');
    }
  }, 'ul.dropdown_users');

	$(document).on('click','.statement_agency .checkbox_users',function(){
       var langue = getLanguage();
       var nom = $(this).siblings('.icone_name_users').find('.name_users').text().trim();

       var id = $(this).siblings('.icone_name_users').find('.name_users').data('id');
       id = parseInt(id);

       var inputOwn = $(this).closest('.dropdown_content').find('.hidden_id_user');
       var inputs = $(this).closest('.statement_agency').find('input.hidden_id_user').not(inputOwn);
       var inputsLength = inputs.length;
       var errorNotValid = 0;
       for (var i = 0; i < inputsLength; i++) {
         if ( parseInt($(inputs[i]).val().trim()) == id){
            errorNotValid += 1;
         }
       }

       if(errorNotValid == 0){
         $(this).toggleClass('active');
         $(this).closest('.dropdown_login').find('.checkbox_users').not(this).removeClass('active');
         if ($(this).hasClass('active')) {
            $(this).closest('.dropdown_content').find('input.input_drop_user').val(nom);
            $(this).closest('.dropdown_content').find('input.hidden_id_user').val(id);
            $(this).closest('.dropdown_content').find('input.input_drop_user').attr('data-idUser', id);
         } else {
            $(this).closest('.dropdown_content').find('input.input_drop_user').val('');
            $(this).closest('.dropdown_content').find('input.input_drop_user').attr('data-idUser', '');
            $(this).closest('.dropdown_content').find('input.hidden_id_user').val('');
         }
       } else {
          // toastr.warning("");
          if(langue == "en"){
              toastr.warning('Ce staff a été déjà séléctionné');
            } else {
              toastr.warning('This staff has already been selected')
            }
       }




  });

    $(document).find('.statement_agency').find('.content_question').find('.wth_img_before').removeClass('wth_img_before');
    $(document).find('.statement_agency').find('.delete_parent').after('<div class="divspecial"></div>');
    $(document).find('.statement_agency').find('.delete_parent:last').hide();
    $(document).find('.statement_agency').find('.delete_child').after('<div class="divspecial"></div>');
    $(document).find('.statement_agency').find('.delete_child:last').hide();


    // add parent question
    $(document).on('click','.statement_agency .add_parent',function(){
      var langue = getLanguage();
      var numberOfReports = $(document).find('.statement_agency').find('.content_statement').length;
      if(numberOfReports < event_repport_max){
        var question = $(this).closest('.content_statement').find('textarea.wth_description_statement_question').val();
        question = question.trim();
        var user =  $(this).closest('.content_statement').find('input.input_drop_user').val();
        user = user.trim();
        if (question != '' && user != ''){
          add_parent_question('.content_statement');
          $(this).hide();
          $(document).find('.delete_parent').show();
        } else {
          // toastr.warning('Veuillez completer au moins une question et un utilisateur');
          if(langue == "en"){
        			toastr.warning('Question fields required');
        		} else {
        			toastr.warning('Champs question obligatoire');
        		}
        }
      } else {
        toastr.warning('Vous ne pouvez plus ajouter un rapport!');
      }

      var events = $(document).find('.statement_agency').find('.modify');
      var numberOfEvent = events.length;
      for(var i=0; i<numberOfEvent; i++){
        var n = i + 1;
        $(events[i]).text(eventTranslate+' '+n);
      }

    });
    //delete parent question
    $(document).on('click','.delete_parent',function(){
    	if($(document).find('.content_statement').length != 1){
          var eventStatementToRemove = $(this).closest('.content_statement').attr('data-eventState-id');
          $(this).closest('statement_agency').find('input.id_event').after('<input type="hidden" name="eventStatementToRemove[]" value="'+eventStatementToRemove+'">');
        	$(this).closest('.content_statement').remove();
          var i = 0;
          $(document).find('.content_statement').each(function(){
              $(this).find('input').each( function(){
                var nameStr = $(this).attr('name');
                nameStr = nameStr.replace(/[0-9]+/, i);
                $(this).attr('name', nameStr);
              });
              $(this).find('textarea').each( function(){
                var nameStrText = $(this).attr('name');
                nameStrText = nameStrText.replace(/[0-9]+/, i);
                $(this).attr('name', nameStrText);
              });
            i++
          });
    	}
    	if ($(document).find('.content_statement').length == 1){
	        $(document).find('.content_statement').find('.delete_parent').after('<div class="divspecial"></div>');
	        $(document).find('.content_statement').find('.delete_parent').hide();
	    }
	    $(document).find('.content_statement:last').find('.add_parent').show();

      var events = $(document).find('.statement_agency').find('.modify');
      var numberOfEvent = events.length;
      for(var i=0; i<numberOfEvent; i++){
        var n = i + 1;
        $(events[i]).text(eventTranslate+' '+n);
      }
    });
    // add question
    $(document).on('click','.statement_agency .add_child',function(){
      $(this).parent().removeClass('wth_img_before');
      var question = $(this).closest('.content_statement').find('textarea.wth_description_statement_question').last().val();
      question = question.trim();
      if (question != ''){
        var clone = $(document).find('.content_question:last').clone();
        clone.find('.add_child').parent().addClass('wth_img_before');
        clone.find('input').each(function(){
          $(this).val("");
        });
        clone.find('textarea').each( function(){
          $(this).val("");
        });
        clone.find('ul').each(function(){
          $(this).find('.checkbox_users').removeClass('active');
        });
        clone.insertAfter($(this).closest('.content_question'));
        $(document).find('.divspecial').remove();
        $(this).hide();
        $(this).closest('.content_pages_statement').find('.content_question').siblings().find('.delete_child').show();
      } else {
        toastr.warning('Veuillez completer une question');
      }

      var questions = $(this).closest('.content_statement').find('.first_divider_content_question');
      var numberOfQuestion = questions.length;
      for(var i=0; i<numberOfQuestion; i++){
        var n = i + 1;
        $(questions[i]).find('label').text('Question #'+n);
      }
    });
    //delete question
    $(document).on('click','.statement_agency .delete_child',function(){
      var contentSelf = $(this).closest('.content_statement');
    	if($(this).closest('.content_statement').find('.content_question').length > 1){
        var idQuestionToRemove = $(this).closest('.content_question').find('input.idQuestionToRemove').val();
        $(this).closest('.content_statement').find('.header_statement').after('<input type="hidden" name="questionToRemove[]" value="'+idQuestionToRemove+'">');
        $(this).closest('.content_question').remove();
        contentSelf.find('.content_question:last').find('.add_child').show();
        contentSelf.find('.content_question:last').find('.add_child').parent().addClass('wth_img_before');
    	}
      if (contentSelf.find('.content_question').length == 1){
        contentSelf.find('.content_question:last').find('.delete_child').after('<div class="divspecial"></div>');
        contentSelf.find('.content_question:last').find('.delete_child').hide();
        contentSelf.find('.content_question:last').find('.add_child').parent().removeClass('wth_img_before');
      }

      var questions = contentSelf.find('.first_divider_content_question');
      var numberOfQuestion = questions.length;
      for(var i=0; i<numberOfQuestion; i++){
        var n = i + 1;
        $(questions[i]).find('label').text('Question #'+n);
      }
    });

    $('.content_future_event').on('click', '.footer_content_question button', function(e) {

        e.preventDefault(); // avoid to execute the actual submit of the form.

        var form = $(this).closest('#event_statement_registration');
        var url = form.attr('action');

        // validation des champs
        var textarea = $(this).closest('#event_statement_registration').find('textarea.wth_description_statement_question');
        var textareaLength = textarea.length;
        var input = $(this).closest('#event_statement_registration').find('input.input_drop_user');
        var inputLength = input.length;
        var errorNotValid = 0;
        for(var i = 0; i<textareaLength; i++){
          if ($(textarea[i]).val().trim() == ""){
            errorNotValid += 1;
          }
        }
        for(var j=0; j<inputLength; j++){
          if($(input[j]).val().trim() == ""){
            errorNotValid += 1;
          }
        }

        //Lancement Ajax
        if (errorNotValid == 0){
          $.ajax({
             type: "POST",
             url: url,
             data: form.serialize(), // serializes the form's elements.
             beforeSend: function(){
                launch_modal('modal_wait');
            },
            complete: function(){
                $('#modal_wait').addClass('is_hidden');
                $('#modal_wait').addClass('is_visually_hidden');
                $('.master').removeClass('is_blurred');
                $('html, body').removeClass('no_scroll');
                $('html, body').scrollTop(window.window_position);
            },
            success: function(event){
                toastr.success("Compte rendu reussi"); // show response from the php script.
                $('.content_future_event').find('.future_event').find('.statement').html(event);
            }
          });
        } else {
          toastr.warning("Veuillez remplir les champs vide ou les enlever");
        }
    });
});

function add_parent_question(addition){
    var number = parseInt($(addition).length);

  	var clone = $(addition+':last').clone();
  	clone.find('input').each(function(){
      var nameStr = $(this).attr('name');
      nameStr = nameStr.replace(/[0-9]+/, number);
      $(this).attr('name', nameStr);
  		$(this).val("");
  	});
  	clone.find('textarea').each( function(){
        var nameStrText = $(this).attr('name');
        nameStrText = nameStrText.replace(/[0-9]+/, number);
        $(this).attr('name', nameStrText);
  		$(this).val("");
  	});
  	clone.find('ul').each(function(){
  		$(this).find('.checkbox_users').removeClass('active');
  	});
  	clone.insertAfter(addition+':last');
  	$(document).find('.divspecial').remove();
    clone.find('.content_question:not(:first)').remove();
    /*while (clone.find('.content_question').length > 1){
      clone.find('.content_question:last').remove();
    }*/
    clone.find('.content_question:last').find('.add_child').show();
    clone.find('.content_question:last').find('.delete_child').hide();
}
