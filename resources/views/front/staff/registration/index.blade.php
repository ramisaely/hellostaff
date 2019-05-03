@extends('front.staff.layout.master_registration')
@section('content')

{!! Form::open(array('url' => route('post_register_staff'),'files' => true,'class'=>'staff_registration', 'id'=>'regForm', 'data-session-staff' => route('save_staff_session'),'data-delete-session'=>route('remove_staff_session'))) !!}
	@csrf
	<div class="page">
		@include('front.staff.registration.contact_information')
	</div>
	<div class="page">
		@include('front.staff.registration.job_experience')
	</div>
	<div class="page">
		@include('front.staff.registration.langues')
	</div>
	<div class="page">
		@include('front.staff.registration.certification')
	</div>
	<div class="page">
		@include('front.staff.registration.attributs')
	</div>
	<div class="page">
		@include('front.staff.registration.remuneration')
	</div>
	<div class="page">
		@include('front.staff.registration.mobility')
	</div>
	<div class="page">
		@include('front.staff.registration.photo_cv')
	</div>
{!! Form::close() !!}
@endsection
