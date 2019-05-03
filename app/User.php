<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Models\Staff;
use App\Models\Agency;

class User extends Authenticatable implements MustVerifyEmail
{
    use Notifiable;

    /**
     * @var string
     */
    protected $table = 'users';
    /**
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'first_name', 'last_name', 'email', 'password', 'phone',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
    
    public function staff()
	{
	    return $this->hasOne(Staff::class,'user_id','id');
	}
	
	public function agency(){
	    return $this->belongsToMany(Agency::class, 'agency_users', 'user_id');
    }
}
