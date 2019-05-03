$(document).ready(function () {

    var langue = getLanguage();
    moment.locale(langue);
    window.available_start_hours = [{min : "1:00", max: "24:00"}];
    window.available_start_hours = [{min : "1:00", max: "24:00"}];
    console.log(moment("24:00", "HH:mm").format("hh:mm a"));
    console.log(moment("00:00", "HH:mm").format("hh:mm a"));
    console.log(moment("12:00", "HH:mm").format("hh:mm a"));
    // init daterangepicker 
    var mon = "Lun", tue = "Mar", wed = "Mer", thu = "Jeu", fri = "Ven", sat = "Sam", sun = "Dim";
    var jan = "Janvier", feb = "Février", mar = "Mars", apr = "Avril", may = "Mai", jun = "Juin", jul = "Juillet", aug = "Aout", sep = "Septembre", oct = "Octobre", nov = "Novembre", dec = "Décembre";

    if(langue == "en"){
        $('.plage_dates').find('.title_hours').text('Event dates');
        mon = "Mon";
        tue = "Tue";
        wed = "Wed";
        thu = "Thu";
        fri = "Fri";
        sat = "Sat";
        sun = "Sun";
        jan = "January";
        feb = "February";
        mar = "March";
        apr = "April";
        may = "May";
        jun = "June";
        jul = "July";
        aug = "August";
        sep = "September";
        oct = "October";
        nov = "November";
        dec = "December";
    }
    var picker = $('#daterangepicker1').daterangepicker({
        "parentEl": "#daterangepicker1-container",
        "autoApply": true,
        "locale": {
            "format": "DD/MM/YYYY",
            "separator": " - ",
            "applyLabel": "Apply",
            "cancelLabel": "Cancel",
            "fromLabel": "De",
            "toLabel": "à",
            "customRangeLabel": "Custom",
            "daysOfWeek": [sun,mon, tue, wed, thu, fri, sat],
            "monthNames": [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec],
            "firstDay": 1
        }
    });
  
    // range update listener
    picker.on('apply.daterangepicker', function(ev, picker) {
        $('#popup_dates').find('.first_dates .date_letter').html(showInitialDate(picker.startDate.format('dddd')));
        $('#popup_dates').find('.first_dates .date_number').html(picker.startDate.format('DD'));
        $('#popup_dates').find('.first_dates .month_letter').html(showInitialMonth(picker.startDate.format('MMMM')));
        
        $('#popup_dates').find('.second_dates .date_letter').html(showInitialDate(picker.endDate.format('dddd')));
        $('#popup_dates').find('.second_dates .date_number').html(picker.endDate.format('DD'));
        $('#popup_dates').find('.second_dates .month_letter').html(showInitialMonth(picker.endDate.format('MMMM')));
    });
  
    // prevent hide after range selection
    picker.data('daterangepicker').hide =function(){};
    
    // show picker on load
    picker.data('daterangepicker').show();

    /*Start icône Up/Down PopUp DatePicker*/
    /*Start Hours*/
    jQuery('.liste_first_hours').each(function() {
        var spinner = jQuery(this),
        input = spinner.find('.hours_input'),
        inputMinute = spinner.find('.minute_input'),
        inputAmPm = spinner.find('.am_pm_input'),
        btnUp = spinner.find('.up_hour'),
        btnDown = spinner.find('.down_hour'),
        btnUpMinute = spinner.find('.up_minute'),
        btnDownMinute = spinner.find('.down_minute'),
        btnUpAmPm = spinner.find('.up_am_pm'),
        btnDownAmPm = spinner.find('.down_am_pm'),
        minMinute = inputMinute.attr('min'),
        maxMinute = inputMinute.attr('max'),
        min = input.attr('min'),
        max = input.attr('max');

        /* Start hour */
        btnUp.click(function() {
            min = input.attr('min');
            max = input.attr('max');
            if ((parseInt(input.val()) == 10) && (inputAmPm.val() == "PM")){
                input.val(12);
                $('#popup_dates_2').find('.second_hours').val(11);
            } else {
                var newVal = (parseInt(input.val()) >= max)? min : parseInt(input.val()) + 1;
                input.val(showHourOrMinute(newVal));
                if (newVal >= 12) {
                    inputAmPm.val("PM");
                    $('#popup_dates_2').find('.second_am_pm').val("PM");
                    setFirstHourMin(window.shift_date, window.staff_necessary);
                }
                validateSecondHours();
            }
        });

        btnDown.click(function() {
            min = input.attr('min');
            max = input.attr('max');
            if ((parseInt(input.val()) == 12) && (inputAmPm.val() == "PM")){
                input.val(10);
                $('#popup_dates_2').find('.second_hours').val(11);
                setSecondHourMinAndMax(10);
                setFirstHourMax(11);
            } else {
                var newVal = (parseInt(input.val()) <= min)? max : parseInt(input.val()) - 1;
                input.val(showHourOrMinute(newVal));
                if (newVal >= 12) {
                    inputAmPm.val("PM");
                    $('#popup_dates_2').find('.second_am_pm').val("PM");
                    setFirstHourMin(window.shift_date, window.staff_necessary);
                }
                validateSecondHours();
            }
        });
        /* End hour */

        /*Start Minute*/
        btnUpMinute.click(function() {
            var newVal = (parseInt(inputMinute.val()) >= maxMinute)? minMinute : parseInt(inputMinute.val()) + 1;
            spinner.find(".minute_input").val(showHourOrMinute(newVal));
            validateSecondHours();
        });

        btnDownMinute.click(function() {
            var newVal = (parseInt(inputMinute.val()) <= minMinute)? maxMinute : parseInt(inputMinute.val()) - 1;
            spinner.find(".minute_input").val(showHourOrMinute(newVal));
            validateSecondHours();
        });
        /*End Minute*/

        /*Start AM And PM*/
        btnUpAmPm.click(function() {
            dataMin = $('#popup_dates_2').find('.am_pm_input').data("min");
            if(dataMin == "AM"){
                var newVal = inputAmPm.val();
                inputAmPm.val((newVal == "AM")? "PM" : "AM");
                if (newVal =="AM") {
                    $('#popup_dates_2').find('.second_am_pm').val("PM");
                }
                setFirstHourMin(window.shift_date, window.staff_necessary);
                setFirstHourMax(parseInt($('#popup_dates_2').find('.second_hours').val()));
                validateSecondHours();
            }
        });

        btnDownAmPm.click(function() {
            var newVal = inputAmPm.val();
            dataMin = $('#popup_dates_2').find('.am_pm_input').data("min");
            if(dataMin == "AM"){
                inputAmPm.val((newVal == "AM")? "PM" : "AM");
                if (newVal =="AM" ) {
                    $('#popup_dates_2').find('.second_am_pm').val("PM");
                }
                setFirstHourMin(window.shift_date, window.staff_necessary);
                setFirstHourMax(parseInt($('#popup_dates_2').find('.second_hours').val()));
                validateSecondHours();
            }
        });
        /*End AM And PM*/
    });
    /*End Hours*/

    jQuery('.liste_second_hours').each(function() {
        var spinner = jQuery(this),
        input = spinner.find('.second_hours'),
        inputMinute = spinner.find('.second_minute'),
        inputAmPm = spinner.find('.second_am_pm'),
        btnUp = spinner.find('.up_second_hour'),
        btnDown = spinner.find('.down_second_hour'),
        btnUpMinute = spinner.find('.up_second_minute'),
        btnDownMinute = spinner.find('.down_second_minute'),
        btnUpAmPm = spinner.find('.up_second_am_pm'),
        btnDownAmPm = spinner.find('.down_second_am_pm'),
        minMinute = inputMinute.attr('min'),
        maxMinute = inputMinute.attr('max'),
        min = input.attr('min'),
        max = input.attr('max');

        /*Start Hours*/
        btnUp.click(function() {
            min = input.attr('min');
            max = input.attr('max');
            var newVal = (parseInt(input.val()) >= max)? min : parseInt(input.val()) + 1;
            input.val(showHourOrMinute(newVal));
            if (newVal >= 12)
                inputAmPm.val("PM");
            setFirstHourMax(newVal);
        });

        btnDown.click(function() {
            min = input.attr('min');
            max = input.attr('max');
            var newVal = (parseInt(input.val()) <= min)? max : parseInt(input.val()) - 1;
            input.val(showHourOrMinute(newVal));
            if (newVal >= 12)
                inputAmPm.val("PM");
            setFirstHourMax(newVal);
        });
        /*End Hours*/

        /*Start Minute*/
        btnUpMinute.click(function() {
            var newVal = (parseInt(inputMinute.val()) >= maxMinute)? minMinute : parseInt(inputMinute.val()) + 1;
            inputMinute.val(showHourOrMinute(newVal));
            validateSecondHours();
        });

        btnDownMinute.click(function() {
            var newVal = (parseInt(inputMinute.val()) <= minMinute)? maxMinute : parseInt(inputMinute.val()) - 1;
            inputMinute.val(showHourOrMinute(newVal));
            validateSecondHours();
        });
        /*End Minute*/

        /*Start AM And PM*/
        btnUpAmPm.click(function() {
            var second_hours_val = parseInt($('#popup_dates_2').find('.second_hours').val());
            if ($('.liste_first_hours').find('.am_pm_input').val() == "AM" && second_hours_val < 12 ){
                var newVal = inputAmPm.val();
                inputAmPm.val((newVal == "AM")? "PM" : "AM");
                validateSecondHours();
            } else {
                if (langue == "en")
                    toastr.error("The shift end must be upper than the shift start!")
                else
                    toastr.error("L'heure du fin doit être supérieur au heure du début!")
            }
        });

        btnDownAmPm.click(function() {
            var second_hours_val = parseInt($('#popup_dates_2').find('.second_hours').val());
            if ($('.liste_first_hours').find('.am_pm_input').val() == "AM" && second_hours_val < 12 ){
                var newVal = inputAmPm.val();
                inputAmPm.val((newVal == "AM")? "PM" : "AM");
                validateSecondHours()
            } else {
                if (langue == "en")
                    toastr.error("The shift end must be upper than the shift start!")
                else
                    toastr.error("L'heure du fin doit être supérieur au heure du début!")
            }
        });
        /*End AM And PM*/
    });

    /*Start Validation des inputs dans pop up date*/
    $('#popup_dates_2').on("change", '.hours_input', function(){
        var hours_input_val = parseInt($(this).val());
        var min = $(this).attr('min');
        var max = $(this).attr('max');
        if(hours_input_val > max){
            hours_input_val = max;
            if (langue == "en")
                toastr.error("Please, enter a number between " + showHourOrMinute(min) + " and " + max + "!")
            else
                toastr.error("Veuillez entrez un nombre entre  " + showHourOrMinute(min) + " et " + max + "!")
            if (max == 12)
                $('#popup_dates_2').find(".am_pm_input").val("PM");
        } else if (hours_input_val < min){
            hours_input_val = min;
            if (langue == "en")
                toastr.error("Please, enter a number between  " + showHourOrMinute(min) + " and " + max + "!")
            else
                toastr.error("Veuillez entrez un nombre entre  " + showHourOrMinute(min) + " et " + max + "!")
        }
        $(this).val(showHourOrMinute(hours_input_val));
        validateSecondHours();
    });

    $('#popup_dates_2').on("change", '.minute_input', function(){
        var minute_input_val = parseInt($(this).val());
        var max = $(this).attr('max');
        var min = $(this).attr('min');
        if(minute_input_val > max){
            minute_input_val = max;
            if (langue == "en")
                toastr.error("Please, enter a number between " + showHourOrMinute(min) + " and 59!")
            else
                toastr.error("Veuillez entrez un nombre entre " + showHourOrMinute(min) + " et 59!")
        }
        else if(minute_input_val < min){
            minute_input_val = min;
            if (langue == "en")
                toastr.error("Please, enter a number between " + showHourOrMinute(min) + " and 59!")
            else
                toastr.error("Veuillez entrez un nombre entre " + showHourOrMinute(min) + " et 59!")
        }
        $(this).val(showHourOrMinute(minute_input_val));
        validateSecondHours();
    });
    
    $('#popup_dates_2').on("change", '.second_hours', function(){
        var hours_input_val = parseInt($('#popup_dates_2').find('.hours_input').val());
        var max = $(this).attr('max');
        var second_hours_val =parseInt($(this).val());
        var min = $(this).attr('min');

        if(second_hours_val > max){
            second_hours_val = max;
            if (langue == "en")
                toastr.error("Please, enter a number between "+showHourOrMinute(min)+" and "+max+"!")
            else
                toastr.error("Veuillez entrez un nombre entre "+showHourOrMinute(min)+" et "+max+"!")
            if (max == 12)
                $('#popup_dates_2').find(".second_am_pm").val("PM");
        } else if(second_hours_val <= min){
            second_hours_val = min;
            if (langue == "en")
                toastr.error("Please, enter a number between "+showHourOrMinute(min)+" and "+max+"!")
            else
                toastr.error("Veuillez entrez un nombre entre "+showHourOrMinute(min)+" et "+max+"!")
        }
        $(this).val(showHourOrMinute(second_hours_val));
        setFirstHourMax(second_hours_val);
    });
    
    $('#popup_dates_2').on("change", '.second_minute', function(){
        var minute_input_val = parseInt($(this).val());
        var min =  $(this).attr('min');
        if(minute_input_val > $(this).attr('max')){
            minute_input_val = $(this).attr('max');
            if (langue == "en")
                toastr.error("Please, enter a number between "+showHourOrMinute(min)+" and 59!")
            else
                toastr.error("Veuillez entrez un nombre entre "+showHourOrMinute(min)+" et 59!")
        }
        else if(minute_input_val < $(this).attr('min')){
            minute_input_val = $(this).attr('min');
            if (langue == "en")
                toastr.error("Please, enter a number between "+showHourOrMinute(min)+" and 59!")
            else
                toastr.error("Veuillez entrez un nombre entre "+showHourOrMinute(min)+" et 59!")
        }
        $(this).val(showHourOrMinute(minute_input_val));
    });
    /*End Validation des inputs dans pop up date*/

    $("#popup_dates").on('click','.close_modal', function() {
        if ($('.date_event').val() == ""){
            $('.date_event').closest('.dropdown_cage').css('border','1px solid red');
        } else {
            $('.date_event').closest('.dropdown_cage').css('border','');
        }
    });

    $("#popup_dates_2").on('click','.close_modal', function() {
        if(window.staff_necessary.find('.date_horaire_create_event').length > 0){
            window.staff_necessary.find('.content_three_divider').css('border','');
        } else {
          window.staff_necessary.find('.content_three_divider').css('border','1px solid red');
        }
        window.staff_necessary.find('.startDaily').removeClass("on_edit");
        $('#popup_dates_2').find('.btn_apply').off('click');
    });
});
/* END DIRST JQUERY */

