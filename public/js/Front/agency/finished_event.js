$(document).ready(function(){

    var langue= getLanguage();
    moment.locale(langue);

    var date1 = "";
    var date2 = "";
    var hourStart1 = [];
    var hourEnd1 = [];
    var hourStart2 = [];
    var hourEnd2 = [];
    $('.master').find('.content_facture').each(function(){
        var dataStart = $(this).find('.startDateHb').length;
        date1 = $(this).find('.startDateHb[data-point="'+0+'"]').text();
        date2 = $(this).find('.endDateHb[data-key="'+1+'"]').text();

        $(this).find('.startHour[data-datestart="'+1+'"]').each(function(){
            hourStart1 = $(this).text();
            $(this).addClass('currentHour1Start');
        });

        $(this).find('.endHour[data-dateend="'+1+'"]').each(function(){
            hourEnd1 = $(this).text();
            $(this).addClass('currentHour1End');
        });

        $(this).find('.startHour2[data-datestart1="'+2+'"]').each(function(){
            hourStart2 = $(this).text();
        console.log(hourStart2);
        $(this).addClass('currentHour2Start');
        });

        $(this).find('.endHour2[data-dateend1="'+2+'"]').each(function(){
            hourEnd2 = $(this).text();
            $(this).addClass('currentHour2End');
        });

/*       if (dataStart == 1) {
            // $(this).find('.startView').text(date1);
            // $(this).find('.endView').text(date1);
            // $(this).find('.startHourView1').text(hourStart1);
            // $(this).find('.endHourView1').text(hourEnd1);
            $(this).find('.startHourView2').text(hourStart1);
            $(this).find('.endHourView2').text(hourEnd1);
        }else{
            // $(this).find('.startView').text(date1);
            // $(this).find('.endView').text(date2);
        //     $(this).find('.startHourView1').text(hourStart1);
        //     $(this).find('.endHourView1').text(hourEnd1);
        //     $(this).find('.startHourView2').text(hourStart2);
        //     $(this).find('.endHourView2').text(hourEnd2);
        }*/

        $(this).find('.endDateHb[data-key="'+1+'"]').addClass('activee');
        $(this).find('.startDateHb[data-point="'+0+'"]').addClass('activeee');
        $(this).find('.startDateHb[data-point="'+0+'"]').addClass('currentStartDate');
        $(this).find('.endDateHb[data-key="'+1+'"]').addClass('currentEndDate');

        /*$(this).find('.startHour[data-datestart="'+1+'"]').addClass('activeee');
        $(this).find('.endHour[data-dateend="'+1+'"]').addClass('activeee');
        $(this).find('.startHour2[data-datestart1="'+2+'"]').addClass('activee');
        $(this).find('.endHour2[data-dateend1="'+2+'"]').addClass('activee');

        $(this).find('.startHour[data-datestart="'+1+'"]').addClass('currentStartDate');
        $(this).find('.endHour[data-dateend="'+1+'"]').addClass('currentEndDate');
        $(this).find('.startHour2[data-datestart1="'+2+'"]').addClass('currentStartDate');
        $(this).find('.endHour2[data-dateend1="'+2+'"]').addClass('activee');*/

    });

    $('.master').on('click', '.next', function(){
        var endView = $(this).closest('.content_facture').find('.endView').text();
        var endCurrent = $(this).closest('.content_facture').find('.activee').text();
        var nextStart = $(this).closest('.content_facture').find('.currentStartDate').next();
        var nextEnd = $(this).closest('.content_facture').find('.currentEndDate').next();
        var dataEndNext = nextEnd.attr('data-key');
        var valEnd = $(this).closest('.content_facture').find('label[data-key="'+dataEndNext+'"]').text();
        var endLast = $(this).closest('.content_facture').find('.endDateHb:last').text();
        var firstStartDate = $(this).closest('.content_facture').find('.startDateHb[data-point="'+0+'"]').text();
        var firstEndDate = $(this).closest('.content_facture').find('.endDateHb[data-key="'+0+'"]').text();
        var startHourViewCurrent = [];
        var endHourViewCurrent = [];
        var startHourCurrent = [];
        var endHourCurrent = [];
        var startCurrent2 = [];
        var endCurrent2 = [];
        var next2Start = [];
        var next2End = [];
        var last2End = [];
        var data2Start = [];
        var data2End = [];
        var data1Start = [];
        var data1End = [];
        $(this).closest('.colonne3').each(function(){
            $(this).find('.startHour2[data-datestart1="'+2+'"]').each(function(){
                hourStart2 = $(this).text();
                $(this).addClass('currentHour2Start');
            });
            $(this).find('.endHour2[data-dateend1="'+2+'"]').each(function(){
                hourEnd2 = $(this).text();
                $(this).addClass('currentHour2End');
            });
        });

        if (endLast != endView && endView != firstEndDate) {
            $(this).closest('.content_facture').find('.endDateHb').removeClass('activee');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('activeee');
            $(this).closest('.content_facture').find('.endDateHb').removeClass('currentEndDate');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('currentStartDate');
            nextEnd.addClass('activee');
            nextEnd.addClass('currentEndDate');
            nextStart.addClass('currentStartDate');
            nextStart.addClass('activeee');
            $(this).closest('.content_facture').find('.startView').text(endCurrent);
            $(this).closest('.content_facture').find('.endView').text(valEnd);

            /*Start Slider Hour*/
            $(this).closest('.colonne3').each(function(){
            $(this).find('.startHourView2').each(function(i){
                startCurrent2 = $(this).text();
                $(this).closest('.colonne3').siblings('.colonne2').find('.startHourView1').each(function(a){
                    if (i == a) {
                    $(this).text(startCurrent2);
                    }
                });
            });

            $(this).find('.endHourView2').each(function(i){
                endCurrent2 = $(this).text();
                $(this).closest('.colonne3').siblings('.colonne2').find('.endHourView1').each(function(a){
                    if (i == a) {
                    $(this).text(endCurrent2);
                    }
                });
            });

            $(this).find('.currentHour2Start').next().each(function(i){
                data2Start = $(this).data('datestart1');
                data1Start = data2Start - 1;
                $(this).closest('.colonne3').find('.startHour2').removeClass('currentHour2Start');
                $(this).closest('.colonne3').siblings('.colonne2').find('.startHour').removeClass('currentHour1Start');
                $(this).closest('.colonne3').find('.startHour2[data-datestart1='+data2Start+']').addClass('currentHour2Start');
                $(this).closest('.colonne3').siblings('.colonne2').find('.startHour[data-datestart='+data1Start+']').addClass('currentHour1Start');
                next2Start = $(this).text();
                $(this).closest('.colonne3').find('.startHourView2').each(function(a){
                    if (i == a) {
                        $(this).text(next2Start);
                    }
                });
            });

            $(this).find('.currentHour2End').next().each(function(i){
                data2End = $(this).data('dateend1');
                data1End = data2End - 1;
                $(this).closest('.colonne3').find('.endHour2').removeClass('currentHour2End');
                $(this).closest('.colonne3').siblings('.colonne2').find('.endHour').removeClass('currentHour1End');
                $(this).closest('.colonne3').find('.endHour2[data-dateend1='+data2End+']').addClass('currentHour2End');
                $(this).closest('.colonne3').siblings('.colonne2').find('.endHour[data-dateend='+data1End+']').addClass('currentHour1End');
                next2End = $(this).text();
                $(this).closest('.colonne3').find('.endHourView2').each(function(a){
                    if (i == a) {
                        $(this).text(next2End);
                    }
                });
            });
        });
        /*End Slider Hour*/

        } else if(endLast == endCurrent){
            $(this).closest('.content_facture').find('.endDateHb').removeClass('activee');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('activeee');
            $(this).closest('.content_facture').find('.endDateHb').removeClass('currentEndDate');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('currentStartDate');
            nextStart.addClass('currentStartDate');
            nextStart.addClass('activeee');
            $(this).closest('.content_facture').find('.endDateHb:first').addClass('currentEndDate');
            $(this).closest('.content_facture').find('.endDateHb:first').addClass('activee');
            $(this).closest('.content_facture').find('.startView').text(endCurrent);
            $(this).closest('.content_facture').find('.endView').text(firstStartDate);


            /*Start Slider Hour*/
            $(this).closest('.colonne3').each(function(){
            $(this).find('.startHourView2').each(function(i){
                startCurrent2 = $(this).text();
                $(this).closest('.colonne3').siblings('.colonne2').find('.startHourView1').each(function(a){
                    if (i == a) {
                    $(this).text(startCurrent2);
                    }
                });
                $(this).closest('.colonne3').siblings('.colonne2').find('.startHour:last').each(function(a){
                    data1Start = $(this).data('datestart');
                    $(this).closest('.colonne2').find('.startHour').removeClass('currentHour1Start');
                    $(this).closest('.colonne2').find('.startHour[data-datestart='+data1Start+']').addClass('currentHour1Start');
                });
            });

            $(this).find('.endHourView2').each(function(i){
                endCurrent2 = $(this).text();
                $(this).closest('.colonne3').siblings('.colonne2').find('.endHourView1').each(function(a){
                    if (i == a) {
                    $(this).text(endCurrent2);
                    }
                });
                $(this).closest('.colonne3').siblings('.colonne2').find('.endHour:last').each(function(a){
                    data1End = $(this).data('dateend');
                    $(this).closest('.colonne2').find('.endHour').removeClass('currentHour1End');
                    $(this).closest('.colonne2').find('.endHour[data-dateend='+data1End+']').addClass('currentHour1End');
                });
            });

            $(this).find('.startHour2[data-datestart1='+1+']').each(function(i){
                data2Start = $(this).data('datestart1');
                data1Start = data2Start - 1;
                $(this).closest('.colonne3').find('.startHour2').removeClass('currentHour2Start');
                $(this).closest('.colonne3').find('.startHour2[data-datestart1='+1+']').addClass('currentHour2Start');
                next2Start = $(this).text();
                $(this).closest('.colonne3').find('.startHourView2').each(function(a){
                    if (i == a) {
                        $(this).text(next2Start);
                    }
                });
            });

            $(this).find('.endHour2[data-dateend1='+1+']').each(function(i){
                data2End = $(this).data('dateend1');
                $(this).closest('.colonne3').find('.endHour2').removeClass('currentHour2End');
                $(this).closest('.colonne3').find('.endHour2[data-dateend1='+1+']').addClass('currentHour2End');
                next2End = $(this).text();
                $(this).closest('.colonne3').find('.endHourView2').each(function(a){
                    if (i == a) {
                        $(this).text(next2End);
                    }
                });
            });
        });
        /*End Slider Hour*/

        } else if(endCurrent == firstEndDate){
            $(this).closest('.content_facture').find('.endDateHb').removeClass('activee');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('activeee');
            $(this).closest('.content_facture').find('.endDateHb').removeClass('currentEndDate');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('currentStartDate');
            $(this).closest('.content_facture').find('.startDateHb:first').addClass('currentStartDate');
            $(this).closest('.content_facture').find('.startDateHb:first').addClass('activeee');
            nextEnd.addClass('currentEndDate');
            nextEnd.addClass('activee');
            $(this).closest('.content_facture').find('.startView').text(endCurrent);
            $(this).closest('.content_facture').find('.endView').text(date2);

            /*Start Slider Hour*/
            $(this).closest('.colonne3').each(function(){
            $(this).find('.startHourView2').each(function(i){
                startCurrent2 = $(this).text();
                    $(this).closest('.colonne3').siblings('.colonne2').find('.startHourView1').each(function(a){
                        if (i == a) {
                        $(this).text(startCurrent2);
                        }
                    });
                });

                $(this).find('.endHourView2').each(function(i){
                    endCurrent2 = $(this).text();
                    $(this).closest('.colonne3').siblings('.colonne2').find('.endHourView1').each(function(a){
                        if (i == a) {
                        $(this).text(endCurrent2);
                        }
                    });
                });

            $(this).find('.startHour2[data-datestart1='+2+']').each(function(i){
                data2Start = $(this).data('datestart1');
                data1Start = data2Start - 1;
                $(this).closest('.colonne3').find('.startHour2').removeClass('currentHour2Start');
                $(this).closest('.colonne3').find('.startHour2[data-datestart1='+2+']').addClass('currentHour2Start');
                $(this).closest('.colonne3').siblings('.colonne2').find('.startHour').removeClass('currentHour1Start');
                $(this).closest('.colonne3').siblings('.colonne2').find('.startHour[data-datestart='+data1Start+']').addClass('currentHour1Start');
                next2Start = $(this).text();
                $(this).closest('.colonne3').find('.startHourView2').each(function(a){
                    if (i == a) {
                        $(this).text(next2Start);
                    }
                });
            });

            $(this).find('.endHour2[data-dateend1='+2+']').each(function(i){
                data2End = $(this).data('dateend1');
                data1End = data2End - 1;
                $(this).closest('.colonne3').find('.endHour2').removeClass('currentHour2End');
                $(this).closest('.colonne3').find('.endHour2[data-dateend1='+2+']').addClass('currentHour2End');
                $(this).closest('.colonne3').siblings('.colonne2').find('.endHour').removeClass('currentHour1End');
                $(this).closest('.colonne3').siblings('.colonne2').find('.endHour[data-dateend='+data1End+']').addClass('currentHour1End');
                next2End = $(this).text();
                $(this).closest('.colonne3').find('.endHourView2').each(function(a){
                    if (i == a) {
                        $(this).text(next2End);
                    }
                });
            });
        });
        /*End Slider Hour*/
        }
    });

    $('.master').on('click', '.previous', function(){
        startCurrent = $(this).closest('.content_facture').find('.activeee').text();
        var prevStart = $(this).closest('.content_facture').find('.currentStartDate').prev();
        var prevEnd = $(this).closest('.content_facture').find('.currentEndDate').prev();
        var dataStartPrev = prevStart.attr('data-point');
        var valStart = $(this).closest('.content_facture').find('label[data-point="'+dataStartPrev+'"]').text();
        var startLast = $(this).closest('.content_facture').find('.startDateHb:last').text();
        var firstStartDate = $(this).closest('.content_facture').find('.startDateHb[data-point="'+0+'"]').text();
        var firstEndDate = $(this).closest('.content_facture').find('.endDateHb[data-key="'+0+'"]').text();
        var startHourViewCurrent = [];
        var endHourViewCurrent = [];
        var startHourCurrent = [];
        var endHourCurrent = [];
        var startCurrent1 = [];
        var endCurrent1 = [];
        var next1Start = [];
        var next1End = [];
        var last2End = [];
        var data2Start = [];
        var data2End = [];
        var data1Start = [];
        var data1End = [];
        if(startCurrent == firstStartDate){
            $(this).closest('.content_facture').find('.endDateHb').removeClass('activee');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('activeee');
            $(this).closest('.content_facture').find('.endDateHb').removeClass('currentEndDate');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('currentStartDate');
            $(this).closest('.content_facture').find('.startDateHb:last').addClass('currentStartDate');
            $(this).closest('.content_facture').find('.startDateHb:last').addClass('activeee');
            prevEnd.addClass('currentEndDate');
            prevEnd.addClass('activee');
            $(this).closest('.content_facture').find('.startView').text(startLast);
            $(this).closest('.content_facture').find('.endView').text(startCurrent);
             /*Start Slider Hour*/
            $(this).closest('.colonne2').each(function(){
            $(this).find('.startHourView1').each(function(i){
                startCurrent1 = $(this).text();

                $(this).closest('.colonne2').siblings('.colonne3').find('.startHourView2').each(function(a){
                    if (i == a) {
                    $(this).text(startCurrent1);
                    }
                });
            });

            $(this).find('.endHourView1').each(function(i){
                endCurrent1 = $(this).text();

                $(this).closest('.colonne2').siblings('.colonne3').find('.endHourView2').each(function(a){
                    if (i == a) {
                    $(this).text(endCurrent1);
                    }
                });
            });
            var dataLast = $(this).find('.startHour:last').data('datestart');
            $(this).find('.startHour[data-datestart='+dataLast+']').each(function(i){
                data1Start = $(this).data('datestart');
                $(this).closest('.colonne2').find('.startHour').removeClass('currentHour1Start');
                $(this).closest('.colonne2').find('.startHour[data-datestart='+data1Start+']').addClass('currentHour1Start');
                $(this).closest('.colonne2').siblings('.colonne3').find('.startHour2').removeClass('currentHour2Start');
                $(this).closest('.colonne2').siblings('.colonne3').find('.startHour2[data-datestart1='+1+']').addClass('currentHour2Start');
                next1Start = $(this).text();
                $(this).closest('.colonne2').find('.startHourView1').each(function(a){
                    if (i == a) {
                        $(this).text(next1Start);
                    }
                });
            });
            var dataLastEnd = $(this).find('.endHour:last').data('dateend');
            $(this).find('.endHour[data-dateend='+dataLastEnd+']').each(function(i){
                data1End = $(this).data('dateend');
                $(this).closest('.colonne2').find('.endHour').removeClass('currentHour1End');
                $(this).closest('.colonne2').find('.endHour[data-dateend='+data1End+']').addClass('currentHour1End');
                $(this).closest('.colonne2').siblings('.colonne3').find('.endHour2').removeClass('currentHour2End');
                $(this).closest('.colonne2').siblings('.colonne3').find('.endHour2[data-dateend1='+1+']').addClass('currentHour2End');
                next1End = $(this).text();
                $(this).closest('.colonne2').find('.endHourView1').each(function(a){
                    if (i == a) {
                        $(this).text(next1End);
                    }
                });
            });
        });
        /*End Slider Hour*/
        }else if(startCurrent != firstStartDate){
            $(this).closest('.content_facture').find('.endDateHb').removeClass('activee');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('activeee');
            $(this).closest('.content_facture').find('.endDateHb').removeClass('currentEndDate');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('currentStartDate');
            prevStart.addClass('currentStartDate');
            var dataStartPrev = $(this).closest('.content_facture').find('.currentStartDate').data('point');
            var dataEndPrev = dataStartPrev + 1;
            prevStart.addClass('activeee');
            $(this).closest('.content_facture').find('.endDateHb[data-key='+dataEndPrev+']').addClass('currentEndDate');
            $(this).closest('.content_facture').find('.endDateHb[data-key='+dataEndPrev+']').addClass('activee');
            $(this).closest('.content_facture').find('.startView').text(valStart);
            $(this).closest('.content_facture').find('.endView').text(startCurrent);

            /*Start Slider Hour*/
            $(this).closest('.colonne2').each(function(){
            $(this).find('.startHourView1').each(function(i){
                startCurrent1 = $(this).text();

                $(this).closest('.colonne2').siblings('.colonne3').find('.startHourView2').each(function(a){
                    if (i == a) {
                    $(this).text(startCurrent1);
                    }
                });
            });

            $(this).find('.endHourView1').each(function(i){
                endCurrent1 = $(this).text();
                $(this).closest('.colonne2').siblings('.colonne3').find('.endHourView2').each(function(a){
                    if (i == a) {
                    $(this).text(endCurrent1);
                    }
                });
            });

            $(this).find('.currentHour1Start').prev().each(function(i){
                data1Start = $(this).data('datestart');
                data2Start = data1Start + 1;
                $(this).closest('.colonne2').find('.startHour').removeClass('currentHour1Start');
                $(this).closest('.colonne2').siblings('.colonne3').find('.startHour2').removeClass('currentHour2Start');
                $(this).closest('.colonne2').find('.startHour[data-datestart='+data1Start+']').addClass('currentHour1Start');
                $(this).closest('.colonne2').siblings('.colonne3').find('.startHour2[data-datestart1='+data2Start+']').addClass('currentHour2Start');
                next1Start = $(this).text();
                $(this).closest('.colonne2').find('.startHourView1').each(function(a){
                    if (i == a) {
                        $(this).text(next1Start);
                    }
                });
            });

            $(this).find('.currentHour1End').prev().each(function(i){
                data1End = $(this).data('dateend');
                data2End = data1End + 1;
                $(this).closest('.colonne2').find('.endHour').removeClass('currentHour1End');
                $(this).closest('.colonne2').siblings('.colonne3').find('.endHour2').removeClass('currentHour2End');
                $(this).closest('.colonne2').find('.endHour[data-dateend='+data1End+']').addClass('currentHour1End');
                $(this).closest('.colonne2').siblings('.colonne3').find('.endHour2[data-dateend1='+data2End+']').addClass('currentHour2End');
                next1End = $(this).text();
                $(this).closest('.colonne2').find('.endHourView1').each(function(a){
                    if (i == a) {
                        $(this).text(next1End);
                    }
                });
            });
        });
        /*End Slider Hour*/

        }/*if(startCurrent == startLast){
            $(this).closest('.content_facture').find('.endDateHb').removeClass('activee');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('activeee');
            $(this).closest('.content_facture').find('.endDateHb').removeClass('currentEndDate');
            $(this).closest('.content_facture').find('.startDateHb').removeClass('currentStartDate');
            $(this).closest('.content_facture').find('.startDateHb:first').addClass('currentStartDate');
            $(this).closest('.content_facture').find('.startDateHb:first').addClass('activeee');
            prevEnd.addClass('currentEndDate');
            prevEnd.addClass('activee');
            $(this).closest('.content_facture').find('.startView').text(date1);
            $(this).closest('.content_facture').find('.endView').text(startCurrent);
        }*/
    });

    $('.master').on('click', '.next', function(){
        console.log("");
    });

    $('.master').on('click', '.previous', function(){

    });

    $('.thumbnail:first').addClass('active');
	/*$('.slackSlider').show();
	$('.container_slider_jobs').show();*/

    var staff_events = [];
    showFullcalendar($('#calendar'));
    showFullcalendar($("#calendar_confirmed"));

    if (window.agency_event) {
        staff_events = buildStaffEvents(window.agency_event);
    }
    else {
        console.log("staff_events because window.agency_event don't set");
    }

  	$('.master').on('click','.menu_head', function(){
		$('.menu_head').removeClass('active');
		$(this).addClass('active');
		var dataContent = $(this).data('content');
		$('.future_event>div').addClass('is_hidden');
		$('.'+dataContent).removeClass('is_hidden');
  	});

  	$('.master').on('click','.thumbnail',function(){
		var id_event = $(this).data("id");
		var url = $(this).data("url_event");
		$(this).addClass('active');
		$(this).siblings().removeClass('active');

        $.ajax({
      		url : url,
            type : 'POST',
            /*dataType: 'JSON',*/
            data:{data_id : id_event},
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
            success : function(response){
                $('.content_finished').html(response["view_event"]);
                showFullcalendar($('#calendar'));
                showFullcalendar($('#calendar_confirmed'));
                reloadStarEvaluation();
                staff_events = buildStaffEvents(response["event"]);
            },
            error : function(resultat, statut, erreur){
                console.log("Failed to request event '"+id_event+"' from databse with : "+erreur);
            }
        });
    });

    // Evaluation staffs
    $('.form_item_drop_user').on({
        mouseleave: function(){
            $(this).toggleClass('is_hidden');
        }
    }, 'ul');

    $('.content_finished').on('click','.input_drop_user',function(){
        $(this).siblings('.dropdown_login').toggleClass('is_hidden');
    });
    /*Start get Star Rating*/
    $(".content_finished").on("click", ".rating label", function(){
        var onStar = $(this).data('value');
        $(this).closest('.evaluation_note').find('.ratingResponse').val(onStar);
    });


    /*End get Star Rating*/
    $(".content_finished").on("keyup", ".evaluation_description_new", function(){
        var description = $(this).text();
        $(this).siblings('.description').val(description);
        $(this).css('border','');
    });

    $('.content_finished').find('.description').each(function(i,field){
        if (field.value == ""){
            $('.content_finished').find('.boolean').val('0');
        }
        else{
            $('.content_finished').find('.boolean').val('1');
        }
    });


    $('.content_finished').on('click', '.save_evaluation', function(){
        var formdata = new FormData($("#regFormEveluation")[0]);
        var url = $(this).data('register');
        $('.content_finished').find('.boolean').val('1');
        $(this).closest('.footer_evaluation').siblings('.evaluation_content').find('.description').each(function(i,field){
            if (field.value == ""){
                $('.content_finished').find('.boolean').val('0');
                $(field).siblings('.evaluation_description_new').css('border','1px solid red');
                $(field).focus();
                toastr.error("Ajoute au moins une description s'il te plaît.");
            }
            else{

                $(field).siblings('.evaluation_description_new').css('border','');
            }
        });
        if ($('.content_finished').find('.boolean').val() == '0') {
            $('#click_me').trigger('click');
        }else{
            $.ajax({
                url: url,
                type : 'POST',
                data: formdata,
                processData: false,
                contentType: false,
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
                success : function(response){
                    console.log(response.evaluationIds);
                    $('.evaluation_content').each(function(i, value){
                        $(value).find('.id_assessment').val(response.evaluationIds[i]);
                    });
                    toastr.success(trans('content_finished.finished_event_evaluation_save_success'));
                },
                error : function(resultat, statut, erreur){
                    toastr.warning(trans('content_finished.finished_event_evaluation_save_error'));
                }
            });
        }
    });

    reloadStarEvaluation();

    $('.content_finished').on('click','.checkbox_users',function(){
        $(this).toggleClass('active');
        var id = $(this).siblings('.icone_name_users').find('.name_users').data('id');
      	var nom = $(this).siblings('.icone_name_users').find('.name_users').text();
      	var classn = "user"+id;
      	if ($(this).hasClass('active')){
        		$('.checkbox_users').siblings('.'+classn).val(nom+' , ');
    	    	$(this).closest('.step_evaluation_staff').siblings('.evaluation_content').find('.view_evaluation').each(function(i,field){
    	    		if($(field).data('id_user') != id ){
    	    			if(!$(field).hasClass('active')){
    	    				$(field).addClass('is_hidden');
    	    			}
    	    		}else{
    	    			$(field).removeClass('is_hidden');
    	    			$(field).addClass('active');
    	    		}
    	    	});
  	    } else{
    	    	$(this).siblings('.'+classn).val('');
    	    	$(this).closest('.step_evaluation_staff').siblings('.evaluation_content').find('.view_evaluation').each(function(i,field){
      	    		if($(field).data('id_user') != id){

      	    		} else {
        	    			$(field).addClass('is_hidden');
        	    			$(field).removeClass('active');
      	    		}
    	    	});
  	    }
  	    user_note($('.dropdown_login'));
  	    var n= "";
  	    $(this).closest('ul').find('input').each(function(i,user_name){
  	    	n += $(user_name).val();
  	    });
  	    $(this).closest('.dropdown_login').siblings('.input_create_event').val(n);
    });

    function user_note(comm){
       	var bool =  true;
        comm.each(function(i,field){
        		if($(field).find('.checkbox_users').hasClass('active')){
        		    bool = false;
        		}
        });
        console.log(bool);
        if(bool==true){
        		comm.closest('.step_evaluation_staff').siblings('.evaluation_content').find('.view_evaluation').each(function(i,field){
            		$(field).removeClass('is_hidden');
            		$(field).removeClass('active');
            });
        }
    }

    var calendarView = (window.matchMedia("(max-width: 1023px)").matches)? 'agendaDay listWeek month' : 'agendaDay agendaWeek month';

    function showFullcalendar(calendar){
        calendar.fullCalendar({
            header: {
                left: 'prev next today',
                center: 'title',
                right: calendarView
            },
            editable: false,
            eventLimit: 2,
            locale: langue,
            views: {
                day:{
                  titleFormat : "MMMM DD, YYYY"
                }
            },
            eventRender: function (event, element, view) {
                element.css({'background-image': event.linearGradient, "color": "white"});
                if (view.type != "listWeek") {
                    var start_hour = ((event.start.format("hh") == "12") && (event.start.format("a") == "am"))? "00:"+event.start.format("mm")+" am" : event.start.format("hh:mm a");
                    var end_hour = ((event.end.format("hh") == "12") && (event.end.format("a") == "am"))? "00:"+event.end.format("mm")+" am" : event.end.format("hh:mm a");
                    var staffImgHTML = '';
                    if (event.staffs.length > 0) {
                        event.staffs.forEach(function(staff, index) {
                            staffImgHTML += '<img class="staff_calendar_img" src="'+staff.picture_pic+'" alt="'+staff.first_name+' title="'+staff.first_name+' '+staff.last_name+'"/>';
                        });
                    }
                    element.html('<div class="fc-title"><div class="fc-title_content"><span class="fc-title_hour">' + start_hour + ' - ' + end_hour + '</span>\
                                    <br/><span class="fc-title_text">' + event.title + '</span><br/><div class="list_staff_img circle_img">'+staffImgHTML+'</div></div>\
                                  </div>');
                    if (view.type == "month") {
                        var intervalSetZindex = setInterval(function(){
                                                    if(element.closest('.fc-row')) {
                                                        element.closest('.fc-row').css('z-index', event.zIndex);
                                                        clearInterval(intervalSetZindex);
                                                    }
                                                }, 1000);
                    }
                }
            }
        });
    }

    function getStaffIndice(staff_necessary){
    	return parseInt(staff_necessary.find('.number_title').text()) - 1;
    }

    function buildStaffEvents(currentEvent) {
        var staffEvents = [];
        var greatNumber = 99;
        if (currentEvent.event_staffs.length > 0) {
            currentEvent.event_staffs.forEach(function(event_staff, index){
                var staffUser = [];
                if (event_staff.event_staff_candidate_confirmed.length > 0) {
                    event_staff.event_staff_candidate_confirmed.forEach(function (event_staff_candidate, index_candidate){
                        staffUser[index_candidate] = {
                            staff_id : event_staff_candidate.staff.id,
                            picture_pic : event_staff_candidate.staff.picture_pic,
                            first_name : event_staff_candidate.staff.user.first_name,
                            last_name : event_staff_candidate.staff.user.last_name
                        }
                    });
                }
                if (event_staff.event_staff_dates.length > 0) {
                    event_staff.event_staff_dates.forEach(function (event_staff_date, index_date){
                        var start_date = event_staff_date.date_start+" "+event_staff_date.start_hour_event_staff_date;
                        var end_date = event_staff_date.date_end+" "+event_staff_date.end_hour_event_staff_date;
                        var address=event_staff.zip_event_staff+" "+event_staff.location_event_staff+" "+event_staff.country_event_staff;
                        if(staffEvents[index]){
                            var event={
                                title: event_staff.post,
                                start: new Date(start_date),
                                end: new Date(end_date),
                                linearGradient: event_staff.color_event_staff,
                                address: address,
                                description: event_staff.description_fr_event_staff,
                                staffs: staffUser,
                                zIndex : greatNumber
                            };
                            staffEvents[index].events.push(event);
                        }
                        else {
                            staffEvents[index]={
                                events : [{
                                    title: event_staff.post,
                                    start: new Date(start_date),
                                    end: new Date(end_date),
                                    linearGradient: event_staff.color_event_staff,
                                    address: address,
                                    description: event_staff.description_fr_event_staff,
                                    staffs: staffUser,
                                    zIndex : greatNumber
                                }],
                                allday: false,
                                className: 'per_day_finished_event',  //event_staff.post.replace(/ /,"_")
                                textColor: 'white',
                                id : ""+index
                            };
                        }
                        greatNumber--;
                    });
                    $("#calendar").fullCalendar('addEventSource', staffEvents[index]);
                    $("#calendar_confirmed").fullCalendar('addEventSource', staffEvents[index]);
                }
                else console.log("The "+event_staff.post+" event have no date schedule yet. You may add date schedule.");
            });
        }
        else console.log("The current agency event ("+currentEvent.name+") have no event staffs");
        /*console.log(staffEvents);*/
        return staffEvents;
    }

    function reloadStarEvaluation(){
        $('.content_finished').find('.ratingResponse').each(function(){
            switch($(this).val()) {
              case "0.5":
                $(this).closest('.evaluation_note').find('.rating label[data-value="0.5"]').trigger('click');
                break;
              case "1":
                $(this).closest('.evaluation_note').find('.rating label[data-value="1"]').trigger('click');
                break;
              case "1.5":
                $(this).closest('.evaluation_note').find('.rating label[data-value="1.5"]').trigger('click');
                break;
              case "2":
                $(this).closest('.evaluation_note').find('.rating label[data-value="2"]').trigger('click');
                break;
              case "2.5":
                $(this).closest('.evaluation_note').find('.rating label[data-value="2.5"]').trigger('click');
                break;
              case "3":
                $(this).closest('.evaluation_note').find('.rating label[data-value="3"]').trigger('click');
                break;
              case "3.5":
                $(this).closest('.evaluation_note').find('.rating label[data-value="3.5"]').trigger('click');
                break;
              case "4":
                $(this).closest('.evaluation_note').find('.rating label[data-value="4"]').trigger('click');
                break;
              case "4.5":
                $(this).closest('.evaluation_note').find('.rating label[data-value="4.5"]').trigger('click');
                break;
              case "5":
                $(this).closest('.evaluation_note').find('.rating label[data-value="5"]').trigger('click');
                break;

            }
        });
    }
});
