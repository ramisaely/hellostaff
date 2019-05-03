<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AttributeOptionGender extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'attribute_option_gender';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
}