function showInitialDate(dateDay){
    var langue = getLanguage();
    var mon = "Lun", tue = "Mar", wed = "Mer", thu = "Jeu", fri = "Ven", sat = "Sam", sun = "Dim";
    if(langue == "en"){
        mon = "Mon";
        tue = "Tue";
        wed = "Wed";
        thu = "Thu";
        fri = "Fri";
        sat = "Sat";
        sun = "Sun";
    }
    switch (dateDay) {
        case 'Monday':
            return mon;
            break;
        case 'Tuesday':
            return tue;
            break;
        case 'Wednesday':
            return wed;
            break;
        case 'Thursday':
            return thu;
            break;  
        case 'Friday':
            return fri;
            break;
        case 'Saturday':
            return sat;
            break;
        case 'Sunday':
            return sun;
            break;
        default:
            return dateDay;
            break;
    }
}

function showInitialMonth(dateMonth){
    var langue = getLanguage();
    var jan = "Janvier", feb = "Février", mar = "Mars", apr = "Avril", may = "Mai", jun = "Juin", jul = "Juillet", aug = "Aout", sep = "Septembre", oct = "Octobre", nov = "Novembre", dec = "Décembre";
    if(langue == "en"){
        jan = "January";
        feb = "February";
        mar = "March";
        apr = "April";
        may = "May";
        jun = "June";
        jul = "July";
        aug = "August";
        sep = "September";
        oct = "October";
        nov = "November";
        dec = "December";
    }
    switch (dateMonth) {
        case 'January':
            return jan;
            break;
        case 'February':
            return feb;
            break;
        case 'March':
            return mar;
            break;
        case 'April':
            return apr;
            break;  
        case 'May':
            return may;
            break;
        case 'June':
            return jun;
            break;
        case 'July':
            return jul;
            break;
        case 'August':
            return aug;
            break;
        case 'September':
            return sep;
            break;
        case 'October':
            return oct;
            break;
        case 'November':
            return nov;
            break;  
        case 'December':
            return dec;
            break;
        
        default:
            return dateMonth;
            break;
          // code
    }
}

