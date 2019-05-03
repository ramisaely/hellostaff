<?php

namespace App\Http\Controllers\Front\staff;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Cookie;
use App\Service\UploadService;
use App\Interfaces\StaffRepositoryInterface;
use App\Interfaces\EventRepositoryInterface;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;
use Carbon\Carbon;
use PDF;

class FinishedEvent extends Controller
{
	protected $upload_service;
	protected $staff_repository;
	protected $event_repository;

	public function __construct(UploadService $upload_service, StaffRepositoryInterface $staff_repo, EventRepositoryInterface $event_repo)
    {
        $this->upload_service = $upload_service;
        $this->staff_repository = $staff_repo;
        $this->event_repository = $event_repo;
    }

    public function index() {
    	$reports = $this->staff_repository->showReport();
    	$events = $this->event_repository->getEventsByStaffConfirmedFinished();
    	$event = isset($events[0]) ? $this->event_repository->getEventById($events[0]->id, $events[0]->eventStaffs->first()->id) : false ;
    	return view('front.staff.finished_event.index', compact('reports', 'events', 'event'));
    }

    public function findFinishedEvent(Request $request){
    	$idEvent = $request->get('idEvent');
    	$idEventStaff = $request->get('idEventStaff');
    	$events = $this->event_repository->getEventsByStaffConfirmedFinished();
    	$event = $this->event_repository->getEventById($idEvent, $idEventStaff);
    	LaravelChromeLogger::log($event);
    	$view = view('front.staff.finished_event.content_finished_event', compact('reports', 'event', 'events'))->render();
    	return response()->json(array('view_event'=>$view, 'event'=>$event));
    }

    public function uploadFile($name)
	{
	    $file_name = "";
	    if (Input::hasFile($name)) {
	        $file = Input::file($name);
	        try{
	            $file_name = $this->upload_service->upload($file, 'upload/staff/report');
	        }catch(Exception $e){
	            flash()->error($e->getMessage());
	            return Redirect::back();
	        }
	    }
	    return $file_name;
	}

	public function insert_answer(Request $request){	
		$file_name = [];

		if($request->file('fileResponse')!= null) {
			foreach ($request->file('fileResponse') as $key => $all_file) {
				foreach ($all_file as $k => $file) {
					$name=str_replace(' ', '_', $file->getClientOriginalName()) ;
					$timestamp = str_replace([' ', ':'], '-', Carbon::now()->toDateTimeString());
					$name = $timestamp.''.$name;
		            $file->move(public_path().'/upload/staff/report', $name);  
		            $file_name[$key][$k] = $name; 
				}
			}
		}

		/*if ($image = $request->file('attachment_file')) {
			for ($i=0; $i < sizeof($value['attachment_file']); $i++) { 
				$image = $request->file('attachment_file')[$i];
				foreach ($image as $key => $fileName) {
					$file_name[$i][$key]=$this->uploadFile($fileName);
				}
			}	
		}*/
		$answer = $this->staff_repository->insertAnswer($request->all(), $file_name);
		return response()->json(array('view_event'=>$answer));
	}

	public function storeFacture(Request $request){
		$invoicieIds = $this->event_repository->storeInvoicies($request->all());
		//LaravelChromeLogger::log($invoicies);
		return response()->json(['invoicieIds'=>$invoicieIds]);
	}

	 public function findFacture(Request $request){
    	$idEventStaff = $request->get('data_id');
    	$bills = $this->event_repository->find_facture($idEventStaff);
        return view('modals.staff.bills.bill_content_body', compact('bills'));
    }
}
