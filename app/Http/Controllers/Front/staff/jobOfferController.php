<?php

namespace App\Http\Controllers\Front\staff;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\EventCandidate;
use App\User;

use App\Interfaces\EventRepositoryInterface;
use App\Interfaces\JobRepositoryInterface;
use App\Interfaces\MobilityRepositoryInterface;
use App\Interfaces\StaffRepositoryInterface;

use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;
use Illuminate\Support\Facades\Auth;

class jobOfferController extends Controller
{

	protected $event_repository;
    protected $job_repository;
    protected $staff_repository;
    protected $mobility_repository;

    public function __construct(EventRepositoryInterface $event_repo, JobRepositoryInterface $job_repo, MobilityRepositoryInterface $mobility_repo, StaffRepositoryInterface $staff_repo)
    {
        $this->event_repository = $event_repo;
        $this->job_repository = $job_repo;
        $this->staff_repository = $staff_repo;
        $this->mobility_repository = $mobility_repo;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
    	$event_candidates = $this->event_repository->getEventStaff();
    	return view('front.staff.jobOffer.index', compact('event_candidates'));
    }

    public function applyOrDeclineJob(Request $request){
        $event_status_update = $this->event_repository->updateStatusOfEventCandidat($request->all());
        if (isset($event_status_update)){
            return response()->json($event_status_update);
        } else {
            return 'error';
        }
        
    }

    public function getEvent(Request $request){
        $idEvent = $request->get('idEvent');
        $idEventStaff = $request->get('idEventStaff');
        $events = $this->event_repository->getByEventId($idEvent, $idEventStaff);
        $eventImage = $events->getImageSliderEventPath();
        return response()->json(array('resultat'=>$events , 'image'=>$eventImage));
    }
}
