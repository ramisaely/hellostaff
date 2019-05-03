<?php

namespace App\Models;
use App\Models\Staff;
use App\Models\Agency;

use Illuminate\Database\Eloquent\Model;

class AgencyStaff extends Model
{
    protected $table = 'agency_staff';
    protected $primarykey = "id";

    public function staff() {
        return $this->hasOne(Staff::class, 'id', 'staff_id');
    }
    public function agency() {
        return $this->hasOne(Agency::class, 'id', 'agency_id');
    }
}
