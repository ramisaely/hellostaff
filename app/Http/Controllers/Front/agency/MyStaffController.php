<?php

namespace App\Http\Controllers\Front\agency;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\EventAgency;
use App\Models\Job;
use Illuminate\Support\Facades\Auth;
use App\Interfaces\EventRepositoryInterface;
use App\Interfaces\StaffRepositoryInterface;
use App\Interfaces\AgencyRepositoryInterface;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;

class MyStaffController extends Controller
{
    protected $event_repository;
    protected $staff_repository;
    protected $agency_repository;

    public function __construct(EventRepositoryInterface $event_repo, StaffRepositoryInterface $staff_repo,AgencyRepositoryInterface $agency_repo)
    {
      
         $this->event_repository = $event_repo;
         $this->staff_repository = $staff_repo;
         $this->agency_repository = $agency_repo;
    }

    public function index(){
    	$language_id = getLanguageId();
    	$events = $this->event_repository->showImageEvent();
    	$myStaff = $this->agency_repository->showStaffInArray();
    	$staffs = $this->staff_repository->showStaff();
    	//dd($myStaff);
    	return view('front.agency.my_staff.index', compact('events', 'myStaff', 'staffs'));
    }

    public function find_staff(Request $request){
    	$language_id = getLanguageId();
    	$idUserStaff = $request->get('idStaff');
    	$myStaff = $this->agency_repository->addStaffToMyStaff($idUserStaff);
    	$staff = $myStaff['myStaff']->staff;
    	$staffImage = $myStaff['myStaff']->staff->getImagePortraitPath();
    	/*LaravelChromeLogger::log($staffImage);*/
    	$user = $myStaff['myStaff']->staff->user;
    	$staffRemuneration = $myStaff['myStaff']->staff->staffRemuneration;
    	return response()->json(array('myStaff'=>$myStaff['myStaff'], "resultat" => $myStaff['b'], 'staff'=>$staff, 'staffImage'=>$staffImage, 'user'=>$user, 'staffRemuneration'=>$staffRemuneration));

    }

    public function delete_agency_staff(Request $request){
    	$idmyStaff = $request->get('idmyStaff');
        $idStaff = $request->get('idStaff');
    	$staff = $this->agency_repository->deleteAgencyStaff($idmyStaff, $idStaff);
        $user = $staff->user;
        $image = $staff->getImagePortraitPath();
    	return response()->json(array('staff'=>$staff, 'user'=>$user, 'image'=>$image));
    }

    public function show_post_of_staff(Request $request){
    	$idStaff = $request->get('idStaff');
    	$staff = $this->staff_repository->getById($idStaff);
    	$jobNames = [];
    	foreach ($staff->staffJobs as $key => $staffJob) {
    		$translation = $staffJob->job->getByLanguageId(getLanguageId());
    		$jobNames[] = $translation->name;
    	}
    	return response()->json(['jobNames'=>$jobNames]);
    }

    public function show_staff(Request $request){
        $idStaff = $request->get('idStaff');
        $staff = $this->staff_repository->show_Staff($idStaff);
        return view('front.agency.pages.candidates_card', compact('staff'));
    }

    public function show_staff_for_my_staff(Request $request){
        $idStaff = $request->get('idStaff');
        $staff = $this->staff_repository->show_Staff_for_my_staff($idStaff);
        return view('front.agency.pages.candidates_card', compact('staff'));
    }
    public function get_image_staff(Request $request){
        $idStaff = $request->get('idStaff');
        $image = $this->staff_repository->getById($idStaff);
        return view('modals.agency.fiche_candidates.slider_image_candidates', compact('image'));
    }
}
