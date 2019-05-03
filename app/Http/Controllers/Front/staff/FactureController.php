<?php

namespace App\Http\Controllers\Front\staff;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Interfaces\EventRepositoryInterface;

class FactureController extends Controller
{
	protected $event_repository;
	public function __construct(EventRepositoryInterface $event_repo)
    {
        $this->event_repository = $event_repo;
    }

    public function index() {
    	$events = $this->event_repository->getEventsByStaffConfirmed();
        $bills = [];
    	return view('front.staff.bills.index', compact('events', 'bills'));
    }

    public function findFacture(Request $request){
	    	$idEventStaff = $request->get('data_id');
	    	$bills = $this->event_repository->find_facture($idEventStaff);
				toastr()->success(trans('congrate.save_facture_staff'));
        return view('modals.staff.bills.bill_content_body', compact('events', 'bills'));

    }
}
