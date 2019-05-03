<?php
 
namespace App\Repositories;
 
use App\Models\EventAgency;
use App\Models\EventStaff;
use App\Models\EventStaffDate;
use App\Models\Agency;
use App\Models\Job;
use App\Models\Staff;
use App\Models\Mobility;
use App\Models\JobTranslation;
use App\Models\MobilityTranslation;
use App\Models\EventFacture;

use App\Models\EventAgencyStatement;
use App\Models\EventAgencyStatementQuestionAnswer;

use App\Models\EventCandidate;
use App\Models\Event_Assessment;
use App\Models\StatusEventTranslation;

use App\User;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Cookie;
use App\Interfaces\EventRepositoryInterface;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;

class EventRepository implements EventRepositoryInterface 
{
    /**
	 * @var $model
	 */
	private $model;
 
	/**
	 * EloquentTask constructor.
	 *
	 * @param App\Task $model
	 */
	public function __construct(EventAgency $model)
	{
		$this->model = $model;
	}
 
	/**
	 * Get all tasks.
	 **/
	public function getAll()
	{
		return $this->model->with('agency', 'eventStaffs', 'eventStaffs.eventStaffDates')->get();
		/*return $this->model->all();*/
	}
 
	/**
	 * Get task by id.
	 **/
	public function getById($id)
	{
		return $this->model->with(['agency', 'eventStaffs', 'eventStaffs.eventStaffCandidateConfirmed', 'eventStaffs.eventStaffCandidateConfirmed.staff', 'eventStaffs.eventStaffCandidateConfirmed.staff.user', 'eventStaffs.eventStaffCandidateConfirmed.staff.staffAssessment' => function ($query) use ($id){
				$query->where('event_id', $id);
		}, 'eventStaffs.eventStaffJobs', 'eventStaffs.eventStaffDates'])->find($id);
	}
 
	/**
	 * Create a new task.
	 **/
	public function create($attributes, $file_name)
	{	
		//event
		$agency = Auth::user()->agency->first()->id;
		if(isset($file_name['portrait'])){
			$this->model->picture_event = $file_name['portrait'];
		}
		$this->model->agency_id = $agency;
		$this->model->name = $attributes['name'];
		$this->model->customer = $attributes['customer'];
		$this->model->location_event = $attributes['location_event'];
		$this->model->zip_event = $attributes['zip_event'];
		$this->model->country_event = $attributes['country_event'];
		$this->model->zone_event = $attributes['zone_event'];
		$this->model->start_date = \Carbon\Carbon::parse($attributes['start']);
		$this->model->end_date =  \Carbon\Carbon::parse($attributes['end']);
		$this->model->description_fr_event = $attributes['event_description_fr'];
		$this->model->save();

		$id_user = $attributes['id_users'];
		$id_users_array = explode(",", $id_user);
		for ($i=0; $i<sizeof($id_users_array) ; $i++) {
			$user = User::find($id_users_array[$i]);
			//Table Pivot
			$this->model->managedBy()->attach($user);
		}
		$idZone = $attributes['mobilityIdStaff'];
		$mobility = Mobility::find($idZone);
		$this->model->eventMobility()->attach($mobility);

		$id_event = $this->model->id;

		for ($k = 0; $k<sizeof($attributes['post']); $k++){
			//Event Staff
			
			$eventStaff = new EventStaff();

			$eventStaff->event_id = $id_event;
			$eventStaff->post = $attributes['post'][$k];
			$eventStaff->necessary_staff = $attributes['necessary_staff'][$k];
			$eventStaff->location_event_staff = $attributes['location_event_staff'][$k];
			$eventStaff->zip_event_staff = $attributes['zip_event_staff'][$k];
			$eventStaff->country_event_staff = $attributes['country_event_staff'][$k];
			$eventStaff->zone_event_staff = $attributes['zone_event_staff'][$k];
			/*$hourly_rate = $attributes['hour_rate'][$k]; 
			$hour_rate = substr($hourly_rate, 0, 2);*/
			$eventStaff->hour_rate = $attributes['hour_rate'][$k];
			$eventStaff->description_fr_event_staff = $attributes['description_fr_event_staff'][$k];
			$eventStaff->distance = (isset($attributes['distance'][$k]))? $attributes['distance'][$k] : null;
			$eventStaff->per_diem = (isset($attributes['perdiem'][$k]))? $attributes['perdiem'][$k] : null;
			$eventStaff->color_event_staff = $attributes['color_choose'][$k];
			$eventStaff->save();


			$idJob = $attributes['jobIdStaff'][$k];
			$eventStaff->eventStaffJobs()->attach($idJob);
			$idZoneEvent = $attributes['mobilityIdEventStaff'][$k];
			$eventStaff->eventStaffMobility()->attach($idZoneEvent);

			//Event Staff Date
			$idEventStaff = $eventStaff->id;
			for ($l=0; $l<sizeof($attributes['startDaily'][$k]) ; $l++) { 
				$eventStaffDate = new EventStaffDate();
				$eventStaffDate->event_staff_id = $idEventStaff;
				$start_daily = $attributes['startDaily'][$k][$l];
				$eventStaffDate->date_start = \Carbon\Carbon::parse($start_daily);
				$start_hour_daily = $attributes['startHourDaily'][$k][$l];
				$eventStaffDate->start_hour_event_staff_date = \Carbon\Carbon::parse($start_hour_daily);
				$end_daily = $attributes['endDaily'][$k][$l];
				$eventStaffDate->date_end =  \Carbon\Carbon::parse($end_daily);
				$end_hour_daily = $attributes['endHourDaily'][$k][$l];
				$eventStaffDate->end_hour_event_staff_date =  \Carbon\Carbon::parse($end_hour_daily);
				$eventStaffDate->color_event_staff_date = $attributes['color_tab'][$k][$l];

				$eventStaffDate->save();
			}
		}
		return $this->model;
	}
 
