<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\URL;
use App\Models\AttributeOption;

class Attribute extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'attributes';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	const ATTRIBUTE_IMAGE_PATH = '/img/liste_attributs/';

	public function getImagePath()
	{
		return URL::to('/') . self::ATTRIBUTE_IMAGE_PATH . $this->image;
	}
	
	public function options()
	{
	    return $this->hasMany(AttributeOption::class,'attribute_id','id');
	}
	
	public function translation($language=null)
	{
		if($language==null){
			return $this->hasMany(AttributeTranslation::class,'attribute_id');
		} else {
			return $this->hasOne(AttributeTranslation::class,'attribute_id')->where('language_id',$language);
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
	
	public function getByLanguageid($language_id){
		$option_translation= $this->translation->filter(function ($value, $key) use($language_id) {
			return ($value->language_id==$language_id);
		});
		return (count($option_translation)==0)?$this->translation->first():$option_translation->first();
	}
}
