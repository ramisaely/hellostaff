<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::group(['namespace' => '', 'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ], 'prefix' => LaravelLocalization::setLocale()], function () {
	/*Route::get('/', function () {
	    return view('welcome');
	});*/
	Route::get('/', function () {
	    return view('front.home.index');
	})->name('home_front');

	//Default route for Front
	Route::group(['namespace' => 'Front', 'prefix' => ''], function () {
		//Reset password route list
	    Route::get('forgot-password', ['as' => 'password.request', 'uses' => 'Auth\PasswordController@getEmail']);
	    Route::post('forgot-password', ['as' => 'password.email', 'uses' => 'Auth\PasswordController@postEmail']);
	    Route::get('password/reset/{token}', ['as' => 'password.reset', 'uses' => 'Auth\PasswordController@getReset']);
	    Route::post('forgot', ['as' => 'password.update', 'uses' => 'Auth\PasswordController@postReset']);

	    //email verification route list
	    Route::get('email/verify', ['as' => 'verification.notice', 'uses' => 'Auth\EmailVerificationController@showEmail']);
		Route::get('email/verify/{id}', ['as' => 'verification.verify', 'uses' => 'Auth\EmailVerificationController@verifyEmail']);
		Route::get('email/resend', ['as' => 'verification.resend', 'uses' => 'Auth\EmailVerificationController@resendEmail']);


	/*-----------Staff route start-----------*/
	Route::group(['namespace' => 'staff', 'prefix' => 'staff'], function () {
		//Staff register
		Route::get('register', ['uses' => 'Auth\AuthController@getRegister', "middleware" => 'guest', 'as' => 'register_staff']);
        Route::post('post_register_staff', 'Auth\AuthController@postRegisterStaff')->name('post_register_staff');
        // staff session
        Route::get('save_staff_session', 'Auth\AuthController@saveStaffInSession')->name('save_staff_session');
        Route::get('remove_staff_session', 'Auth\AuthController@removeSession')->name('remove_staff_session');
        Route::post('verifyEmail', 'Auth\AuthController@verifyEmail')->name('verify_email');
        Route::post('verifyPhone', 'Auth\AuthController@verifyPhone')->name('verify_phone');
		//staff login
		Route::get('login', ['uses' => 'Auth\AuthController@getLogin', "middleware" => 'guest', 'as' => 'login_staff']);
    	Route::post('login', 'Auth\AuthController@postLogin')->name('post_login_staff');
	    Route::get('logout', 'Auth\AuthController@destroy')->name('logout_staff');
	    Route::post('get_events_by_staff','CalendarController@getEvents')->name('get_events_by_staff');

        /*----------------Staff authentified start------------------*/
        Route::group(['middleware' => ['auth']], function () {
        	Route::group(['middleware' => ['staff']], function () {
	            Route::group(['middleware' => ['verified']], function () {
		            Route::get('/home', 'HomeController@index')->name('home_staff');
		            Route::get('/update_profil', 'Auth\AuthController@getEditProfil')->name('update_profil_staff');
		            Route::post('/update_profil_staff','Auth\AuthController@updateProfil')->name('post_update');
		            Route::get('/job_offer', 'jobOfferController@index')->name('job_offer');
		            Route::get('/bills', 'FactureController@index')->name('staff_bills');
		           	Route::get('/evaluate', 'EvaluateController@index')->name('evaluate');
		           	Route::get('/finished_event', 'FinishedEvent@index')->name('finished_event_staff');
		           	Route::get('/future_event', 'Future_event@index')->name('future_event_staff');
		           	//Route::get('/download_bill/{event_staff_id}', 'FinishedEvent@download_bill')->name('download_bill');

		           	//applyOrDeclineJob
		           	Route::post('/apply_or_deline_job', 'jobOfferController@applyOrDeclineJob')->name('apply_or_deline_job');
		           	//calendar
		         	Route::get('/calendar', 'CalendarController@index')->name('staff_calendar');
		         	//Answer Question
		         	Route::post('/insertAnswer', 'FinishedEvent@insert_answer')->name('insertAnswer');
		         	//Header Slider
		         	Route::post('/findEvent', 'Future_event@find_event')->name('find_event_staff');
		         	Route::post('/findFinishedEvent', 'FinishedEvent@findFinishedEvent')->name('find_finished_event_staff');
		         	//Answer Question
		         	Route::post('/getEvent', 'jobOfferController@getEvent')->name('getEvent');
		         	//Stored invoicies
		         	Route::post('/storedInvoicies', 'FinishedEvent@storeFacture')->name('storedInvoicies');
		         	//Find Bills
		         	Route::post('/findFacture', 'FactureController@findFacture')->name('findFacture');
				});
        	});
		});
		/*-----------------Staff authentified end------------------*/
	});
	/*-----------Staff route end-------------*/

	/*-------------Agency route start--------*/
	Route::group(['namespace' => 'agency', 'middleware' => [], 'prefix' => 'agency'], function () {
		//Agency register
		Route::get('register', ['uses' => 'Auth\AuthController@postRegister', "middleware" => 'guest', 'as' => 'register_agency']);
        Route::post('post_register', 'Auth\AuthController@postRegisterAgency')->name('post_register_agency');
        //Agency Login
        Route::get('login', ['uses' => 'Auth\AuthController@getLogin', "middleware" => 'guest', 'as' => 'login_agency']);
    	Route::post('login', 'Auth\AuthController@postLogin')->name('post_login_agency');
	    Route::get('logout', 'Auth\AuthController@destroy')->name('logout_agency');

        Route::get('save_agency_in_session', 'Auth\AuthController@saveAgencyInSession')->name('save_agency_in_session');
        Route::get('remove_agency_in_session', 'Auth\AuthController@removeAgencyInsSession')->name('remove_agency_in_session');
        Route::post('verifyUnique', 'Auth\AuthController@verify_unique')->name('verify_unique');
        Route::post('verifyUniqueMail', 'Auth\AuthController@verify_uniqueMail')->name('verify_uniqueMail');
        Route::post('verifyUniquePersPhone', 'Auth\AuthController@verify_uniquePhnPers')->name('verify_uniquePhnPers');
        Route::post('verifyUniquePersEmail', 'Auth\AuthController@verify_uniqueEmailPers')->name('verify_uniqueEmailPers');
        Route::post('/get_all_events','EventController@getAllEvents')->name('get_all_events');

        /*----------------Agency authentified start------------------*/
        Route::group(['middleware' => ['auth']], function () {
        	Route::group(['middleware' => ['agency']], function () {
	            Route::group(['middleware' => ['verified']], function () {
		            Route::get('/home', 'HomeController@index')->name('home_agency');
		            //edit update
		         	Route::get('/edit', 'Auth\AuthController@edit')->name('edit_agency');
		         	Route::post('/update', 'Auth\AuthController@update')->name('update_agency');
		         	Route::post('/findPassword', 'Auth\AuthController@sendValuePassword')->name('sendValue');
		         	//create event
		         	Route::get('/create_event', 'EventController@createEvent')->name('create_event');
		         	Route::get('/create_of_event', 'EventController@createOfEvent')->name('create_of_event');
		         	Route::post('/event_register','EventController@postRegisterEvent')->name('post_register_event');
		         	//future event
		         	Route::get('/future_event', 'FutureEventController@index')->name('future_event');
		         	//Budget Previsionnel
		         	Route::post('/store_budget', 'FutureEventController@storeBudget')->name('storeBudget');

					Route::post('/candidate_form', 'FutureEventController@getCandidatesCard')->name('candidate_form');
		         	Route::post('/updateEvent', 'FutureEventController@update_Event')->name('updateEvent');
		         	Route::post('/deleteEvent', 'FutureEventController@erase_Event')->name('eraseEvent');
					Route::post('/find_candidate', 'FutureEventController@find_candidate')->name('find_candidate');
					Route::post('/update_horary', 'FutureEventController@update_horary')->name('update_horary');
					Route::post('/see_candidate', 'FutureEventController@see_candidate')->name('see_candidate');
					Route::post('/confirm_candidate', 'FutureEventController@confirm_candidate')->name('confirm_candidate');
					Route::post('/job_offer', 'FutureEventController@job_offer')->name('job_staff_offer');
					Route::post('/job_all_staff_offer', 'FutureEventController@job_all_staff_offer')->name('job_all_staff_offer');
					Route::post('/reload_staff_confirme', 'FutureEventController@reload_staff_confirme')->name('reload_staff_confirme');
					Route::post('/get_modal_info', 'FutureEventController@get_modal_info')->name('get_modal_info');

		         	//finished event
		         	Route::get('/finished_event', 'FinishedEventController@index')->name('finished_event');
		         	//my staff
		         	Route::get('/my_staff', 'MyStaffController@index')->name('my_staff');
		         	//Show Image Staff
		         	Route::post('/get_image_staff', 'MyStaffController@get_image_staff')->name('getImageStaff');
		         	//Show staff
		         	Route::post('/show_staff', 'MyStaffController@show_staff')->name('showStaff');
		         	//Show staff for my staff
		         	Route::post('/show_staff_for_my_staff', 'MyStaffController@show_staff_for_my_staff')->name('show_staff_for_my_staff');
		         	//Add new staff to MyStaff
		         	Route::post('/addStaffToMyStaff', 'MyStaffController@find_staff')->name('addStaffToMyStaff');
		         	//Delete staff to MyStaff
		         	Route::post('/deleteAgencyStaff', 'MyStaffController@delete_agency_staff')->name('deleteAgencyStaff');
		         	//Delete candidate
		         	Route::post('/deleteCandidate', 'FutureEventController@delete_candidate')->name('deleteCandidate');
		         	//Show staff post
		         	Route::post('/showPostOfStaff', 'MyStaffController@show_post_of_staff')->name('showPostOfStaff');
		         	//calendar
		         	Route::get('/calendar', 'CalendarController@index')->name('calendar');
		         	//Header Slider
		         	Route::post('/findEvent', 'FutureEventController@find_event')->name('find_event');
		         	//Header Slider event finished
		         	Route::post('/findEventFinished', 'FinishedEventController@findEventById')->name('find_event_finished');
		         	//event statement regsister
		         	Route::post('/eventStatementRegister', 'FutureEventController@registerEventStatement')->name('event_statement_register');
		         	//Evaluation Register
		         	Route::post('/evaluation_register', 'FinishedEventController@evaluationRegister')->name('evaluation_register');
				});
        	});
		});
		/*-----------------Agency authentified end------------------*/
	});
	/*-------------End Agency route start--------*/

});






	/************* Inscription Hellostaff *************/
	Route::group(['namespace' => 'hellostaff', 'middleware' => [], 'prefix' => 'hellostaff'], function () {
		Route::get('/candidat_filter', 'PageHellostaffController@candidat_filter');
		Route::get('/create_event', 'PageCreateEventController@create_event');
        Route::get('/login', 'LoginController@index');
	});
	/************** End Inscription Hellostaff ****/

	Route::get('/agency_mobile_first', function (){
		return view ('agency_mobile.agency');
	});
	Route::get('/create_mobile', function (){
		return view ('create_mobile.create_mobile_first');
	});
	Route::get('/header_mobile', function (){
		return view ('header_mobile.header_mobile_first');
	});


});
