@extends('front.staff.layout.master_account')

@section('additional-css')
  {!! Html::style('css/Front/staff/updateProfil/update_profil.css') !!}
  {!! Html::style('css/Front/staff/updateProfil/modals.css') !!}
  {!! Html::style('css/Front/staff/updateProfil/update_profil_responsive.css')!!}
@endsection

@section('content')
<div class="content_pages update_profil_staff">

    <div class="update_profil_staff_content">
      <div class="section_title">
        <div class="section_title_content">
          <label class="title">{!! trans('staff_register.Modify_profil') !!}</label>
          <div class="language_site_staff">
            <div class="checkbox">
              <label class="french with_fake_out_in {{Auth::user()->language_code == 'fr' ? 'active' : ''}}" for="fr_language_update">
                <input type="radio" id="fr_language_update" data-val="fr" class="change_language">
                <div class="out_check"><span class="in_check"></span></div>
                <span class="language_type_radio_fr">{!! trans('staff_register.french_site') !!}</span>
              </label>
            </div>
            <div class="checkbox">
              <label class="english with_fake_out_in {{Auth::user()->language_code == 'en' ? 'active' : ''}}" for="en_language_update">
                <input type="radio" id="en_language_update" data-val="en" class="change_language">
                <div class="out_check"><span class="in_check"></span></div>
                <span class="language_type_radio_en">{!! trans('staff_register.english_site') !!}</span>
              </label>
            </div>
          </div>
        </div>
      </div>
      <form id="updateProfilStaff" method="post" action="{{ route('post_update') }}" enctype="multipart/form-data">
        @csrf
        <div class="update_profil_staff_item">
          <div class="information_item personnal_item">
            <div class="form_item">
              <input class="is_hidden" type="hidden" name="id_users" value="{{Auth::user()->id}}">
              <label for="name">{!! trans('staff_register.first_name') !!}</label>
              <input class="required" type="text" name="first_name" id="name" value="{{ Auth::user()->first_name}}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
            </div>

            <div class="form_item">
              <label for="last_name">{!! trans('staff_register.last_name') !!}</label>
              <input class="required" type="text" name="last_name" id="last_name" value="{{ Auth::user()->last_name }}" data-msg="{!! trans('staff_register.invalid_field') !!}." autocomplete="off">
            </div>

            <div class="form_item">
              <div class="checkbox_wrap gender">
                <label>{!! trans('staff_register.gender') !!}</label>
                <div class="checkbox_items">
                    <div class="checkbox">
                      <label class="with_fake_out_in" for="man">
                        <input type="radio" name="gender" id="man" class="required" autocomplete="off" value="1" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" {{ $staff->kind == 1? 'checked' : ''}} disabled>
                        <div class="out_check"><span class="in_check"></span></div>
                        <span>{!! trans('staff_register.man') !!}</span>
                      </label>
                    </div>
                    <div class="checkbox">
                      <label class="with_fake_out_in" for="woman">
                        <input type="radio" name="gender" id="woman" class="required" autocomplete="off" value="2" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" {{ $staff->kind == 2? 'checked' : ''}} disabled>
                        <div class="out_check"><span class="in_check"></span></div>
                        <span>{!! trans('staff_register.woman') !!}</span>
                      </label>
                    </div>
                </div>
              </div>
            </div>

            <div class="form_item">
              <label> {!! trans('staff_register.birthday') !!}</label>
              <div class="separated_date_picker">
                  <div class="dropdown-menu birth_day">
                    <span class="form_item label_select">
                      <input class="select day required" id="day" name="birth_day" value="<?php $day= explode('-', $staff->birthday); echo(intval($day[2]));?>" placeholder="{!! trans('staff_register.day') !!}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" readonly disabled>
                    </span>
                    <!-- <ul class="dropdown scrollbar" data-input="day">
                      <?php for($day=1;$day<=31;$day++) { ?>
                        <li>{{ $day }}</li>
                      <?php } ?>
                    </ul> -->
                  </div>

                  <div class="dropdown-menu birth_day">
                    <span class="form_item label_select year">
                      <input class="select month required" id="month" name="birth_month" value="<?php $month= explode('-', $staff->birthday);
                        $month_val = intval( $month[1]);
                                switch ($month_val) {
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
                        default:
                          $monthL = "";
                          break;
                      }
                      echo($monthL);
                        ?>" placeholder="{!! trans('staff_register.month') !!}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" readonly disabled>
                    </span>
                    <!-- <ul class="dropdown scrollbar" data-input="month">
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
                    </ul> -->
                  </div>

                  <div class="dropdown-menu birth_day">
                    <span class="form_item label_select">
                      <input class="select year required" id="year" name="birth_year" value="<?php $year= explode('-', $staff->birthday); echo(intval($year[0]));?>" placeholder="{!! trans('staff_register.year') !!}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" readonly disabled>
                    </span>
                    <!-- <ul id="yearID" class="dropdown scrollbar" data-input="year">
                      <?php for($year=1960;$year<=2018; $year++) { ?>
                        <li id="{{ $year }}">{{ $year }}</li>
                      <?php } ?>
                    </ul> -->
                  </div>
                </div>

            </div>
          </div>

          <div class="information_item account">
            <div class="form_item">
              <label for="email">{!! trans('staff_register.email') !!}</label>
              <input class="required" type="text" name="email" id="email" value="{{ Auth::user()->email }}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" data-email_verif="{{route('verify_email')}}"><br>
              <small class="popuptext" id="emailerror" style="color: red"></small>
            </div>

            <div class="form_item">
              <label for="password">{!! trans('staff_register.password') !!}</label>
              <div class="input_group">
                <input class="required" type="password" name="password"  id="password" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
                <span class="input_addon background_no_view" onclick="showPassword(this)">
                </span>
              </div>
            </div>

            <div class="form_item">
              <label for="confirm_password">{!! trans('staff_register.confirm_password') !!}</label>
              <div class="input_group">
                <input class="required" type="password" name="confirm_password" id="confirm_password" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
                <span class="input_addon background_no_view" onclick="showPassword(this)">
                </span>
              </div>
              <!-- <small class="popuptext" id="error_confirm">{!! trans('staff_register.error_confirm') !!}</small> -->
            </div>

            <div class="form_item">
              <label for="phone">{!! trans('staff_register.cellular_sms') !!}</label>
              <input type="text" style="-moz-appearance: textfield" class="required"  name="phone" value="{{ Auth::user()->phone }}" id="phone" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" data-phone_verif="{{route('verify_phone')}}"><br>
              <small class="popuptext" id="phoneerror" style="color: red"></small><br>
              <!-- <small>{!! trans('staff_register.cellular_sms_text') !!}</small> -->
            </div>
          </div>

          <div class="information_item contact">
            <div class="form_item">
              <label for="city">{!! trans('staff_register.city') !!}</label>
              <input class="required" type="text" name="city" value="{{ $staff->city }}" id="city" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
            </div>

            <div class="form_item">
              <label for="address">{!! trans('staff_register.address') !!}</label>
              <input class="required" type="text" name="address" value="{{ $staff->address }}" id="address" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
            </div>

            <div class="form_item">
              <label for="code_postal">{!! trans('staff_register.postal_code') !!}</label>
              <input class="required" type="text" name="zip_code" value="{{ $staff->zip_code }}" id="code_postal" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
            </div>

            <div class="car_certification">
              <div class="item">
                <label>{!! trans('staff_register.car') !!}</label>
                <div class="form_item">
                  <input type="hidden" name="car">
                  <div class="checkbox">
                    <label class="with_fake_out_in" for="car_yes">
                      <input type="radio" name="have_car[]" id="car_yes" class="required" value="1" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" {{ $staff->staffCertification->have_car == 1 ? 'checked' : '' }}>
                      <div class="out_check"><span class="in_check"></span></div>
                      <span>{!! trans('staff_register.yes') !!}</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label class="with_fake_out_in" for="car_no">
                      <input type="radio" name="have_car[]" id="car_no" class="required" value="0" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" {{ $staff->staffCertification->have_car == 0 ? 'checked' : '' }}>
                      <div class="out_check"><span class="in_check"></span></div>
                      <span>{!! trans('staff_register.no') !!}</span>
                    </label>
                  </div>
                </div>
              </div>
              <div class="item">
                <label>{!! trans('staff_register.Auto_license') !!}</label>
                <div class="form_item">
                  <input type="hidden" name="drive">
                  <div class="checkbox">
                    <label class="with_fake_out_in" for="driver_license_yes">
                      <input type="radio" name="driver_license[]" id="driver_license_yes" class="required" value="1" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" {{ $staff->staffCertification->driver_license == 1 ? 'checked' : '' }}>
                      <div class="out_check"><span class="in_check"></span></div>
                      <span>{!! trans('staff_register.yes') !!}</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label class="with_fake_out_in" for="driver_license_no">
                      <input type="radio" name="driver_license[]" id="driver_license_no" class="required" value="0" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" {{ $staff->staffCertification->driver_license == 0 ? 'checked' : '' }}>
                      <div class="out_check"><span class="in_check"></span></div>
                      <span>{!! trans('staff_register.no') !!}</span>
                    </label>
                  </div>
                </div>
              </div>
              <div class="item">
                <label>{!! trans('staff_register.Truck_license') !!}</label>
                <div class="form_item">
                  <input type="hidden" name="truck">
                  <div class="checkbox">
                    <label class="with_fake_out_in" for="truck_license_yes">
                      <input type="radio" name="truck_license[]" id="truck_license_yes" class="required" value="1" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" {{ $staff->staffCertification->driver_license_truck == 1 ? 'checked' : '' }}>
                      <div class="out_check"><span class="in_check"></span></div>
                      <span>{!! trans('staff_register.yes') !!}</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label class="with_fake_out_in" for="truck_license_no">
                      <input type="radio" name="truck_license[]" id="truck_license_no" class="required" value="0" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off" {{ $staff->staffCertification->driver_license_truck == 0 ? 'checked' : '' }}>
                      <div class="out_check"><span class="in_check"></span></div>
                      <span>{!! trans('staff_register.no') !!}</span>
                    </label>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="update_profil_staff_item">
          <div class="information_item jobs_item">
            <div class="form_item">
              <label>Jobs</label>
              <div class="dropdown-menu">
                <label for="jobs" class="label_select">
                  <input class="select required" type="text" id="jobs" name="jobs" value="{{listingJobSelectionedInInput($staff)}}" data-msg="invalid field." autocomplete="off" readonly="readonly">
                </label>
                <ul class="dropdown multiple extendable scrollbar" data-input="jobs">
                  @if(count($jobs)>0)
                  @foreach($jobs as $job)
                    <?php $translation_job = $job->getByLanguageId(getLanguageId()); ?>
                    <li>
                      <div class="multiple_item">
                        <div class="checkbox parent_element">
                          <input type="hidden" name="job[]" class="job_id" autocomplete="off" data-val="{{$translation_job->job_id}}" value="">
                          <label class="with_fake_out_in" for="{{$translation_job->id}}">
                            <input type="hidden" name="staff_job_id[]" class="staff_langue_id" value="@foreach($staff->staffJobs as $staffjob) {{($staffjob->job_id == $translation_job->job_id) ? $staffjob->id : '' }} @endforeach">
                            <input type="hidden" name="creat_job[]" class="creat_langue">
                            <input type="hidden" name="update_job[]" class="update_langue">
                            <input type="hidden" name="update_id_job[]" class="update_id">
                            <input type="hidden" name="remove_job[]" class="remove_langue">
                            <input type="checkbox" name="jobs[]" id="{{$translation_job->id}}" class="id_parent @foreach($staff->staffJobs as $staffjob) {{$staffjob->job_id == $translation_job->job_id ? 'active' : '' }} @endforeach" autocomplete="off" data-val="{{$translation_job->job_id}}" value="{{$translation_job->job_id}}" @foreach($staff->staffJobs as $staffjob) {{$staffjob->job_id == $translation_job->job_id ? 'checked' : '' }} @endforeach>
                            <div class="out_check"><span class="in_check"></span></div>
                              <input type="hidden" name="staff_job[]" value="@foreach($staff->staffJobs as $staffjob){{$staffjob->job_id == $translation_job->job_id ? $staffjob->id : ''}}@endforeach">
                            <span>{{$translation_job->name}}</span>
                          </label>
                          <a class="extend" data-element="id1{{$translation_job->id}}">
                            <img src="{!! url('img/input_icons/down-arrow.png') !!}">
                          </a>
                        </div>
                        <div class="extended_element is_hidden" id="id1{{$translation_job->id}}">
                          <input type="hidden" name="job_exp[]" class="level">
                          <input type="hidden" name="update_exp[]" class="update_level">
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="xp0{{$translation_job->id}}">
                              <input type="checkbox" name="xp[]" id="xp0{{$translation_job->id}}" class="" autocomplete="off" value="0" @foreach($staff->staffJobs as $staffjob) @if($staffjob->job_id == $translation_job->job_id && $staffjob->experience_year == 0 ){{'checked'}}@endif @endforeach>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span>XP0</span>
                            </label>
                          </div>
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="xp1{{$translation_job->id}}">
                              <input type="checkbox" name="xp[]" id="xp1{{$translation_job->id}}" class="" autocomplete="off" value="1" @foreach($staff->staffJobs as $staffjob) @if($staffjob->job_id == $translation_job->job_id && $staffjob->experience_year == 1 ){{'checked'}}@endif @endforeach>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span>XP1</span>
                            </label>
                          </div>
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="xp2{{$translation_job->id}}">
                              <input type="checkbox" name="xp[]" id="xp2{{$translation_job->id}}" class="" autocomplete="off" value="2" @foreach($staff->staffJobs as $staffjob) @if($staffjob->job_id == $translation_job->job_id && $staffjob->experience_year == 2 ){{'checked'}}@endif @endforeach>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span>XP2</span>
                            </label>
                          </div>
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="xp3{{$translation_job->id}}">
                              <input type="checkbox" name="xp[]" id="xp3{{$translation_job->id}}" class="" autocomplete="off" value="3" @foreach($staff->staffJobs as $staffjob) @if($staffjob->job_id == $translation_job->job_id && $staffjob->experience_year == 3 ){{'checked'}}@endif @endforeach>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span>XP3<sup>+</sup></span>
                            </label>
                          </div>
                        </div>
                      </div>
                    </li>
                  @endforeach
                  @endif
                </ul>

              </div>
            </div>

            <div class="form_item">
              <label>{!! trans('staff_register.attributes') !!}</label>
              <div class="dropdown-menu">
                <label for="attributs" class="label_select">
                  <input class="select required" type="text" id="attributs" name="attributs" value="{{listingAttributes($staff, $attributes)}}" data-msg="invalid field." autocomplete="off" readonly="readonly">
                  <input class="select required" type="hidden" id="attributs_id" name="attributs_id" value="{{$staff->staffAttribut->id}}" data-msg="invalid field." autocomplete="off" readonly="readonly">

                </label>
                <ul class="dropdown multiple extendable scrollbar" data-input="attributs">
                    <li>
                      <div class="multiple_item">
                        <div class="checkbox parent_element">
                          <label class="with_fake_out_in" for="tatou">
                            <input type="checkbox" name="attribut_item[]" id="tatou" class="id_parent {{$staff->staffAttribut->tattoo != '' ? 'active' : ''}}" autocomplete="off" value="{{$staff->staffAttribut->tattoo}}" {{$staff->staffAttribut->tattoo != '' ? 'checked' : ''}}>
                            <div class="out_check"><span class="in_check"></span></div>
                            <span>{!! trans('staff_register.tattoo') !!}</span>
                          </label>
                          <a class="extend" data-element="attribut_item1">
                            <img src="{!! url('img/input_icons/down-arrow.png') !!}">
                          </a>
                        </div>
                        <div class="extended_element is_hidden" id="attribut_item1">
                          <input type="hidden" name="tattoo" value="{{$staff->staffAttribut->tattoo}}">
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="tatou_visible">
                              <input type="radio" name="tatou_visible[]" id="tatou_visible" class="" autocomplete="off" value="1" {{$staff->staffAttribut->tattoo ==1 ? 'checked' : ''}}>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span>{!! trans('staff_register.visible') !!}</span>
                            </label>
                          </div>
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="tatou_not_visible">
                              <input type="radio" name="tatou_visible[]" id="tatou_not_visible" class="" autocomplete="off" value="2" {{$staff->staffAttribut->tattoo == 2 ? 'checked' : ''}}>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span>{!! trans('staff_register.not_visible') !!}</span>
                            </label>
                          </div>
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="aucun">
                              <input type="radio" name="tatou_visible[]" id="aucun" class="" autocomplete="off" value="3" {{$staff->staffAttribut->tattoo == 3 ? 'checked' : ''}}>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span>{!! trans('staff_register.none') !!}</span>
                            </label>
                          </div>
                        </div>
                      </div>
                    </li>

                    <li>
                      <div class="multiple_item">
                        <div class="checkbox parent_element">
                          <label class="with_fake_out_in" for="piercing">
                            <input type="checkbox" name="attribut_item[]" id="piercing" class="id_parent {{$staff->staffAttribut->piercing != '' ? 'active' : ''}}" autocomplete="off" value="" {{$staff->staffAttribut->piercing != '' ? 'checked' : ''}}>
                            <div class="out_check"><span class="in_check"></span></div>
                            <span>{!! trans('find_candidates.Piercing') !!}</span>
                          </label>
                          <a class="extend" data-element="attribut_item2">
                            <img src="{!! url('img/input_icons/down-arrow.png') !!}">
                          </a>
                        </div>
                        <div class="extended_element is_hidden" id="attribut_item2">
                          <input type="hidden" name="piercing" value="{{$staff->staffAttribut->piercing}}">
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="piercing_visible">
                              <input type="radio" name="piercing_visible[]" id="piercing_visible" class="" autocomplete="off" value="1" {{$staff->staffAttribut->piercing ==1 ? 'checked' : ''}}>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span>{!! trans('staff_register.visible') !!}</span>
                            </label>
                          </div>
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="piercing_not_visible">
                              <input type="radio" name="piercing_visible[]" id="piercing_not_visible" class="" autocomplete="off" value="2" {{$staff->staffAttribut->piercing ==2 ? 'checked' : ''}}>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span>{!! trans('staff_register.not_visible') !!}</span>
                            </label>
                          </div>
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="piercing_aucun">
                              <input type="radio" name="piercing_visible[]" id="piercing_aucun" class="" autocomplete="off" value="3" {{$staff->staffAttribut->piercing ==3 ? 'checked' : ''}}>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span>{!! trans('staff_register.none') !!}</span>
                            </label>
                          </div>
                        </div>
                      </div>
                    </li>

                @if(count($attributes)>0)
                  @foreach($attributes as $key =>$attribute)
                    <?php $translation = $attribute->getByLanguageId(getLanguageId()); ?>
                    <li>
                      @foreach($staff->staffAttribut->StaffAttributeOption as $att_option) @if($att_option->attribute_id == $translation->attribute_id )<input type="hidden" name="staff_att[]" value="{{$att_option->id}}">
                          @endif @endforeach
                          <input class="input_hidden" type="hidden" name="attribute[]" id="attribute{!! $attribute->id !!}" autocomplete="off" value="{!! $attribute->id !!}">
                      <div class="multiple_item">
                        <div class="checkbox parent_element">
                          <label class="with_fake_out_in" for="jacket{{$translation->id}}">
                            <input type="checkbox" name="attribut_item[]" id="jacket{{$translation->id}}" class="id_parent @foreach($staff->staffAttribut->StaffAttributeOption as $att_option) @if($att_option->attribute_id == $translation->attribute_id ) {{'active'}}  @endif @endforeach" autocomplete="off" value="" @foreach($staff->staffAttribut->StaffAttributeOption as $att_option) @if($att_option->attribute_id == $translation->attribute_id ) {{'checked'}}  @endif @endforeach>
                            <div class="out_check"><span class="in_check"></span></div>
                            <span>{!! $translation->name !!}</span>
                          </label>
                          <a class="extend" data-element="attribut_item{{$key+3}}">
                            <img src="{!! url('img/input_icons/down-arrow.png') !!}">
                          </a>
                        </div>

                        <div class="extended_element is_hidden" id="attribut_item{{$key+3}}">
                          <?php $countStart = 1?>
                        @foreach($attribute->options as $option)
                        <?php $option_translation = $option->getByLanguageId(getLanguageId()); $opt = $option->optionGender ; $nb=count($staff->staffAttribut->StaffAttributeOption);?>
                          @foreach($staff->staffAttribut->StaffAttributeOption as $index=>$att_option)
                            @if($att_option->attribute_option_id == $option_translation->attribute_option_id )
                            <?php $countStart += 1?>
                                  <input type="hidden" name="jacket[]" value="{{$att_option->attribute_option_id}}" >
                              @endif
                          @endforeach
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="{!! $option_translation->value !!}">
                              <input type="radio" id="{!! $option_translation->value !!}" name="sizeAttribute{{ $attribute->id }}[]" class="{{activeStaffAttributOption($staff, $attribute->id, $option)}}" autocomplete="off" value="{!! $option_translation->attribute_option_id !!}" {{checkStaffAttributOption($staff, $attribute->id, $option)}}>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span class="">{!! $option_translation->value !!}</span>
                            </label>
                          </div>
                        @endforeach
                        </div>
                      </div>
                    </li>
                    @endforeach
                    @endif
                </ul>
              </div>
            </div>

            <!-- <div class="form_item">
              <label for="nas">{!! trans('staff_register.city') !!}</label>
              <input class="required" type="text" name="nas" value="{{$staff->city}}" id="nas" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
            </div> -->

          </div>

          <div class="information_item">
            <div class="form_item">
              <label>{!! trans('staff_register.languages') !!}</label>
              <div class="dropdown-menu">
                <label for="languages" class="label_select">
                  <input class="select required" type="text" id="languages" name="language" value="{{listingLanguageSelectionedInInput($staff, $all_languages)}}" data-msg="invalid field." autocomplete="off" readonly="readonly">
                </label>
                <ul class="dropdown multiple extendable scrollbar" data-input="languages">
                  @if(count($all_languages)>0)
                  @foreach($all_languages as $language)
                  <?php $translation = $language->getByLanguageId(getLanguageId()); ?>
                    <li>
                      <div class="multiple_item">
                        <div class="checkbox parent_element">
                          <input type="hidden" name="langue[]" class="job_id" autocomplete="off" value="">
                          <label class="with_fake_out_in" for="language{{$translation->id}}">
                            <input type="hidden" name="staff_langue_id[]" class="staff_langue_id" value="@foreach($staff->staffLanguages as $staff_langue) {{$staff_langue->all_language_id == $language->id ? $staff_langue->id : ''}} @endforeach">
                            <input type="hidden" name="creat_langue[]" class="creat_langue">
                            <input type="hidden" name="update_langue[]" class="update_langue">
                            <input type="hidden" name="update_id[]" class="update_id">
                            <input type="hidden" name="remove_langue[]" class="remove_langue">
                            <input type="checkbox" name="language[]" id="language{{$translation->id}}" class="id_parent @foreach($staff->staffLanguages as $staff_langue) {{$staff_langue->all_language_id == $language->id ? 'active' : ''}} @endforeach" autocomplete="off" data-val="{{$translation->all_language_id}}" value="{{$translation->all_language_id}}" @foreach($staff->staffLanguages as $staff_langue) {{$staff_langue->all_language_id == $language->id ? 'checked' : ''}} @endforeach>
                            <div class="out_check"><span class="in_check"></span></div>
                            <input type="hidden" name="staff_langue[]" value="@foreach($staff->staffLanguages as $staff_langue){{$staff_langue->all_language_id == $language->id ? $staff_langue->id : ''}}@endforeach">
                            <span>{!! $translation->name !!}</span>
                          </label>
                          <a class="extend" data-element="lang{{$language->id}}">
                            <img src="{!! url('img/input_icons/down-arrow.png') !!}">
                          </a>
                        </div>
                        <div class="extended_element is_hidden" id="lang{{$language->id}}">
                          <input type="hidden" name="level[]" class="level">
                          <input type="hidden" name="update_level[]" class="update_level">
                          @foreach($all_language_choices as $choice)
                          <?php $translation_choice = $choice->getByLanguageId(getLanguageId()); ?>
                          <div class="checkbox">
                            <label class="with_fake_out_in" for="biginner">
                              <input type="checkbox" name="fr_level[]" class="" autocomplete="off" value="{{$translation_choice->id}}" @foreach($staff->staffLanguages as $staff_langue_choice) @if($staff_langue_choice->all_language_choice_id == $choice->id && $staff_langue_choice->all_language_id == $translation->all_language_id) {{'checked'}} @endif @endforeach>
                              <div class="out_check"><span class="in_check"></span></div>
                              <span>{!! $translation_choice->name !!}</span>
                            </label>
                          </div>
                          @endforeach
                        </div>
                      </div>
                    </li>
                    @endforeach
                    @endif
                </ul>
              </div>
            </div>

            <div class="form_item">
              <label>Certifications</label>
              <div class="dropdown-menu staff_certification">
                <input type="hidden" name="staff_certification" value="{{$staff->staffCertification->id}}">
                <label for="certifications" class="label_select">
                  <input class="select required" type="text" id="certifications" name="certifications" value="{{listingCertification($staff)}}" data-msg="invalid field." autocomplete="off" readonly="readonly">
                </label>
                <ul class="dropdown scrollbar multiple" data-input="certifications">
                  <li>
                    <input type="hidden" name="actra">
                    <div class="checkbox multiple_item">
                      <label class="with_fake_out_in" for="actra">
                        <span>ACTRA</span>
                        <input type="checkbox" name="certification_item[]" id="actra" class="withOutChild {{$staff->staffCertification->actra == 1 ? 'active' : ''}}" autocomplete="off" value="{{$staff->staffCertification->actra}}" {{$staff->staffCertification->actra == 1 ? 'checked' : ''}}>
                        <div class="out_check"><span class="in_check"></span></div>
                      </label>
                    </div>
                  </li>
                  <li>
                    <input type="hidden" name="foods">
                    <div class="checkbox multiple_item">
                      <label class="with_fake_out_in" for="food_manipulation">
                        <span>{!! trans('certification_blade.Handling_food') !!}</span>
                        <input type="checkbox" name="certification_item[]" id="food_manipulation" class="withOutChild {{$staff->staffCertification->food_handling == 1 ? 'active' : ''}}" autocomplete="off" value="{{$staff->staffCertification->food_handling}}" {{$staff->staffCertification->food_handling == 1 ? 'checked' : ''}}>
                        <div class="out_check"><span class="in_check"></span></div>
                      </label>
                    </div>
                  </li>
                  <li>
                    <input type="hidden" name="smart_serve">
                    <div class="checkbox multiple_item">
                      <label class="with_fake_out_in" for="smart_serve">
                        <span>Smart Serve</span>
                        <input type="checkbox" name="certification_item[]" id="smart_serve" class="withOutChild {{$staff->staffCertification->smart_serve == 1 ? 'active' : ''}}" autocomplete="off" value="{{$staff->staffCertification->smart_serve}}" {{$staff->staffCertification->smart_serve == 1 ? 'checked' : ''}}>
                        <div class="out_check"><span class="in_check"></span></div>
                      </label>
                    </div>
                  </li>
                  <li>
                    <input type="hidden" name="uda">
                    <div class="checkbox multiple_item">
                      <label class="with_fake_out_in" for="uda">
                        <span>UDA</span>
                        <input type="checkbox" name="certification_item[]" id="uda" class="withOutChild {{$staff->staffCertification->uda == 1 ? 'active' : ''}}" autocomplete="off" value="{{$staff->staffCertification->uda}}" {{$staff->staffCertification->uda == 1 ? 'checked' : ''}}>
                        <div class="out_check"><span class="in_check"></span></div>
                      </label>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>

          <div class="information_item">
            <div class="form_item">
              <label>{!! trans('staff_register.work') !!}</label>
              <div class="dropdown-menu staff_mobility">
                <label for="mobility" class="label_select">
                  <input class="select required" type="text" id="mobility" name="mobility" value="{{listingWorkAreaSelectionedInInput($staff, $mobilities)}}" data-msg="invalid field." autocomplete="off" readonly="readonly">
                </label>
                <ul class="dropdown scrollbar multiple" data-input="mobility">
                  @if(count($mobilities)>0)
                  @foreach($mobilities as $mobility)
                    <?php $translation = $mobility->getByLanguageId(getLanguageId()); $mob =$mobility->id; ?>
                    <li>
                      <input type="hidden" class="id_now" name="staffmob_id[]" value="@foreach($staff->staffMobility as $staffmob) {{$staffmob->mobility_id == $mobility->id ? $staffmob->id : '' }} @endforeach">
                      <input type="hidden" class="id_remove" name="mob_remove[]">
                      <input type="hidden" class="id_create" name="mob_create[]">
                    <div class="checkbox multiple_item">
                      <label class="with_fake_out_in" for="mobility{!! $mobility->id !!}">
                        <span>{{$translation->name}}</span>
                        <input type="checkbox" name="mobility[]" id="mobility{!! $mobility->id !!}" class="withOutChild @foreach($staff->staffMobility as $staffmob) {{$staffmob->mobility_id == $mobility->id ? 'active' : '' }} @endforeach" autocomplete="off" value="{!! $mobility->id !!}"@foreach($staff->staffMobility as $staffmob) {{$staffmob->mobility_id == $mobility->id ? 'checked' : '' }} @endforeach>
                        <div class="out_check"><span class="in_check"></span></div>
                      </label>
                    </div>
                  </li>
                  @endforeach
                  @endif
                </ul>
              </div>
            </div>

            <div class="form_item">
              <label>{!! trans('staff_register.height') !!}</label>
              <div class="dropdown-menu">
                <label for="size" class="label_select">
                  <input class="select required" type="text" id="size" name="size" value="{{$staff->staffAttribut->height}}" data-msg="invalid field." autocomplete="off" readonly="readonly">
                </label>
                <ul class="dropdown scrollbar" data-input="size">
                    <li>5'0" = 1.53m</li>
                    <li>5'1" = 1.55m</li>
                    <li>5'2" = 1.57m</li>
                    <li>5'3" = 1.60m</li>
                    <li>5'4" = 1.63m</li>
                    <li>5'5" = 1.65m</li>
                    <li>5'6" = 1.68m</li>
                    <li>5'7" = 1.70m</li>
                    <li>5'8" = 1.73m</li>
                    <li>5'9" = 1.75m</li>
                    <li>5'10" = 1.78m</li>
                    <li>5'11" = 1.80m</li>
                    <li>6'0" = 1.83m</li>
                    <li>6'1" = 1.85m</li>
                    <li>6'2" = 1.88m</li>
                    <li>6'3" = 1.90m</li>
                    <li>6'4" = 1.93m</li>
                    <li>6'5" = 1.96m</li>
                    <li>6'6" = 1.98m</li>
                    <li>6'7" = 2.00m</li>
                    <li>6'8" = 2.03m</li>
                    <li>6'9" = 2.06m</li>
                    <li>6'10" = 2.08m</li>
                </ul>
              </div>
            </div>

            <div class="form_item photo_cv_files">
              <label>{!! trans('staff_register.photo') !!}</label>
              <div class="photo_cv_files_content">
                <div class="item head_shot_photo">
                  <div class="file_item launch_modal" data-modal="upload_head_shot_photo">
                    <img src="{!! $staff->portrait_pic !=''? $staff->getImagePortraitPath(): url('/img/step_photo_cv/icon_upload_cv.svg') !!}">
                    <span class="refresh_file icon_refresh">
                      <!-- <img class="logo_hello_staff" src="{!! url('/img/input_icons/refrech.svg') !!}"> -->
                    </span>
                    <input type="number" class="input_hidden shot_photo" value="" name="shot_photo">
                    <input type="file" class="input_hidden sp" value="{{$staff->portrait_pic}}" name="head_shot_photo" id="head_shot_photo">
                  </div>
                </div>
                <div class="item upper_body_photo">
                  <div class="file_item launch_modal" data-modal="upload_upper_body_photo">
                    <img src="{!! $staff->single_storey_pic !=''? $staff->getImagePortraitPleinPath() : url('/img/step_photo_cv/icon_upload_cv.svg') !!}">
                    <span class="refresh_file icon_refresh">
                      <!-- <img class="logo_hello_staff" src="{!! url('/img/input_icons/refrech.svg') !!}"> -->
                    </span>
                    <input type="number" class="input_hidden body_photo" value="" name="body_photo">
                    <input type="file" class="input_hidden up" value="{{$staff->single_storey_pic}}" name="upper_body_photo" id="upper_body_photo">
                  </div>
                </div>
                <div class="item resume">
                  <div class="file_item launch_modal" data-modal="upload_resume_file">
                    <img src="<?php $val= explode('.', $staff->cv);
                    switch($val[sizeof($val) -1]){
                      case "docx":
                        $url = url('/img/step_photo_cv/word.png');
                        break;
                      case "doc":
                        $url = url('/img/step_photo_cv/word.png');
                        break;
                      case "pdf":
                        $url = url('/img/step_photo_cv/pdf.jpeg');
                        break;
                      case "pptx":
                        $url = url('/img/step_photo_cv/pptx.png');
                        break;
                      default:
                        $url =url('/img/step_photo_cv/icon_upload_cv.svg');
                        break;
                    } echo ($url)?>">
                    <span class="refresh_file icon_refresh">
                      <!-- <img class="logo_hello_staff" src="{!! url('/img/input_icons/refrech.svg') !!}"> -->
                    </span>
                    <input type="number" class="input_hidden resume_photo" value="" name="resume_photo">
                    <input type="file" class="input_hidden rm" value="{{$staff->cv}}" name="resume" id="resume" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
        <input type="hidden" name="" class="bool">
        <div class="submit">
          <button class="save_profil_staff" id="save_profil_staff">{!! trans('staff_register.btn_save') !!}</button>
        </div>
      </form>
    </div>
</div>
@endsection

@section('modal')
  @include('modals.staff.update_profil.upload_head_shot_photo')
  @include('modals.staff.update_profil.upload_upper_body_photo')
  @include('modals.staff.update_profil.upload_resume_file')
  @include('modals.agency.update_profil.modal_change_update_profil')
@endsection

@section('additional-scripts')
  <script type="text/javascript">
    var appURL = "{!! url("/") !!}";
  </script>
  {!! Html::script('js/Front/staff/update_profil.js') !!}
@endsection
