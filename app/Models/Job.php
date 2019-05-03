<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\URL;
use App\Models\JobTranslation;
use App\Models\EventStaff;

class Job extends Model
{
        /**
	 * @var string
	 */
	protected $table = 'jobs';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';
	
	const JOB_IMAGE_PATH = '/img/step_jobs/';
	
	public function getImagePath()
	{
		return URL::to('/') . self::JOB_IMAGE_PATH . $this->icon;
	}
	
	public function translation($language=null)
	{
		if($language==null){
			return $this->hasMany(JobTranslation::class,'job_id');
		} else {
			return $this->hasOne(JobTranslation::class,'job_id')->where('language_id',$language);
		}
	}
	
	public function french()
	{
		return $this->translation(1);
	}
	
	public function english()
	{
		return $this->translation(2);
	}
	
	public function getByLanguageid($language_id){
		$option_translation= $this->translation->filter(function ($value, $key) use($language_id) {
			return ($value->language_id==$language_id);
		});
		return (count($option_translation)==0)?$this->translation->first():$option_translation->first();
	}

	public function jobsEventStaff() {
    	return $this->belongsToMany(EventStaff::class, 'event_staff_jobs', 'job_id');
    }
}
