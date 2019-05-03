<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StaffAttributeOption extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'staff_attribute_options';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
	
	public function staff(){
		return $this->hasOne(Staff::class, 'staff_id', 'id');
	}
	public function attributeoptionTranslation(){
		return $this->hasOne(AttributeOptionTranslation::class,'attribute_option_id','attribute_option_id');
	}
}