	/**
	 * Update a task.
	 **/
	public function update($attributes, $file_name)
	{
		/*LaravelChromeLogger::log("repo");
        LaravelChromeLogger::log($event_staff_toRemove);
        console('test repo');*/

		$agency = Auth::user()->agency->first()->id;
		$idEvent = $attributes['id_event'];
		$this->model = $this->model->find($idEvent);

		$this->model->agency_id = $agency;
		if ($file_name['portrait'] != ""){
		$this->model->picture_event = $file_name['portrait'];
		}
		$this->model->name = $attributes['name_event'];
		$this->model->customer = $attributes['customer'];
		$this->model->location_event = $attributes['location_event'];
		$this->model->zip_event = $attributes['zip_event'];
		$this->model->country_event = $attributes['country_event'];
		$this->model->zone_event = $attributes['zone_event'];
		$this->model->start_date = \Carbon\Carbon::parse($attributes['start']);
		$this->model->end_date =  \Carbon\Carbon::parse($attributes['end']);
		$this->model->description_fr_event = $attributes['event_description_fr'];
		$this->model->save();

		$this->model->managedBy()->detach();
		$id_user = $attributes['id_users'];
		$id_users_array = explode(",", $id_user);
		for ($i=0; $i<sizeof($id_users_array) ; $i++) {
			$user = User::find($id_users_array[$i]);
			//Table Pivot
			$this->model->managedBy()->attach($user);
		}

		$this->model->eventMobility()->detach();
		$idZone = $attributes['mobilityIdStaff'];
		$mobility = Mobility::find($idZone);
		$this->model->eventMobility()->attach($mobility);




		$id_event = $this->model->id;
		for ($k = 0; $k<sizeof($attributes['post']); $k++){
			//Event Staff
			$eventStaff = EventStaff::findOrNew(isset($attributes["idEventStaff"][$k])?$attributes["idEventStaff"][$k]:0);
			$eventStaff->event_id = $id_event;
			$eventStaff->post = $attributes['post'][$k];
			$eventStaff->necessary_staff = $attributes['necessary_staff'][$k];
			$eventStaff->location_event_staff = $attributes['location_event_staff'][$k];
			$eventStaff->zip_event_staff = $attributes['zip_event_staff'][$k];
			$eventStaff->country_event_staff = $attributes['country_event_staff'][$k];
			$eventStaff->zone_event_staff = $attributes['zone_event_staff'][$k];
			/*$hourly_rate = $attributes['hour_rate'][$k]; 
			$hour_rate = substr($hourly_rate, 0, 2);*/
			$eventStaff->hour_rate = $attributes['hour_rate'][$k];
			$eventStaff->description_fr_event_staff = $attributes['description_fr_event_staff'][$k];
			$eventStaff->distance = $attributes['distance'][$k];
			$eventStaff->per_diem = $attributes['perdiem'][$k];
			$eventStaff->color_event_staff = $attributes['color_choose'][$k];
			
			$eventStaff->save();

			$eventStaff->eventStaffJobs()->detach();
			$idJob = $attributes['jobIdStaff'][$k];
			$eventStaff->eventStaffJobs()->attach($idJob);
			
			$eventStaff->eventStaffMobility()->detach();
			$idZoneEvent = $attributes['mobilityIdEventStaff'][$k];
			$eventStaff->eventStaffMobility()->attach($idZoneEvent);

			//Event Staff Date
			$idEventStaff = $eventStaff->id;
			
			for ($l=0; $l<sizeof($attributes['startDaily'][$k]) ; $l++) { 
				$eventStaffDate = EventStaffDate::findOrNew(isset($attributes["idEventStaffDate"][$k][$l])?$attributes["idEventStaffDate"][$k][$l]:0);
				$eventStaffDate->event_staff_id = $idEventStaff;
				$start_daily = $attributes['startDaily'][$k][$l];
				$eventStaffDate->date_start = \Carbon\Carbon::parse($start_daily);
				$start_hour_daily = $attributes['startHourDaily'][$k][$l];
				$eventStaffDate->start_hour_event_staff_date = \Carbon\Carbon::parse($start_hour_daily);
				$end_daily = $attributes['endDaily'][$k][$l];
				$eventStaffDate->date_end =  \Carbon\Carbon::parse($end_daily);
				$end_hour_daily = $attributes['endHourDaily'][$k][$l];
				$eventStaffDate->end_hour_event_staff_date =  \Carbon\Carbon::parse($end_hour_daily);
				$eventStaffDate->color_event_staff_date = $attributes['color_tab'][$k][$l];

				$eventStaffDate->save();
			}
		}

		if ($attributes['event_staffs_toRemove']){
			$event_staffs_toRemove = explode(",", $attributes['event_staffs_toRemove']);
			for ($i = 0; $i<sizeof($event_staffs_toRemove); $i++) {
				$eventStaff = EventStaff::find($event_staffs_toRemove[$i]);
				$eventStaff->delete();
			}
		}
		if ($attributes['event_staffs_dates_toRemove']){
			$event_staffs_dates_toRemove = explode(",", $attributes['event_staffs_dates_toRemove']);
			for ($i = 0; $i<sizeof($event_staffs_dates_toRemove); $i++) {
				$eventStaffDate = EventStaffDate::find($event_staffs_dates_toRemove[$i]);
				$eventStaffDate->delete();
			}
		}
		return $this->model;
	}
 
