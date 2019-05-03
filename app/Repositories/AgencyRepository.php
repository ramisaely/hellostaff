<?php
 
namespace App\Repositories;

use App\Models\Agency;
use App\User;
use App\Models\AgencyStaff;
use App\Models\Staff;
use App\Models\EventCandidate;
use App\Models\EventFacture;


use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Auth;
use App\Interfaces\AgencyRepositoryInterface;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;

class AgencyRepository implements AgencyRepositoryInterface
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
	public function __construct(Agency $model)
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
 
	/**
	 * Get task by id.
	 **/
	public function getById($id)
	{
		return $this->model::with('users')->find($id);
	}
 
	/**
	 * Create a new task.
	 **/
	public function create($attributes, $file_name)
	{	
		// Agency
	    $this->model->name = $attributes['name_entreprise'];
		$this->model->address = $attributes['address_entreprise'];
		$this->model->number = $attributes['num_entreprise'];
		$this->model->city = $attributes['city'];
		$this->model->tps = $attributes['tps'];
		$this->model->tvq = $attributes['tvq'];
		$this->model->postal_code = $attributes['postal_code'];
		$this->model->province = $attributes['province'];
		$this->model->country = $attributes['country'];
		$this->model->description_fr = $attributes['description_fr'];
		//$this->model->description_en = $attributes['description_en'];
		$this->model->phone = $attributes['agency_phone'];
		$this->model->email = $attributes['agency_mail'];
		$this->model->logo = $file_name['company_logo'];
		$this->model->main_user = $attributes['last_name_personal'][0]." ".$attributes['first_name_personal'][0];
		
		$this->model->save();
		
		$users = [];
		for ($i = 0; $i<sizeof($attributes['first_name_personal']); $i++){
			//Users
			
			$user = new User();
			$user->role_id = 2;
			$user->first_name = $attributes['first_name_personal'][$i];
			$user->last_name = $attributes['last_name_personal'][$i];
			$user->email = $attributes['email'][$i];
			$user->phone = $attributes['phone'][$i];
			$user->language_code = getLanguageCode();
			$user->password = Hash::make($attributes['password'][$i]);
			$user->save();
			$users[]=$user;
			
			//table pivot
			$this->model->users()->attach($user);
		}
		
		return $users;
	}
 
	/**
	 * Update a task.
	 **/
	public function update($id, $attributes, $file_name)
	{
		// Agency
		$this->model = $this->model->find($id);
	    $this->model->main_user = $attributes['main_user'];
		$this->model->description_fr = $attributes['description'];
		$this->model->phone = $attributes['agency_phone'];
		$this->model->email = $attributes['agency_mail'];
		if ($file_name['image'] != ""){
		$this->model->logo = $file_name['image'];
		}
		$this->model->save();
		$this->model->users()->detach();
		$usersMail = [];
		for ($i = 0; $i<sizeof($attributes['first_name']); $i++){
			//Users
			$utilisateur = User::find(isset($attributes["id_users"][$i])?$attributes["id_users"][$i]:0);
			
			$user = User::findOrNew(isset($attributes["id_users"][$i])?$attributes["id_users"][$i]:0);
			$user->role_id = 2;
			$user->first_name = $attributes['first_name'][$i];
			$user->last_name = $attributes['last_name'][$i];
			$user->email = $attributes['email'][$i];
			$user->phone = $attributes['phone'][$i];
			$user->language_code = $attributes['language_code'];
			if (isset($attributes['password'][$i])) {
			$user->password = Hash::make($attributes['password'][$i]);
			}
			$user->save();
			if ($utilisateur === null) {
				array_push($usersMail, $user);
			}
			//table pivot

			$this->model->users()->attach($user);
		}
		return $usersMail;
	}
 
	/**
	 * Delete a task.
	 **/
	public function delete($id)
	{
		return $this->model->find($id)->delete();
	}
	/*
	Verifier formulaire unique
	*/
	/*
	Phone Unique
	*/
	public function verifyUnique($phone)
	{
		$phone = $this->model->where('phone', $phone)->first();
		if($phone)
	        return true;
	    else
	        return false;
	}

	/*
	Email Unique
	*/
	public function verifyUniqueMail($email)
	{
		$email = $this->model->where('email', $email)->first();
		if($email)
	        return true;
	    else
	        return false;
	}
	/*
	Phone Personnal Unique
	*/
	public function verifyUniquePersPhone($phones)
	{
		$user = new User();
		$phone = $user->where('phone', $phones)->first();
		if($phone)
	        return true;
	    else
	        return false;
	}
	public function verifyUniquePersEmail($emails)
	{
		$user = new User();
		$email = $user->where('email', $emails)->first();
		if($email)
	        return true;
	    else
	        return false;
	}

	public function findPassword($motdepasse, $userId)
	{
		LaravelChromeLogger::log($motdepasse);


		$password = User::where('id', $userId)->first();
		LaravelChromeLogger::log(Hash::make("Hery@1891")."==".$password->password);
		$pass = "Hery@1891";
		if ($password && Hash::check($motdepasse, $password->password)){
	        return true;
		}
	    else{
	        return false;
	    }
	}

	public function showStaffInArray(){
		$agencyId = Auth::user()->agency->first()->id;
		$agencyStaff = AgencyStaff::with('staff', 'staff.user')->where('agency_id', $agencyId)->orderBy('id', 'DESC')->get();
				
		return $agencyStaff;
	}

	public function addStaffToMyStaff($idUserStaff){
		$agencyId = Auth::user()->agency->first()->id;
        $staff = Staff::where('user_id', $idUserStaff)->first();
        $staffId = $staff->id;

        $agency_staffResponse = [];

        $myStaff = AgencyStaff::where('staff_id',$staffId)->where('agency_id', $agencyId)->first();
        if($myStaff){
        	$agency_staffResponse['b'] = true;
        	$agency_staffResponse['myStaff'] = $myStaff;
        	return $agency_staffResponse;
        }else{
        $agencyStaff = new AgencyStaff();
        $agencyStaff->agency_id = $agencyId;
        $agencyStaff->staff_id = $staffId;
        $agencyStaff->save();
        	$agency_staffResponse['b'] = [false, $agencyStaff];
        	$agency_staffResponse['myStaff'] = $agencyStaff;
        	return $agency_staffResponse;
        }
	}

	public function deleteAgencyStaff($id, $idStaff)
	{
		$delete = AgencyStaff::find($id)->delete();
		return Staff::with('user')->where('id',$idStaff)->first();
	}

	public function deleteCandidate($id)
	{
		return EventCandidate::find($id)->delete();
	}

	public function store_budget($attributes){

		$all_budget = [];
		for ($i=0; $i < sizeof($attributes['idEventStaff']); $i++) { 
			$all_budget[$i] = []; 
			$idFacture = $attributes['idFacture'][$i];
			$idFactureSplit = explode(",", $idFacture);
			for ($j=0; $j < sizeof($attributes['idStaff'][$i]); $j++) { 
				for ($k=0; $k < sizeof($attributes['date_start'][$i]) ; $k++) {
					$a = sizeof($attributes['date_start'][$i])*$j+$k;
					$budget = EventFacture::findOrNew(isset($idFactureSplit[$a])?$idFactureSplit[$a]:0);
					$budget->event_staff_id = $attributes['idEventStaff'][$i];
					$budget->staff_id = $attributes['idStaff'][$i][$j];
					$budget->event_staff_date_id = $attributes['idEventStaffDate'][$i][$k];
					$budget->range_done = $attributes['range'][$i][$j];
					$budget->expense = $attributes['expense'][$i][$j];
					$budget->remuneration = $attributes['remuneration'][$i][$j];
					$budget->start_hour_done = $attributes['hourStart'][$i][$k];
					$budget->end_hour_done = $attributes['hourEnd'][$i][$k];
					$budget->startDate_event = $attributes['date_start'][$i][$k];
					$budget->save();
					array_push($all_budget[$i], $budget->id);
				}
					
			}
		}
		LaravelChromeLogger::log($all_budget);
		return $all_budget;
	}

}