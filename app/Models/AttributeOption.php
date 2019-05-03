<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Attribute;
use App\Models\AttributeOptionTranslation;
use App\Models\AttributeOptionGender;

class AttributeOption extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'attribute_options';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
	
	public function attribute()
	{
	    return $this->hasOne(Attribute::class,'attribute_id','id');
	}
	
	public function translation($language=null)
	{
		if($language==null) {
			return $this->hasMany(AttributeOptionTranslation::class, 'attribute_option_id');
		} else {
			return $this->hasOne(AttributeOptionTranslation::class, 'attribute_option_id')->where('language_id',$language);
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
    
    public function optionGender()
    {
    	return $this->hasOne(AttributeOptionGender::class, 'attribute_option_id', 'id');
    }
}
