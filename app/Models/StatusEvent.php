<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\StatusEventTranslation;

class StatusEvent extends Model
{
    /**
     * @var string
     */
    protected $table = 'status_event';
    /**
     * @var string
     */
    protected $primaryKey = 'id';

    public function translation($language=null)
    {
        if($language==null){
            return $this->hasMany(StatusEventTranslation::class,'status_id');
        } else {
            return $this->hasOne(StatusEventTranslation::class,'status_id')->where('language_id',$language);
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
    
    public function getByLanguageId($language_id)
     {
         $option_translation= $this->translation->filter(function ($value, $key) use($language_id) {
             return ($value->language_id==$language_id);
         });
        return (count($option_translation)==0)?$this->translation->first():$option_translation->first();
     }
    
}