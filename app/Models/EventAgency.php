<?php

namespace App\Models;
use App\User;
use App\Models\Agency;
use App\Models\EventStaff;
use App\Models\Mobility;
use App\Models\EventAgencyStatement;
use Illuminate\Support\Facades\URL;

use Illuminate\Database\Eloquent\Model;

class EventAgency extends Model
{
    protected $table = 'event';
    protected $primarykey = "id";

    const EVENT_IMAGE_PATH = '/upload/agency/create_event/';

    protected $fillable = ['name', 'customer', 'location_event', 'zip_event', 'country_event', 'zone_event', 'start_date', 'end_date', 'description_fr_event', 'description_en_event', 'start_hour_event', 'end_hour_event', 'picture_event'];
    
    public function eventStaffs() {
        return $this->hasMany(EventStaff::class, 'event_id', 'id');
    }
    public function EventAgencyStatements() {
        return $this->hasMany(EventAgencyStatement::class, 'event_id', 'id');
    }
    public function agency() {
        return $this->belongsTo(Agency::class, 'agency_id', 'id');
    }
    public function managedBy() {
    	return $this->belongsToMany(User::class, 'event_manage_by', 'event_id');
    }
    public function getImageSliderEventPath()
    {
        return URL::to('/') . self::EVENT_IMAGE_PATH . $this->picture_event;
    }

    public function eventMobility() {
        return $this->belongsToMany(Mobility::class, 'event_mobility', 'event_id');
    }
}