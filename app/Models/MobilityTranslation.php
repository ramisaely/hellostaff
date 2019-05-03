<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MobilityTranslation extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'mobility_translation';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';
	public $timestamps = false;
}
