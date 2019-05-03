<?php
/**
 * Global helpers file with misc functions
 **/
 
 /*get the language id*/

 use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;
 use App\Models\Event_Assessment;
 use App\Models\EventStaff;

function getLanguageId()
{
    $language_code = getLanguageCode();
    if($language_code == 'fr')
        return 1;
    else
        return 2;
}

/*get the language code*/
function getLanguageCode()
{
    return Mcamara\LaravelLocalization\Facades\LaravelLocalization::getCurrentLocale();
}

/*return the notification message*/
function notification($type, $message)
{
    \Session::flash('alert-class', $type);
    \Session::flash('message', $message); 
}


// captcha
function customRequestCaptcha(){
    return new \ReCaptcha\RequestMethod\Post();
}

//prenom nom
function fullName($last_name, $first_name){
	return $last_name.' '.$first_name;
}

//prenom initial nom
function FirstAndInitialName($last_name, $first_name){
	return $first_name.' '.$last_name[0].'.';
}


function showHourlyRate($hourly){
    return $hourly. '$/Hr';
}

function showDateJobOffer($dateStart, $dateEnd){
    $start = [];
    $end = [];
    $month_start = "";
    $month_end = "";

    $start = explode('-', $dateStart);
    $end = explode('-', $dateEnd);

    $month_start = translateMonth($start[1]);
    $month_end = translateMonth($end[1]);

    if ($month_end == $month_start){
        return $month_end.' '.$start[2].' - '.$end[2] ;
    } else {
        return $month_start.' '.$start[2].' - '.$month_end.' '.$end[2] ;
    }
}

function statusApplication($status){
    switch ($status) {
        case 1:
            return "";
            break;

        case 2:
            return "checked";

        case 4:
            return "checked";

        case 3:
            return "";
        
        default:
            # code...
            break;
    }
}


function statusRefused($status){
    switch ($status) {
        case 1:
            return "";
            break;

        case 2:
            return "";

        case 4:
            return "";

        case 3:
            return "checked";
        
        default:
            # code...
            break;
    }
}

function statusButtonListOfCandidate($languageId, $status){
    switch($status){
        case 1:
            if($languageId == 1){
                return 'EN ATTENTE DE REPONSE';
            } else {
                return 'WAITING FOR A RESPONSE';
            }
            break;
        case 2:
            if($languageId == 1){
                return 'CONFIRMER';
            } else {
                return 'CONFIRME';
            }
            break;
        case 3:
            if($languageId == 1){
                return 'INDISPONIBLE';
            } else {
                return 'UNAVAILABLE';
            }
            break;
    }

}

function colorButtonStatus($status){
    switch ($status) {
        case 1:
            return 'color_waiting_response';
            break;
        
        case 2:
            return 'color_confirmed';
            break;

        case 3:
            return 'color_indisponible';
            break;
    }
}

function showPerDiem($perdiem){
    return $perdiem. '$';
}

function translateMonth($month) {
    $language_code = getLanguageCode();
    $month_str = "";
    switch ($month) {
        case '01':  $month_str = ($language_code == 'fr')? "Janvier" : "January";
                    break;

        case '02':  $month_str = ($language_code == 'fr')? "Février" : "February";
                    break;

        case '03':  $month_str = ($language_code == 'fr')? "Mars" : "March";
                    break;

        case '04':  $month_str = ($language_code == 'fr')? "Avril" : "April";
                    break;

        case '05':  $month_str = ($language_code == 'fr')? "Mai" : "Mey";
                    break;

        case '06':  $month_str = ($language_code == 'fr')? "Juin" : "June";
                    break;

        case '07':  $month_str = ($language_code == 'fr')? "Juillet" : "Jully";
                    break;

        case '08':  $month_str = ($language_code == 'fr')? "Août" : "August";
                    break;

        case '09':  $month_str = ($language_code == 'fr')? "Septembre" : "September";
                    break;

        case '10':  $month_str = ($language_code == 'fr')? "Octobre" : "October";
                    break;

        case '11':  $month_str = ($language_code == 'fr')? "Novembre" : "November";
                    break;

        case '12':  $month_str = ($language_code == 'fr')? "Décembre" : "December";
                    break;
        
        default:    $month_str = $month;
                    break;
    }
    return $month_str;
}