	/**
	 * Delete a task.
	 **/
	public function delete($id)
	{
		return $this->model->find($id)->delete();
	}

	public function showImageEvent(){
		$agency = Auth::user()->agency->first()->id;
        $events = $this->model->where('agency_id', $agency)->whereDate('end_date','>=',\Carbon\Carbon::now())->orderBy('id', 'DESC')->with(['eventStaffs', 'eventStaffs.eventStaffDates', 'eventStaffs.eventStaffCandidateConfirmed', 'eventStaffs.eventStaffCandidateConfirmed.staff', 'eventStaffs.eventStaffCandidateConfirmed.staff.user', 'managedBy', 'eventMobility'])->get();
        return $events;
	}

	public function showImageEventFinished(){
		$agency = Auth::user()->agency->first()->id;
        $events = $this->model->where('agency_id', $agency)->whereDate('end_date','<',\Carbon\Carbon::now())->orderBy('id', 'DESC')->with(['eventStaffs', 'eventStaffs.eventStaffDates', 'eventStaffs.eventStaffCandidateConfirmed', 'eventStaffs.eventStaffCandidateConfirmed.staff', 'eventStaffs.eventStaffCandidateConfirmed.staff.user', 'managedBy', 'eventMobility'])->get();
        return $events;
	}

	public function reloadStaffConfirmed(){
		$agency = Auth::user()->agency->first()->id;
        $events = $this->model->where('agency_id', $agency)->orderBy('id', 'DESC')->with(['eventStaffs', 'eventStaffs.eventStaffDates', 'eventStaffs.eventStaffCandidateConfirmed', 'eventStaffs.eventStaffCandidateConfirmed.staff', 'eventStaffs.eventStaffCandidateConfirmed.staff.user', 'managedBy', 'eventMobility'])->get();
        return $events;
	}

