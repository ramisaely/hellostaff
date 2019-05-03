<?php

namespace App\Http\Controllers\Front\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Contracts\Auth\PasswordBroker;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;
use Validator;

class PasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset requests
    | and uses a simple trait to include this behavior. You're free to
    | explore this trait and override any methods you wish to tweak.
    |
    */

    use ResetsPasswords;
    protected $redirectTo = '/';
    /**
     * Create a new password controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    public function getEmail()
    {
        return view('auth.passwords.email');
    }

    public function getReset(Request $request, $token = null)
    {
        return view('auth.passwords.reset')->with(
            ['token' => $token, 'email' => $request->email]
        );
    }
    public function postEmail(Request $request)
    {
        $this->validateEmail($request);

        $response = $this->broker()->sendResetLink(
            $request->only('email')
        );

        return $response == Password::RESET_LINK_SENT
            ? $this->sendResetLinkResponse($response)
            : $this->sendResetLinkFailedResponse($request, $response);
    }

    /**
     * Validate the email for the given request.
     *
     * @param \Illuminate\Http\Request  $request
     * @return void
     */
    protected function validateEmail(Request $request)
    {
        $this->validate($request, ['email' => 'required|email']);
    }

    protected function sendResetLinkResponse($response)
    {
        return back()->with('status', trans($response));
    }

    protected function sendResetLinkFailedResponse(Request $request, $response)
    {
        return back()->withErrors(
            ['email' => trans($response)]
        );
    }
    public function broker()
    {
        return Password::broker('users');
    }

    public function postReset(Request $request)
    {
        $credentials = Input::only('email', 'password', 'password_confirmation', 'token');
        $credentials['email'] = (Input::get('email'));
        $rules = array(
            'password' => 'required',
            'password_confirmation' => 'required',
            'email' => 'required',

        );
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return Redirect::back()->withInput()->withErrors($validator);
        }
        $role_user = false;
        $response = Password::broker('users')->reset($credentials, function ($user, $password) {
            if($user->role_id == 1)
                $role_user = true;
            $user->password = \Hash::make($password);
            $user->save();
        });
        switch ($response) {
            case PasswordBroker::INVALID_PASSWORD:
                return Redirect::back()->withErrors(trans('passwords.password'));
            case PasswordBroker::INVALID_TOKEN:
                return Redirect::back()->withErrors(trans('passwords.token'));
            case PasswordBroker::INVALID_USER:
                return Redirect::back()->withErrors(trans('passwords.user'));
            case PasswordBroker::PASSWORD_RESET:
                if($role_user)
                    return redirect()->route('login_staff')->with('status', trans('passwords.reset'));
                else
                    return redirect()->route('login_agency')->with('status', trans('passwords.reset'));
        }
    }
}
