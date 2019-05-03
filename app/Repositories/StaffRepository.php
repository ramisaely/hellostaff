<?php
 
namespace App\Repositories;
 
use App\Models\Staff;
use App\Models\StaffLanguage;
use App\Models\StaffJob;
use App\User;
use App\Models\StaffCertification;
use App\Models\StaffAttribut;
use App\Models\StaffAttributeOption;
use App\Models\StaffRemuneration;
use App\Models\StaffMobility;
use App\Models\EventAgencyStatement;
use App\Models\EventAgencyStatementQuestionAnswer;
use App\Models\EventStatementQuestionAnswerFile;
use App\Models\AgencyStaff;
use App\Models\EventAgency;
use App\Models\EventCandidate;
use App\Models\Event_Assessment;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Auth;
use App\Interfaces\StaffRepositoryInterface;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;

class StaffRepository implements StaffRepositoryInterface 
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
	public function __construct(Staff $model)
	{
		$this->model = $model;
	}
 
	/**
	 * Get all tasks.
	 **/
	public function getAll()
	{
		return $this->model->all();
	}


	/* get user by staff */

	public function getUserByStaff(){
		$users = User::where('role_id', 1)->get();
		return $users;
	}
 
	/**
	 * Get task by id.
	 **/
	public function getById($id)
	{
		return $this->model::with('user', 'staffLanguages', 'staffLanguages.allLanguage', 'staffAttribut', 'staffAttribut.StaffAttributeOption', 'staffMobility', 'staffCertification','staffMobility.mobility', 'staffJobs','staffJobs.job')->find($id);
	}
 
	/**
	 * Create a new task.
	 **/
	public function create($attributes, $file_name)
	{	
		$user = new User();
		$user->role_id = 1;
		$user->first_name = $attributes['first_name'];
		$user->last_name = $attributes['last_name'];
		$user->email = $attributes['email'];
		$user->phone = $attributes['phone'];
		$user->language_code = getLanguageCode();
		$user->password = Hash::make($attributes['password']);
		$user->save();
		
		//Staff
		$this->model->user_id = $user->id;
		$this->model->kind = $attributes['gender'];
		$month = $attributes['birth_month'];
		switch ($month) {
		 	case 'Janvier':
		 		$month = 1;
		 		break;
		 	case 'Février':
		 		$month = 2;
		 		break;
		 	case 'Mars':
		 		$month = 3;
		 		break;
		 	case 'Avril':
		 		$month = 4;
		 		break;
		 	case 'Mai':
		 		$month = 5;
		 		break;
		 	case 'Juin':
		 		$month = 6;
		 		break;
		 	case 'Juillet':
		 		$month = 7;
		 		break;
		 	case 'Août':
		 		$month = 8;
		 		break;
		 	case 'Septembre':
		 		$month = 9;
		 		break;
		 	case 'Octobre':
		 		$month = 10;
		 		break;
		 	case 'Novembre':
		 		$month = 11;
		 		break;
		 	case 'Décembre':
		 		$month = 12;
		 		break;
		 	case 'January':
		 		$month = 1;
		 		break;
		 	case 'February':
		 		$month = 2;
		 		break;
		 	case 'March':
		 		$month = 3;
		 		break;
		 	case 'April':
		 		$month = 4;
		 		break;
		 	case 'May':
		 		$month = 5;
		 		break;
		 	case 'June':
		 		$month = 6;
		 		break;
		 	case 'July':
		 		$month = 7;
		 		break;
		 	case 'August':
		 		$month = 8;
		 		break;
		 	case 'September':
		 		$month = 9;
		 		break;
		 	case 'October':
		 		$month = 10;
		 		break;
		 	case 'November':
		 		$month = 11;
		 		break;
		 	case 'December':
		 		$month = 12;
		 		break;
		 	
		 } 
		$birthday = $attributes['birth_year'].'-'.$month.'-'.$attributes['birth_day'];
		$this->model->birthday = \Carbon\Carbon::parse($birthday);
		$this->model->ages = $attributes['ages'];
		$this->model->city = $attributes['city'];
		$this->model->address = $attributes['address'];
		$this->model->zip_code = $attributes['zip_code'];
		$this->model->source = $attributes['source'];
		if(isset($file_name['portrait'])){
			$this->model->portrait_pic = $file_name['portrait'];
		}	
		if(isset($file_name['portrait_plein'])){
			$this->model->single_storey_pic = $file_name['portrait_plein'];
		}
		if(isset($file_name['cv'])){
			$this->model->cv = $file_name['cv'];	
		}
		$this->model->save();
		
		//StaffJob
		for ($j=0 ; $j<sizeof($attributes['job_checked']) ; $j++){
			if($attributes['job_checked'][$j] == "yes"){
				if($attributes['job_experience'][$j] != "no"){
					$staff_job = new StaffJob();
					$staff_job->staff_id = $this->model->id;
					$staff_job->job_id = $attributes['job_id'][$j];
					if ($attributes['job_experience'][$j] == "3+"){
						$staff_job->experience_year = 3;
					} else{
						$staff_job->experience_year = $attributes['job_experience'][$j];
					}
					$staff_job->save();
				}
			}
		}
		
		//StaffLanguage
		$language_choice_id = array();
		for ($k=0 ; $k<sizeof($attributes['all_language_choice_id']) ; $k++){
			if($attributes['all_language_choice_id'][$k] != null && $attributes['all_language_choice_id'][$k] != "-- Choisir --" 
				&& $attributes['all_language_choice_id'][$k] != "-- Choose --")
			{
				array_push($language_choice_id, $attributes['all_language_choice_id'][$k]);
			}
		}
		for ($i=0 ; $i<sizeof($attributes['language']) ; $i++){
			$staff_language = new StaffLanguage();
			$staff_language->staff_id = $this->model->id;
			$staff_language->all_language_id = $attributes['language'][$i];
			$staff_language->all_language_choice_id = $language_choice_id[$i];
			//$staff_language->level = $language_level[$i];
			$staff_language->save();
		}
		
		// StaffCertification
		$staff_certification = new StaffCertification();
		$staff_certification->staff_id = $this->model->id;
		if(isset($attributes['actra'])){
			$staff_certification->actra = 1;
		} else {
			$staff_certification->actra = 0;
		}
		if(isset($attributes['smart_serve'])){
			$staff_certification->smart_serve = 1;
		} else {
			$staff_certification->smart_serve = 0;
		}
		if(isset($attributes['foods'])){
			$staff_certification->food_handling = 1;
		} else {
			$staff_certification->food_handling = 0;
		}
		if(isset($attributes['uda'])){
			$staff_certification->uda = 1;
		} else {
			$staff_certification->uda = 0;
		}
		if(isset($attributes['car'][0])) {
			$staff_certification->have_car = $attributes['car'][0];
		}
		else {
			$staff_certification->have_car = 0;
		}
		
		// non obligation de cocher tous les permis de conduires: 1 seul suffit
		if(isset($attributes['drive'][0])) {
			$staff_certification->driver_license = $attributes['drive'][0];
		}
		else {
			$staff_certification->driver_license = 0;
		}
		if(isset($attributes['truck'][0])) {
			$staff_certification->driver_license_truck = $attributes['truck'][0];
		}
		else {
			$staff_certification->driver_license_truck = 0;
		}
		/*dd($attributes);*/
		$staff_certification->save();
		
		
		// StaffAttribut
		$staff_attribut = new StaffAttribut();
		$staff_attribut->staff_id = $this->model->id;
		if (isset($attributes['attributs'][0])){
			$staff_attribut->tattoo = $attributes['attributs'][0];
		}else{
			$staff_attribut->tattoo = 3;
		}
		if (isset($attributes['attributs'][1])){
			$staff_attribut->piercing = $attributes['attributs'][1];
		}else{
			$staff_attribut->piercing = 3;
		}
		if (isset($attributes['attributs'][2])){
			$staff_attribut->height=$attributes['attributs'][2];
		}else{
			$staff_attribut->height="";
		}

		$staff_attribut->not_pronounced = 0;
		$staff_attribut->save();
		
		// StaffAttributOption
		for ($l=0 ; $l<3 ; $l++){
			$staff_attribut_option = new StaffAttributeOption();
			$staff_attribut_option->staff_attribut_id = $staff_attribut->id;
			$staff_attribut_option->attribute_id = $l + 1;
			$staff_attribut_option->attribute_option_id = $attributes['attribute_option_id'][$l];
			$staff_attribut_option->save();
		}
		
		// StaffRemuneration
		$staff_remuneration = new StaffRemuneration();
		$staff_remuneration->staff_id = $this->model->id;
		$staff_remuneration->price = $attributes['price_remuneration'];
		if (isset($attributes['nas'])){
			$staff_remuneration->nas = $attributes['nas'];
		} else {
			$staff_remuneration->nas = '';
		}
		
		$staff_remuneration->save();
		
		//staffMobility
		for ($n=0 ; $n<sizeof($attributes['mobility']) ; $n++){
			$staff_mobility = new StaffMobility();
			$staff_mobility->staff_id = $this->model->id;
			$staff_mobility->mobility_id = $attributes['mobility'][$n];
			$staff_mobility->save();
		}
		
		return $user;
	}
 
	/**
	 * Update a task.
	 **/
	public function update($id, $attributes,$file_name)
	{
		dd($attributes);
		//$this->model->users()->detach();
		$user = User::find(isset($attributes["id_users"])?$attributes["id_users"]:'');
		$user->role_id = 1;
		$user->first_name = $attributes['first_name'];
		$user->last_name = $attributes['last_name'];
		$user->email = $attributes['email'];
		$user->phone = $attributes['phone'];
		$user->language_code = getLanguageCode();
		if (isset($attributes['password'])) {
			$user->password = Hash::make($attributes['password']);
		}
		$user->save();
		$this->model = $this->model->find($id);
		// $month = $attributes['birth_month'];
		// switch ($month) {
		//  	case 'Janvier':
		//  		$month = 1;
		//  		break;
		//  	case 'Février':
		//  		$month = 2;
		//  		break;
		//  	case 'Mars':
		//  		$month = 3;
		//  		break;
		//  	case 'Avril':
		//  		$month = 4;
		//  		break;
		//  	case 'Mai':
		//  		$month = 5;
		//  		break;
		//  	case 'Juin':
		//  		$month = 6;
		//  		break;
		//  	case 'Juillet':
		//  		$month = 7;
		//  		break;
		//  	case 'Août':
		//  		$month = 8;
		//  		break;
		//  	case 'Septembre':
		//  		$month = 9;
		//  		break;
		//  	case 'Octobre':
		//  		$month = 10;
		//  		break;
		//  	case 'Novembre':
		//  		$month = 11;
		//  		break;
		//  	case 'Décembre':
		//  		$month = 12;
		//  		break;
		//  	case 'January':
		//  		$month = 1;
		//  		break;
		//  	case 'February':
		//  		$month = 2;
		//  		break;
		//  	case 'March':
		//  		$month = 3;
		//  		break;
		//  	case 'April':
		//  		$month = 4;
		//  		break;
		//  	case 'May':
		//  		$month = 5;
		//  		break;
		//  	case 'June':
		//  		$month = 6;
		//  		break;
		//  	case 'July':
		//  		$month = 7;
		//  		break;
		//  	case 'August':
		//  		$month = 8;
		//  		break;
		//  	case 'September':
		//  		$month = 9;
		//  		break;
		//  	case 'October':
		//  		$month = 10;
		//  		break;
		//  	case 'November':
		//  		$month = 11;
		//  		break;
		//  	case 'December':
		//  		$month = 12;
		//  		break;
		 	
		//  } 
		// $birthday = $attributes['birth_year'].'-'.$month.'-'.$attributes['birth_day'];
		// $this->model->birthday = \Carbon\Carbon::parse($birthday);
	    $this->model->city = $attributes['city'];
	    $this->model->zip_code = $attributes['zip_code'];
	    $this->model->address = $attributes['address'];
	    if(isset($file_name['head_shot_photo']) && $attributes['shot_photo']==1 ){
			$this->model->portrait_pic = $file_name['head_shot_photo'];
		}
		if(isset($file_name['upper_body_photo']) && $attributes['body_photo']==1){
			$this->model->single_storey_pic = $file_name['upper_body_photo'];
		}
		if(isset($file_name['resume']) && $attributes['resume_photo']==1){
			$this->model->cv = $file_name['resume'];	
		}
	    $this->model->save();
	    //Staff attributes
	    $staff_attribut = StaffAttribut::find($attributes['attributs_id']);
		$staff_attribut->staff_id = $this->model->id;
		if (isset($attributes['tatou_visible'])){
			$staff_attribut->tattoo = $attributes['tatou_visible'][0];
		}
		if (isset($attributes['piercing_visible'])){
			$staff_attribut->piercing = $attributes['piercing_visible'][0];
		}

		$staff_attribut->not_pronounced = 0;
		$staff_attribut->height = $attributes['size'];
		$staff_attribut->save();
		// staff attribute option
		if (isset($attributes['staff_att'])){
			for ($i = 0; $i<sizeof($attributes['attribute']); $i++){
		    	$staff_attribut_option = StaffAttributeOption::find($attributes['staff_att'][$i]);
				$staff_attribut_option->staff_attribut_id = $staff_attribut->id;
				$staff_attribut_option->attribute_id = $attributes['attribute'][$i];
				$increments = $i+1;
				$id = 'sizeAttribute'.$increments;
				$staff_attribut_option->attribute_option_id = $attributes[$id][0];
		    	$staff_attribut_option->save();
	    	}
		}
	    //StaffJob
	    for ($n=0; $n <sizeof($attributes['creat_job']) ; $n++) { 
			if (isset($attributes['creat_job'][$n]) && isset($attributes['job_exp'][$n])) {
				$staff_job = new StaffJob();
				$staff_job->staff_id = $this->model->id;
				$staff_job->job_id = $attributes['creat_job'][$n];
				$staff_job->experience_year = $attributes['job_exp'][$n];
				$staff_job->save();
			}
		}
		for ($o=0; $o <sizeof($attributes['remove_job']) ; $o++) { 
			if (isset($attributes['remove_job'][$o])) {
				$staff_jobremove = StaffJob::find($attributes['remove_job'][$o]);
				$staff_jobremove->delete();
			}
		}
		for ($j=0 ; $j<sizeof($attributes['update_job']) ; $j++){
			if(isset($attributes['update_job'][$j])){
				if(isset($attributes['update_exp'][$j])){
					$staff_job = StaffJob::find($attributes['update_job'][$j]);
					$staff_job->staff_id = $this->model->id;
					$staff_job->job_id = $attributes['update_id_job'][$j];
					$staff_job->experience_year = $attributes['update_exp'][$j];
					$staff_job->save();
				}
			}
		}
		//staff certification
		$staff_certification = StaffCertification::find($attributes['staff_certification']);
		$staff_certification->staff_id = $this->model->id;
		if(isset($attributes['actra'])){
			$staff_certification->actra = $attributes['actra'];
		}
		if(isset($attributes['smart_serve'])){
			$staff_certification->smart_serve = $attributes['smart_serve'];
		}
		if(isset($attributes['foods'])){
			$staff_certification->food_handling = $attributes['foods'];
		}
		if(isset($attributes['uda'])){
			$staff_certification->uda = $attributes['uda'];
		}
		if(isset($attributes['car'])) {
			$staff_certification->have_car = $attributes['car'];
		}
		
		// non obligation de cocher tous les permis de conduires: 1 seul suffit
		if(isset($attributes['drive'])) {
			$staff_certification->driver_license = $attributes['drive'];
		}
		if(isset($attributes['truck'])) {
			$staff_certification->driver_license_truck = $attributes['truck'];
		}
		/*dd($attributes);*/
		$staff_certification->save();

		//staffMobility
		for ($n=0 ; $n<sizeof($attributes['mob_create']) ; $n++){
			if(isset($attributes['mob_create'][$n])){
				$staff_mobility = new StaffMobility();
				$staff_mobility->staff_id = $this->model->id;
				$staff_mobility->mobility_id = $attributes['mob_create'][$n];
				$staff_mobility->save();
			}
		}
		for ($m=0; $m <sizeof($attributes['mob_remove']) ; $m++) { 
			if(isset($attributes['mob_remove'][$m])){
				$staff_mob = StaffMobility::find($attributes['mob_remove'][$m]);
				$staff_mob->delete();
			}
		}
		//StaffLanguage
		for ($n=0; $n <sizeof($attributes['creat_langue']) ; $n++) { 
			if (isset($attributes['creat_langue'][$n]) && isset($attributes['level'][$n])) {
				$staff_language = new StaffLanguage();
				$staff_language->staff_id = $this->model->id;
				$staff_language->all_language_id = $attributes['creat_langue'][$n];
				$staff_language->all_language_choice_id = $attributes['level'][$n];
				$staff_language->save();
			}
		}
		for ($o=0; $o <sizeof($attributes['remove_langue']) ; $o++) { 
			if (isset($attributes['remove_langue'][$o])) {
				$staff_languageremove = StaffLanguage::find($attributes['remove_langue'][$o]);
				$staff_languageremove->delete();
			}
		}
		for ($l=0 ; $l<sizeof($attributes['update_langue']) ; $l++){
			if(isset($attributes['update_langue'][$l])){
					
				if(isset($attributes['update_level'][$l])){
					$staff_language = StaffLanguage::find($attributes['update_langue'][$l]);
					$staff_language->staff_id = $this->model->id;
					$staff_language->all_language_id = $attributes['update_id'][$l];
					$staff_language->all_language_choice_id = $attributes['update_level'][$l];
					//$staff_language->level = $language_level[$i];
					$staff_language->save();
				}
			}
		}
		//return $this->model->find($id)->update($attributes);
		return $user;
	}
 
	/**
	 * Delete a task.
	 **/
	public function delete($id)
	{
		return $this->model->find($id)->delete();
	}

	/** Exist email **/
	public function verifyEmail($email){
		/*$user = new User();*/
		$emails = User::where('email',$email)->first();
		if($emails){
			return true;
		}else{
			return false;
		}
	}

	/** Exist phone **/
	public function verifyPhone($phone){
		$user = new User();
		$phones =$user->where('phone',$phone)->first();
		if($phones){
			return true;
		}else{
			return false;
		}
	} 

	//Filter candidate new staff
	public function filterCandidate($attributes) {
		$paginate = $attributes['paginate'];
		return $this->model->leftJoin('agency_staff', 'agency_staff.staff_id', '=', "staff.id")->where("agency_staff.staff_id", null)
		->filter($attributes)->with(['user', 'staffJobs' => function ($query) use ($attributes) {
        	$query->where('job_id', $attributes['job_id']);
    	}])->select('staff.*')->paginate($paginate);
	}

	//filter candidate my staff
	public function filterMyCandidate($attributes) {
		$paginate = $attributes['paginate'];
		return AgencyStaff::with(['staff.user', 'staff.staffJobs' => function ($query) use ($attributes) {
        	$query->where('job_id', $attributes['job_id']);
    	}])->whereHas('staff' , function ($query) use ($attributes){
			$query->filter($attributes);
		})->paginate($paginate);
	}

	public function showStaff(){
		$staffs = $this->model->leftJoin('agency_staff', 'agency_staff.staff_id', '=', "staff.id")->where("agency_staff.staff_id", null)
		->leftJoin('users', 'users.id', '=', "user_id")->where("users.email_verified_at", '<>', null)->get();
		return $staffs;
	}

	public function show_Staff($idStaff){
		$user = User::with('staff')->where('id', $idStaff)->first();
		return $user->staff;
	}

	public function show_Staff_for_my_staff($idStaff){
		$staff = $this->model->where('id', $idStaff)->first();

		return $staff;
	}

	public function showReport(){
		$staffId = Auth::user()->staff->id;
		$eventCandidate = EventCandidate::with('eventStaff.eventAgency')->where('staff_id', $staffId)->where('status_event_id', 4)->first();
		/*$eventId = $eventCandidate->eventStaff->eventAgency->id;*/
		/*LaravelChromeLogger::log($eventCandidate);*/
		$reports = EventAgencyStatement::with('eventStatementQuestionAnswers')->where('staff_id', $staffId)->orderBy('id', 'DESC')->get();
		return $reports;
	}

	public function insertAnswer($attributes, $file_name){
		$ids = $attributes['idQuestion'];
		/*LaravelChromeLogger::log($ids);*/
		for ($i=0; $i < sizeof($ids) ; $i++) { 
			$answers = EventAgencyStatementQuestionAnswer::find($ids[$i]);
			$answers->answer = $attributes['answer'][$i];
			$answers->save();

			$idAnswer = $answers->id;

			if(isset($file_name[$i])){
				for ($j=0; $j < sizeof($file_name[$i]) ; $j++) { 
				$files = new EventStatementQuestionAnswerFile();
				$files->question_answer_id = $idAnswer;
				$files->name = $file_name[$i][$j];
				$files->save();

				}
		  	}

			if(isset($attributes['idRemove'][$i])){
			$idToRemove = $attributes['idRemove'][$i];
			$idRemove = substr($idToRemove, 0, -1);
			$idRemoveSplit = explode(',', $idRemove);
				for ($k=0; $k <sizeof($idRemoveSplit) ; $k++) { 
					$files_remove = EventStatementQuestionAnswerFile::find($idRemoveSplit[$k]);
					$files_remove->delete();
				}
		  }
		}
		return $answers;

	}

	public function findEvaluation(){
		$staffId = Auth::user()->staff->id;
		$evaluations = Event_Assessment::where('staff_id', $staffId)->orderBy('id', 'DESC')->get();
		return $evaluations;
	}

}