	public function registerEventStatement($eventStatement){

		// Remove Question
		if (isset($eventStatement['questionToRemove'])){
			for ($i=0; $i<sizeof($eventStatement['questionToRemove']); $i++){
				if ($eventStatement['questionToRemove'][$i] != null && $eventStatement['questionToRemove'][$i] != ''){
					$event_statement_question_answer_to_remove = EventAgencyStatementQuestionAnswer::find($eventStatement['questionToRemove'][$i]);
					if ($event_statement_question_answer_to_remove){
						$event_statement_question_answer_to_remove->delete();
					}
				}
			}
		}

		// Remove EventStatement
		if (isset($eventStatement['eventStatementToRemove'])){
			for ($i=0; $i<sizeof($eventStatement['eventStatementToRemove']); $i++){
				if ($eventStatement['eventStatementToRemove'][$i] != null && $eventStatement['eventStatementToRemove'][$i] != ''){
					$event_statement_to_remove = EventAgencyStatement::find($eventStatement['eventStatementToRemove'][$i]);
					if ($event_statement_to_remove){
						$event_statement_to_remove->delete();
					}
				}
			}
		}

		// Create Or Update Last Questions, Answers and Event Reports
		$agency_id = Auth::user()->agency->first()->id;
		for ($i = 0; $i < sizeof($eventStatement['id_users']); $i++){
			$id_user = (int) $eventStatement['id_users'][$i];
			$staff_id = Staff::where('user_id', $id_user)->first()->id;
			$eventExistant = EventAgencyStatement::where('event_id', (int) $eventStatement['id_event'])->where('agency_id', $agency_id)->where('staff_id', $staff_id)->first();
			if ($eventExistant){
				for ($j = 0; $j < sizeof($eventStatement['questions'][$i]); $j++){
					$event_statement_question_answer = null;
					if($eventStatement['question_id'][$i][$j] != null){
						$event_statement_question_answer = EventAgencyStatementQuestionAnswer::find($eventStatement['question_id'][$i][$j]);
					}
					if($event_statement_question_answer){
						if (trim($eventStatement['questions'][$i][$j]) != trim($event_statement_question_answer->question)){
							$event_statement_question_answer->question = $eventStatement['questions'][$i][$j];
							$event_statement_question_answer->answer = null;
							$event_statement_question_answer->save();
						} 
					}else{
						$event_statement_question_answer = new EventAgencyStatementQuestionAnswer();
						$event_statement_question_answer->event_statement_id = $eventExistant->id;
						$event_statement_question_answer->question = $eventStatement['questions'][$i][$j];
						$event_statement_question_answer->save();
					}
				}
			}else{
				$event_statement = new EventAgencyStatement();
				$event_statement->event_id = (int) $eventStatement['id_event'];
				$event_statement->agency_id = $agency_id;
				$event_statement->staff_id = $staff_id;
				$event_statement->save();
				for ($j = 0; $j < sizeof($eventStatement['questions'][$i]); $j++){
					$event_statement_question_answer = new EventAgencyStatementQuestionAnswer();
					$event_statement_question_answer->event_statement_id = $event_statement->id;
					$event_statement_question_answer->question = $eventStatement['questions'][$i][$j];
					$event_statement_question_answer->save();
				}
			}	
		}
		return (int) $eventStatement['id_event'];
	}

	public function getStatement(){
		$agency_id = Auth::user()->agency->first()->id;
		$statement = EventAgencyStatement::with('staffs', 'staffs.user' , 'eventStatementQuestionAnswers')->where('agency_id', $agency_id)->orderBy('id', 'DESC')->get();
		/*dd($statement);*/
		return $statement;
	}

	public function confirmCandidate($idEventCandidate){
		$eventCandidat = EventCandidate::find((int) $idEventCandidate['idEventCandidat']);
		$eventCandidat->status_event_id = 4;
		$eventCandidat->save();
		return $eventCandidat;
	}

