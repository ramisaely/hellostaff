
<div class="photo_cv grid">

  <div class="portrait ">
    <div class="level1">
      <label class="icon_plus" for="portrait">+</label>
      <div class="level2">
        <div class="icon_photo">
            <img id="imgPortrait" class="make_print_photo_desktop" src="{!! url('img/step_photo_cv/icon_upload.svg') !!}"></img>
        </div>
      </div>
    </div>
    <p class="title"></p>
    <span class="medium_title">{!! trans('staff_register.portrait_picture') !!}</span>
     <small class="mini_title">{!! trans('staff_register.browse_your') !!} <label class="file_link" for="portrait">{!! trans('staff_register.files') !!}</label>
       <input type="file" class="input_hidden" name="portrait" value="" id="portrait" accept="image/*;capture=camera">
     </small>
     <p class = "infoPortrait" style="font-size:80%;color:red;font-style:italic;"></p>
  </div>


  <div class="portrait ">
    <div class="level1">
      <label class="icon_plus" for="long_portrait">+</label>
      <div class="level2">
        <div class="icon_photo">
            <img id="imgPortraitPlain" class="make_print_photo_plain_desktop" src="{!! url('img/step_photo_cv/icon_upload.svg') !!}"></img>
        </div>
      </div>
    </div>
    <p class="title"></p>
    <span class="medium_title">{!! trans('staff_register.photo_plein_foot') !!}</span>
     <small class="mini_title">{!! trans('staff_register.browse_your') !!} <label class="file_link" for="long_portrait">{!! trans('staff_register.files') !!}</label>
       <input type="file" class="input_hidden" name="portrait_plein" value="" id="long_portrait" accept="image/*;capture=camera">
     </small>
     <p class = "infoPortraitPlain" style="font-size:80%;color:red;font-style:italic;"></p>
  </div>

  <div class="item divider"></div>

  <div class="portrait ">
    <div class="level1">
      <label class="icon_plus" for="cv">+</label>
      <div class="level2">
        <div class="icon_photo">
            <img id="imgCV" src="{!! url('img/step_photo_cv/icon_upload_cv.svg') !!}"></img>
        </div>
      </div>
    </div>
    <p class="title"></p>
    <span class="medium_title">{!! trans('staff_register.cv') !!}</span>
     <small class="mini_title">{!! trans('staff_register.browse_your') !!} <label class="file_link" for="cv">{!! trans('staff_register.files') !!}</label>
       <input type="file" class="input_hidden" name="cv" value="" id="cv" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
     </small>
     <p class = "infoCV" style="font-size:80%;color:red;font-style:italic;"></p>
  </div>

  <button type="submit" id="click_me" class="is_hidden">Click Me!</button>
</div>

<div class="form_item form_condition">
	<div class="g-recaptcha" data-callback="recaptchaCallback" data-sitekey="6Le2_nsUAAAAANsY7xLiQTVupTrvoCWSy6oqQBgz"></div>
	<input id="hidden-grecaptcha" name="hidden-grecaptcha"  data-msg="{!! trans('agency_register.recaptcha') !!}" type="text" style="opacity: 0; position: absolute; top: 0; left: 0; height: 1px; width: 1px;"/>
	<div></div>
</div>
<div class="form_item">
	<div class="condition">
		<div class="checkbox">
			<input type="checkbox" name="condition_agree" class="required" id="condition_agree" data-msg="{!! trans('staff_register.invalid_field') !!}">
	
			<label class="checkbox_label" for="condition_agree">
				<small class="text_condition">
					{!! trans('staff_register.terms_conditions') !!} <a class="link launch_modal" data-modal="term_and_condition">{!! trans('staff_register.terms_conditions_link') !!}</a>
				</small>
			</label>
		</div>
	</div>
</div>

@section('additional-script') 
<script> var appURL = "{!! url("/") !!}";</script>
@stop