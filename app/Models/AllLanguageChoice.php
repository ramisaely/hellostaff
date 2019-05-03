<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\AllLanguageChoiceTranslation;

class AllLanguageChoice extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'all_language_choice';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public function translation($language=null)
	{
		if($language==null){
			return $this->hasMany(AllLanguageChoiceTranslation::class,'all_language_choice_id');
		} else {
			return $this->hasOne(AllLanguageChoiceTranslation::class,'all_language_choice_id')->where('language_id',$language);
		}
	}
	
	public function french()
	{
		return $this->translation(1);
	}
	
	public function english()
	{
		return $this->translation(2);
	}
	
	public function getByLanguageid($language_id)
	{
		$option_translation= $this->translation->filter(function ($value, $key) use($language_id) {
			return ($value->language_id==$language_id);
		});
		return (count($option_translation)==0)?$this->translation->first():$option_translation->first();
	}
}