function showDateEventStaff($date){
    $dateArray = [];
    $month = "";
    $dateArray = explode('-', $date);
    $month = translateMonth($dateArray[1]);
    return $month.' '.$dateArray[2];   
}

function showHoursEventStaff($hourStart, $hourEnd) {
    return convertToTwelveHour($hourStart)." - ".convertToTwelveHour($hourEnd);
}

function showDateEvent($dateStart, $dateEnd){
    $start = [];
    $end = [];
    $month_start = "";
    $month_end = "";

    $start = explode('-', $dateStart);
    $end = explode('-', $dateEnd);

    $month_start = translateMonth($start[1]);
    $month_end = translateMonth($end[1]);

    if ($start[0] == $end[0]){
        return $month_start.' '.$start[2].' - '.$month_end.' '.$end[2].', '.$end[0] ;
    } else {
        return $month_start.' '.$start[2].', '.$start[0].' - '.$month_end.' '.$end[2].', '.$end[0] ;
    }
}

function listingLanguageSelectionedInInput($staff, $all_languages){
    $languageListing = '';
    foreach($staff->staffLanguages as $stafflanguage){
        foreach($all_languages as $language){
            if($stafflanguage->all_language_id == $language->id){
                $languageListing = $languageListing.''.$language->getByLanguageId(getLanguageId())->name.', ';
            }
        }
    }
    $languageListingSnakeComma = substr($languageListing, 0, -2);
    return $languageListingSnakeComma;
}

function listingJobSelectionedInInput($staff){
    $jobListing = '';
    foreach($staff->staffJobs as $staffjob){
       $jobListing = $jobListing.''.$staffjob->job->getByLanguageId(getLanguageId())->name.', ';
    }
    $jobListingSnakeComma = substr($jobListing, 0, -2);
    return $jobListingSnakeComma;
}

function listingCertification ($staff){
    $certificationListing = "";
    $jobListingSnakeComma = "";
    if ($staff->staffCertification->actra == 1)
       $certificationListing = $certificationListing.''.'ACTRA, ';

    if ($staff->staffCertification->food_handling == 1)
       $certificationListing = $certificationListing.''.trans('certification_blade.Handling_food').', ';
    
    if ($staff->staffCertification->smart_serve == 1)
       $certificationListing = $certificationListing.''.'Smart Serve, ';
    
    if ($staff->staffCertification->uda == 1)
       $certificationListing = $certificationListing.''.'UDA, ';
    
    if ($certificationListing != "")
        $jobListingSnakeComma = substr($certificationListing, 0, -2);
    
    return $jobListingSnakeComma;
}

function listingWorkAreaSelectionedInInput($staff, $mobilities){
    $workAreaListing = '';
    $workAreaListingSnakeComma = '';

    foreach ($staff->staffMobility as $staffmob) {
        foreach ($mobilities as $mobility) {
            if($staffmob->mobility_id == $mobility->id){
                $workAreaListing = $workAreaListing.''.$mobility->getByLanguageId(getLanguageId())->name.', ';
            }
        }
    }
    if ($workAreaListing != "")
        $workAreaListingSnakeComma = substr($workAreaListing, 0, -2);

    return $workAreaListingSnakeComma;
}

function listingAttributes($staff, $attributes){
    $attributesListing = "";
    $attributesListingSnakeComma = "";

    if ($staff->staffAttribut->tattoo != "")
        $attributesListing = $attributesListing.''.trans('staff_register.tattoo').', ';
    if ($staff->staffAttribut->piercing != "")
        $attributesListing = $attributesListing.''.trans('find_candidates.Piercing').', ';

    foreach ($staff->staffAttribut->StaffAttributeOption as $att_option) {
        foreach ($attributes as $key =>$attribute) {
           if ($attribute->getByLanguageId(getLanguageId())->attribute_id == $att_option->attribute_id){
                $attributesListing = $attributesListing.''.$attribute->getByLanguageId(getLanguageId())->name.', ';
           }
        }
    }

    if ($attributesListing != "")
        $attributesListingSnakeComma = substr($attributesListing, 0, -2);

    return $attributesListingSnakeComma;
}

