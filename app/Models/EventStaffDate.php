<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\EventStaff;
use App\Models\EventFacture;

class EventStaffDate extends Model
{
    protected $table = 'event_staff_date';
    protected $primarykey = "id";
    protected $fillable = ['event_staff_id', 'start_hour_event_staff_date', 'end_hour_event_staff_date', 'color_event_staff_date', 'date_start', 'date_end'];
    
    public function eventStaff() {
        return $this->belongsTo(EventStaff::class, 'event_staff_id', 'id');
    }

    public function eventFacture() {
        return $this->hasOne(EventFacture::class, 'event_staff_date_id', 'id');
    }
}
