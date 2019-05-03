<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Staff;
use App\Models\AllLanguage;
use App\Models\AllLanguageChoice;

class StaffLanguage extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'staff_languages';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
	
	public function staff() {
	    return $this->hasOne(Staff::class, 'staff_id', 'id');
	}

	public function allLanguage() {
		return $this->hasOne(AllLanguage::class, 'id', 'all_language_id');
	}

	public function allLanguageChoice() {
		return $this->hasOne(AllLanguageChoice::class, 'id', 'all_language_choice_id');
	}
}
