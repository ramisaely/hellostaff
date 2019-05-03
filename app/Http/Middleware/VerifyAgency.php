<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Contracts\Auth\Guard;

class VerifyAgency
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
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (!$this->auth->check()) {
			return redirect()->route('login_agency');
		}
		$user = $this->auth->user();
		if ($user->role_id == 1) {
			return redirect()->route('home_front');
		}
        return $next($request);
    }
}
