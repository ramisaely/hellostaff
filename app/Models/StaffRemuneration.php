<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Staff;

class StaffRemuneration extends Model
{
            /**
	 * @var string
	 */
	protected $table = 'staff_remunerations';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
	
	public function staff() {
	    return $this->hasOne(Staff::class, 'id', 'staff_id');
	}

}
