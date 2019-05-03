@extends('front.agency.layout.master_registration')
@section('content')
{!! Form::open(array('url' => route('post_register_agency'),'files' => true,'class'=>'agency_registration','autocomplete'=>'off' ,'id'=>'regForm', 'data-url-session' => route('save_agency_in_session'))) !!}
	@csrf
	<div class="page">
		@include('front.agency.registration.entreprise')
	</div>
	<div class="page">
		@include('front.agency.registration.corporative_identity')
	</div>
	<div class="page">
		@include('front.agency.registration.contact_user')
	</div>
{!! Form::close() !!}
@endsection
