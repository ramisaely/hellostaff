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
use Illuminate\Support\Facades\Session;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;
use App\Models\EventAgency;

class FinishedEventController extends Controller
{
	protected $upload_service;
    protected $event_repository;

    public function __construct(UploadService $upload_service, EventRepositoryInterface $event_repo)
    {
        $this->upload_service = $upload_service;
        $this->event_repository = $event_repo;
    }
    public function index(Request $request) {    	
        $events = $this->event_repository->showImageEventFinished();
        $event = isset($events[0]) ? $this->event_repository->getById($events[0]->id) : false ;
        if ($event)
            $event = changeStaffImagePortraitPathEvent($event);
        if(isset($events[0])) {
            $statement = $this->event_repository->getStatement();
            /*$event->staff_image = $event->getImageSliderEventPath();*/
        }
    	return view('front.agency.finished_event.index',compact('events', 'event', 'statement'));
    }
    public function findEventById(Request $request){
    	$idevent = $request->get('data_id');
    	$event = $this->event_repository->getById($idevent);
        if ($event)
            $event = changeStaffImagePortraitPathEvent($event);
        $statement = $this->event_repository->getStatement();
        /*LaravelChromeLogger::log("repo");
        LaravelChromeLogger::log($event->staff_image);*/
        $view=view('front.agency.finished_event.content_finished_event', compact('event', 'statement'))->render();
        return response()->json(array('view_event'=>$view, 'event'=>$event));
    }

    public function evaluationRegister(Request $request){
        $evaluationIds = $this->event_repository->evaluation_register($request->all());
        return response()->json(['evaluationIds'=>$evaluationIds]);
    }
}
