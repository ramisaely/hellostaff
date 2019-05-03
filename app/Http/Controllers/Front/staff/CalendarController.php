<?php

namespace App\Http\Controllers\Front\staff;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Interfaces\EventRepositoryInterface;
use App\Models\EventAgency;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;

class CalendarController extends Controller
{
	protected $event_repository;

	public function __construct(EventRepositoryInterface $event_repo) {
        $this->event_repository = $event_repo;
    }

    public function index() {
    	return view('front.staff.calendar.calendar');
    }

    public function getEvents() {
    	$events=$this->event_repository->getEventsByStaffConfirmed();
        return response()->json(['events' => $events]);
    }
}
