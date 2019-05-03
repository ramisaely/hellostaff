@extends('front.agency.layout.master')

@section('additional-css')
  {!! Html::style('css/Front/agency/updateProfil/update_profil.css') !!}
  {!! Html::style('css/Front/agency/updateProfil/update_profil_responsive.css')!!}
@endsection

@section('content')
<div class="content_pages">
    <div class="modify_profil">
      <input type="hidden" class="boolean" value="1">
      <input type="hidden" class="oneOrNull" value="1">
      <form id="regFormUpdateProfile" method="post" action="{{ route('update_agency') }}" enctype="multipart/form-data">
        @csrf
        <div class="step_modify_profil modification_profil_agence">
          <label class="modify">{!! trans('update_agency.text_edit') !!}</label>
          <label class="modify_language">
              <div class="checkbox">
                  <input type="radio" id="fr_language" name="language_code" value="fr" class="" {{Auth::user()->language_code == 'fr' ? 'checked' : ''}}>
                  <label class="french language_not_radio_fr checkbox_label {{Auth::user()->language_code == 'fr' ? 'active' : ''}}" for="fr_language">{!! trans('update_agency.French') !!}</label>
              </div>
              <div class="checkbox">
                  <input type="radio" id="en_language" value="en" name="language_code" class="" {{Auth::user()->language_code == 'en' ? 'checked' : ''}}>
                  <label class="english language_not_radio_en checkbox_label {{Auth::user()->language_code == 'en' ? 'active' : ''}}" for="en_language">{!! trans('update_agency.English') !!}</label>
              </div>
          </label>
        </div>
        <div class="form_modify_profil">
          <div class="form_group_profil">
            <div class="form_item">
                <label for="name_entreprise">{!! trans('agency_register.name_of_company') !!}</label>
                <input type="text" name="name" id="name_entreprise" value="{{ $agency->name }}" readonly>
            </div>
            <div class="form_item">
                <label for="address_entreprise">{!! trans('agency_register.company_address') !!}</label>
                <input type="text" name="address" id="address_entreprise" value="{{ $agency->address }}" readonly>
            </div>
          </div>

          <div class="form_group_profil">
            <div class="form_item">
              <label for="number_entreprise">{!! trans('agency_register.company_number') !!}</label>
              <input type="number" name="num_entreprise" id="number_entreprise" value="{{ $agency->number }}" readonly>
            </div>
            <div class="form_item">
              <label for="city_entreprise">{!! trans('agency_register.city') !!}</label>
              <input type="text" name="city" id="city_entreprise" value="{{ $agency->city }}" readonly>
            </div>
          </div>

          <div class="form_group_profil">
            <div class="form_item">
              <label for="postal_code_entreprise">{!! trans('agency_register.postal_code') !!}</label>
              <input type="text" name="zip" id="postal_code_entreprise" value="{{ $agency->postal_code }}" readonly>
            </div>
            <div class="form_item">
              <label for="province_entreprise">{!! trans('agency_register.province') !!}</label>
              <input type="text" name="province" id="province_entreprise" value="{{ $agency->province }}" readonly>
            </div>
          </div>

          <div class="form_group_profil">
            <div class="form_item">
              <label for="country_entreprise">{!! trans('agency_register.country') !!}</label>
              <input type="text" name="country" id="country_entreprise" value="{{ $agency->country }}" readonly>
            </div>
            <div class="form_item">
              <div class="form_tps_tvq">
                <div class="tps_tvq">
                  <label for="tps">TPS/TVH</label>
                  <input type="number" name="tps" id="tps" value="{{ $agency->tps }}" readonly>
                </div>

                <div class="tps_tvq">
                  <label for="tvq">TVQ</label>
                  <input type="number" name="tvq" id="tvq" value="{{ $agency->tvq }}" readonly>
                </div>
              </div>

            </div>
          </div>

        </div>
        <div class="form_message">
          <small class="message" >{!! trans('agency_register.text_hello') !!}:</small>&nbsp;<small class="bold_message">sayhello@hellostaff.ca</small>
        </div>

        <div class="description_modify">
          <div class="logo_modif">
          <label class="title_logo">{!! trans('agency_register.text_logo') !!}</label>
          <div class="agency_logo">
            <img class="img_agency" src="{!! $agency->getImageProfilPath() !!}" alt="{{ $agency->name }}" id="img_principal">
            <input type="file" name="image" class="input_hidden input_update" id="image"/>
          </div>
          <label class="icon_refresh refrech_background"></label>
        </div>

        <div class="form_modif">
          <div class="form_modify_description">
            <div class="form_group_profil">
              <div class="form_item">
                  <label for="name_agency">{!! trans('agency_register.main_contact') !!}</label>
                  <input class="input_no main_user" class="input_no name_agency" type="text" name="main_user" id="name_agency" value="{{ $agency->main_user }}">
              </div>
              <div class="form_item">
                  <label for="agency_mail">{!! trans('agency_register.agency_email') !!}</label>
                  <input class="input_no agency_email" type="email" name="agency_mail" id="agency_mail" value="{{ $agency->email }}">
              </div>
              <div class="form_item">
                  <label for="agency_phone">{!! trans('agency_register.agency_phone') !!}</label>
                  <input class="input_no" class="input_no agency_phone" type="number" name="agency_phone" id="agency_phone" value="{{ $agency->phone }}">
              </div>
            </div>
          </div>
        </div>

        <div class="description">
          <div class="form_group_profil">
            <div class="form_item">
                <label class="desc_modif">Description</label>
                <textarea class="texte_description agency_description" name="description" >{{ $agency->description_fr }}</textarea>
            </div>
          </div>
        </div>
      </div>

      @foreach($agency->users as $key => $user)
      <section class="utilisateur_profil_update" data-indice="{{$key+1}}" >
        <div class="header_create_event header_create_event_two">
            <div class="number_step_head">
                <label class="number_title police_number"></label>
            </div>
            <div class="title_step">
                <label class="title_h2">{!! trans('agency_register.user_name') !!}</label>
            </div>
            <div class="line_divider"></div>

        </div>
        <div class="input_update_profil">
           <div class="input_update_profil_col1">
              <div class="form_item_create_event">
                 <label class="label_create_event">{!! trans('agency_register.first_name') !!}</label>
                 <input class="input_create_event required last_name last_name{{$key+1}}" type="text" name="last_name[]" value="{{$user->last_name}}" disabled="disabled">
              </div>
              <div class="form_item_create_event">
                 <label class="label_create_event">{!! trans('agency_register.name') !!}</label>
                 <input class="input_create_event is_hidden userId" type="hidden" name="id_users[]" value="{{$user->id}}">
                 <input class="input_create_event required first_name first_name{{$key+1}}" type="text" name="first_name[]" value="{{$user->first_name}}" disabled="disabled">
              </div>
           </div>
           <div class="input_update_profil_col2">
             <div class="form_item_create_event">
                 <label class="label_create_event">{!! trans('agency_register.user_phone') !!}</label>
                 <input class="input_create_event required phone phone{{$key+1}}" type="number" name="phone[]" value="{{$user->phone}}" disabled="disabled">
              </div>
              <div class="form_item_create_event">
                 <label class="label_create_event">{!! trans('agency_register.email') !!}</label>
                 <input class="input_create_event required email email{{$key+1}}" type="email" name="email[]" value="{{$user->email}}" disabled="disabled">
                 <input type="hidden" value="{{ Auth::user()->email }}" class="emailConnecte">
              </div>
           </div>
           <div class="input_update_profil_col3">
            <div class="parent_view">
              <div class="form_item_create_event">
                 <label class="label_create_event lbl_pwd">{!! trans('agency_register.Change_password') !!}</label>
                 <input class="input_create_event password password{{$key+1}}" type="password" name="password[]" placeholder="" autocomplete="off" disabled="disabled">
                 <span class="input_addon_update_profil background_no_view_noir" onclick="showPassword_input_update_profil(this)" ></span>
              </div>
            </div>
             <div class="parent_view parent_pass">
               <div class="form_item_create_event">
                 <label class="label_create_event">{!! trans('agency_register.Confirm_password') !!}</label>

                 <input class="input_create_event confirm_password confirm_password{{$key+1}}" type="password" name="confirm_password[]" placeholder="" autocomplete="off"  data-sendValue="{{ route('sendValue') }}" disabled="disabled">
                 <span class="input_addon_update_profil background_no_view_noir" onclick="showPassword_input_update_profil(this)"></span>
              </div>
             </div>
           </div>
        </div>

        <div class="content_button_update_profil">
          <button type="button" class="btn_valide btn_validUser btn_validUser{{$key+1}}">{!! trans('agency_register.valide') !!}</button>
          <button type="button" class="button_update_profil_no_gradient">{!! trans('agency_register.remove') !!}</button>
        </div>
        <div class="liste_button_update">
          <button type="button" class="button_update_profil_gradient">{!! trans('agency_register.addition') !!}</button>
        </div>

      </section>
      @endforeach
      <div class="line_divider_bg">
        <div class="line_divider"></div>
      </div>
      <div class="footer_update_profil">
        <button class="button_update_profil_footer" type="submit">{!! trans('agency_register.save') !!}</button>
        <span class="is_hidden" id="click_me"></span>
      </div>

     </form>
    </div>

</div>
@endsection

@section('modal')
  @include('modals.agency.update_profil.modal_update_actual')
  @include('modals.agency.update_profil.modal_change_update_profil')
  @include('modals.waiting.modal_wait')
@endsection

@section('additional-scripts')
  {!! Html::script('js/Front/agency/update_profil.js') !!}
  {!! Html::script('https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js') !!}
@endsection
