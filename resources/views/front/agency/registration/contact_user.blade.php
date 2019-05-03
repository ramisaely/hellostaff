
<div class="contact_principal">
	<input type="hidden" class="boolean" value="1">
	<div class="title_agency">
		<div class="title_tiret">
			<div class="title">{!! trans('agency_register.main_contact') !!}</div>
			<!-- tiret			-->
			<div class="tiret tiret_contact_user"></div>
			<!-- End tiret      -->

		</div>

	</div>
	<?php
      if(Session::has('agencyData')) {
          $agency_data = Session::get('agencyData');
      }
  ?>

	<div class="contact_user item_user">
	    <div class="personal item">
			<div class="form_item">
				<label for="phone_agence">{!! trans('agency_register.agency_phone') !!}</label>
				<input type="tel"  class="required input_contact_user" name="agency_phone" id="phone_agence" data-msg="{!! trans('staff_register.invalid_field') !!}" value="" autocomplete="off">
				<small id="msgbox" style="color: red" data-verify_unique= "{{route('verify_unique')}}"></small>
			</div>
		</div>
	    <div class="personal item">
			<div class="form_item">
				<label for="mail_agence">{!! trans('agency_register.agency_email') !!}</label>
				<input type="email" class="required input_contact_user" name="agency_mail" id="mail_agence" data-msg="{!! trans('staff_register.invalid_field') !!}" value="" autocomplete="off">
				<small id="mailmsg" style="color: red" data-verifyUniqueMail= "{{route('verify_uniqueMail')}}"></small>
			</div>
		</div>
	</div>

	<!-- Ajouter Supprimer personal-->
 	<div class="personal_plus" data-range="1">
 		<div class="title_agency show_title">
			<div class="title_tiret">
				<div class="title">{!! trans('agency_register.user_name') !!}</div>
				<!-- tiret			-->
				<div class="tiret tiret_users"></div>
				<!-- End tiret      -->
			</div>
		</div>
		<div class="contact_user item_user">
			<div class="personal item">
			 <div class="form_item">
				 <label for="first_name_personal">{!! trans('agency_register.first_name') !!}</label>
				 <input type="text" class="required input_contact_user first_name" name="first_name_personal[]" id="first_name_personal" value="{{Session::has('agencyData') ? $agency_data['first_name_personal'] : ''}}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
			 </div>
		 </div>
			<div class="personal item">
				<div class="form_item">
					<label for="last_name_personal">{!! trans('agency_register.name') !!}</label>
					<input type="text" class="required input_contact_user last_name" name="last_name_personal[]" id="last_name_personal" value="{{Session::has('agencyData') ? $agency_data['last_name_personal'] : ''}}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
				</div>
			</div>

		</div>
		<div class="contact_user item_user">
			<div class="personal item">
				<div class="form_item">
					<label for="phone_personal">{!! trans('agency_register.user_phone') !!}</label>
					<input type="tel" class="required input_contact_user phone_personal" name="phone[]" id="phone_personal" value="" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
					<small class="phnPers" style="color: red" data-verify_uniquePhnPers= "{{route('verify_uniquePhnPers')}}"></small>
				</div>
			</div>
			<div class="personal item">
				<div class="form_item">
					<label for="adress_personal">{!! trans('agency_register.email') !!}</label>
					<input type="email" class="required input_contact_user adress_personal" name="email[]" id="adress_personal" value="" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
					<small class="emailPers" style="color: red" data-verify_uniqueEmailPers= "{{route('verify_uniqueEmailPers')}}"></small>
				</div>
			</div>
		</div>
		<div class="contact_user item_user">
			<div class="personal item">
				<div class="form_item">
					<label for="password">{!! trans('agency_register.password') !!}</label>
					<div class="input_group">
						<input class="input_contact_user required password" type="password" name="password[]" id="password" autocomplete="new-password" data-msg="{!! trans('staff_register.invalid_field') !!}">
						<span class="input_addon background_no_view " onclick="showPassword(this)">
							<!-- <i class="fa fa-eye" ></i> -->
						</span>
					</div>
				</div>
			</div>
			<div class="personal item">
				<div class="form_item">
					<label for="confirm_password">{!! trans('agency_register.password_verification') !!}</label>
					<div class="input_group">
						<input class="input_contact_user required confirm_password" type="password" name="confirm_password[]" autocomplete="new-password" id="confirm_password" data-msg="{!! trans('staff_register.invalid_field') !!}">
						<span class="input_addon background_no_view" onclick="showPassword(this)">
							<!-- <i class="fa fa-eye" ></i> -->
						</span>
					</div>
					<small class="popuptext" id="error_confirm">{!! trans('staff_register.error_confirm') !!}</small>
				</div>
			</div>

		</div>
		<div class="contact_user item_user">
			<div class="personal item">

			</div>
			<div class="personal item btn_responsive">
				<div class="form_item form_boutton">
					<div class="footer bouton_personal">
						<div class="supprimer">
							<a class=" delete_personal" id="" onclick="">{!! trans('agency_register.remove') !!}</a>
						</div>
						<div class="ajouter ajout1">
							<a class=" plus_personal" id="" onclick="">{!! trans('agency_register.validate') !!}</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="btn_make_user_register">
			<button type="button" name="" class="btn_make_user">{!! trans('agency_register.make_user') !!} </button>
		</div>
 	</div>
 	<!--End Ajouter Supprimer personal-->

	<div class="content_term_condition">

		<div class="tiret_separation"></div>
		<div class="form_item form_condition">
			<div class="g-recaptcha" data-callback="recaptchaCallback" data-sitekey="6Le2_nsUAAAAANsY7xLiQTVupTrvoCWSy6oqQBgz"></div>
			<input id="hidden-grecaptcha" name="hidden-grecaptcha"   data-msg="{!! trans('agency_register.recaptcha') !!}" type="text" style="opacity: 0; position: absolute; top: 0; left: 0; height: 1px; width: 1px;"/>
			<div></div>
		</div>
		<div class="form_item">
			<div class="condition marg_condition">
				<div class="checkbox">
					<input type="checkbox" class="required" name="condition_agree" id="condition_agree">

					<label class="checkbox_label" for="condition_agree">
						<small class="text_condition">
						{!! trans('agency_register.condition1') !!} <a class="link launch_modal" data-modal="term_and_condition">{!! trans('agency_register.condition2') !!}</a>
						</small>
					</label>
				</div>
			</div>
		</div>
	</div>

    <button type="submit" id="click_me" class="is_hidden">{!! trans('agency_register.click') !!}</button>
</div>
