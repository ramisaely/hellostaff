<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\User;
use App\Models\EventAgency;
use App\Models\Staff;
use App\Models\EventAgencyStatement;
use Illuminate\Support\Facades\URL;

class Agency extends Model
{
    protected $table = 'agency';
    protected $primarykey = "id";

    const AGENCY_IMAGE_PATH = '/upload/agency/logo/';

    protected $fillable = ['name', 'address', 'number', 'city', 'tps', 'tvq', 'postal_code', 'province', 'country', 
    'logo', 'description_fr', 'description_en', 'phone', 'email'];
    
    public function users() {
        return $this->belongsToMany(User::class, 'agency_users', 'agency_id');
    }

    public function staff() {
        return $this->belongsToMany(Staff::class, 'agency_staff', 'agency_id');
    }

    public function EventAgency() {
        return $this->hasMany(EventAgency::class, 'id', 'agency_id');
    }

    public function EventAgencyStatement() {
        return $this->hasMany(EventAgencyStatement::class, 'id', 'agency_id');
    }

    public function getImageProfilPath()
    {
        return URL::to('/') . self::AGENCY_IMAGE_PATH . $this->logo;
    }
}

