<?php

namespace App\Http\Controllers\Front\agency;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    public function index()
    {
        return view('front.agency.home.index');
    }
}
