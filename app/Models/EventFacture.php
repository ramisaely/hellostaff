<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;
use App\Models\EventStaff;
use App\Models\Staff;

class EventFacture extends Model
{
    protected $table = 'event_facture';
    protected $primarykey = "id";

    protected $fillable = ['staff_id', 'event_staff_id', 'event_staff_date_id', 'range_done', 'expense', 'remuneration', 'additional_info', 'net_total', 'start_hour_done', 'end_hour_done', 'startDate_event', 'endDate_event'];

    public function eventStaff() {
        return $this->hasOne(EventStaff::class, 'id', 'event_staff_id');
    }

    public function staff() {
        return $this->hasOne(Staff::class, 'id', 'staff_id');
    }
}