function showTattooPiercing($value){
    switch ($value) {
        case 1:
            return trans('staff_register.visible');
            break;
        case 2:
            return trans('staff_register.not_visible');
            break;
        case 3:
            return trans('staff_register.none');
            break;    
    }
}

function getLanguageValue($id){
    switch ($id) {
        case 1:
            return 25;
            break;
        case 2:
            return 50;
            break;
        case 3:
            return 100;
            break;
        case 4:
            return 100;
            break;                    
    }
}

function getAppreciation($staff){
    $all_rating = 0;
    $ratingResponse = 0;
    $maxValue =array();

    foreach ($staff->staffAssessment as $value) {
        $maxValue[] = $value->rating;
        $all_rating += $value->rating;        
    }
    if(count($staff->staffAssessment)>0){
        $ratingResponse = $all_rating / count($staff->staffAssessment);
        $ratingResponse = number_format($ratingResponse,1);
    }
    if ($ratingResponse == 0) {
        $ratingResponse = 5;
    }
    return $ratingResponse;
}

function getDateString($date){

    if($date!=null){
        $language_code = getLanguageCode();
        $date_str ="";
        $dateSplit = explode("-", $date);
        $month_str = translateMonth($dateSplit[1]);
        $daySplit = explode(" ", $dateSplit[2]);

        $date_str = $daySplit[0]." ".$month_str." ".$dateSplit[0];
        
        return $date_str;
    }
}

function activeStaffAttributOption($staff, $attributeID, $option){
    $option_translation = $option->getByLanguageId(getLanguageId());
    foreach($staff->staffAttribut->StaffAttributeOption as $att_option) {
        if($attributeID == $att_option->attribute_id){
            if($att_option->attribute_option_id == $option_translation->attribute_option_id){
                return 'active';
            }else {
                return '';
            }
        }
    }
}

function checkStaffAttributOption($staff, $attributeID, $option){
    $option_translation = $option->getByLanguageId(getLanguageId());
    foreach($staff->staffAttribut->StaffAttributeOption as $att_option) {
        if($attributeID == $att_option->attribute_id){
            if($att_option->attribute_option_id == $option_translation->attribute_option_id){
                return 'checked';
            }else {
                return '';
            }
        }
    }
}

function is_my_staff($agency_id, $staff_id){
    $agencyStaff = App\Models\AgencyStaff::where('agency_id', $agency_id)->where('staff_id', $staff_id)->first(); 
    return $agencyStaff;   
}

function is_my_hour_event($hours){
    $hour = "";
    $hourSplit = explode(":", $hours);
    $hour = $hourSplit[0];
    return $hour;
}

function is_my_per_diem($per_diem){
    $myPerDiem = "";
    if ($per_diem != "") {
        $myPerDiem = $per_diem;
        return $myPerDiem;
    } else {
        $myPerDiem = "--";
        return $myPerDiem;
    }
}

function show_cv_iframe($url){
    $array_url = explode(".",$url);
    $extension = $array_url[sizeof($array_url)-1];
    if ($extension == 'docx' || $extension == 'doc') 
        return "https://docs.google.com/gview?url=".$url;
    else
        return $url;   
}

function show_date_to_bills($dateStart, $dateEnd){
    $start = [];
    $end = [];

    $start = explode('-', $dateStart);
    $end = explode('-', $dateEnd);

    return $start[2]."/".$start[1]."/".$start[0]." au ".$end[2]."/".$end[1]."/".$end[0];

}

function sumExpense($expense, $staff_id){
    $sumExpense = 0;
    foreach ($expense->eventFactures as $depense) {
        if($depense->staff_id == $staff_id){
            $sumExpense += $depense->expense;
        }
    }
    return $sumExpense;
}

function sumExpenseFuture($expense, $staff_id){
    $sumExpense = 0;
    foreach ($expense->eventFactures as $depense) {
        if($depense->staff_id == $staff_id){
            $sumExpense = $depense->expense;
            break;
        }
    }
    return $sumExpense;
}

