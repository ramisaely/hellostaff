<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatusEventTranslation extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'status_event_translation';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';
	public $timestamps = false;
}