<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AllLanguageTranslation extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'all_language_translation';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';
	public $timestamps = false;
}
