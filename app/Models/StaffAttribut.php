<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\StaffAttributeOption;

class StaffAttribut extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'staff_attribut';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
	
	public function StaffAttributeOption()
	{
	    return $this->hasMany(StaffAttributeOption::class,'staff_attribut_id','id');
	}
}
