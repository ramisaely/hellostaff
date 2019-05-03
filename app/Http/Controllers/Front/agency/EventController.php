<?php
namespace App\Http\Controllers\Front\agency;

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
use App\Interfaces\EventRepositoryInterface;
use App\Interfaces\JobRepositoryInterface;
use App\Interfaces\MobilityRepositoryInterface;
use Illuminate\Support\Facades\Session;
use App\Models\EventAgency;
use App\Models\Job;
use App\Models\Mobility;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;

class EventController extends Controller
{
    protected $upload_service;
    protected $event_repository;
    protected $job_repository;
    protected $mobility_repository;

    public function __construct(UploadService $upload_service, EventRepositoryInterface $event_repo, JobRepositoryInterface $job_repo, MobilityRepositoryInterface $mobility_repo)
    {
        $this->upload_service = $upload_service;
         $this->event_repository = $event_repo;
         $this->job_repository = $job_repo;
         $this->mobility_repository = $mobility_repo;
    }

    public function createEvent(){
        $language_id = getLanguageId();
        $mobilities = $this->mobility_repository->getAll();
        $jobs = $this->job_repository->getAll();
        return view('front.agency.create_event.index',compact('jobs', 'mobilities'));
    }

    public function createOfEvent(){
        $language_id = getLanguageId();
        $mobilities = $this->mobility_repository->getAll();
        $jobs = $this->job_repository->getAll();
        return view('front.agency.create_event.creation_of_event',compact('jobs', 'mobilities'));
    }

    public function postRegisterEvent(Request $request){
       $rules = array(
            'name' => 'required',
        );
        $validator = Validator::make($request->all(),$rules);
        /*LaravelChromeLogger::log($request->all());*/

        if ($validator->fails()) {
            return Redirect::back()->withInput()->withErrors($validator);
        } else {

            try {
                $file_name['portrait']=$this->uploadPhoto('portrait');
                $event = $this->event_repository->create($request->all(), $file_name);
            	Event::fire(new Registered($event));
                toastr()->success(trans('create_event.create_event_success'));
                return redirect()->route('future_event');
            //   $request->session()->forget('agencyData');
            } catch(\Exception $e){
               // dd($e->getMessage());
                return Redirect::back()->withInput()->withErrors(toastr()->error(trans('create_event.create_event_error')));

            }
            //return redirect()->route('future_event');

        }

    }
    public function uploadPhoto($name)
	{
		$image_name = "";
		if (Input::hasFile($name)) {
			$file = Input::file($name);
			try{
              $image_name = $this->upload_service->upload($file, 'upload/agency/create_event');
			}catch(Exception $e){
				  flash()->error($e->getMessage());
                  return Redirect::back();
			}
		}
		return $image_name;
	}
    public function getAllEvents(){
        $Events=$this->event_repository->getAll();
        return response()->json(['Events' => $Events]);
    }
}
