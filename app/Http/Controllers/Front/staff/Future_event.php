<?php

namespace App\Http\Controllers\Front\staff;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Interfaces\EventRepositoryInterface;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;

class Future_event extends Controller
{
	protected $event_repository;
	public function __construct(EventRepositoryInterface $event_repo)
    {
        $this->event_repository = $event_repo;
    }

    public function index() {
    	$events = $this->event_repository->getEventsByStaffConfirmed();
    	$event = isset($events[0]) ? $this->event_repository->getEventById($events[0]->id, $events[0]->eventStaffs->first()->id) : false;
        if(isset($events[0])) 
            $event->staff_image = $event->getImageSliderEventPath();
    	return view('front.staff.Future_event.index', compact('event', 'events'));
    }

    public function find_event(Request $request){
    	$idEvent = $request->get('idEvent');
        $idEventStaff = $request->get('idEventStaff');
    	$events = $this->event_repository->getEventsByStaffConfirmed();
    	$event = $this->event_repository->getEventById($idEvent, $idEventStaff);
    	$view = view('front.staff.Future_event.content_future_event', compact('event', 'events'))->render();
    	return response()->json(array('view_event'=>$view, 'event'=>$event));
    }
}