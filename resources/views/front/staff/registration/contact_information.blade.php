<div class="contact_information grid">
	<div class="personal item">
		<div class="title">{!! trans('staff_register.staff') !!}</div>
		<?php 
            if(Session::has('staffData')) {
                $staff_data = Session::get('staffData');
            }
        ?>

		<div class="form_item">
			<label for="name">{!! trans('staff_register.first_name') !!}</label>
			<input class="required" type="text" name="first_name" id="name" value="{{Session::has('staffData') ? $staff_data['first_name'] : ''}}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
		</div>

		<div class="form_item">
			<label for="last_name">{!! trans('staff_register.last_name') !!}</label>
			<input class="required" type="text" name="last_name" id="last_name" value="{{Session::has('staffData') ? $staff_data['last_name']: ''}}" data-msg="{!! trans('staff_register.invalid_field') !!}." autocomplete="off">
		</div>

		<div class="form_item">
			<div class="checkbox_wrap">
				<label>{!! trans('staff_register.gender') !!}</label>
				<div class="checkbox_items">
						<div class="checkbox">
							<input type="radio" onclick="load_gender(this);" name="gender" value="1" id="man" class="required" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" {{Session::has('staffData') ? $staff_data['man'] : ''}}>
							<div class="checkmark"></div>
							
							<label class="checkbox_label {{Session::has('staffData') ? ($staff_data['man'] != '' ? 'active' : '') : ''}}" for="man">{!! trans('staff_register.man') !!}</label>
							
						</div>
						<div class="checkbox">
							<input type="radio" onclick="load_gender(this);" name="gender" value="2" id="woman" class="required" autocomplete="off" {{Session::has('staffData') ? $staff_data['woman'] : ''}}>
							<label class="checkbox_label {{Session::has('staffData') ? ($staff_data['woman'] != '' ? 'active' : '') : ''}}" for="woman">{!! trans('staff_register.woman') !!}</label>
						</div>
				</div>
			</div>
		</div>

		<div class="form_item">
			<label> {!! trans('staff_register.birthday') !!}</label>
			<div class="separated_date_picker">
					<div class="dropdown-menu birth_day">
						<span class="form_item label_select">
							<input class="select day required" id="day" name="birth_day" value="{{Session::has('staffData') ? $staff_data['birth_day'] : ''}}" placeholder="{!! trans('staff_register.day') !!}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" readonly>
						</span>
						<ul class="dropdown scrollbar" data-input="day">
							<?php for($day=1;$day<=31;$day++) { ?>
								<li>{{ $day }}</li>
							<?php } ?>
						</ul>
					</div>

					<div class="dropdown-menu birth_day">
						<span class="form_item label_select year">
							<input class="select month required" id="month" name="birth_month" value="<?php if(Session::has('staffData')) {
                				$staff_data = Session::get('staffData');  
                				switch ($staff_data['birth_month']) {
								case "Janvier":
									$monthL = trans('staff_register.january');
									break;
								case "January":
									$monthL = trans('staff_register.january');
									break;
								
								case "Février":
									$monthL = trans('staff_register.february');
									break;
								case "February":
									$monthL = trans('staff_register.february');
									break;
								case "Mars":
									$monthL = trans('staff_register.march');
									break;
								case "march":
									$monthL = trans('staff_register.march');
									break;
								case "Avril":
									$monthL = trans('staff_register.april');
									break;
								case "April":
									$monthL = trans('staff_register.april');
									break;
								case "Mai":
									$monthL = trans('staff_register.may');
									break;
								case "May":
									$monthL = trans('staff_register.may');
									break;
								case "Juin":
									$monthL = trans('staff_register.june');
									break;
								case "June":
									$monthL = trans('staff_register.june');
									break;
								case "Juillet":
									$monthL = trans('staff_register.july');
									break;
								case "July":
									$monthL = trans('staff_register.july');
									break;
								case "Août":
									$monthL = trans('staff_register.august');
									break;
								case "August":
									$monthL = trans('staff_register.august');
									break;
								case "Septembre":
									$monthL = trans('staff_register.september');
									break;
								case "September":
									$monthL = trans('staff_register.september');
									break;
								case "Octobre":
									$monthL = trans('staff_register.october');
									break;
								case "October":
									$monthL = trans('staff_register.october');
									break;
								case "Novembre":
									$monthL = trans('staff_register.november');
									break;
								case "November":
									$monthL = trans('staff_register.november');
									break;
								case "Décembre":
									$monthL = trans('staff_register.december');
									break;
								case "December":
									$monthL = trans('staff_register.december');
									break;
								default:
									$monthL = "";
									break;
							}
							echo $monthL;
								}?>" placeholder="{!! trans('staff_register.month') !!}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" readonly>
						</span>
						<ul class="dropdown scrollbar" data-input="month">
							<?php for($month=1;$month<=12;$month++) { switch ($month) {
								case 1:
									$monthL = trans('staff_register.january');
									break;
								
								case 2:
									$monthL = trans('staff_register.february');
									break;
								case 3:
									$monthL = trans('staff_register.march');
									break;
								case 4:
									$monthL = trans('staff_register.april');
									break;
								case 5:
									$monthL = trans('staff_register.may');
									break;
								case 6:
									$monthL = trans('staff_register.june');
									break;
								case 7:
									$monthL = trans('staff_register.july');
									break;
								case 8:
									$monthL = trans('staff_register.august');
									break;
								case 9:
									$monthL = trans('staff_register.september');
									break;
								case 10:
									$monthL = trans('staff_register.october');
									break;
								case 11:
									$monthL = trans('staff_register.november');
									break;
								case 12:
									$monthL = trans('staff_register.december');
									break;
							}
								?>
								<li>{{ $monthL }}</li>
							<?php } ?>
						</ul>
					</div>

					<div class="dropdown-menu birth_day">
						<span class="form_item label_select">
							<input class="select year required" id="year" name="birth_year" value="{{Session::has('staffData') ? $staff_data['birth_year'] : ''}}" placeholder="{!! trans('staff_register.year') !!}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" readonly>
						</span>
						<input type="hidden" class="staff_ages" name="ages" value="">
						<ul id="yearID" class="dropdown scrollbar" data-input="year">
							<?php for($year=1960;$year<=2018; $year++) { ?>
								<li id="{{ $year }}">{{ $year }}</li>
							<?php } ?>
						</ul>
					</div>
				</div>

		</div>
	</div>
	<div class="account item">
		<div class="title">{!! trans('staff_register.account') !!}</div>

		<div class="form_item">
			<label for="email">{!! trans('staff_register.email') !!}</label>
			<input class="required" type="text" name="email" id="email" value="{{Session::has('staffData') ? $staff_data['email'] : ''}}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" data-email_verif="{{route('verify_email')}}"><br>
			<small class="popuptext" id="emailerror" style="color: red"></small>
		</div>

		<div class="form_item">
			<label for="password">{!! trans('staff_register.password') !!}</label>
			<div class="input_group">
				<input class="required" type="password" name="password"  id="password" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
				<span class="input_addon background_no_view" onclick="showPassword(this)">
					<!-- <i class="fa fa-eye" ></i> -->
				</span>
			</div>
		</div>

		<div class="form_item">
			<label for="confirm_password">{!! trans('staff_register.confirm_password') !!}</label>
			<div class="input_group">
				<input class="required" type="password" name="confirm_password" id="confirm_password" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
				<span class="input_addon background_no_view" onclick="showPassword(this)">
					<!-- <i class="fa fa-eye" ></i> -->
				</span>
			</div>
			<small class="popuptext" id="error_confirm">{!! trans('staff_register.error_confirm') !!}</small>
		</div>

		<div class="form_item">
			<label for="phone">{!! trans('staff_register.cellular_sms') !!}</label>
			<!--<input type="tel" pattern="[\+]\d{0,100000}" class="required"  name="phone" value="{{Session::has('staffData') ? $staff_data['phone'] : ''}}" id="phone" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" data-phone_verif="{{route('verify_phone')}}"><br>-->
			<input type="number" style="-moz-appearance: textfield" class="required"  name="phone" value="{{Session::has('staffData') ? $staff_data['phone'] : ''}}" id="phone" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" data-phone_verif="{{route('verify_phone')}}"><br>
			<small class="popuptext" id="phoneerror" style="color: red"></small><br>
			<small>{!! trans('staff_register.cellular_sms_text') !!}</small>
		</div>
		
	</div>
	<div class="contact item">
		<div class="title">Contact</div>

		<div class="form_item">
			<label for="city">{!! trans('staff_register.city') !!}</label>
			<input class="required" type="text" name="city" value="{{Session::has('staffData') ? $staff_data['city'] : ''}}" id="city" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
		</div>

		<div class="form_item">
			<label for="address">{!! trans('staff_register.address') !!}</label>
			<input class="required" type="text" name="address" value="{{Session::has('staffData') ? $staff_data['address'] : ''}}" id="address" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
		</div>

		<div class="form_item">
			<label for="code_postal">{!! trans('staff_register.postal_code') !!}</label>
			<input class="required zip_staff" type="text" name="zip_code" value="{{Session::has('staffData') ? $staff_data['zip_code'] : ''}}" id="code_postal" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" maxlength="7">
		</div>

		<div class="form_item">
			<label>Source</label>
			<div class="dropdown-menu source">
				<label for="day" class="label_select">
					<input class="select source required" type="text" id="source" name="source" value="<?php if(Session::has('staffData')) {
                		$staff_data = Session::get('staffData');
                		switch ($staff_data['source']){
                			case "Amis":
                				$value = trans('staff_register.friends');
                				break;
                			case "Friends":
                				$value = trans('staff_register.friends');
                				break;
                			case "Parrainage":
                				$value = trans('staff_register.sponsorship');
                				break;
                			case "Sponsorship":
                				$value = trans('staff_register.sponsorship');
                				break;
                			case "Notre site web":
                				$value = trans('staff_register.our_website');
                				break;
                			case "Our website":
                				$value = trans('staff_register.our_website');
                				break;
                			case "Réseau sociaux":
                				$value = trans('staff_register.social_networks');
                				break;
                			case "Social networks":
                				$value = trans('staff_register.social_networks');
                				break;
                			case "Bouche-à-oreille":
                				$value = trans('staff_register.word_of_mouth');
                				break;
                			case "Word of mouth":
                				$value = trans('staff_register.word_of_mouth');
                				break;
                			case "Campus Universitaire":
                				$value = trans('staff_register.university_campus');
                				break;
                			case "University campus":
                				$value = trans('staff_register.university_campus');
                				break;
                			case "Ne se prononce pas":
                				$value = trans('staff_register.is_not_pronounced');
                				break;
                			case "Is not pronounced":
                				$value = trans('staff_register.is_not_pronounced');
                				break;
                			default:
                				$value = '';
                				break;

                		}
                		echo $value;
	            	}?>" placeholder="-- {!! trans('staff_register.choose_source') !!} --" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" readonly="readonly">
				</label>
				<ul class="dropdown dropdown_large scrollbar" data-input="source">
						<li>{!! trans('staff_register.friends') !!}</li>
						<li>{!! trans('staff_register.sponsorship') !!}</li>
						<li>{!! trans('staff_register.our_website') !!}</li>
						<li>{!! trans('staff_register.social_networks') !!}</li>
						<li>{!! trans('staff_register.word_of_mouth') !!}</li>
						<li>{!! trans('staff_register.university_campus') !!}</li>
						<li>{!! trans('staff_register.is_not_pronounced') !!}</li>
				</ul>

			</div>
			<small>{!! trans('staff_register.choose_source_text') !!}</small>
		</div>
	</div>
</div>