	public function offerJob($attributes){
		$existCandidate = EventCandidate::where('staff_id', $attributes['staff_id'])->where('event_staff_id',$attributes['event_staff_id'])->first();
		if($existCandidate){
			return false;
		}else{
			$eventCandidate = new EventCandidate();
			$eventCandidate->staff_id = $attributes['staff_id'];
			$eventCandidate->event_staff_id = $attributes['event_staff_id'];
			$eventCandidate->status_event_id = 1;
			$eventCandidate->agency_id = Auth::user()->agency->first()->id;
			$eventCandidate->save();
			return true;
		}	
	}

	public function offerJobToAllStaff($attributes){
		foreach ($attributes['all_staff_id'] as $key => $staff_id) {
			$existCandidate = EventCandidate::where('staff_id', $staff_id)->where('event_staff_id',$attributes['event_staff_id'])->first();
			if(!$existCandidate){
				$eventCandidate = new EventCandidate();
				$eventCandidate->staff_id = $staff_id;
				$eventCandidate->event_staff_id = $attributes['event_staff_id'];
				$eventCandidate->status_event_id = 1;
				$eventCandidate->agency_id = Auth::user()->agency->first()->id;
				$eventCandidate->save();
			}	
		} return true;
	}

	public function updateHorary($attributes) {
		$eventStaff = EventStaff::find($attributes['event_staff_id']);
		$eventStaff->hour_rate = $attributes['horary'];
		$eventStaff->save();
		return $eventStaff;
	}

	public function getEventStaff(){
		$staff_id = Staff::where('user_id', Auth::user()->id)->first()->id;
		$event_candidates = EventCandidate::with('eventStaff','eventStaff.eventAgency', 'eventStaff.eventStaffDates', 'statusEvent')->where('staff_id', $staff_id)->get();
		//dd($event_candidates);
		return $event_candidates;
	}

	public function updateStatusOfEventCandidat($eventCandidatData){
		$eventCandidat = EventCandidate::find($eventCandidatData['id']);
		$eventCandidat->event_staff_id = $eventCandidat->event_staff_id;
		$eventCandidat->staff_id = $eventCandidat->staff_id;
		$eventCandidat->status_event_id = (int) $eventCandidatData['status_event_id'];
		$eventCandidat->save();
		return [$eventCandidat, $eventCandidat->statusEvent->getByLanguageId((int) $eventCandidatData['language_id'])->name];
	}

	public function seeCandidate($attributes){
		LaravelChromeLogger::log($attributes);
		$agency_id = Auth::user()->agency->first()->id;
		$seeCandidate = EventCandidate::where('agency_id', $agency_id)->where('status_event_id', '!=' , 4)->with(['eventStaff','staff','staff.user', 
			'staff.staffJobs' => function ($query) use ($attributes){
				$query->where('job_id', (int) $attributes['job_id']);
		}])->whereHas('eventStaff.eventStaffJobs', function ($query) use ($attributes) {
			$query->where('job_id', (int) $attributes['job_id']);
		})->paginate($attributes['paginate']);
		return $seeCandidate;
	}

	public function getEventsByStaffConfirmed() {
		$staff_id = Staff::where('user_id', Auth::user()->id)->first()->id;
		$event_candidate = EventCandidate::with('eventStaff', 'eventStaff.eventAgency')->where('staff_id', $staff_id)->where('status_event_id', 4)->get();
		$events=[];
		if ($event_candidate) {
			for ($i = 0; $i < sizeof($event_candidate); $i++) {
				$eventStaff = $event_candidate[$i]->eventStaff;
				$eventStaffId = $event_candidate[$i]->eventStaff->id;
				$eventId = $eventStaff->eventAgency->id;
				$event = $this->model->where('id', $eventId)->whereDate('end_date','>=',\Carbon\Carbon::now())->with(['agency', 'eventStaffs' => function ($query) use ($eventStaffId){
			$query->where('id', $eventStaffId);
		}, 'eventStaffs.eventStaffDates'])->first();
				if ($event) {
					$events[$i]=$event;
				}
			}
		}
		return $events;
	}

