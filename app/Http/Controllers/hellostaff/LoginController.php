<?php

namespace App\Http\Controllers\hellostaff;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LoginController extends Controller
{
    public function index() {
        return view('hellostaff.page.login');
    }
}
