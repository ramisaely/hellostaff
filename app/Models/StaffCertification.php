<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StaffCertification extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'staff_certifications';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
	
	public function staff() {
		return $this->hasOne(Staff::class, 'staff_id', 'id');
	}
}