function sumExpenseTotal($expense){
    $sumExpenseTotal = 0;
    foreach ($expense->eventFactures as $depense) {
            $sumExpenseTotal += $depense->expense;
    }
    return $sumExpenseTotal;
}

function sumRange($range, $staff_id){
    $sum = 0;
    foreach ($range->eventFactures as $depense) {
       if($depense->staff_id == $staff_id){
          $sum += $depense->range_done;
       }
    }
    return  $sum*$range->distance;
}

function sumRangeFuture($range, $staff_id){
    $sum = 0;
    foreach ($range->eventFactures as $depense) {
       if($depense->staff_id == $staff_id){
          $sum = $depense->range_done;
          break;
       }
    }
    return  $sum*$range->distance;
}

function sumRangeTotal($expense){
    $sumRangeTotal = 0;
    foreach ($expense->eventFactures as $depense) {
            $sumRangeTotal += $depense->range_done;
    }
    return $sumRangeTotal*$expense->distance;
}

function sumRemuneration($expense, $staff_id){
    $sumRemuneration = 0;
    foreach ($expense->eventFactures as $depense) {
        if($depense->staff_id == $staff_id){
            $sumRemuneration += $depense->remuneration;
        }
    }
    return $sumRemuneration;
}

function sumRemunerationTotal($expense){
    $sumRemunerationTotal = 0;
    foreach ($expense->eventFactures as $depense) {
            $sumRemunerationTotal += $depense->remuneration;
    }
    return $sumRemunerationTotal;
}

function sumPerdiemTotal($eventStaff){
    // pour le moment aloha satria mbola tsy tena mazava tsara ilay atao hoe perdiem
    $numberStaffConfirmedInOnePostEvent = sizeof ($eventStaff->eventStaffCandidateConfirmed);
    return $eventStaff->per_diem * $numberStaffConfirmedInOnePostEvent;
} 

function TotalExpense($event){
    $TotalExpense = 0;
    if($event){
        foreach ($event->eventStaffs as $index=>$eventStaff) {
            foreach ($eventStaff->eventFactures as $depense) {
                $TotalExpense += $depense->expense;
            }
        }
    }    
    return $TotalExpense;
}

function TotalPerdiem($event){
    $TotalPerdiem = 0;
    $numberStaffConfirmedInOnePostEvent = 0;
    if($event){
        foreach ($event->eventStaffs as $index=>$eventStaff) {
            $numberStaffConfirmedInOnePostEvent = sizeof ($eventStaff->eventStaffCandidateConfirmed);
            $TotalPerdiem += $eventStaff->per_diem * $numberStaffConfirmedInOnePostEvent;
        }
    }
    return $TotalPerdiem;
}

function TotalRange($event){
    $TotalRange = 0;
    if($event){
        foreach ($event->eventStaffs as $index=>$eventStaff) {
             $sumRangeTotal = 0;
            foreach ($eventStaff->eventFactures as $depense) {
                $sumRangeTotal += $depense->range_done;
            }
            $TotalRange += $sumRangeTotal * $eventStaff->distance;
        }
    }    
    return $TotalRange;
}

function TotalRemuneration($event){
     $TotalRemuneration = 0;
     if($event){
        foreach ($event->eventStaffs as $index=>$eventStaff) {
            $sumRemunerationTotal = 0;
            foreach ($eventStaff->eventFactures as $depense) {
                $sumRemunerationTotal += $depense->remuneration;
            }
            $TotalRemuneration += $sumRemunerationTotal;
        }
    }    
    return $TotalRemuneration;
}

function startHourView1($candidat, $eventStaff){
    $start = '';
    $tab = [];
    $staff_id = $candidat->staff_id;
    foreach ($eventStaff->eventFactures as $s=>$facture) {
        if($facture->staff_id ==  $staff_id){
            array_push($tab, $facture->start_hour_done);
        }
    }
    if (sizeof($tab)>0){
        $start = $tab[0].' h';
    }
    return $start;
}