function showHourOrMinute(hourOrMinute){
    return (hourOrMinute < 10)? ("0"+hourOrMinute) : hourOrMinute;
}

function setFirstHourMin(date, staff_necessary){
    var min = 1;
    var am_pm_duration = false;
    staff_necessary.find(".startDaily").each(function(){
        if((date == $(this).val()) && !($(this).hasClass("on_edit"))){
            var startHourDaily = $(this).siblings(".startHourDaily").val().split(":");
            var startHour = parseInt(startHourDaily[0]);
            startHourDaily = startHourDaily[1].split(" ");
            var startAmPm = startHourDaily[1];
            var endHourDaily = $(this).siblings(".endHourDaily").val().split(":");
            var endHour = parseInt(endHourDaily[0]);
            endHourDaily = endHourDaily[1].split(" ");
            var endAmPm = endHourDaily[1];
            if (am_pm_duration == false) {
                if (startAmPm == "AM" && endAmPm == "PM"){
                    $('#popup_dates_2').find('.am_pm_input').attr("data-min", "PM");
                    $('#popup_dates_2').find('.am_pm_input').val("PM");
                    $('#popup_dates_2').find('.second_am_pm').val("PM");
                    am_pm_duration = true;
                    if (min < endHour)
                        min = endHour;
                } else if ((min < endHour) && ($('#popup_dates_2').find('.am_pm_input').val() == endAmPm))
                    min = endHour;
            } else if (min < endHour) {
                min = endHour;
            }
        }
    });
    var hours_input_val = parseInt($('#popup_dates_2').find('.hours_input').val());
    if (hours_input_val < min){
        $('#popup_dates_2').find('.hours_input').val(showHourOrMinute(min));
    }
    if (am_pm_duration == true)
        $('#popup_dates_2').find('.am_pm_input').attr("data-min", "PM");
    else
        $('#popup_dates_2').find('.am_pm_input').attr("data-min", "AM");
    $('#popup_dates_2').find('.hours_input').attr("min", min);
    validateSecondHours();
    console.log("Start hour min : " + min);
}

