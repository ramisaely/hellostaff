<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AttributeTranslation extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'attribute_translations';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
}