function startHourFuture1($eventStaff){
    $start = '';
    $tab = [];
    $startHour = [];
    $startHourSplit = [];
    foreach ($eventStaff->eventStaffDates as $s=>$eventStaffDate) {
            $startHour = $eventStaffDate->start_hour_event_staff_date;
            $startHourSplit = explode(":", $startHour);
            array_push($tab, $startHourSplit[0]);
    }
    if (sizeof($tab)>0){
        $start = $tab[0];
    }
    return $start;
}

function endHourFuture1($eventStaff){
    $end = '';
    $tab = [];
    $endHour = [];
    $endHourSplit = [];
    foreach ($eventStaff->eventStaffDates as $s=>$eventStaffDate) {
        $endHour = $eventStaffDate->end_hour_event_staff_date;
        $endHourSplit = explode(":", $endHour);
            array_push($tab, $endHourSplit[0]);
    }
    if (sizeof($tab)>0){
        $end = $tab[0];
    }
    return $end;
}

function startHourFuture2($eventStaff){
    $start = '';
    $tab = [];
    $startHour = [];
    $startHourSplit = [];
    foreach ($eventStaff->eventStaffDates as $s=>$eventStaffDate) {
            $startHour = $eventStaffDate->start_hour_event_staff_date;
            $startHourSplit = explode(":", $startHour);
            array_push($tab, $startHourSplit[0]);
    }
    if(sizeof($tab)==1){
       $start = $tab[0]; 
    }else if (sizeof($tab)>0){
        $start = $tab[1];
    }
    return $start;
}

function endHourFuture2($eventStaff){
    $end = '';
    $tab = [];
    $endHour = [];
    $endHourSplit = [];
    foreach ($eventStaff->eventStaffDates as $s=>$eventStaffDate) {
        $endHour = $eventStaffDate->end_hour_event_staff_date;
        $endHourSplit = explode(":", $endHour);
            array_push($tab, $endHourSplit[0]);
    }
    if(sizeof($tab)==1){
       $end = $tab[0]; 
    }else if (sizeof($tab)>0){
        $end = $tab[1];
    }
    return $end;
}

function endHourView1($candidat, $eventStaff){
    $end = '';
    $tab = [];
    $staff_id = $candidat->staff_id;
    foreach ($eventStaff->eventFactures as $s=>$facture) {
        if($facture->staff_id ==  $staff_id){
            array_push($tab, $facture->end_hour_done);
        }
    }
    if (sizeof($tab)>0){
        $end = $tab[0].' h';
    }
    return $end;
}

function sumHoursFuture($eventStaff){
    $start = 0;
    $end = 0;
    $startHour = [];
    $startHourSplit = [];
    $endHour = [];
    $endHourSplit = [];
    foreach ($eventStaff->eventStaffDates as $s=>$eventStaffDate) {
        $startHour = $eventStaffDate->start_hour_event_staff_date;
        $startHourSplit = explode(":", $startHour);
        $start += $startHourSplit[0];
        $endHour = $eventStaffDate->end_hour_event_staff_date;
        $endHourSplit = explode(":", $endHour);
        $end += $endHourSplit[0];
    }
    return $end - $start;
}

/*function totalHoursFuture($eventStaff){
    $start = 0;
    $end = 0;
    $startHour = [];
    $startHourSplit = [];
    $endHour = [];
    $endHourSplit = [];
    $totalHours = 0;
    //foreach ($event->eventStaffs as $eventStaff) {
        foreach ($eventStaff->eventStaffDates as $s=>$eventStaffDate) {
            $startHour = $eventStaffDate->start_hour_event_staff_date;
            $startHourSplit = explode(":", $startHour);
            $start += $startHourSplit[0];
            $endHour = $eventStaffDate->end_hour_event_staff_date;
            $endHourSplit = explode(":", $endHour);
            $end += $endHourSplit[0];
            $total = $end - $start;
            $totalHours += $total;
        }
    //}
    return $totalHours;
}*/

