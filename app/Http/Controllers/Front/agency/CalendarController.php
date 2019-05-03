<?php

namespace App\Http\Controllers\Front\agency;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CalendarController extends Controller
{
    public function index(){
    	return view('front.agency.calendar.calendar');
    }
}
