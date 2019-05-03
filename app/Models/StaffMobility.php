<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Staff;
use App\Models\Mobility;

class StaffMobility extends Model
{
            /**
	 * @var string
	 */
	protected $table = 'staff_mobility';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;


    public function staff() {
        return $this->hasOne(Staff::class, 'id', 'staff_id');
    }

     public function mobility() {
        return $this->hasOne(Mobility::class, 'id', 'mobility_id');
    }
}