function sumHours($candidat, $eventStaff){
    $start = 0;
    $end = 0;
    $staff_id = $candidat->staff_id;
    foreach ($eventStaff->eventFactures as $s=>$facture) {
        if($facture->staff_id ==  $staff_id){
            $start += $facture->start_hour_done;
            $end += $facture->end_hour_done;
        }
    }
    return $end - $start;
}

function sumHoursTotal($eventStaff){
    $start = 0;
    $end = 0;
    foreach ($eventStaff->eventFactures as $s=>$facture) {
            $start += $facture->start_hour_done;
            $end += $facture->end_hour_done;
    }
    return $end - $start;
}

function totalHours($event){
    $totalHours = 0;
    if($event){
        foreach ($event->eventStaffs as $index=>$eventStaff) {
            $start = 0;
            $end = 0;
            $sumHoursTotal = 0;
            foreach ($eventStaff->eventFactures as $s=>$facture) {
                $start += $facture->start_hour_done;
                $end += $facture->end_hour_done;
            }
            $totalHours += $end - $start;
        }
    }    
    return $totalHours;
}

function startHourView2($candidat, $eventStaff){
    $start = '';
    $tab = [];
    $staff_id = $candidat->staff_id;
    foreach ($eventStaff->eventFactures as $s=>$facture) {
        if($facture->staff_id ==  $staff_id){
            array_push($tab, $facture->start_hour_done);
        }
    }
    if (sizeof($tab)>1){
        $start = $tab[1].' h';
    }/*else{
        $start = $tab[0].' h';
    }*/
    return $start;
}

function endHourView2($candidat, $eventStaff){
    $end = '';
    $tab = [];
    $staff_id = $candidat->staff_id;
    foreach ($eventStaff->eventFactures as $s=>$facture) {
        if($facture->staff_id ==  $staff_id){
            array_push($tab, $facture->end_hour_done);
        }
    }
    if (sizeof($tab)>1){
        $end = $tab[1].' h';
    }/*else{
        $end = $tab[0].' h';
    }*/
    return $end;
}

function startView($eventStaff){
     $tab = [];
     $start = '';
    foreach($eventStaff->eventStaffCandidateConfirmed as $candidat){
        $staff_id = $candidat->staff_id;
        foreach ($eventStaff->eventFactures as $s=>$facture) {
            if($facture->staff_id ==  $staff_id){
                array_push($tab, $facture->startDate_event);
            }
        }
    }
    if (sizeof($tab)>0){
        $start = $tab[0];
    }
    return $start;
}

function startViewFuture($eventStaff){
     $tab = [];
     $start = '';
        foreach ($eventStaff->eventStaffDates as $s=>$eventStaffDate) {
                array_push($tab, $eventStaffDate->date_start);
        }
    if (sizeof($tab)>0){
        $start = $tab[0];
    }
    return $start;
}

function endView($eventStaff){
     $tab = [];
     $end = '';
    foreach($eventStaff->eventStaffCandidateConfirmed as $candidat){
        $staff_id = $candidat->staff_id;
        foreach ($eventStaff->eventFactures as $s=>$facture) {
            if($facture->staff_id ==  $staff_id){
                array_push($tab, $facture->startDate_event);
            }
        }
    }
    if (sizeof($tab)>1){
        $end = $tab[1];
    }else{
        $end = $tab[0];
    }
    return $end;
}

function endViewFuture($eventStaff){
     $tab = [];
     $end = '';
        foreach ($eventStaff->eventStaffDates as $s=>$eventStaffDate) {
                array_push($tab, $eventStaffDate->date_start);
        }
    if (sizeof($tab)>1){
        $end = $tab[1];
    }else{
        $end = $tab[0];
    }
    return $end;
}

function tittleIcon($name){
    $temp = explode('.', $name);
    return strtoupper($temp[count($temp) - 1]);
}



function showOneTotal($eventStaff){
    $totalNet = array();
    foreach ($eventStaff->eventFactures as $key => $value) {
        $totalNet[] = $value->net_total;
    }
    if ($totalNet) {
        return $totalNet[0]."$";
    }else{
        $totalNet = "Pas encore validé";
        return $totalNet;
    }
    
}

