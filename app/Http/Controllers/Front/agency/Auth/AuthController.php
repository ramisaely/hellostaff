<?php

namespace App\Http\Controllers\Front\agency\Auth;

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
use App\Interfaces\AgencyRepositoryInterface;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\MessageBag;
use App\User;

use App\Models\Agency;

class AuthController extends Controller
{

    protected $upload_service;
    protected $agency_repository;

    public function __construct(UploadService $upload_service, AgencyRepositoryInterface $agency_repo)
    {
        $this->upload_service = $upload_service;
         $this->agency_repository = $agency_repo;
    }

     public function getLogin()
    {
        return view('front.agency.auth.login');
    }

    public function postLogin(Request $request)
    {
        $rules = array (
			'email' => 'required',
			'password' => 'required',
		);
		$validator = Validator::make($request->all(), $rules);

		if ($validator->fails()) {
			return Redirect::back()->withInput()->withErrors($validator);
		} else {
			if (Auth::attempt(['email' => $request->get('email'), 'password' => $request->get('password'), 'role_id'=>'2'])) {
				$user = Auth::getLastAttempted();
				Auth::login($user, $request->has('memory'));
                if(isset($user->language_code))
				    return Redirect::to($user->language_code.'/agency/home');
                else
                    return redirect()->route('home_agency');
			}
		}        toastr()->error(trans('auth.email_password_incorrect'));
		return Redirect::back();
        //return Redirect::back()->withInput()->withErrors(trans('auth.email_password_incorrect'));
    }

    public function postRegister(Request $request)
    {
        //view inscription agence
       return view('front.agency.registration.index');
    }

    public function postRegisterAgency(Request $request){

       $rules = array(
            'email' => 'required|unique:agency',
            'phone' => 'required|unique:agency',
            'password' => 'required',
            'phone' => 'required|unique:users',
            'email' => 'required|unique:users'
        );
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return Redirect::back()->withInput()->withErrors($validator);
        }else{
            try{
                $file_name['company_logo']=$this->uploadLogo('company_logo');
                $users = $this->agency_repository->create($request->all(), $file_name);
                foreach($users as $user){
            	    Event::fire(new Registered($user));
                }
				Auth::login($users[0]);
            }catch(\Exception $e){
                return Redirect::back()->withInput()->withErrors($e->getMessage());
            }
            return redirect()->route('home_agency');
        }
    }

    public function destroy()
    {
    	Auth::logout();
		return redirect()->route('login_agency');
    }

    public function uploadLogo($name)
	{
		$image_name = "";
		if (Input::hasFile($name)) {
			$file = Input::file($name);
			try{
              $image_name = $this->upload_service->upload($file, 'upload/agency/logo');
			}catch(Exception $e){
				  flash()->error($e->getMessage());
                  return Redirect::back();
			}
		}
		return $image_name;
	}

	public function saveAgencyInSession(Request $request) {
	    $data = $request->all();
	    Session::put('agencyData',$data);
	    return response()->json(["data" => $data]);
	}

	public function removeAgencyInsSession(Request $request){
	   $request->session()->forget('agencyData');
	}

    public function verify_unique(Request $request){
        $phone = $request->get('phone');
        $result = $this->agency_repository->verifyUnique($phone);
        return response()->json(["result" => $result]);
    }

    public function verify_uniqueMail(Request $request){
        $email = $request->get('email');
        $result1 = $this->agency_repository->verifyUniqueMail($email);
        return response()->json(["result" => $result1]);
    }

    public function verify_uniquePhnPers(Request $request){
        $phones = $request->get('phones');
        $resultat = $this->agency_repository->verifyUniquePersPhone($phones);
        return response()->json(["resultat" => $resultat]);
    }

    public function verify_uniqueEmailPers(Request $request){
        $emails = $request->get('emails');
        $resultat = $this->agency_repository->verifyUniquePersEmail($emails);
        return response()->json(["resultat" => $resultat]);
    }

    public function edit(){
        $agency = Auth::user()->agency->first();
        return view('front.agency.updateProfil.update_profil', compact('agency'));
    }

    public function update(Request $request) {
        $agencyId = Auth::user()->agency->first()->id;
        $file_name['image']=$this->uploadLogo('image');
        $users = $this->agency_repository->update($agencyId, $request->all(), $file_name);
        $user1 = [];
        foreach($users as $user){
                    Event::fire(new Registered($user));
                }
        toastr()->success(trans('congrate.update_profil_agency_congrates'));
        foreach ($users as $langue) {
            return Redirect::to($langue->language_code.'/agency/edit');
            break;
        }
        
    }

    public function sendValuePassword(Request $request){
        $password = $request->get('data');
        $userId = $request->get('userId');
        $resultat = $this->agency_repository->findPassword($password, $userId);
        return response()->json(["resultat" => $resultat]);
    }

}
