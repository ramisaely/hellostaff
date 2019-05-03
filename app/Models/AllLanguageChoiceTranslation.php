<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AllLanguageChoiceTranslation extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'all_language_choice_translation';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';
	public $timestamps = false;
}