function showOneDate($eventStaff){
    $dateFacture = array();
    $dateInvoicie = array();
    $dateBill = array();
    $dateBillFinal = array();
    foreach ($eventStaff->eventFactures as $key => $value) {
        $dateFacture[] = $value->created_at;
    }

    if ($dateFacture) {
        $dateInvoicie = explode(" ", $dateFacture[0]);
        $dateBill = explode("-", $dateInvoicie[0]);
        $dateBillFinal = $dateBill[2]."-".$dateBill[1]."-".$dateBill[0];
        return $dateBillFinal;
    }else{
        $dateBillFinal = "Pas encore validé";
        return $dateBillFinal;
    }
    
    
}

function intBillsCode($key){
    $billCode = "";
    if ($key<1 || $key<10) {
        $billCode = "0".$key;
    }else{
        $billCode = $key;
    }

    return $billCode;
}

function intBillsHour($date){
    $billDate = "";
    if ($date<1 || $date<10) {
        $billDate = "0".$date;
    }else{
        $billDate = $date;
    }

    return $billDate;
}

function getHourEvent($hours){
    $hourSplit = [];

    $hourSplit = explode(":", $hours);

    return $hourSplit[0];
}

function calculDistanceBills($distance, $distVal){
    $distTotal = 0;
    $distTotal = $distance * $distVal;
    return $distTotal;
}

function calculRemuneration($bills){
    $remTotal = 0;

    foreach ($bills as $bill) {
        $remTotal += $bill->remuneration;        
    }
    return $remTotal;
}

function calculDepense($bills){
    $exTotal = 0;

    foreach ($bills as $bill) {
        $exTotal += $bill->expense;        
    }
    return $exTotal;
}

function calculRange($bills){
    $distTotal = 0;
    $distPre = 0;
    $rangePre = 0;
    $rangeTotal = 0;

    foreach ($bills as $bill) {
        $distPre = $bill->range_done; 
        $rangePre = $bill->eventStaff->distance; 
        $distTotal =  $distPre * $rangePre; 
        $rangeTotal += $distTotal;
    }

    return $rangeTotal;
}

function per_diem($bills){
    $my_per_diem = [];
    foreach ($bills as $bill) {
        $my_per_diem[] = $bill->eventStaff->per_diem; 
    }

    return $my_per_diem[0];
}

function get_total($bills){
    $my_total = [];
    foreach ($bills as $bill) {
        $my_total[] = $bill->net_total; 
    }

    return $my_total[0];
}

function additionnal_info($bills){
   $info = [];
    foreach ($bills as $bill) {
        $info[] = $bill->additionnal_info; 
    }

    return $info[0]; 
}

function nameAgenceInBill($bills){
    $nameAgence = [];
    foreach ($bills as $bill) {
        //dd($bill);
        $nameAgence[] = $bill->eventStaff->eventAgency->agency->name; 
    }

    return $nameAgence[0]; 
}

function logoAgenceInBill($bills){
    $logoAgence = [];
    foreach ($bills as $bill) {
        $logoAgence[] = $bill->eventStaff->eventAgency->agency->getImageProfilPath(); 
    }

    return $logoAgence[0]; 
}

function phoneAgenceInBill($bills){
    $phoneAgence = [];
    foreach ($bills as $bill) {
        $phoneAgence[] = $bill->eventStaff->eventAgency->agency->phone; 
    }

    return $phoneAgence[0]; 
}

function emailAgenceInBill($bills){
    $emailAgence = [];
    foreach ($bills as $bill) {
        $emailAgence[] = $bill->eventStaff->eventAgency->agency->email; 
    }

    return $emailAgence[0]; 
}

function addressAgenceInBill($bills){
    $addressAgence = [];
    $cityAgence = [];
    $provinceAgence = [];
    foreach ($bills as $bill) {
        $addressAgence[] = $bill->eventStaff->eventAgency->agency->address;
        $cityAgence[] = $bill->eventStaff->eventAgency->agency->city;
        $provinceAgence[] = $bill->eventStaff->eventAgency->agency->province; 
    }

    return $addressAgence[0]." ".$cityAgence[0]." (".$provinceAgence[0].")"; 
}

