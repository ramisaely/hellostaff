<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\MobilityTranslation;
use App\Models\EventStaff;
use App\Models\Event;

class Mobility extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'mobility';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';
	
	public function translation($language=null)
	{
		if($language==null){
			return $this->hasMany(MobilityTranslation::class,'mobility_id');
		} else {
			return $this->hasOne(MobilityTranslation::class,'mobility_id')->where('language_id',$language);
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

	public function mobilityEventStaff() {
        return $this->belongsToMany(EventStaff::class, 'event_staff_mobility', 'mobility_id');
    }

    public function mobilityEven() {
        return $this->belongsToMany(Event::class, 'event_mobility', 'mobility_id');
    }
}
