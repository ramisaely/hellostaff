<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\StaffJob;
use App\Models\StaffLanguage;
use App\Models\StaffCertification;
use App\Models\StaffAttribut;
use App\Models\StaffRemuneration;
use App\Models\StaffMobility;
use App\Models\EventAgencyStatementQuestionAnswer;
use App\Models\Event_Assessment;
use App\Models\AgencyStaff;
use App\Models\EventCandidate;
use App\User;
use Illuminate\Support\Facades\URL;
use DigitalDrifter\LaravelChromeLogger\LaravelChromeLogger;

class Staff extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'staff';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';
	/**
	 * @var array
	 */
	protected $fillable = [];

	public $timestamps = false;

	const STAFF_IMAGE_PORTRAIT_PATH = '/upload/staff/portrait/';
    const STAFF_IMAGE_SINGLE_PATH = '/upload/staff/portrait_plein/';
    const STAFF_CV_PATH = '/upload/staff/cv/';
    const DEFAULT_PAGINATE = 12;

    public function agencyStaff(){
        return $this->hasMany(AgencyStaff::class, 'staff_id','id');
    }

    public function eventCandidate(){
        return $this->hasMany(EventCandidate::class, 'staff_id','id');
    }

	public function staffJobs()
	{
		return $this->hasMany(StaffJob::class,'staff_id','id');
	}

	public function staffLanguages()
	{
		return $this->hasMany(StaffLanguage::class,'staff_id','id');
	}

	public function staffCertification()
	{
	    return $this->hasOne(StaffCertification::class,'staff_id','id');
	}

	public function staffAttribut()
	{
	    return $this->hasOne(StaffAttribut::class,'staff_id','id');
	}

	public function staffRemuneration()
	{
	    return $this->hasOne(StaffRemuneration::class,'staff_id','id');
	}

	public function staffMobility()
	{
	    return $this->hasMany(StaffMobility::class,'staff_id','id');
	}

    public function eventAgencyStatementQuestionAnswer()
    {
        return $this->hasMany(EventAgencyStatementQuestionAnswer::class,'id','staff_id');
    }

	public function user()
	{
	    return $this->hasOne(User::class,'id','user_id');
	}

    public function staffAssessment() {
        return $this->hasMany(Event_Assessment::class, 'staff_id', 'id')->orderBy('rating','DESC');
    }

	public function getImagePortraitPath()
    {
        return URL::to('/') . self::STAFF_IMAGE_PORTRAIT_PATH . $this->portrait_pic;
    }
    public function getImagePortraitPleinPath()
    {
        return URL::to('/') . self::STAFF_IMAGE_SINGLE_PATH . $this->single_storey_pic;
    }
    public function getImageCvPath()
    {
        return URL::to('/') . self::STAFF_CV_PATH . $this->cv;
    }

    public function scopeFilter($q, $param){
    	$gender = isset($param['gender']) ? $param['gender'] : '';
    	$ages = isset($param['ages']) ? $param['ages'] : [];
    	$certifications = isset($param['certifications']) ? $param['certifications'] : []; //avec les params
    	$job_id = isset($param['job_id']) ? $param['job_id'] : '';
    	$experience = isset($param['experience']) ? $param['experience'] : '';
    	$language_ids = isset($param['language_ids']) ? $param['language_ids'] : [];
    	$tattoo = isset($param['tattoo']) ? $param['tattoo'] : '';
        //LaravelChromeLogger::log(' tattoo: '.$tattoo);
        $piercing = isset($param['piercing']) ? $param['piercing'] : '';
        //LaravelChromeLogger::log(' piercing: '.$piercing);
    	$price = isset($param['price']) ? $param['price'] : '';
        $event_staff_id = isset($param['event_staff_id']) ? $param['event_staff_id'] : '';
    	return $q
    		->where(function($query) use ($gender, $ages){
    			if(!empty($gender) && $gender != 0){
    				$query->where('staff.kind', $gender);
    			}
    			if(!empty($ages)){
    				$query->whereBetween('staff.ages', $ages);
    			}
    		})
            ->leftJoin('users as user', function($query){
                $query->on('user.id', '=', 'staff.user_id');
            })
    		->leftjoin('staff_attribut as sa', function ($query){
    			$query->on('sa.staff_id', '=', 'staff.id');
    		})
    		->leftjoin('staff_certifications as sc', function ($query){
    			$query->on('sc.staff_id', '=', 'staff.id');
    		})
    		->leftjoin('staff_jobs as sj', function ($query){
    			$query->on('sj.staff_id', '=', 'staff.id');
    		})
    		->leftjoin('staff_languages as sl', function ($query){
    			$query->on('sl.staff_id', '=', 'staff.id');
    		})
    		->leftjoin('staff_remunerations as sr', function ($query){
    			$query->on('sr.staff_id', '=', 'staff.id');
    		})
            ->leftJoin('event_candidate', 'event_candidate.staff_id', '=', "staff.id")->whereNotIn("event_candidate.staff_id",
                function($query) use ($event_staff_id ){
                    $query->select('staff_id')->from('event_candidate')->where('event_staff_id', $event_staff_id);
                }
            )
    		->where(function($query) use ($certifications, $experience, $language_ids, $tattoo, $piercing, $price, $job_id){
    			$query->where('user.email_verified_at', '<>', null);
                if(!empty($tattoo)){
    				$query->where('sa.tattoo', $tattoo);
    			}
    			if(!empty($piercing)){
    				$query->where('sa.piercing', $piercing);
    			}
    			if(!empty($certifications)){
                    if(!empty($certifications['actra']) && $certifications['actra'] != 0){
                        $query->where('sc.actra', $certifications['actra']);
                    }
                    if(!empty($certifications['food_handling']) && $certifications['food_handling'] != 0){
                        $query->where('sc.food_handling', $certifications['food_handling']);
                    }
                    if(!empty($certifications['uda']) && $certifications['uda'] != 0){
                        $query->where('sc.uda', $certifications['uda']);
                    }
                    if(!empty($certifications['have_car']) && $certifications['have_car'] != 0){
                        $query->where('sc.have_car', $certifications['have_car']);
                    }
                    if(!empty($certifications['driver_license']) && $certifications['driver_license'] != 0){
                        $query->where('sc.driver_license', $certifications['driver_license']);
                    }
                    if(!empty($certifications['smart_serve']) && $certifications['smart_serve'] != 0){
                        $query->where('sc.smart_serve', $certifications['smart_serve']);
                    }
    			}
    			if(!empty($job_id)){
    				$query->where('sj.job_id', $job_id);
    			}
    			if(!empty($experience) && $experience != 0){
    				$query->where('sj.experience_year', '>' , 0);
    			}
    			if(!empty($language_ids)){
    				$query->whereIn('sl.all_language_id', $language_ids);
    			}
    			if(!empty($price)){
    				$query->where('sr.price', $price);
    			}
    		})
    		->groupBy('staff.id');
    }
}
