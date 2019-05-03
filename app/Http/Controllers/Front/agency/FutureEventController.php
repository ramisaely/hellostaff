<?php

namespace App\Http\Controllers\Front\agency;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Service\UploadService;
use Illuminate\Support\Facades\Input;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Cookie;
use App\Interfaces\EventRepositoryInterface;
use App\Interfaces\JobRepositoryInterface;
use App\Interfaces\MobilityRepositoryInterface;
use Illuminate\Support\Facades\Session;
use App\Models\EventAgency;
use App\Models\Job;
use App\Models\Mobility;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;
use App\Interfaces\AllLanguageRepositoryInterface;
use App\Interfaces\StaffRepositoryInterface;
use App\Interfaces\AgencyRepositoryInterface;
use App\Interfaces\AttributeRepositoryInterface;


class FutureEventController extends Controller
{

    protected $upload_service;
    protected $event_repository;
    protected $job_repository;
    protected $staff_repository;
    protected $mobility_repository;
    protected $all_language_repository;
    protected $agency_repository;
    protected $attribute_repository;

    public function __construct(UploadService $upload_service, EventRepositoryInterface $event_repo, JobRepositoryInterface $job_repo, MobilityRepositoryInterface $mobility_repo, AllLanguageRepositoryInterface $all_language_repo, StaffRepositoryInterface $staff_repo, AgencyRepositoryInterface $agency_repo, AttributeRepositoryInterface $attribute_repo)
    {
        $this->upload_service = $upload_service;
        $this->event_repository = $event_repo;
        $this->job_repository = $job_repo;
        $this->staff_repository = $staff_repo;
        $this->mobility_repository = $mobility_repo;
        $this->all_language_repository = $all_language_repo;
        $this->agency_repository = $agency_repo;
        $this->attribute_repository = $attribute_repo;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(request $request)
    {
        $language_id = getLanguageId();
        $jobs = $this->job_repository->getAll();
        $mobilities = $this->mobility_repository->getAll();
        $all_languages = $this->all_language_repository->getAll();
        $all_staffs_to_see = [];
        $all_staffs = [];
        $all_my_staffs = [];
        $staffs = $this->staff_repository->getUserByStaff();
        $events = $this->event_repository->showImageEvent();
        $event = isset($events[0]) ? $this->event_repository->getById($events[0]->id) : false;
        if($event) 
            $event = changeStaffImagePortraitPathEvent($event);
        return view('front.agency.future_event.index', compact('events', 'event', 'jobs', 'mobilities', 'all_languages', 'all_staffs', 'all_my_staffs', 'staffs', 'all_staffs_to_see'));
    }
    
    public function getCandidatesCard(Request $request) {
        $staff = $this->staff_repository->getById($request->get('staff_id'));
        return view('front.agency.pages.candidates_card', compact('staff'));
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function uploadLogo($name)
    {
        $image_name = "";
        if (Input::hasFile($name)) {
            $file = Input::file($name);
            try{
                $image_name = $this->upload_service->upload($file, 'upload/agency/create_event');
            }catch(Exception $e){
                flash()->error($e->getMessage());
                return Redirect::back();
            }
        }
        return $image_name;
    }


    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function find_event(Request $request){
        $idEvent = $request->get('idEvent');
        $jobs = $this->job_repository->getAll();
        $mobilities = $this->mobility_repository->getAll();
        $all_languages = $this->all_language_repository->getAll();
        $staffs = $this->staff_repository->getAll();
        $all_staffs_to_see=[];
        $all_staffs = [];
        $all_my_staffs = [];
        $event = $this->event_repository->getById($idEvent);
        if($event) 
            $event = changeStaffImagePortraitPathEvent($event);
        $view = view('front.agency.future_event.content_future_event', compact('event', 'jobs', 'mobilities', 'all_languages', 'all_staffs', 'all_my_staffs', 'staffs', 'all_staffs_to_see'))->render();
        return response()->json(array('view_event'=>$view, 'event'=>$event));
    }

    public function update_Event(Request $request){
        $file_name['portrait']=$this->uploadLogo('portrait');
        $event = $this->event_repository->update($request->all(), $file_name);
        if($event) 
            $event = changeStaffImagePortraitPathEvent($event);
        $staffs = $this->staff_repository->getAll();
        $jobs = $this->job_repository->getAll();
        $mobilities = $this->mobility_repository->getAll();
        $all_languages = $this->all_language_repository->getAll();
        $all_staffs_to_see = [];
        $all_staffs = [];
        $all_my_staffs = [];
        /*LaravelChromeLogger::log($request->all());*/
        $view = view('front.agency.future_event.content_future_event', compact('event', 'jobs', 'mobilities', 'all_languages', 'all_staffs', 'all_my_staffs', 'staffs', 'all_staffs_to_see'))->render();
        return response()->json(array('view_event'=>$view, 'event'=>$event));
    }

    public function erase_event(Request $request){
        $idevent = $request->get('idEvent');
        $deleteStatus = $this->event_repository->delete($idevent);
        $jobs = $this->job_repository->getAll();
        $mobilities = $this->mobility_repository->getAll();
        $all_languages = $this->all_language_repository->getAll();
        $all_staffs_to_see = [];
        $all_staffs = [];
        $all_my_staffs = [];
        $staffs = $this->staff_repository->getAll();
        $idNextEvent = $request->get('nextEvent');
        $event = $this->event_repository->getById($idNextEvent);
        if($event) 
            $event = changeStaffImagePortraitPathEvent($event);
        $view = view('front.agency.future_event.content_future_event', compact('event', 'jobs', 'mobilities', 'all_languages', 'all_staffs', 'all_my_staffs', 'staffs', 'all_staffs_to_see'))->render();
        return response()->json(array('view_event'=>$view, 'event'=>$event));
    }

    public function find_candidate(Request $request){
        $data = $request->get('dataFilter');
        $all_staffs = $this->staff_repository->filterCandidate($data);
        $all_my_staffs = $this->staff_repository->filterMyCandidate($data);
        /*LaravelChromeLogger::log('all_my_staffs');
        LaravelChromeLogger::log($all_staffs);*/
        return view('front.agency.future_event.components.filter_result', compact('all_staffs', 'all_my_staffs'));
        //return response()->json(array('data'=>$data));
    }


    public function registerEventStatement(Request $request){
        $idEvent = $this->event_repository->registerEventStatement($request->all());
        $event = $this->event_repository->getById($idEvent);
        return view('front.agency.future_event.statement', compact('event'));
    }

    public function update_horary(Request $request) {
        $eventStaff = $this->event_repository->updateHorary($request->all());
        if($eventStaff)
            return response()->json(['notification'=>'success']);
    }

    public function job_offer(Request $request){
        $eventCandidate = $this->event_repository->offerJob($request->all());
        if($eventCandidate)
            return response()->json(['notification'=>'success']);
        else
            return response()->json(['notification'=>'warning']);
    }

    public function job_all_staff_offer(Request $request) {
        /*LaravelChromeLogger::log($request->all());*/
        $this->event_repository->offerJobToAllStaff($request->all());
        return response()->json(['notification'=>'success']);
    }

    public function delete_candidate(Request $request){
        $idCandidate = $request->get('idCandidate');
        $candidate = $this->agency_repository->deleteCandidate($idCandidate);
        return response()->json(['resultat'=>$candidate]);
    }

    public function see_candidate (Request $request){
        $all_staffs_to_see = $this->event_repository->seeCandidate($request->all());
        return view('front.agency.future_event.components.candidate_list', compact('all_staffs_to_see'));
    }

    public function confirm_candidate (Request $request){
        $succes = $this->event_repository->confirmCandidate($request->all());
        return $succes;
    }

    public function reload_staff_confirme (){
        $events = $this->event_repository->reloadStaffConfirmed();
        $event = isset($events[0]) ? $events[0] : false;
        if($event) 
            $event = changeStaffImagePortraitPathEvent($event);
        return view('front.agency.future_event.confirmed_staff', compact('events', 'event'));
    }

    public function get_modal_info(Request $request){
        $modal = $request->get('modal');
        $staff = $this->staff_repository->getById($request->get('staff_id'));
        $attributes = $this->attribute_repository->getAll();
        /*LaravelChromeLogger::log($staff);*/
        
        return view($modal, compact('staff', 'attributes'));
    }

    public function storeBudget(Request $request){
        $budget = $this->agency_repository->store_budget($request->all());
        return response()->json(['budget'=>$budget]);
    }

}