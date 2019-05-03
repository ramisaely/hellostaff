<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Job;

class StaffJob extends Model
{
    
    /**
	 * @var string
	 */
	protected $table = 'staff_jobs';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
	
	
	public function job() {
	    return $this->hasOne(Job::class, 'id', 'job_id');
	}
}
