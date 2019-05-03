<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JobTranslation extends Model
{
         /**
	 * @var string
	 */
	protected $table = 'job_translation';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
}