function setFirstHourMax(secondHour){
    var secondHour = parseInt(secondHour);
    var max = ((secondHour == 11) && ($('#popup_dates_2').find('.am_pm_input').val() == "PM"))? 10 : 12;
    $('#popup_dates_2').find('.hours_input').attr("max", max);
}

function setSecondHourMinAndMax(startHour) {
    var min = 1;
    var minute = 0;
    var startHour = parseInt(startHour);
    var secondHour = parseInt($('#popup_dates_2').find('.second_hours').val());
    var start_am_pm = $('#popup_dates_2').find('.am_pm_input').val();
    var second_am_pm = $('#popup_dates_2').find('.second_am_pm').val();
    if((startHour != 12) && (start_am_pm == second_am_pm)) {
        min = startHour + 1;
    }
    if((secondHour <= (startHour + 1)) && (start_am_pm == second_am_pm))
        minute = parseInt($('#popup_dates_2').find('.minute_input').val());

    $('#popup_dates_2').find('.second_hours').attr("min", min);
    $('#popup_dates_2').find('.second_minute').attr("min", minute);

    var max = ($('#popup_dates_2').find('.am_pm_input').val() == "PM")? 11 : 12;
    $('#popup_dates_2').find('.second_hours').attr("max", max);
}

function initializeDaterangepicker2(startDateEvent, endDateEvent){
    var langue= getLanguage();
    var mon = "Lun", tue = "Mar", wed = "Mer", thu = "Jeu", fri = "Ven", sat = "Sam", sun = "Dim";
    var jan = "Janvier", feb = "Février", mar = "Mars", apr = "Avril", may = "Mai", jun = "Juin", jul = "Juillet", aug = "Aout", sep = "Septembre", oct = "Octobre", nov = "Novembre", dec = "Décembre";
    if(langue == "en"){
        mon = "Mon";
        tue = "Tue";
        wed = "Wed";
        thu = "Thu";
        fri = "Fri";
        sat = "Sat";
        sun = "Sun";
        jan = "January";
        feb = "February";
        mar = "March";
        apr = "April";
        may = "May";
        jun = "June";
        jul = "July";
        aug = "August";
        sep = "September";
        oct = "October";
        nov = "November";
        dec = "December";
    }
    if (startDateEvent < moment())
        startDateEvent = moment();
    var picker2 = $('#daterangepicker2').daterangepicker({
        "parentEl": "#daterangepicker2-container",
        "autoApply": true,
        "singleDatePicker": true,
        "minDate": startDateEvent,
        "maxDate": endDateEvent,
        "locale": {
            "format": "DD/MM/YYYY",
            "separator": " - ",
            "applyLabel": "Apply",
            "cancelLabel": "Cancel",
            "fromLabel": "De",
            "toLabel": "à",
            "customRangeLabel": "Custom",
            "daysOfWeek": [sun,mon, tue, wed, thu, fri, sat],
            "monthNames": [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec],
            "firstDay": 1
        }
    });
    picker2.on('apply.daterangepicker', function(ev, picker) {
        $('#popup_dates_2').find('.first_dates .date_letter').html(showInitialDate($('#daterangepicker2').data('daterangepicker').startDate.format('dddd')));
        $('#popup_dates_2').find('.first_dates .date_number').html($('#daterangepicker2').data('daterangepicker').startDate.format('DD'));
        $('#popup_dates_2').find('.first_dates .month_letter').html(showInitialMonth($('#daterangepicker2').data('daterangepicker').startDate.format('MMMM')));
        
        $('#popup_dates_2').find('.second_dates .date_letter').html(showInitialDate($('#daterangepicker2').data('daterangepicker').endDate.format('dddd')));
        $('#popup_dates_2').find('.second_dates .date_number').html($('#daterangepicker2').data('daterangepicker').endDate.format('DD'));
        $('#popup_dates_2').find('.second_dates .month_letter').html(showInitialMonth($('#daterangepicker2').data('daterangepicker').endDate.format('MMMM')));
        window.shift_date = $('#daterangepicker2').data('daterangepicker').startDate.format('YYYY-MM-DD');
        setFirstHourMin(window.shift_date, window.staff_necessary);
    });
    picker2.data('daterangepicker').hide = function(){};
    picker2.data('daterangepicker').show();
}