function nameEventInBill($bills){
    $nameEvent = [];
    foreach ($bills as $bill) {
        $nameEvent[] = $bill->eventStaff->eventAgency->name; 
    }

    return $nameEvent[0]; 
}

function dateEventInBill($bills){
    $dateStartEvent = [];
    $dateEndEvent = [];
    $dateInvoicie = [];
    $dateBill = [];
    foreach ($bills as $bill) {
        $dateStartEvent[] = $bill->eventStaff->eventAgency->start_date; 
        $dateEndEvent[] = $bill->eventStaff->eventAgency->end_date; 
    }

    $dateInvoicie = explode("-", $dateStartEvent[0]);
    $dateBill = explode("-", $dateEndEvent[0]);

    return $dateInvoicie[2]."-".$dateInvoicie[1]."-".$dateInvoicie[0]." au ".$dateBill[2]."-".$dateBill[1]."-".$dateBill[0]; 
}

function postEventInBill($bills){
    $postEvent = [];
    foreach ($bills as $bill) {
        $postEvent[] = $bill->eventStaff->post;
    }

    return $postEvent[0]; 
}

function hourly_rateEventInBill($bills){
    $hourly_rate = [];
    foreach ($bills as $bill) {
        $hourly_rate[] = $bill->eventStaff->hour_rate;
    }

    return $hourly_rate[0];
}

function calculRemunerationEvent($event){
    $totalHour = 0;
    $totalInHour = 0;
    $totalWithHour = 0;
    $totalPerDiem = 0;
    $remuneration = 0;
    $distance = 0;
    $hourlyRate = 0;
    $per_diem = 0;
    $startHour = 0;
    $endHour = 0;

    foreach ($event->eventStaffs as $eventStaff) {
        $distance = $eventStaff->distance;
        $hourlyRate = $eventStaff->hour_rate;
        $per_diem = $eventStaff->per_diem;
        foreach ($eventStaff->eventStaffDates as $eventStaffDate) {
            $startHour = $eventStaffDate->start_hour_event_staff_date;
            $endHour = $eventStaffDate->end_hour_event_staff_date;
            $startHourSplit = explode(":", $startHour);
            $endHourSplit = explode(":", $endHour);
            $totalHour = $endHourSplit[0] - $startHourSplit[0];
            $totalInHour += $totalHour;
        }
        $totalWithHour = $totalInHour * $hourlyRate;
        $nbDate = count($eventStaff->eventStaffDates);
        $totalPerDiem = $per_diem * $nbDate;
    }
    $remuneration = $totalWithHour + $distance + $totalPerDiem;
    return $remuneration;

}

function compressPlacehoder($name){
    $temp = explode('.', $name);
    $ext = $temp[count($temp) - 1];
    $nameToPrint = substr($name, 0, 27);
    if (strlen($name) > 27){
        return $nameToPrint.'...'.$ext;
    }else{
        return $name;
    }

}

function changeStaffImagePortraitPathEvent($event) {
    foreach ($event->eventStaffs as $eventStaff) {
        foreach ($eventStaff->eventStaffCandidateConfirmed as $keyCandidate => $eventStaffCandidate) {
            /*$eventStaff->eventStaffCandidateConfirmed[$keyCandidate]->staff->picture*/
            $eventStaffCandidate->staff->picture_pic = $eventStaffCandidate->staff->getImagePortraitPath();
        }
    }
    return $event;
}

/*function rangeDone($eventStaffs) {
    $range = 0;
    foreach ($eventStaffs as $eventStaff) {
        $range = $eventStaff->distance;
        if ($range == "" || $range == 0) {
        $range = 0;
        }
    }

    
    return $range;
}*/

function convertToTwelveHour($hour24){
    $hour = 0;
    $minute = 0;
    $AmPm = "";
    $hour24Split = explode(":", $hour24);
    $hour24 = (int)$hour24Split[0];
    $hour = ($hour24 <= 12)? $hour24 : $hour24 - 12;
    $minute = $hour24Split[1];
    $AmPm = ($hour24 < 12)? "AM" : "PM";
    return $hour.":".$minute." ".$AmPm;
}
