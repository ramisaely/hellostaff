<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\EventAgency;
use App\Models\EventStaffDate;
use App\Models\Job;
use App\Models\Mobility;
use App\Models\EventCandidate;
use App\Models\Event_Assessment;
use App\Models\EventFacture;

class EventStaff extends Model
{
    protected $table = 'event_staff';
    protected $primarykey = "id";
    protected $fillable = ['post', 'necessary_staff', 'location_event_staff', 'zip_event_staff', 'country_event_staff', 'zone_event_staff', 'color_event_staff', 'hour_rate', 'description_fr_event_staff', 'description_en_event_staff', 'distance', 'per_diem'];
    
    public function eventAgency() {
        return $this->hasOne(EventAgency::class, 'id', 'event_id');
    }
    public function eventStaffDates() {
        return $this->hasMany(EventStaffDate::class, 'event_staff_id', 'id')->orderBy("date_start", "ASC");
    }
    public function eventStaffJobs() {
    	return $this->belongsToMany(Job::class, 'event_staff_jobs', 'event_staff_id');
    }

    public function eventStaffMobility() {
        return $this->belongsToMany(Mobility::class, 'event_staff_mobility', 'event_staff_id');
    }

    public function eventFactures() {
        return $this->hasMany(EventFacture::class, 'event_staff_id', 'id');
    }

    public function eventStaffCandidate() {
        return $this->hasMany(EventCandidate::class, 'event_staff_id', 'id');
    }

    public function eventStaffCandidateConfirmed() {
        return $this->hasMany(EventCandidate::class, 'event_staff_id', 'id')->where('status_event_id', 4);
    }

    public function eventAssessment() {
        return $this->hasMany(Event_Assessment::class, 'event_staff_id', 'id');
    }
}
