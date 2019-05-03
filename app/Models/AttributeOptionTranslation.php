<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AttributeOptionTranslation extends Model
{
    /**
	 * @var string
	 */
	protected $table = 'attribute_option_translations';
	/**
	 * @var string
	 */
	protected $primaryKey = 'id';

	public $timestamps = false;
}
