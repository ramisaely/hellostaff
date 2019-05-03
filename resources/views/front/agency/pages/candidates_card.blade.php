<div class="candidates_card">
  <div class="container_candidates_card">
    <!-- Step1 -->
    <div class="fiche_candidates">
      <div class="description_staff color_back_profil">

        <div class="content_btn_precedent">
          <div class="btn_presedent">
            <i class="fa fa-arrow-left"></i>
          </div>
        </div>

        <div class="profil_staff">
          <div class="form_item_staff">
            <div class="name_ages">
              <label for="" class="name">{{ fullName($staff->user->first_name, $staff->user->last_name) }}</label>
              <label for="" class="ages">{{ $staff->ages }} {!! trans('find_candidates.years') !!}</label>
            </div>
            <label for="" class="country_staff">{{ $staff->city }}</label>
            <div class="form_item_nas">
              <label for="" class="number_nas">NAS:</label>
              <label for="" class="number_nas">{{ isset($staff->staffRemuneration->nas) ? $staff->staffRemuneration->nas : '' }}</label>
            </div>
          </div>
          <div class="img_profile">
            <div class="photo_staff">
              <img src="{!! $staff->getImagePortraitPath() !!}" alt="">
            </div>
          </div>
        </div>

        <div class="btn_profil_staff">
          <button class="btn_profil color_proposed_jobs" type="button" name="button">{!! trans ('page_agency.OFFER_JOB') !!}</button>
          @if(is_my_staff(Auth::user()->agency->first()->id, $staff->id))
            <button class="btn_profil delete_agency_staff" data-url="{{ route('deleteAgencyStaff') }}" data-agency_staff_id="{{is_my_staff(Auth::user()->agency->first()->id, $staff->id)->id}}" type="button" data-staff_id="{{ $staff->id }}" data-user_id="{{ $staff->user_id }}" name="button">{!! trans ('page_agency.REMOVE_STAFF') !!}</button>
          @else
            <button class="btn_profil add_agency_staff" data-url="{{ route('addStaffToMyStaff') }}" data-staff_id="{{ $staff->user->id }}" data-agency_staff_id="" data-user_id="{{ $staff->id }}" type="button" name="button"> {!! trans ('page_agency.ADD_STAFF') !!} </button>
          @endif
          <button class="btn_profil btn_slider_profil_staff" type="button" name="button" data-id="{{ $staff->id }}" data-getImageStaff="{{ route('getImageStaff') }}">
            <img src="{!! url('img/fiche_candidates/icone1.png') !!}" alt="">
          </button>
        </div>

        <img class="staff_img_back" src="{!! $staff->getImagePortraitPath() !!}" alt="">
        <img class="staff_img_plein is_hidden" src="{!! $staff->getImagePortraitPleinPath() !!}" alt="">
      </div>

      <div class="content_liste_attributs">
        <div class="attributs_perso">

          <div class="container_attributs separated_attributs">
            <div class="title_content_attributs ">
              <div class="icones_attributs">
                <img src="{!! url('img/fiche_candidates/tel.png') !!}" alt="">
              </div>
              <label class="title_attributs" for="">{!! trans ('page_agency.Phone') !!}</label>
            </div>
            <label class="value_attributs" for="">{{ $staff->user->phone }}</label>
          </div>
          <div class="container_attributs separated_attributs">
            <div class="title_content_attributs">
              <div class="icones_attributs">
                <img src="{!! url('img/fiche_candidates/star_vert.png') !!}" alt="">
              </div>
              <label class="title_attributs" for="">{{getAppreciation($staff)}}</label>
            </div>
            <label class="value_attributs" for="">{!! trans ('page_agency.Appreciation') !!}</label>
          </div>
          <div class="container_attributs content_couriel">
            <div class="title_content_attributs">
              <div class="icones_attributs">
                <img src="{!! url('img/fiche_candidates/couriel.png') !!}" alt="">
              </div>
              <label class="title_attributs" for="">{!! trans ('page_agency.Courriel') !!}</label>
            </div>
            <label class="value_attributs" for="">{{ $staff->user->email }}</label>
          </div>

        </div>
        <div class="attributs_auto">
          <div class="content_attributs_auto is_hidden">
            <div class="image_not_auto">
              @if( $staff->staffCertification->have_car == 1 )
                <img src="{!! url('img/fiche_candidates/car.svg') !!}" alt="">
              @else
                <img src="{!! url('img/fiche_candidates/no-car.svg') !!}" alt="">
              @endif
            </div>
          </div>
          <div class="content_attributs_auto">
            <div class="auto_permited">
              <div class="image_auto_permited">
                @if( $staff->staffCertification->driver_license == 1 )
                  <img src="{!! url('img/fiche_candidates/car.svg') !!}" alt="">
                @else
                  <img src="{!! url('img/fiche_candidates/no-car.svg') !!}" alt="">
                @endif
              </div>
              <label for="" class="texte_permited">{!! trans ('page_agency.Owner_license') !!}</label>
            </div>
          </div>
          <div class="content_attributs_auto">
            <div class="auto_permited">
              <div class="image_auto_permited">
                @if( $staff->staffCertification->driver_license_truck == 1 )
                  <img src="{!! url('img/fiche_candidates/truck.svg') !!}" alt="">
                @else
                  <img src="{!! url('img/fiche_candidates/no-truck.svg') !!}" alt="">
                @endif
              </div>
              <label for="" class="texte_permited">{!! trans ('page_agency.license') !!}</label>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Step1 -->

    <!-- Step Experience -->
    <div class="container_experience">
      <div class="content_title_experience">
        <label for="" class="title_experience">{!! trans ('page_agency.Previous_Experience') !!}</label>
        <div class="separated_exp"></div>
      </div>
      <div class="slider_jobs_exp">
        <div class="container_slider_jobs_exp">
            <div class="post_slider_exp">
              @foreach($staff->staffJobs as $staffJob)
                @if($staffJob->experience_year != 0)
                <?php $translation = $staffJob->job->getByLanguageId(getLanguageId()); ?>
                <div class="description_jobs_exp myJob{{$staffJob->experience_year}}">
                  <div class="item_jobs_list_exp">
                    <div class="logo_jobs_exp">
                      <img  class="svg-inline" src="{!! $staffJob->job->getImagePath() !!}" alt="{!! $translation->name !!}"/>
                    </div>
                    <label for="" class="title_jobs_exp">{!! $translation->name !!}</label>
                    <div class="separated_exp"></div>
                    <button class="status_jobs_exp xp_candidates" data-experience="{!! $staffJob->experience_year !!}">{!! ($staffJob->experience_year ==3)? $staffJob->experience_year."+":$staffJob->experience_year!!}</button>
                  </div>
                </div>
                @endif
              @endforeach
            </div>
             <!-- control arrows -->
          </div>

          <div class="container_btn_slider_exp">
            <div class="prev_exp">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"><</span>
            </div>
            <div class="next_exp">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">></span>
            </div>
          </div>
      </div>
    </div>
    <!-- End Step Experience -->
    <div class="liste_more_exp">
      <div class="item_more_exp separated_item" id="view_cv" data-iframe_url="{{ show_cv_iframe($staff->getImageCvPath()) }}" data-url="{{ $staff->getImageCvPath() }}" data-modal="iframe_view_cv" data-curriculum="{{ $staff->cv }}">
        <div class="img_more_exp">
          <img src="{!! url('img/fiche_candidates/bottom/cv.svg') !!}" alt="">
        </div>
        <label class="title_more_exp" for="">{!! trans ('page_agency.See_CV') !!}</label>
      </div>
      <div class="item_more_exp separated_item" id="language_exp" data-modal="modals.agency.fiche_candidates.language_experience" data-staff_id="{!! $staff->id !!}" data-url="{!! route('get_modal_info') !!}">
        <div class="img_more_exp">
          <img src="{!! url('img/fiche_candidates/bottom/langues.svg') !!}" alt="">
        </div>
        <label class="title_more_exp" for="">{!! trans ('page_agency.Spoken_language') !!}</label>
      </div>
      <div class="item_more_exp separated_item" id="certifications_exp" data-modal="modals.agency.fiche_candidates.certifications_candidates" data-staff_id="{!! $staff->id !!}" data-url="{!! route('get_modal_info') !!}">
        <div class="img_more_exp">
          <img src="{!! url('img/fiche_candidates/bottom/checked.svg') !!}" alt="">
        </div>
        <label class="title_more_exp" for="">{!! trans ('page_agency.certifications') !!}</label>
      </div>
      <div class="item_more_exp separated_item" id="listes_attributs" data-modal="modals.agency.fiche_candidates.attributs_candidates" data-staff_id="{!! $staff->id !!}" data-url="{!! route('get_modal_info') !!}">
        <div class="img_more_exp">
          <img src="{!! url('img/fiche_candidates/bottom/info.svg') !!}" alt="">
        </div>
        <label class="title_more_exp" for="">{!! trans ('page_agency.attributes') !!}</label>
      </div>
      <div class="item_more_exp" id="mobilities_exp" data-modal="modals.agency.fiche_candidates.mobilities_candidates" data-staff_id="{!! $staff->id !!}" data-url="{!! route('get_modal_info') !!}">
        <div class="img_more_exp">
          <img src="{!! url('img/fiche_candidates/bottom/route.svg') !!}" alt="">
        </div>
        <label class="title_more_exp" for="">{!! trans ('page_agency.Mobility') !!}</label>
      </div>
    </div>
  </div>
</div>
