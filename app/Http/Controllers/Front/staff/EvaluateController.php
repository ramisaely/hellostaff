<?php

namespace App\Http\Controllers\Front\staff;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Interfaces\StaffRepositoryInterface;
use App\Interfaces\EventRepositoryInterface;

class EvaluateController extends Controller
{
	protected $upload_service;
	protected $staff_repository;
	protected $event_repository;

	public function __construct(StaffRepositoryInterface $staff_repo, EventRepositoryInterface $event_repo)
    {
        $this->staff_repository = $staff_repo;
        $this->event_repository = $event_repo;
    }

    public function index()
    {
    	$evaluations = $this->staff_repository->findEvaluation();
    	return view('front.staff.evaluate.index', compact('evaluations'));
    }
}
