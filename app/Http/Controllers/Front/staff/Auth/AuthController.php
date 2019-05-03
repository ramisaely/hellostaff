<?php

namespace App\Http\Controllers\Front\staff\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Cookie;
use App\Interfaces\MobilityRepositoryInterface;
use App\Interfaces\JobRepositoryInterface;
use App\Interfaces\AttributeRepositoryInterface;
use App\Interfaces\StaffRepositoryInterface;
use App\Interfaces\AllLanguageRepositoryInterface;
use App\Interfaces\AllLanguageChoiceRepositoryInterface;
use Illuminate\Auth\Events\Registered;
use App\Service\UploadService;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use App\User;
use App\Models\Staff;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;

class AuthController extends Controller
{
    protected $mobility_repository;
    protected $job_repository;
    protected $attribute_repository;
    protected $staff_repository;
    protected $upload_service;
    protected $all_language_repository;
    protected $all_language_choice_repository;

    public function __construct(MobilityRepositoryInterface $mobility_repo, JobRepositoryInterface $job_repo, AttributeRepositoryInterface $attribute_repo, StaffRepositoryInterface $staff_repo, UploadService $upload_service, AllLanguageRepositoryInterface $all_language_repo, AllLanguageChoiceRepositoryInterface $all_language_choice_repo)
    {
        $this->mobility_repository = $mobility_repo;
        $this->job_repository = $job_repo;
        $this->attribute_repository = $attribute_repo;
        $this->staff_repository = $staff_repo;
        $this->upload_service = $upload_service;
        $this->all_language_repository = $all_language_repo;
        $this->all_language_choice_repository = $all_language_choice_repo;
    }

    public function getLogin()
    {
        return view('front.staff.auth.login');
    }

    public function postLogin(Request $request)
    {
        $rules = array(
			'email' => 'required',
			'password' => 'required',
		);
		$validator = Validator::make($request->all(), $rules);

		if ($validator->fails()) {
			return Redirect::back()->withInput()->withErrors($validator);
		} else {
			if (Auth::attempt(['email' => $request->get('email'), 'password' => $request->get('password'), 'role_id'=>'1'])) {
				$user = Auth::getLastAttempted();
				Auth::login($user, $request->has('memory'));
				if(isset($user->language_code))
				    return Redirect::to($user->language_code.'/staff/home');
                else
                    return redirect()->route('home_staff');
			}
		}
		toastr()->error(trans('auth.email_password_incorrect'));
		return Redirect::back();
		//return Redirect::back()->withInput()->withErrors(trans('auth.email_password_incorrect'));
    }

    public function getRegister(Request $request)
    {
        $language_id = getLanguageId();
        $mobilities = $this->mobility_repository->getAll();
        $jobs = $this->job_repository->getAll();
        $attributes = $this->attribute_repository->getAll();
        $all_languages = $this->all_language_repository->getAll();
        $all_language_choices = $this->all_language_choice_repository->getAll();
        return view('front.staff.registration.index',compact('mobilities','jobs','attributes','all_languages','all_language_choices'));
    }

    public function postRegisterStaff(Request $request)
    {
    	$rules = array(
            'email' => 'required|unique:users',
            'phone' => 'required|unique:users',
            'password' => 'required',
        );
        $validator = Validator::make($request->all(), $rules);
        //dd($validator);
        if ($validator->fails()) {
            return Redirect::back()->withInput()->withErrors($validator);
        } else {
            try {
                $file_name['portrait']=$this->uploadImage('portrait');
                $file_name['portrait_plein']=$this->uploadPortraitPlein('portrait_plein');
                $file_name['cv']=$this->uploadCV('cv');
                $request->session()->forget('staffData');
                $user = $this->staff_repository->create($request->all(), $file_name);

            	Event::fire(new Registered($user));
				Auth::login($user);
			} catch (\Exception $e) {
                return Redirect::back()->withInput()->withErrors($e->getMessage());
            }
            return redirect()->route('home_staff');
        }
    }

    public function destroy()
    {
    	Auth::logout();
		return redirect()->route('login_staff');
    }

    public function uploadImage($name)
	{
		$image_name = "";
		if (Input::hasFile($name)) {
			$file = Input::file($name);
			try{
              $image_name = $this->upload_service->upload($file, 'upload/staff/portrait');
			}catch(Exception $e){
				  flash()->error($e->getMessage());
                  return Redirect::back();
			}
		}
		return $image_name;
	}

	public function uploadCV($name)
	{
	    $file_name = "";
	    if (Input::hasFile($name)) {
	        $file = Input::file($name);
	        try{
	            $file_name = $this->upload_service->upload($file, 'upload/staff/cv');
	        }catch(Exception $e){
	            flash()->error($e->getMessage());
	            return Redirect::back();
	        }
	    }
	    return $file_name;
	}

	public function uploadPortraitPlein($name)
	{
	    $plein_name = "";
	    if (Input::hasFile($name)) {
	        $file = Input::file($name);
	        try{
	            $plein_name = $this->upload_service->upload($file, 'upload/staff/portrait_plein');
	        }catch(Exception $e){
	            flash()->error($e->getMessage());
	            return Redirect::back();
	        }
	    }
	    return $plein_name;
	}

	public function saveStaffInSession(Request $request) {
	    $data = $request->all();
	    Session::put('staffData',$data);
	    return response()->json($data);
	}

	public function removeoveSession(Request $request){
	    $request->session()->forget('staffData');
	}

	/** Exist email user **/
	public function verifyEmail(Request $request){
        /*LaravelChromeLogger::log("verify email");
        console("verify email");*/
		$email = $request->get('email');
		$val = $this->staff_repository->verifyEmail($email);
		return response()->json(['email_result'=>$val]);
	}

	/** Exist phone user **/
	public function verifyPhone(Request $request){
		$phone = $request->get('phone');
		$val = $this->staff_repository->verifyPhone($phone);
		return response()->json(['phone_result'=>$val]);
	}

	public function getEditProfil()
    {
        $attributes = $this->attribute_repository->getAll();
        $all_languages = $this->all_language_repository->getAll();
        $mobilities = $this->mobility_repository->getAll();
        $jobs = $this->job_repository->getAll();
        $all_language_choices = $this->all_language_choice_repository->getAll();
    	$staff = Auth::user()->staff;
        //dd($attributes);
        return view('front.staff.updateProfil.update_profil', compact('staff','attributes','all_languages','all_language_choices','mobilities','jobs'));
    }
    public function updateProfil(Request $request){
        $staffId = Auth::user()->staff->id;
        $file_name['head_shot_photo']=$this->uploadImage('head_shot_photo');
        $file_name['upper_body_photo']=$this->uploadPortraitPlein('upper_body_photo');
        $file_name['resume']=$this->uploadCV('resume');
        $user = $this->staff_repository->update($staffId, $request->all(),$file_name);
        toastr()->success(trans('upload_staff.update_profil_success'));
    	return redirect()->route('update_profil_staff');
    }
}