	public function getEventsByStaffConfirmedFinished() {
		$staff_id = Staff::where('user_id', Auth::user()->id)->first()->id;
		$event_candidate = EventCandidate::with('eventStaff', 'eventStaff.eventAgency')->where('staff_id', $staff_id)->where('status_event_id', 4)->get();
		$events=[];
		if ($event_candidate) {
			for ($i = 0; $i < sizeof($event_candidate); $i++) {
				$eventStaff = $event_candidate[$i]->eventStaff;
				$eventStaffId = $event_candidate[$i]->eventStaff->id;
				$eventId = $eventStaff->eventAgency->id;
				/*dd($eventId);*/
				$event = $this->model->where('id', $eventId)->whereDate('end_date','<',\Carbon\Carbon::now())->with(['agency', 'eventStaffs' => function ($query) use ($eventStaffId){
			$query->where('id', $eventStaffId);
		}, 'eventStaffs.eventStaffDates'])->first();
				if ($event) {
					$events[$i]=$event;
				}
			}
		}
		return $events;
	}

	public function evaluation_register($attributes){
		$evaluationIds = [];
		for ($i=0; $i < sizeof($attributes['ratingResponse']); $i++) { 
			$event_assessment = Event_Assessment::findOrNew(isset($attributes["id_assessment"][$i])?$attributes["id_assessment"][$i]:0);
			$event_assessment->staff_id = $attributes['id_staff'][$i];
			$event_assessment->event_id = $attributes['id_event'][$i];
			$event_assessment->agency_id = $attributes['id_agency'][$i];
			$event_assessment->event_staff_id = $attributes['id_eventStaff'][$i];
			$event_assessment->rating = $attributes['ratingResponse'][$i];
			$event_assessment->description = $attributes['description'][$i];
			$event_assessment->save();
			$evaluationIds[] = $event_assessment->id;
		}
		return $evaluationIds;
	}

	public function getByEventId($id, $idEventStaff)
	{
		return $this->model->with(['agency', 'eventStaffs' => function ($query) use ($idEventStaff){
			$query->where('id', $idEventStaff);
		}, 'eventStaffs.eventStaffJobs', 'eventStaffs.eventStaffDates'])->find($id);
	}

	public function getEventById($idEvent, $idEventStaff){
		
		return $this->model->with(['agency', 'eventStaffs' => function ($query) use ($idEventStaff){
			$query->where('id', $idEventStaff);
		}, 'eventStaffs.eventStaffJobs', 'eventStaffs.eventStaffDates', 'eventStaffs.eventStaffDates.eventFacture' => function ($query){
			$staffId =  Auth::user()->staff->id;
			$query->where('staff_id', $staffId);
		}])->find($idEvent);
	}

	public function storeInvoicies($attributes){
		$invoicieIds = [];
		for ($i=0; $i < sizeof($attributes['eventDate']); $i++) {
			$invoicies = EventFacture::findOrNew(isset($attributes["idFacture"][$i])?$attributes["idFacture"][$i]:0);
			$invoicies->event_staff_id = $attributes['idEventStaff'];
			$invoicies->staff_id = $attributes['idStaff'];
			if(isset($attributes['additional_info'])){
			$invoicies->additional_info = $attributes['additional_info'];
			}
			$invoicies->net_total = $attributes['net_total']; 
			$invoicies->range_done = $attributes['range_done'][$i];
			$invoicies->expense = $attributes['expense_amount'][$i];
			$invoicies->remuneration = $attributes['remunerations'][$i];
			$invoicies->start_hour_done = $attributes['hourEventStart'][$i];
			$invoicies->end_hour_done = $attributes['hourEventEnd'][$i];
			$eventDate = $attributes['eventDate'][$i];
			$eventDateSplit = explode(" ", $eventDate);
			$month = translateMonth($eventDateSplit[1]);
			
			$invoicies->startDate_event = \Carbon\Carbon::parse($eventDateSplit[0]."-".$month."-".$eventDateSplit[2]);
			$invoicies->event_staff_date_id = $attributes['idEventStaffDate'][$i];
			$invoicies->save();
			$invoicieIds[] = $invoicies->id;
		}

		return $invoicieIds;
	}

	public function find_facture($idEventStaff){
		$staffId = Auth::user()->staff->id;
		$bills = EventFacture::where('staff_id', $staffId)->where('event_staff_id', $idEventStaff)->with('eventStaff')->get();
		return $bills;
	}

}