<?php

namespace App\Models;
use App\Models\Staff;
use App\Models\Agency;
use App\Models\EventAgency;
use App\Models\EventStaff;

use Illuminate\Database\Eloquent\Model;

class Event_Assessment extends Model
{
    protected $table = 'event_assessment';
    protected $primarykey = "id";

    public function staffs(){
        return $this->hasMany(Staff::class, 'id', 'staff_id');
    }

    public function eventAgency() {
        return $this->hasOne(EventAgency::class, 'id', 'event_id');
    }

    public function agency(){
        return $this->hasOne(Agency::class, 'id', 'agency_id');
    }

    public function eventStaff(){
        return $this->hasOne(EventStaff::class, 'id', 'event_staff_id');
    }
}
