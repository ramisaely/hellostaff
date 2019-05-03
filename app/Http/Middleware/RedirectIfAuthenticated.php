<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\Auth\Guard;

class RedirectIfAuthenticated
{
    protected $auth;

	public function __construct(Guard $guard)
	{
		$this->auth = $guard;
	}
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (Auth::guard($guard)->check()) {
            $user = $this->auth->user();
    		if ($user->role_id == 1) {
    			return redirect()->route('home_staff');
    		}else
    		    return redirect()->route('home_agency');
        }

        return $next($request);
    }
}
