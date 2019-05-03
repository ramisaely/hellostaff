@if($event)
<div class="agency_card_container">
	<div class="section_title">
		<span>{!! trans('agency_staff.sheet_Agency') !!}</span>
	</div>

	<div class="agency_card_content">
		<div class="agency_logo">
			<img src="{{ $event->agency->getImageProfilPath() }}">
		</div>

		<div class="agency_card_header">
			<div class="agency_identity">
				<div class="agency_identity_item name">
					<img src="{!! url('/img/staff/name.svg') !!}">
					<div class="content">
						<p class="title">{!! trans('agency_staff.Name_Agency') !!}</p>
						<p class="text">{{ $event->agency->name }}</p>
					</div>
				</div>

				<div class="agency_identity_item address">
					<img src="{!! url('/img/staff/location.svg') !!}">
					<div class="content">
						<p class="title">{!! trans('agency_staff.Address') !!}</p>
						<p class="text">{{ $event->agency->address }}</p>
					</div>
				</div>
			</div>

			<div class="description">
				<p class="title">Description</p>
				<p class="text">{{ $event->agency->description_fr }}</p>
			</div>
		</div>

		<div class="agency_card_footer">
			<div class="submit">
				<button>{!! trans('agency_staff.SEND_MESSAGE') !!}</button>
			</div>
			<div class="footer_informations">
				<div class="information_item">
					<img src="{!! url('/img/staff/user.svg') !!}">
					<div class="information_wrapper">
						<p class="title">{!! trans('agency_staff.Agency_Contact') !!}</p>
						<p class="info">{{ $event->agency->name }}</p>
					</div>
				</div>
				<div class="information_item">
					<img src="{!! url('/img/staff/mail.svg') !!}">
					<div class="information_wrapper">
						<p class="title">Mail</p>
						<p class="info">{{ $event->agency->email }}</p>
					</div>
				</div>
				<div class="information_item">
					<img src="{!! url('/img/staff/smartphone.svg') !!}">
					<div class="information_wrapper">
						<p class="title">{!! trans('agency_staff.Phone') !!}</p>
						<p class="info">{{ $event->agency->phone }}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endif