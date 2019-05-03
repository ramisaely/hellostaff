$(document).ready(function(){


    calculRemuneration();
    greatTotal();
    var langue = getLanguage();
    moment.locale(langue);
    var window_position = window.pageYOffset;
    initializeButtons();
    $(".validate").addClass("isValid");

    $('.content_future_event').find('.label_facturec_content_one').each(function(){
        var frais = $(this).siblings('.content_facture').find('.distanceStaff').val();
        if (frais == "" || frais == 0) {
            if (langue == "fr") {
                $(this).text("Aucun frais kilométrique n’a été attribué");
            } else {
                $(this).text("No mileage charges have been assigned");
            }
        }
    });


    $('.content_future_event').find('.content_facture').each(function(){
        var idFacture = $(this).find('.idFacture').val();
        if (idFacture.length > 0){
        idFacture = idFacture.substring(0, idFacture.length - 1);
        }
        $(this).find('.idFacture').val(idFacture);
    });

    var date1 = "";
    var date2 = "";
    var hourStart1 = [];
    var hourEnd1 = [];
    var hourStart2 = [];
    var hourEnd2 = [];
    var rangeInitial = [];
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
        $(this).addClass('currentHour2Start');
        });

        $(this).find('.endHour2[data-dateend1="'+2+'"]').each(function(){
            hourEnd2 = $(this).text();
            $(this).addClass('currentHour2End');
        });

        $(this).find('.endDateHb[data-key="'+1+'"]').addClass('activee');
        $(this).find('.startDateHb[data-point="'+0+'"]').addClass('activeee');
        $(this).find('.startDateHb[data-point="'+0+'"]').addClass('currentStartDate');
        $(this).find('.endDateHb[data-key="'+1+'"]').addClass('currentEndDate');
    });
        var start = "";
        var end = "";
    $('.master').find('.startView').each(function(i){
            start = $(this).text();
        $('.master').find('.endView').each(function(a){
                end = $(this).text();
            if (i == a) {
                if (start == end) {
                    $(this).closest('.table_col_two').find('.colonne3').addClass('is_hidden');
                    $(this).closest('.table_col_two').find('.colonne2').addClass('colonne2_flex_one');
                    $(this).closest('.table_col_two').find('.colonne2').find('.flex_one').addClass('colonne2_flex_one_padding');
                    $(this).closest('.table_col_two').find('.colonne2').find('.flex_one').find('.previous').addClass('is_hidden');
                    $(this).closest('.table_col_two').find('.colonne2').find('.flex_one').css('height', '26px');
                }
            }
        });
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

        }else if(endLast == endCurrent){
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

        }else if(endCurrent == firstEndDate){
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

    var range = 0;
    var rangeTotal = 0;
    $('.master').on('keyup', '.distance', function(){
        var distance = $(this).text();
        if (distance == "") {
            distance = "0";
            var parKm = $(this).siblings('.distanceStaff').val();
            divPar = distance * parKm;

        }else{
            var parKm = $(this).siblings('.distanceStaff').val();
            divPar = distance * parKm;
        }
        /*calculRemuneration();*/
        greatTotal();
        $(this).siblings('.distMoney').text(divPar+" $");
        $(this).siblings('.distVal').val(divPar);
            $(this).closest('.table_facture').each(function(){
                $(this).find('.th_range').each(function(){
                range = $(this).find('.distVal').val();
                rangeTotal += parseFloat(range);
                $(this).closest('.table_facture').siblings('.foot_table').find('.totalRange').text("");
                $(this).closest('.table_facture').siblings('.foot_table').find('.totalRange').text(rangeTotal+" $");
            });
                rangeTotal = 0;
        });
    });
    var expense = 0;
    var expenseTotal = 0;
    $('.master').on('keyup', '.expense', function(){
        var depense = $(this).text();
        $(this).siblings('.expenseVal').val(depense);
        calculRemuneration();
        greatTotal();
    });

    $('.master').on('keyup', '.endHourView2', function(){
        var finCurrent = $(this).siblings('.currentHour2End').text();
        var start2 = $(this).closest('.flex_two').find('.startHourView2').text();
        if ($(this).text() <= parseInt(start2)) {
            toastr.warning('L\'heure fin ne doit pas être inférieur ou égal à l\'heure début');
            $(this).text(finCurrent);
        }else if ($(this).text() == "") {
            $(this).text("");
        }else if($(this).text() != parseInt($(this).text())){
            toastr.warning('L\'heure fin ne doit pas être une chaine de caractère');
            $(this).text(finCurrent);
        }
        else{
            $(this).siblings('.currentHour2End').text($(this).text());
            calculRemuneration();
            greatTotal();
        }

    });
    $('.master').on('keyup','.startHourView2',function(){
        var debutCurrent = $(this).siblings('.currentHour2Start').text();
        var end2 = $(this).closest('.flex_two').find('.endHourView2').text();
        if ($(this).text() >= parseInt(end2)) {
            toastr.warning('L\'heure debut ne doit pas être supéieur ou égal à l\'heure début');
            $(this).text(debutCurrent);
        }else if ($(this).text() == "") {
            $(this).text("");
        }else if($(this).text() != parseInt($(this).text())){
            toastr.warning('L\'heure debut ne doit pas être une chaine de caractère');
            $(this).text(debutCurrent);
        }
        else{
            $(this).siblings('.currentHour2Start').text($(this).text());
            calculRemuneration();
            greatTotal();
        }
    });
    $('.master').on('keyup', '.endHourView1', function(){
        var finCurrent = $(this).siblings('.currentHour1End').text();
        var start1 = $(this).closest('.flex_two').find('.startHourView1').text();
        if ($(this).text() <= parseInt(start1)) {
            toastr.warning('L\'heure fin ne doit pas être inférieur ou égal à l\'heure début');
            $(this).text(finCurrent);
        }else if ($(this).text() == "") {
            $(this).text("");
        }else if($(this).text() != parseInt($(this).text())){
            toastr.warning('L\'heure fin ne doit pas être une chaine de caractère');
            $(this).text(finCurrent);
        }
        else{
            $(this).siblings('.currentHour2End').text($(this).text());
            calculRemuneration();
            greatTotal();
        }

    });
    $('.master').on('keyup','.startHourView1',function(){
        var debutCurrent = $(this).siblings('.currentHour1Start').text();
        var endHour = $(this).closest('.flex_two').find('.endHourView1').text();
        if ($(this).text() >= parseInt(endHour)) {
            toastr.warning('L\'heure debut ne doit pas être superieur ou égal à l\'heure début');
            $(this).text(debutCurrent);
        }else if ($(this).text() == "") {
            $(this).text("");
        }else if($(this).text() != parseInt($(this).text())){
            toastr.warning('L\'heure debut ne doit pas être une chaine de caractère');
            $(this).text(debutCurrent);
        }
        else{
            $(this).siblings('.currentHour2Start').text($(this).text());
            calculRemuneration();
            greatTotal();
        }
    })

    $('.master').on('click', '.button_save', function(){
        event.preventDefault();
        var url = $(this).attr("data-storeBudget");
        var data = new FormData($("#regFormEstimated")[0]);

        $.ajax({
            url: url,
            type : 'POST',
            /*dataType: 'JSON',*/
            data: data,
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
                toastr.success('Heure et Budget Prévisionnel enregistré avec success!');
                $('.master').find('.content_facture').each(function(i){
                    $(this).find('.idFacture').val(response['budget'][i].join(","));
                });
            },
            error : function(resultat, statut, erreur){
                toastr.error('Une erreur est survenu lors de l\'enregistrement!');
                console.log("Ajax error in the Thumbnail click event with : "+erreur);
            }
        });
    });


    var usersUpdate = $('.input_drop_user_update').val();
    var usersUpdateId = $('.input_id_user_update').val();
    if (usersUpdate.length > 0 && usersUpdateId.length > 0){
        usersUpdate = usersUpdate.substring(0, usersUpdate.length - 2);
        usersUpdateId = usersUpdateId.substring(0, usersUpdateId.length - 1);
    }
    $('.content_future_event').find('.input_drop_user_update').val(usersUpdate);
    $('.content_future_event').find('.input_id_user_update').val(usersUpdateId);

    var userIdSplit = usersUpdateId.split(',');
    //var idLabel = [];
    for(var i = 0; i<userIdSplit.length; i++){
        $('.content_future_event').find('.checkbox_users_update').each(function(a,field){
            var idLabel = $(field).siblings().find('.name_users_update').attr('data-id');
            if (parseInt(userIdSplit[i]) == parseInt($(field).siblings().find('.name_users_update').attr('data-id'))) {
                $(field).addClass('active');
            }
        });
    }

    /* Form validation on change */
    $('.content_future_event').on('change', '#name', function(){
        if($(this).val() == "" || $(this).val().length < 3){
            $(this).closest('.form_item_create_event').addClass('error');
            $(this).siblings('.error').removeClass('is_hidden');
            $(this).focus();
            $(".addition").off("click");
            $('.validate').removeClass("isValid");
            if(langue == "en"){
                toastr.error('Please enter at least two letter!');
            } else {
                toastr.error('Veuillez entrer au minimum deux lettre!')
            }
        } else {
            $(this).closest('.form_item_create_event').removeClass('error');
            $(this).siblings('.error').addClass('is_hidden');
        }
    });

    $('.content_future_event').on('change', '#location_event', function(){
        if($(this).val() == "" || $(this).val().length < 3 ){
            $(this).closest('.form_item_create_event').addClass('error');
            $(this).siblings('.error').removeClass('is_hidden');
            $(this).focus();
            $(".addition").off("click");
            $('.validate').removeClass("isValid");
            if(langue == "en"){
                toastr.error('Please enter a valid location!');
            } else {
                toastr.error('Veuillez entrer un emplacement valide!')
            }
        } else {
            $(this).closest('.form_item_create_event').removeClass('error');
            $(this).siblings('.error').addClass('is_hidden');
        }
    });

    $('content_future_event').on('change', '#zip_event', function(){
        var zipCode = /^[a-zA-Z][0-9][a-zA-Z]\s*[0-9][a-zA-Z][0-9]/;
        if(!zipCode.test($(this).val())){
            $(this).closest('.form_item_create_event').addClass('error');
            $(this).closest('.label_create_event ').siblings('.error').removeClass('is_hidden');
            $(this).focus();
            $(".addition").off("click");
            $('.validate').removeClass("isValid");
            if(langue == "en"){
                toastr.error('Please enter a valid zip code!');
            } else {
                toastr.error('Veuillez entrer un code postal valide!')
            }
        } else {
            $(this).closest('.label_create_event ').closest('.form_item_create_event').removeClass('error');
            $(this).closest('.label_create_event ').siblings('.error').addClass('is_hidden');
        }
    });

    $('.content_future_event').on('change','#event_description_fr',function(){
        if($(this).val() == ""){
            $(this).closest('.description_event').css('border','1px solid red');
            $(this).focus();
            $(".addition").off("click");
            $('.validate').removeClass("isValid");
            if(langue == "en"){
                toastr.error('Please enter a description!');
            } else {
                toastr.error('Veuillez entrer une description!')
            }
        } else {
            $(this).closest('.description_event').css('border','');
        }
    });

    $('.content_future_event').on('change','.emplacement',function(){
        if($(this).val() == "" || $(this).val().length <3){
            $(this).closest('.form_item_create_event').addClass('error');
            $(this).siblings('.error').removeClass('is_hidden');
            $(this).focus();
            $(".addition").off("click");
            $('.validate').removeClass("isValid");
            if(langue == "en"){
                toastr.error('Please enter a valid location!');
            } else {
                toastr.error('Veuillez entrer un emplacement valide!')
            }
        } else {
            $(this).closest('.form_item_create_event').removeClass('error');
            $(this).siblings('.error').addClass('is_hidden');
        }
    });

    $('.content_future_event').on('change','.postal',function(){
        var zipCode = /^[a-zA-Z][0-9][a-zA-Z]\s*[0-9][a-zA-Z][0-9]/;
        if(!zipCode.test($(this).val())){
            $(this).closest('.form_item_create_event').addClass('error');
            $(this).closest('.label_create_event ').siblings('.error').removeClass('is_hidden');
            $(this).focus();
            $(".addition").off("click");
            $('.validate').removeClass("isValid");
            if(langue == "en"){
                toastr.error('Please enter a valid zip code!');
            } else {
                toastr.error('Veuillez entrer un code postal valide!')
            }
        } else {
            $(this).closest('.form_item_create_event').removeClass('error');
            $(this).closest('.label_create_event ').siblings('.error').addClass('is_hidden');
        }
    });

    $('.content_future_event').on('change','.hour_rate',function(){
        if ($(this).val() < 12) {
            $(this).val(12);
            if(langue == "fr")
                toastr.warning('Veuillez entrer un nombre supérieur à 12!');
            else
                toastr.warning('Please enter a number greater than 12!');
        }
    });

    $('.content_future_event').on('change','.desciption_event_staff',function(){
        if($(this).val() == ""){
            $(this).closest('.description_staff').css('border','1px solid red');
            $(this).focus();
            $('.validate').removeClass("isValid");
            $(".addition").off("click");
            if(langue == "en"){
                toastr.error('Please enter a description!');
            } else {
                toastr.error('Veuillez entrer une description!')
            }
        } else {
            $(this).closest('.description_staff').css('border','');
        }
    });
    /* End Form validation on change */

    /* Reactive the Validate button on change of all input in staff necessary */
    $('.content_future_event').on('change','.staff_necessary_update input',function(){
        $(this).closest(".staff_necessary_update").find('.validate').removeClass("isValid");
        /*$('.content_future_event').off('click','.addition');*/
    });

    $('.content_future_event').on('change','.staff_necessary_update textarea',function(){
        $(this).closest(".staff_necessary_update").find('.validate').removeClass("isValid");
    });

    $(".content_future_event").on("click", ".staff_necessary_update li", function(){
        $(this).closest(".staff_necessary_update").find('.validate').removeClass("isValid");
    });
    /* End of reactiving the Validate button */

    /* listing users */
    $('.content_future_event').on('click','.checkbox_users_update',function(){
        var userUpdate = '';
        var user_idUpdate = '';
        if(!$(this).hasClass('active')){
            window_position = window.pageYOffset;
            $(this).addClass('me');
            launch_modal('modal_creat');
        }
        else {
            if (!$(this).hasClass('priory')) {
                $(this).removeClass('active');
                $(this).closest('ul').find('.checkbox_users_update').each(function(i, el){
                    if ($(this).hasClass('active')){
                        userUpdate = userUpdate + $(this).siblings().find('.name_users_update').text() + ', ';
                        user_idUpdate = user_idUpdate + $(this).siblings().find('.name_users_update').attr('data-id') + ',';
                    }
                });
                if (userUpdate.length > 0 && user_idUpdate.length > 0){
                    userUpdate = userUpdate.substring(0, userUpdate.length - 2);
                    user_idUpdate = user_idUpdate.substring(0, user_idUpdate.length - 1);
                }
                $('.content_future_event').find('.input_drop_user_update').val(userUpdate);
                $('.content_future_event').find('.input_id_user_update').val(user_idUpdate);
            }
        }
    });

    $('#modal_creat').on('click', '.check_modal_user', function(){
        $('ul').find('.me').addClass('active');
        $('ul').find('.me').removeClass('me');
        var userUpdate = '';
        var user_idUpdate = '';
        $('ul.dropdown_users').find('.checkbox_users_update').each(function(i, el){
            if($(this).hasClass('active')){
                userUpdate = userUpdate + $(this).siblings().find('.name_users_update').text() + ', ';
                user_idUpdate = user_idUpdate + $(this).siblings().find('.name_users_update').attr('data-id') + ',';
            }
        });
        if(userUpdate.length > 0 && user_idUpdate.length > 0){
            userUpdate = userUpdate.substring(0, userUpdate.length - 2);
            user_idUpdate = user_idUpdate.substring(0, user_idUpdate.length - 1);
        }
        $('.content_future_event').find('.input_drop_user_update').val(userUpdate);
        $('.content_future_event').find('.input_id_user_update').val(user_idUpdate);
        close_modal("modal_creat");
    });

    $('.check_modal_crois').on('click', function(){
        var modal = $(this).closest('.modal');
        modal.addClass('is_hidden is_visually_hidden');
        $('.master').removeClass('is_blurred');
        $('html, body').removeClass('no_scroll');
        $('html, body').scrollTop(window.window_position);
    });
    /* end listing users */

    var staff_events = [];
    var last_event_staffs = [];
    var last_event_staff_dates = [];
    var calendarView = (window.matchMedia("(max-width: 1023px)").matches)? 'agendaDay listWeek month' : 'agendaDay agendaWeek month';
    showFullcalendar($('#calendar'));
    showFullcalendar($("#calendar_confirmed"));

    if (window.agency_event) {
        staff_events = buildStaffEvents(window.agency_event);
        window.agency_event.event_staffs.forEach(function(event_staff) {
            last_event_staffs.push(event_staff.id);
            event_staff.event_staff_dates.forEach(function(event_staff_date) {
                last_event_staff_dates.push(event_staff_date.id);
            });
        });
    }
    else {
        console.log("staff_events because window.agency_event don't set");
    }

    $('.thumbnail:first').addClass('active');

    if ($('.delet').length == 1) {
        $('.delet').after('<div class="divspecial"></div>');
        $('.delet').hide();
    }

    $('.content_future_event').on('click','.dropdown-menu',function(){
        $(this).find('ul').toggle();
    });

    $('.content_future_event').on('click','ul li', function(){
        $(this).closest('.dropdown-menu').find('input').val($(this).text());
        validate_dropdown(this);
    });

    $('.content_future_event').on({
        mouseleave: function(){
            $('.content_future_event').find('ul').hide();
        }
    }, 'ul');

    /** image **/
    $('.content_future_event').find("#img_event").click(function(){
        $('.content_future_event').find('.portrait').trigger("click");
    });

     /** drag and drop file **/
    $(document).on('dragenter', '.photo_event', function() {
        $(this).css('border', '2px dashed red');
        return false;
    });

    $(document).on('dragover', '.photo_event', function(e){
        e.preventDefault();
        e.stopPropagation();
        $(this).css('border', '2px dashed red');
        return false;
    });

    $(document).on('dragleave', '.photo_event', function(e) {
        e.preventDefault();
        e.stopPropagation();
        $(this).css('border', '1px dashed #BBBBBB');
        return false;
    });

    $(document).on('drop', '.photo_event', function(e) {
        if(e.originalEvent.dataTransfer){
            if(e.originalEvent.dataTransfer.files.length) {
                e.preventDefault();
                e.stopPropagation();
                $(this).css('border', '1px dashed green');
                upload(e.originalEvent.dataTransfer.files);
                //readURLLogo(e.originalEvent.dataTransfer.files);
            }
        }
        else
            $(this).css('border', '1px dashed #BBBBBB');

        return false;
    });
    /**ENd drag and drop file*/

    $('.content_future_event').on('click','.content_color_bouton .choose_color',function() {
        var color_code = $(this).data('color');
        var staff_indice = getStaffIndice($(this).closest(".staff_necessary_update"));
        switch (color_code)  {
            case "purple":
                $(this).closest('.content_color_bouton').siblings().find('[data-attr=color]').attr('class', 'circle_create_event_purple');
                $(this).attr('class', 'choose_color purple purple-active');
                $(this).siblings().removeClass('blue_sky-active green-active orange-active blue-active');
                $(this).closest('.color_choose').find('.input_color').val(linear_gradient("purple"));
                $(this).closest('.staff_necessary_update').find('.color_tab').val(linear_gradient("purple"));
                if ((staff_events[staff_indice]) && staff_events[staff_indice].events[0].linearGradient != linear_gradient("purple")){
                    $('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
                    $('#calendar_confirmed').fullCalendar('removeEventSource', staff_events[staff_indice]);
                    staff_events[staff_indice].events.forEach( function(item, index, events){
                        events[index].linearGradient = linear_gradient("purple");
                    });
                    $('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
                    $('#calendar_confirmed').fullCalendar('addEventSource', staff_events[staff_indice]);
                }
                break;
            case "blue_sky":
                $(this).closest('.content_color_bouton').siblings().find('[data-attr=color]').attr('class', 'circle_create_event_blue');
                $(this).attr('class', 'choose_color blue_sky blue_sky-active');
                $(this).siblings().removeClass('purple-active green-active orange-active blue-active');
                $(this).closest('.color_choose').find('.input_color').val(linear_gradient("blue_sky"));
                $(this).closest('.staff_necessary_update').find('.color_tab').val(linear_gradient("blue_sky"));
                if ((staff_events[staff_indice]) && staff_events[staff_indice].events[0].linearGradient != linear_gradient("blue_sky")){
                    $('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
                    $('#calendar_confirmed').fullCalendar('removeEventSource', staff_events[staff_indice]);
                    staff_events[staff_indice].events.forEach( function(item, index, events){
                        events[index].linearGradient = linear_gradient("blue_sky");
                    });
                    $('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
                    $('#calendar_confirmed').fullCalendar('addEventSource', staff_events[staff_indice]);
                }
                break;
            case "green":
                $(this).closest('.content_color_bouton').siblings().find('[data-attr=color]').attr('class', 'circle_create_event_green');
                $(this).attr('class', 'choose_color green green-active');
                $(this).siblings().removeClass('blue_sky-active purple-active orange-active blue-active');
                $(this).closest('.color_choose').find('.input_color').val(linear_gradient("green"));
                $(this).closest('.staff_necessary_update').find('.color_tab').val(linear_gradient("green"));
                if ((staff_events[staff_indice]) && staff_events[staff_indice].events[0].linearGradient != linear_gradient("green")){
                    $('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
                    $('#calendar_confirmed').fullCalendar('removeEventSource', staff_events[staff_indice]);
                    staff_events[staff_indice].events.forEach( function(item, index, events){
                        events[index].linearGradient = linear_gradient("green");
                    });
                    $('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
                    $('#calendar_confirmed').fullCalendar('addEventSource', staff_events[staff_indice]);
                }
                break;
            case "orange":
                $(this).closest('.content_color_bouton').siblings().find('[data-attr=color]').attr('class', 'circle_create_event_red');
                $(this).attr('class', 'choose_color orange orange-active');
                $(this).siblings().removeClass('blue_sky-active green-active purple-active blue-active');
                $(this).closest('.color_choose').find('.input_color').val(linear_gradient("orange"));
                $(this).closest('.staff_necessary_update').find('.color_tab').val(linear_gradient("orange"));
                if ((staff_events[staff_indice]) && staff_events[staff_indice].events[0].linearGradient != linear_gradient("orange")){
                    $('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
                    $('#calendar_confirmed').fullCalendar('removeEventSource', staff_events[staff_indice]);
                    staff_events[staff_indice].events.forEach( function(item, index, events){
                        events[index].linearGradient = linear_gradient("orange");
                    });
                    $('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
                    $('#calendar_confirmed').fullCalendar('addEventSource', staff_events[staff_indice]);
                }
                break;
            case "blue":
                $(this).closest('.content_color_bouton').siblings().find('[data-attr=color]').attr('class', 'circle_create_event_blue_fonce');
                $(this).attr('class', 'choose_color blue blue-active');
                $(this).siblings().removeClass('blue_sky-active green-active orange-active purple-active');
                $(this).closest('.color_choose').find('.input_color').val(linear_gradient("blue"));
                $(this).closest('.staff_necessary_update').find('.color_tab').val(linear_gradient("blue"));
                if ((staff_events[staff_indice]) && staff_events[staff_indice].events[0].linearGradient != linear_gradient("blue")){
                    $('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
                    $('#calendar_confirmed').fullCalendar('removeEventSource', staff_events[staff_indice]);
                    staff_events[staff_indice].events.forEach( function(item, index, events){
                        events[index].linearGradient = linear_gradient("blue");
                    });
                    $('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
                    $('#calendar_confirmed').fullCalendar('addEventSource', staff_events[staff_indice]);
                }
                break;
        }
    });

    //toggle dropdown list for zone
    $('.master').on("click", ".zone_label", function(){
          $(this).siblings("ul").toggle();
    });

    //Icone down arrow event for zone
    $('.master').on("click", ".icone_down_arrow", function(){
        $(this).siblings(".form_zone").find("ul").toggle();
    });

    //Icone down arrow event for jobs
    $('.master').on("click", ".jobs_icone_down", function(){
        $(this).siblings(".form_zone").find("ul").toggle();
    });

    //Dropdown element function
    $('.master').on("click", "ul.other_dropdown li", function(){
        var data_input = $(this).closest('.dropdown').attr('data-input');
        var select_li = $(this).text();
        $(this).closest('.dropdown-menu').find(".not_label_select #"+data_input).val(select_li).keyup(); //we need keyup() to remove error in validation
        $(this).closest(".dropdown").hide();
    });

    //Popup daterangerpicker in create event zone
    $('.master').on("click", ".date_icone_down", function(){
        /*var window_position = window.pageYOffset;
        $('#popup_dates').find('.btn_apply').attr("data-position", window_position);*/
        launch_modal("popup_dates");
    });

    $('#popup_dates').find('.btn_apply').click(function(){
        var event_title=$('.content_create_event').find('#name').val();

        var start_date= $('#daterangepicker1').data('daterangepicker').startDate.format('YYYY-MM-DD');
        var end_date = $('#daterangepicker1').data('daterangepicker').endDate.format('YYYY-MM-DD');

        var val= formatEventDate(start_date, end_date);
        $('.content_create_event').find('#start_date').val(val);
        $('.content_create_event').find('#start').val(start_date);
        $('.content_create_event').find('#end').val(end_date);
        $('.content_future_event').find('#start_date').closest('.dropdown_cage').css('border','');
        /* Close popup date */
        close_modal("popup_dates");
        /*$(this).closest('.modal').addClass('is_hidden is_visually_hidden');
        $('.master').removeClass('is_blurred');
        $('html, body').removeClass('no_scroll');
        $('html, body').scrollTop(window_position);*/
    });
    /*End the "plus" date boutton click function*/
    $('.content_future_event').on('click', ".img_plus", function(){
        var staff_necessary=$(this).closest('.staff_necessary_update');
        window.staff_necessary = staff_necessary;
        if(!window.shift_date)
            window.shift_date = (moment() < moment($("#start").val()))? $("#start").val() : moment().format("YYYY-MM-DD");
        setFirstHourMin(window.shift_date, window.staff_necessary);
        staff_necessary.find('.validate').removeClass("isValid");
        launch_modal('popup_dates_2');

        /*Start popup dates apply function*/
        $('#popup_dates_2').find('.btn_apply').one('click', staff_necessary, function(){
            var staff_indice = getStaffIndice(staff_necessary);
            var event_title = staff_necessary.find('.post').val();
            var start_date = $('#daterangepicker2').data('daterangepicker').startDate.format('YYYY-MM-DD');
             var start_hour = $('#popup_dates_2').find('.hours_input').val()+":"+$('#popup_dates_2').find('.minute_input').val()+" "+$('#popup_dates_2').find('.am_pm_input').val();
            var start_datetime = new Date(start_date+" "+start_hour);
            var end_date = $('#daterangepicker2').data('daterangepicker').startDate.format('YYYY-MM-DD');
            var end_hour=$('#popup_dates_2').find('.second_hours').val()+":"+$('#popup_dates_2').find('.second_minute').val()+" "+$('#popup_dates_2').find('.second_am_pm').val();
            var end_datetime = new Date(end_date+" "+end_hour);
            var color = staff_necessary.find('.input_color').val();
            var address=staff_necessary.find('.emplacement').val()+" "+staff_necessary.find('.postal').val()+" "+staff_necessary.find('.province_staff').val();

            /* Update staff_ events : events Sources for the fullcalendar */
            if(staff_events[staff_indice]){
                $('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
                $('#calendar_confirmed').fullCalendar('removeEventSource', staff_events[staff_indice]);
                var event={
                    title: event_title,
                    start: start_datetime,
                    end: end_datetime,
                    linearGradient: color,
                    address: address,
                    staffs: []
                };
                staff_events[staff_indice].events.push(event);
            }
            else {
                staff_events[staff_indice]={
                    events : [{
                        title: event_title,
                        start: start_datetime,
                        end: end_datetime,
                        linearGradient: color,
                        address: address,
                        staffs: []
                    }],
                    allday: false,
                    className: event_title.replace(/ /, "_"),
                    textColor: 'white',
                    id : ""+staff_indice
                };
            }

            /*Add the new event  on the fullcalendar*/
            $('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
            $('#calendar_confirmed').fullCalendar('addEventSource', staff_events[staff_indice]);

            /*Add the new event in dates horaires section*/
            var date_horaire=staff_necessary.find('.date_horaire_create_event');
            if(date_horaire.length > 0) {
                var clone = staff_necessary.find('.date_horaire_create_event:last').clone();
                clone.find('label:first').text(moment(start_datetime).format('MMMM DD'));
                clone.find('label:last').text(start_hour+" - "+end_hour);
                clone.find('.startDaily').val(start_date);
                clone.find('.endDaily').val(end_date);
                clone.find('.startHourDaily').val(start_hour);
                clone.find('.endHourDaily').val(end_hour);
                clone.find('.idEventStaffDate').attr('value', '');
            }
            else{
                var clone = '<tr class="date_horaire_create_event" style="display: flex; margin-top: 2rem;">\
                                <td><div data-attr="color" class=' + dateScheduleCircleColor(staff_necessary) + '></div></td>\
                                <td><div class="date_create_event"><input type="hidden" name="idEventStaffDate['+staff_indice+'][]" value="" class="idEventStaffDate">\
                                <label class="text_brief opacity_two">'+ moment(start_datetime).format('MMMM DD') + '</label></div></td>\
                                <td><div class="horaire_create_event"><label class="text_brief opacity_two">'+ start_hour + " - " + end_hour + '</label>\
                                <input type="hidden" name="startDaily['+staff_indice+'][]" class="startDaily" value="'+start_date+'">\
                                <input type="hidden" name="endDaily['+staff_indice+'][]" class="endDaily" value="'+end_date+'">\
                                <input type="hidden" name="startHourDaily['+staff_indice+'][]" class="startHourDaily" value="'+start_hour+'">\
                                <input type="hidden" name="endHourDaily['+staff_indice+'][]" class="endHourDaily" value="'+end_hour+'">\
                                <input type="hidden" name="color_tab['+staff_indice+'][]" class="color_tab" value="'+linear_gradient("blue_sky")+'"></div></td>\
                                <td><div class="delete_date_hours is_hidden"><i class="fa fa-times"></i></div></td>\
                            </tr>';
            }
            staff_necessary.find('.decription_table_event_form table').append(clone);

            /*Close the popup date*/
            close_modal("popup_dates_2");
        });
        /*End popup dates apply function*/
    });
    /*End the "plus" date boutton click function*/

    $('.content_future_event').on('click', ".delete_date_hours", function(){
        var event_indice = $(this).closest('.date_horaire_create_event').index();
        var staff_indice = getStaffIndice($(this).closest('.staff_necessary_update'));
        $('#calendar').fullCalendar('removeEventSource', staff_events[staff_indice]);
        $('#calendar_confirmed').fullCalendar('removeEventSource', staff_events[staff_indice]);
        staff_events[staff_indice].events.splice(event_indice, 1);
        $('#calendar').fullCalendar('addEventSource', staff_events[staff_indice]);
        $('#calendar_confirmed').fullCalendar('addEventSource', staff_events[staff_indice]);
        $(this).closest('.date_horaire_create_event').remove();
        $(".staff_necessary_update").eq(staff_indice - 1).find('.validate').removeClass("isValid");
        setAmPmDataMin($(this).closest('.staff_necessary_update'));
    });

    $('.content_future_event').on('click', ".show_btn_delete", function(){
        $(this).closest(".content_three_divider").find('.delete_date_hours').toggleClass('is_hidden');
    });

    $('.content_future_event').on('mouseleave', '.staff_necessary_update', function(){
        if ($(this).find('.delete_date_hours').not('.is_hidden')){
            $(this).find('.delete_date_hours').addClass('is_hidden');
        }
    });

    setAllStaffIndice();

    $(".content_future_event").on("click", ".validate", function () {
        if(validateAllStaff()) {
            /*if(langue == "en")
                toastr.success('All the necessary information about the positions are valid!')
            else
                toastr.success('Toutes les informations necessaires sur les postes sont valides')*/
            if (!$(this).hasClass("isValid")) {
                $(this).addClass("isValid");
                additionOnClick();
            }
        } else {
            if(langue == "en"){
                toastr.error('Error required fields')
            } else {
                toastr.error('Erreur champs requis')
            }
        }
    });

    /*additionOnClick();*/
    /* End of Staff necessaire addition */

    $('.content_future_event').on('click','.delete',function(){
        if ($('.delete').length != 1){
            launch_modal("confirm_removing_post");
            confirmRemoveOnClick($(this).closest(".staff_necessary_update"));
        }
    });

    function confirmRemoveOnClick(staff_necessary) {
        $(".check_modal_removing").one("click", staff_necessary, function() {
            var staff_indice = getStaffIndice(staff_necessary);
            if(staff_events) {
                $('#calendar').fullCalendar('removeEventSources', staff_events);
                $('#calendar_confirmed').fullCalendar('removeEventSources', staff_events);
                staff_events.splice(staff_indice, 1);
                staff_events.forEach(function(source, index){
                    $('#calendar').fullCalendar('addEventSource', source);
                    $('#calendar_confirmed').fullCalendar('addEventSource', source);
                });
            }
            staff_necessary.find(".date_horaire_create_event").each(function(index_date) {
                var id_event_staff_date = parseInt($(this).find('input[name="idEventStaffDate['+staff_indice+'][]"]').val());
                if(id_event_staff_date != "") {
                    last_event_staff_dates.splice(last_event_staff_dates.indexOf(id_event_staff_date), 1);
                }
            });
            staff_necessary.remove();
            setAllStaffIndice();
            initializeButtons();
            close_modal("confirm_removing_post");
        });
    }

    function setAllStaffIndice(){
        $('.staff_necessary_update').each(function(i) {
            $(this).attr('data-indice', i+1);
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
        });
    }

    $('.content_future_event').on('click', '.apply', function() {
        var isValid = true;
        if (!validateCreateEvent())
            isValid = false;
        if (!validateAllStaff())
            isValid = false;

        if (isValid) {
            launch_modal("confirm_updating_event");
        } else {
            if(langue == "en"){
                toastr.error('Error required fields')
            } else {
                toastr.error('Erreur champs requis')
            }
        }
    });

    $("#confirm_updating_event").on("click", ".check_modal", function() {
        var url = $('.content_future_event').attr('data-updateEvent');
        var data = $('.id_event').val();
        var form_data = new FormData($("#regFormUpdateEvent")[0]);
        $(".staff_necessary_update").each(function(index_staff) {
            var id_event_staff = parseInt($(this).find('input[name="idEventStaff['+index_staff+']"]').val());
            if(id_event_staff != "") {
                last_event_staffs.splice(last_event_staffs.indexOf(id_event_staff), 1);
            }
            $(this).find(".date_horaire_create_event").each(function(index_date) {
                var id_event_staff_date = parseInt($(this).find('input[name="idEventStaffDate['+index_staff+'][]"]').val());
                if(id_event_staff_date != "") {
                    last_event_staff_dates.splice(last_event_staff_dates.indexOf(id_event_staff_date), 1);
                }
            });
        });
        form_data.append("event_staffs_toRemove", last_event_staffs);
        form_data.append("event_staffs_dates_toRemove", last_event_staff_dates);
        close_modal("confirm_updating_event");
        $.ajax({
            url: url,
            type : 'POST',
            data: form_data,
            processData: false,
            contentType: false,
            beforeSend: function(){
                launch_modal('modal_wait');
            },
            complete: function(){
                close_modal('modal_wait');
            },
            success: function(response) {
                $('.content_future_event').html(response["view_event"]);
                $('.container_slider_jobs').removeClass('is_hidden');
                if (langue == "fr")
                    toastr.success('Modification réussie')
                else
                    toastr.success('Changes successfully saved')
                postSliderFutureEvent();
                ageRange();
                showFullcalendar($('#calendar'));
                showFullcalendar($("#calendar_confirmed"));
                staff_events = buildStaffEvents(response["event"]);
                last_event_staffs =[];
                last_event_staff_dates =[];
                response["event"].event_staffs.forEach(function(event_staff) {
                    last_event_staffs.push(event_staff.id);
                    event_staff.event_staff_dates.forEach(function(event_staff_date) {
                        last_event_staff_dates.push(event_staff_date.id);
                    });
                });
                initializeButtons();
                //for slder post and find cadidate
                $('.find_candidates_form .slick-active:first').find('.item_jobs_list').addClass('active');
                var first_horary = $('.find_candidates_form .slick-active:first').data('hourly_rate');
                $('.horary'+first_horary).addClass('active');
                $(".thumbnail").each(function() {
                    if (parseInt($(this).data("id")) == response["event"].id)
                        $(this).addClass("active");
                });
            },
            error: function(response, statut, erreur){
                console.log("Applying modification event error (Ajax) with : " + erreur);
            }
        });
    });
    /*End update event with AJAX*/

    /*Start erase event*/
    $('.content_future_event').on('click', '.erase', function() {
        var langue = getLanguage();
        var url = $('.content_future_event').attr('data-eraseEvent');
        var idEventToErase = $('.id_event').val();
        var nextEvent= $(".thumbnail:first").hasClass("active")? $(".thumbnail:first").next().data("id") : $(".thumbnail:first").data("id");
        $.ajax({
            url: url,
            type : 'POST',
            /*dataType : 'JSON',*/
            data: {idEvent: idEventToErase, nextEvent: nextEvent},
            beforeSend: function(){
                launch_modal('modal_wait');
            },
            complete: function(){
                close_modal('modal_wait');
            },
            success: function(response) {
                $('.content_future_event').html(response["view_event"]);
                $('.container_slider_jobs').removeClass('is_hidden');
                // toastr.success('Suppréssion réussi avec succès!')
                if (langue == "fr") {
                    toastr.success('Suppression d\'événement réussi')
                } else {
                    toastr.error('Event successfully deleted')
                }
                postSliderFutureEvent();
                ageRange();
                showFullcalendar($('#calendar'));
                showFullcalendar($("#calendar_confirmed"));
                last_event_staffs =[];
                last_event_staff_dates =[];
                staff_events = buildStaffEvents(response["event"]);
                response["event"].event_staffs.forEach(function(event_staff) {
                    last_event_staffs.push(event_staff.id);
                    event_staff.event_staff_dates.forEach(function(event_staff_date) {
                        last_event_staff_dates.push(event_staff_date.id);
                    });
                });
                initializeButtons();
                //for slder post and find cadidate
                $('.find_candidates_form .slick-active:first').find('.item_jobs_list').addClass('active');
                var first_horary = $('.find_candidates_form .slick-active:first').data('hourly_rate');
                $('.horary'+first_horary).addClass('active');
                $(".thumbnail.active").remove();
                $(".thumbnail:first").addClass("active");
            },
            error: function(response, statut, erreur){
                console.log("Ajax from Erase boutton event error with :" + erreur);
            }
        });
    });
    /*End erase event*/

    /*Changing the future event content according to the event choosed*/
    $('.header_slider').on('click', '.thumbnail', function() {
        var url = $('.content_future_event').attr('data-eventPost');
        var data = $(this).data('id');
        $(this).addClass('active');
        $(this).siblings().removeClass('active');
        $.ajax({
            url: url,
            type : 'POST',
            /*dataType: 'JSON',*/
            data: {idEvent: data},
            beforeSend: function(){
                launch_modal('modal_wait');
            },
            complete: function(){
                close_modal('modal_wait');
            },
            success : function(response){

                $('.content_future_event').html(response["view_event"]);
                window.number_staff_initial = $('.content_future_event').find('.staff_necessary_update').length;
                window.number_question_initial = $('.statement_agency').find('.wth_description_statement_question').length;
                /*$('.content_future_event').attr("data-longueur", long);*/
                $('.container_slider_jobs').removeClass('is_hidden');
                postSliderFutureEvent();
                ageRange();
                showFullcalendar($('#calendar'));
                showFullcalendar($("#calendar_confirmed"));
                staff_events = buildStaffEvents(response["event"]);
                last_event_staffs =[];
                last_event_staff_dates =[];
                response["event"].event_staffs.forEach(function(event_staff) {
                    last_event_staffs.push(event_staff.id);
                    event_staff.event_staff_dates.forEach(function(event_staff_date) {
                        last_event_staff_dates.push(event_staff_date.id);
                    });
                });
                initializeButtons();
                    var start = "";
                    var end = "";
                $('.master').find('.startView').each(function(i){
                        start = $(this).text();
                    $('.master').find('.endView').each(function(a){
                            end = $(this).text();
                        if (i == a) {
                            if (start == end) {
                                $(this).closest('.table_col_two').find('.colonne3').addClass('is_hidden');
                                $(this).closest('.table_col_two').find('.colonne2').addClass('colonne2_flex_one');
                                $(this).closest('.table_col_two').find('.colonne2').find('.flex_one').addClass('colonne2_flex_one_padding');
                                $(this).closest('.table_col_two').find('.colonne2').find('.flex_one').find('.previous').addClass('is_hidden');
                                $(this).closest('.table_col_two').find('.colonne2').find('.flex_one').css('height', '26px');
                            }
                        }
                    });
                });
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
                    $(this).addClass('currentHour2Start');
                    });

                    $(this).find('.endHour2[data-dateend1="'+2+'"]').each(function(){
                        hourEnd2 = $(this).text();
                        $(this).addClass('currentHour2End');
                    });

                    $(this).find('.endDateHb[data-key="'+1+'"]').addClass('activee');
                    $(this).find('.startDateHb[data-point="'+0+'"]').addClass('activeee');
                    $(this).find('.startDateHb[data-point="'+0+'"]').addClass('currentStartDate');
                    $(this).find('.endDateHb[data-key="'+1+'"]').addClass('currentEndDate');
                });
                //for slder post and find cadidate
                $('.find_candidates_form .slick-active:first').find('.item_jobs_list').addClass('active');
                var first_horary = $('.find_candidates_form .slick-active:first').data('hourly_rate');
                $('.horary'+first_horary).addClass('active');
                calculRemuneration();
                greatTotal();
                $('.content_future_event').find('.label_facturec_content_one').each(function(){
                    var frais = $(this).siblings('.content_facture').find('.distanceStaff').val();
                    if (frais == "" || frais == 0) {
                        if (langue == "fr") {
                            $(this).text("Aucun frais kilométrique n’a été attribué");
                        } else {
                            $(this).text("No mileage charges have been assigned");
                        }
                    }
                });
            },
            error : function(resultat, statut, erreur){
                console.log("Ajax error in the Thumbnail click event with : "+erreur);
            }
        });
    });
    /*End hanging the future event content according to the event choosed*/

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

    $('.content_future_event').on('click', '.postStaff', function(){
        var liIdJobStaff = $(this).attr('data-jobIdStaff');
        $(this).closest('.staff_necessary_update').find('.input_jobIdStaff').val(liIdJobStaff);
    });
    $('.content_future_event').on('click', '.zoneEventStaff', function(){
        var liIdZoneEventStaff = $(this).attr('data-zoneIdEventStaff');
        $(this).closest('.staff_necessary_update').find('.input_mobilityIdEventStaff').val(liIdZoneEventStaff);
    });
    $('.content_future_event').on('click', '.zoneStaff', function(){
        var liIdZoneStaff = $(this).attr('data-zoneIdStaff');
        $('.input_mobilityIdStaff').val(liIdZoneStaff);
    });

});

function buildStaffEvents(currentEvent) {
    var staffEvents = [];
    var greatNumber = 99;
    initializeDaterangepicker2(moment(currentEvent.start_date), moment(currentEvent.end_date));
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
                            start: moment(start_date),
                            end: moment(end_date),
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
                                start: moment(start_date),
                                end: moment(end_date),
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
                /*console.log(staffEvents);*/
            }
            else console.log("The "+event_staff.post+" event have no date schedule yet. You may add date schedule.");
        });
    }
    else console.log("The current agency event ("+currentEvent.name+") have no event staffs");
    /*console.log(staffEvents);*/
    return staffEvents;
}

function postSliderFutureEvent(){
    $('.post_slider').slick({
        dots: false,
        prevArrow: $('.prev_post'),
        nextArrow: $('.next_post'),
        infinite: true,
        speed: 300,
        slidesToShow: 2,
        slidesToScroll: 1
    });
}

function readURLLogo(input, div) {
    if (input.files && input.files[0]) {
        if (input.files[0].type == "image/jpeg" || input.files[0].type == "image/png" || input.files[0].type == "image/svg+xml"){
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.content_future_event').find('.img_event').attr('src', e.target.result);
                $('.content_future_event').find('.img_event').removeClass('initial_image');
                if(!$('.content_future_event').find('.img_event').hasClass('final_image')){
                    $('.content_future_event').find('.img_event').addClass('final_image');
                }
            }
            reader.readAsDataURL(input.files[0]);
            $('.content_future_event').find('.input_hidden').css('border','');
        } else {
            $('.content_future_event').find('.img_event').attr('src', 's');
        }
    }
}

$('.content_future_event').on("change", "#portrait", function () {
    readURLLogo(this);
});

function choosedColor (staff_necessary){
    if(staff_necessary.find(".choose_color").hasClass("purple-active"))
        return "purple";
    else if(staff_necessary.find(".choose_color").hasClass("orange-active"))
        return "orange";
    else if(staff_necessary.find(".choose_color").hasClass("green-active"))
        return "green";
    else if(staff_necessary.find(".choose_color").hasClass("blue-active"))
        return "blue";
    else if(staff_necessary.find(".choose_color").hasClass("blue_sky-active"))
        return "blue_sky";
    else
        return false;
}

function getNewStaffColor() {
    var colorNotChoosed = ["purple", "orange", "green", "blue", "blue_sky"];
    $(".content_future_event").find(".staff_necessary_update").each(function(){
        var color = choosedColor($(this));
        colorNotChoosed.splice(colorNotChoosed.indexOf(color), 1);
    });
    if(colorNotChoosed[0])
        return colorNotChoosed[0];
    else
        return "blue_sky";
}

function dateScheduleCircleColor (staff_necessary){
    if(staff_necessary.find(".choose_color").hasClass("purple-active"))
        return "circle_create_event_purple";
    else if(staff_necessary.find(".choose_color").hasClass("orange-active"))
        return "circle_create_event_red";
    else if(staff_necessary.find(".choose_color").hasClass("green-active"))
        return "circle_create_event_green";
    else if(staff_necessary.find(".choose_color").hasClass("blue-active"))
        return "circle_create_event_blue_fonce";
    else
        return "circle_create_event_blue";
}

function linear_gradient (color){
    if(color == "purple")
        return 'linear-gradient(231deg, #899ED4, #A389D4)';
    else if(color == "orange")
        return 'linear-gradient(60deg, #F44236, #F48F36)';
    else if(color == "green")
        return 'linear-gradient(67deg, #1FA548, #21FFAA)';
    else if(color == "blue")
        return 'linear-gradient(237deg, #48C6EF, #337DE2)';
    else
        return 'linear-gradient(239deg, #1DE9B6, #1DC4E9)';
}

function getStaffIndice(staff_necessary){
    return parseInt(staff_necessary.attr('data-indice')) - 1;
}

/* dropdown validation */
function validate_dropdown(dropdown){
    $(dropdown).closest('.form_item').removeClass('error');
    $(dropdown).closest('.dropdown-menu').siblings('.error').addClass('is_hidden');
    $(dropdown).closest('.dropdown_cage').css('border','');
}
/* dropdown validation */

function initializeButtons () {
    /*if ($('.delete').length == 1){
        $('.delete').after('<div class="divspecial"></div>');
        $('.delete').hide();
    }
    $('.addition').hide();
    $('.addition:last').show();
    $('.validate').hide();
    $('.validate').removeClass("isValid");
    $('.validate:last').show();*/
    $(".delete").show();
    $('.addition').hide();
    $('.addition:last').show();
    /*$('.validate').hide();*/
    $('.validate').show();
    /*$(".staff_necessary_update").each(function (){
        if(validateStaff($(this))){
            if(!($(this).find(".validate").hasClass("isValid")))
                $(this).find(".validate").addClass("isValid");
        } else {
            $(this).find(".validate").removeClass("isValid");
        }
    });*/
    if(AllValidateButtonIsValid())
        additionOnClick();
}

function formatEventDate(dateStart, dateEnd){
    var start = moment(dateStart);
    var end = moment(dateEnd);

    if (start.format("YYYY") == end.format("YYYY")){
        return ''+start.format("MMMM DD")+' - '+end.format("MMMM DD, YYYY");
    } else {
        return ''+start.format("MMMM DD, YYYYY")+' - '+end.format("MMMM DD, YYYY");
    }
}

function AllValidateButtonIsValid() {
    var hasClassIsValid = true;
    $(".validate").each(function(){
        if(!$(this).hasClass("isValid"))
            hasClassIsValid = false;
    });
    return hasClassIsValid;
}

function additionOnClick () {
    $('.content_future_event').one('click','.addition', function() {
        if (AllValidateButtonIsValid()) {
            var clone = $('.staff_necessary_update:last').clone();
            var attr = parseInt($('.staff_necessary_update:last').data('indice'));
            clone.attr("data-indice", attr+1);
            clone.find('input').each( function(){
                var nameStr = $(this).attr('name');
                nameStr = nameStr.replace(/[0-9]+/, attr);
                $(this).attr('name', nameStr);
                $(this).not(".choose_color").val("");
            });
            clone.find('textarea').each( function(){
                var nameStrText = $(this).attr('name');
                nameStrText = nameStrText.replace(/[0-9]+/, attr);
                $(this).attr('name', nameStrText);
                $(this).val("");
            });
            clone.find(".date_horaire_create_event").remove();
            clone.find('.validate').removeClass("isValid");
            clone.insertAfter('.staff_necessary_update:last');
            $('.divspecial').remove();
            initializeButtons();

            var color = getNewStaffColor();
            $("."+color+":last").trigger("click");
        } else {
            var langue = getLanguage();
            if(langue == "en"){
                toastr.error('Please validate the staffs first!')
            } else {
                toastr.error("Veuillez d'abord valider les staffs!")
            }
        }
    });
}

function validateAllStaff() {
    var isValid = true;
    $('.content_future_event').find('.staff_necessary_update').each(function(){
        if(!validateStaff($(this)))
            isValid = false;
    });
    return isValid;
}

function validateStaff(staff_necessary) {

    var isValid = true;

    var currentInput = staff_necessary.find('.post');
    if (currentInput.val() == "" || currentInput.val().length < 3){
        isValid = false;
        if (!hasInputFocused (staff_necessary))
            currentInput.focus();
        currentInput.closest('.dropdown_cage').css('border','1px solid red');
    }
    else{
        currentInput.closest('.dropdown_cage').css('border','');
    }

    currentInput = staff_necessary.find('.necessary_staff');
    if (currentInput.val() == ""){
        isValid = false;
        if (!hasInputFocused (staff_necessary))
            currentInput.focus();
        currentInput.closest('.dropdown_cage').css('border','1px solid red');
    }
    else{
        currentInput.closest('.dropdown_cage').css('border','');
    }

    currentInput = staff_necessary.find('.emplacement');
    if (currentInput.val() == "" || currentInput.val().length < 3){
        isValid = false;
        if (!hasInputFocused (staff_necessary))
            currentInput.focus();
        currentInput.closest('.form_item_create_event').addClass('error');
        currentInput.siblings('.error').removeClass('is_hidden');
    }
    else{
        currentInput.closest('.form_item_create_event').removeClass('error');
        currentInput.siblings('.error').addClass('is_hidden');
    }

    currentInput = staff_necessary.find('.postal');
    var zipCode = /^[a-zA-Z][0-9][a-zA-Z]\s*[0-9][a-zA-Z][0-9]/;
    if(!zipCode.test(currentInput.val())){
        isValid = false;
        if (!hasInputFocused (staff_necessary))
            currentInput.focus();
        currentInput.closest('.form_item_create_event').addClass('error');
        currentInput.closest('.label_create_event ').siblings('.error').removeClass('is_hidden');
    }
    else{
        currentInput.closest('.form_item_create_event').removeClass('error');
        currentInput.closest('.label_create_event ').siblings('.error').addClass('is_hidden');
    }

    currentInput = staff_necessary.find('.province_staff');
    if (currentInput.val() == "" || currentInput.val().length < 3){
        isValid = false;
        if (!hasInputFocused (staff_necessary))
            currentInput.focus();
        currentInput.closest('.form_item').addClass('error');
        currentInput.closest('.dropdown-menu').siblings('.error').removeClass('is_hidden');
    }
    else{
        currentInput.closest('.form_item').removeClass('error');
        currentInput.closest('.dropdown-menu').siblings('.error').addClass('is_hidden');
    }

    currentInput = staff_necessary.find('.hour_rate');
    if (currentInput.val() < 12){
        isValid = false;
        if (!hasInputFocused (staff_necessary))
            currentInput.focus();
        currentInput.closest('.dropdown_cage').css('border','1px solid red');
    }
    else{
        currentInput.closest('.dropdown_cage').css('border','');
    }

    currentInput = staff_necessary.find('.zone_event_staff');
    if (currentInput.val() == "" || currentInput.val().length < 3){
        isValid = false;
        if (!hasInputFocused (staff_necessary))
            currentInput.focus();
        currentInput.closest('.dropdown_cage').css('border','1px solid red');
    }
    else{
        currentInput.closest('.dropdown_cage').css('border','');
    }

    currentInput = staff_necessary.find('.text_brief_new');
    if (currentInput.val() == ""){
        isValid = false;
        if (!hasInputFocused (staff_necessary))
            currentInput.focus();
        currentInput.closest('.description_staff').css('border','1px solid red');
    }
    else{
        currentInput.closest('.description_staff').css('border','');
    }

    currentInput = staff_necessary.find('.description_event_tab');
    if(currentInput.children().length > 0){
        currentInput.closest('.content_three_divider').css('border','');
    }else{
        isValid = false;
        currentInput.closest('.content_three_divider').css('border','1px solid red');
    }

    return isValid;
}

function hasInputFocused (input_parent) {
    var has = false;
    input_parent.find("input").each(function(){
        if ($(this).is(":focus"))
            has = true;
    });
    input_parent.find("textarea").each(function(){
        if ($(this).is(":focus"))
            has = true;
    });
    return has;
}

function validateCreateEvent(){

    var isValid = true;

    if ($('#name').val() == "" || $('#name').val().length < 3){
        isValid = false;
        if (!hasInputFocused($(".content_create_event")))
            $('#name').focus();
        $('#name').closest('.form_item_create_event').addClass('error');
        $('#name').siblings('.error').removeClass('is_hidden');
    } else {
        $('#name').closest('.form_item_create_event').removeClass('error');
        $('#name').siblings('.error').addClass('is_hidden');
    }

    if ($('#location_event').val() == "" || $('#location_event').val().length < 3){
        isValid = false;
        if (!hasInputFocused($(".content_create_event")))
            $('#location_event').focus();
        $('#location_event').closest('.form_item_create_event').addClass('error');
        $('#location_event').siblings('.error').removeClass('is_hidden');
    } else {
        $('#location_event').closest('.form_item_create_event').removeClass('error');
        $('#location_event').siblings('.error').addClass('is_hidden');
    }

    var zipCode = /^[a-zA-Z][0-9][a-zA-Z]\s*[0-9][a-zA-Z][0-9]/;
    if(!zipCode.test($('#zip_event').val())){
        isValid = false;
        if (!hasInputFocused($(".content_create_event")))
            $('#zip_event').focus();
        $('#zip_event').closest('.label_create_event ').closest('.form_item_create_event').addClass('error');
        $('#zip_event').closest('.label_create_event ').siblings('.error').removeClass('is_hidden');
    } else {
        $('#zip_event').closest('.label_create_event ').closest('.form_item_create_event').removeClass('error');
        $('#zip_event').closest('.label_create_event ').siblings('.error').addClass('is_hidden');
    }

    if ($('#event_description_fr').val() == ""){
        isValid = false;
        if (!hasInputFocused ($(".content_create_event")))
            $('#event_description_fr').focus();
        $('#event_description_fr').closest('.description_event').css('border','1px solid red');
    } else {
        $('#event_description_fr').closest('.description_event').css('border','');
    }

    return isValid;
}

function calculRemuneration(){
    var totalHours = 0;
    $('.master').find('.content_facture').each(function(){
        rangeInitial = $(this).find('.rangeInitial').text();
        if (rangeInitial == "") {
            $(this).find('.rangeInitial').text("0");
        }
        var hourSplit = [];
        var salaire = 0;

        $(this).find('.th_total_hours').each(function(a){
            var hours = $(this).find('.sumHours').text();
            hourSplit = hours.split(' ');
            totalHours += parseInt(hourSplit[0]);
        $(this).closest('.content_facture').find('.hourTotal').text(totalHours+" h");
            var hour_rate_split = [];

            $(this).closest('.content_facture').find('.th_hourly_rate').each(function(b){
                var hourly_rate = $(this).find('.hourly_rate').text();
                hour_rate_split = hourly_rate.split(" ");
                if (a == b) {
                    salaire = hourSplit[0] * hour_rate_split[0];
                }

                var expense = [];
                var total1 = [];
                var depenseTotal = 0;

                $(this).closest('.content_facture').find('.th_expense').each(function(c){
                    expense = $(this).find('.expense').text();
                    if (expense == "") {
                        expense = 0;
                        $(this).find('.expenseVal').val(expense);
                    }

                    depenseTotal += parseInt(expense);
                        $(this).closest('.table_facture').siblings('.foot_table').find('.totalExpense').text(depenseTotal+' $');
                    if (a == b && a == c) {
                        total1 = parseInt(salaire) + parseInt(expense);

                        var range = [];
                        var rangeTotal = 0;
                        var total2 = [];
                        var ranges = [];
                        $(this).closest('.content_facture').find('.th_range').each(function(e){
                            range = $(this).find('.distance').text();
                            ranges = $(this).find('.distMoney').text();


                            $(this).find('.distVal').val(ranges);
                            if (ranges == "00 $") {
                                    ranges = "0 $";
                                }
                                var rangesSplit = ranges.split(" ");
                                rangeTotal += parseFloat(rangesSplit[0]);
                                $(this).closest('.table_facture').siblings('.foot_table').find('.totalRange').text(parseFloat(rangeTotal)+' $');
                            if (a == e) {
                                total2 = total1 + parseInt(rangesSplit[0]);
                                var per_diem = [];
                                var perSplit = [];
                                var total3 = [];
                                var remuneration = 0;
                                $(this).closest('.content_facture').find('.th_per_diem').each(function(f){
                                    per_diem = $(this).find('.per_diem').text();
                                    if (per_diem == " $" || per_diem == "$") {
                                        per_diem = "0 $";
                                        $(this).find('.per_diem').text("0 $");
                                    }
                                    perSplit = per_diem.split(' ');
                                    if(a == f){
                                        total3 = total2 + parseInt(perSplit[0]);
                                        $(this).closest('.content_facture').find('.remuneration').each(function(d){
                                            if (a == d) {
                                                $(this).text(salaire+" $");
                                                $(this).siblings('.remVal').val(salaire);
                                            }
                                            var remunerations = $(this).text();
                                            remuneration += parseInt(remunerations);


                                            $(this).closest('.table_facture').siblings('.foot_table').find('.remTotal').text(remuneration+" $");
                                        });
                                    }
                                });
                            }
                        });
                    }
                });
            });
        });
    });
}

function greatTotal(){
    var greatSumExpense = 0;
    var greatSumPerdiem = 0;
    var greatSumRange = 0;
    var greatSumHour = 0;
    var greatSumRem = 0;
    $('.master').find('.content_facture').each(function(){
        /*Start Great Total Expense*/
        var sumExpense = $(this).find('.totalExpense').text();
        var sumExpenseSplit = sumExpense.split(" ");
        greatSumExpense += parseInt(sumExpenseSplit[0]);
        $(this).closest('.content_future_event').find('.greatSumExpense').text(greatSumExpense+" $");
        /*End Great Total Expense*/
        /*Start Great Total per diem*/
        var sumPerDiem = $(this).find('.totalPer_diem').text();
        var sumPerDiemSplit = sumPerDiem.split(" ");
        greatSumPerdiem += parseInt(sumPerDiemSplit[0]);
        $(this).closest('.content_future_event').find('.greatSumPerDiem').text(greatSumPerdiem+" $");
        /*End Great Total per diem*/
        /*Start Great Total range*/
        var sumRange = $(this).find('.totalRange').text();
        var sumRangeSplit = sumRange.split(" ");
        greatSumRange += parseFloat(sumRangeSplit[0]);
        $(this).closest('.content_future_event').find('.greatSumRange').text(greatSumRange+" $");
        /*End Great Total range*/
        /*Start Great Total hours*/
        var sumHours = $(this).find('.hourTotal').text();
        var sumHoursSplit = sumHours.split(" ");
        greatSumHour += parseInt(sumHoursSplit[0]);
        $(this).closest('.content_future_event').find('.greatSumHours').text(greatSumHour+" h");
        /*End Great Total hours*/
        /*Start Great Total Remuneration*/
        var sumRem = $(this).find('.remTotal').text();
        var sumRemSplit = sumRem.split(" ");
        greatSumRem += parseInt(sumRemSplit[0]);
        var total = parseInt(greatSumRem) + parseFloat(greatSumRange) + parseInt(greatSumPerdiem) + parseInt(greatSumExpense);
        $(this).closest('.content_future_event').find('.greatSumRem').text(total+" $");
        /*End Great Total Remuneration*/
    });
}