function validateSecondHours() {
    var second_hours = parseInt($('#popup_dates_2').find('.second_hours').val());
    var hours_input = parseInt($('#popup_dates_2').find('.hours_input').val());
    var second_am_pm = $('#popup_dates_2').find('.second_am_pm').val();
    var input_am_pm = $('#popup_dates_2').find('.am_pm_input').val();
    if ((input_am_pm == second_am_pm) && ((hours_input >= second_hours) || (second_hours >= 12))) {
        second_hours = hours_input + 1;
        if (input_am_pm == "PM" && second_hours >= 11) {
            second_hours = 11;
            hours_input = (hours_input > 10)? 10 : hours_input;
            $('#popup_dates_2').find('.second_hours').val(11);
            setFirstHourMin(window.shift_date, window.staff_necessary);
            setSecondHourMinAndMax(hours_input);
            setFirstHourMax(11);
        } else {
            $('#popup_dates_2').find('.second_hours').val(showHourOrMinute(second_hours));
            if (second_hours >= 12) {
                $('#popup_dates_2').find('.second_am_pm').val("PM");
                setFirstHourMin(window.shift_date, window.staff_necessary);
            }
            setSecondHourMinAndMax(hours_input);
        }
    } else if (input_am_pm != second_am_pm && input_am_pm == "PM"){
        $('#popup_dates_2').find('.second_am_pm').val("PM");
        setFirstHourMin(window.shift_date, window.staff_necessary);
        validateSecondHours();
    }
        setSecondHourMinAndMax(hours_input);

    if ((input_am_pm == second_am_pm) && ((hours_input + 1) >= second_hours)) {
        var minute_input = parseInt($('#popup_dates_2').find('.minute_input').val());
        var second_minute = parseInt($('#popup_dates_2').find('.second_minute').val());
        if (minute_input > second_minute)
            $('#popup_dates_2').find('.second_minute').val(showHourOrMinute(minute_input));
    }
    console.log("Second hour min : "+$('#popup_dates_2').find('.second_hours').attr("min"));
}

/*function */