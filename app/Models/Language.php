<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Language extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'language';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
}
