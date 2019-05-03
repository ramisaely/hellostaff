<?php

namespace App\Models;
use App\User;
use App\Models\Agency;
use App\Models\EventAgency;
use App\Models\Staff;
use App\Models\EventAgencyStatementQuestionAnswer;

use Illuminate\Support\Facades\URL;

use Illuminate\Database\Eloquent\Model;

class EventAgencyStatement extends Model
{
    protected $table = 'event_statement';
    protected $primarykey = "id";

    public function eventAgency() {
        return $this->hasOne(EventAgency::class, 'event_id', 'id');
    }

    public function agency(){
        return $this->hasOne(Agency::class, 'agency_id', 'id');
    }

    public function staffs(){
        return $this->hasMany(Staff::class, 'id', 'staff_id');
    }

    public function users(){
        return $this->hasMany(User::class, 'user_id', 'id');
    }

    public function eventStatementQuestionAnswers(){
        return $this->hasMany(EventAgencyStatementQuestionAnswer::class, 'event_statement_id', 'id');
    }
    
}