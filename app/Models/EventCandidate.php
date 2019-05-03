<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\EventStaff;
use App\Models\Staff;
use App\Models\StatusEvent;



class EventCandidate extends Model
{
    protected $table = 'event_candidate';
    protected $primarykey = "id";
    public $timestamps = false;

    protected $fillable = ['staff_id', 'event_staff_id', 'status'];
    
    public function eventStaff() {
        return $this->hasOne(EventStaff::class, 'id', 'event_staff_id');
    }


    public function staff() {
        return $this->hasOne(Staff::class, 'id', 'staff_id');
    }

    public function statusEvent() {
        return $this->hasOne(StatusEvent::class, 'id', 'status_event_id');
    }
}
