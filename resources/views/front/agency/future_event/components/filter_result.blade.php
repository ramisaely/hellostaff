<!-- Liste candidates filtrer -->
<section class="liste_candidates_filter">
  <div class="listes_staff ">
    <label for="" class="title_filter_candidates my_staff">{!! trans('find_candidates.My_staff') !!}
      <i class="icone_responsive_icons_play_one is_hidden fa fa-caret-right"></i>
    </label>
    @if(count($all_my_staffs)>0)
    <div class="search_candidates search_candidates_two">
      <div class="form_item_candidates_search">
        <input class="input_my_staff" id="myStaffList" type="text" name="" value="" placeholder="{!! trans('find_candidates.text_search') !!}">
        <img class="loup_search" src="{!! url('img/input_icons/Search.svg') !!}" alt="">
      </div>
      <div class="checkox_filter">
        <div class="list_item_filter">
          <label for="" class="title_filter">{!! trans('find_candidates.text_candidates_my_staff') !!}</label>
          <label for="" class="checkbox_label clic_proposed_more_mystaff" data-url="{{ route('job_all_staff_offer') }}"></label>
        </div>
      </div>
    </div>
    @foreach($all_my_staffs as $my_staff)
    <div class="personnal_candidates responsive_liste_candidates_filter_two myStaffList">
      <div class="candidates">
            <div class="personnal_candidates_description">
              <div class="photo_candidates">
                <img src="{!! $my_staff->staff->portrait_pic !='' ? $my_staff->staff->getImagePortraitPath() : url('img/login/users_profil.JPG') !!}" alt="{{ fullName($my_staff->staff->user->last_name, $my_staff->staff->user->first_name) }}">
              </div>
              <div class="description_candidates">
                <label for="" class="name">{{ FirstAndInitialName($my_staff->staff->user->first_name, $my_staff->staff->user->last_name) }}</label>
                <label for="" class="ages">{{ $my_staff->staff->ages }} {!! trans('find_candidates.years') !!}</label>
                <label for="" class="country">{{ $my_staff->staff->city }}</label>
              </div>
            </div>
            <div class="evaluations_candidates">
                <div class="description_appreciations">
                  <div class="status_appreciation">
                    <img src="{!! url('img/agency/icones_pages_agency/star.svg') !!}" alt="">
                    <label for="" class="number">{{getAppreciation($my_staff->staff)}}</label>
                  </div>
                  <label for="" class="title_p_candidates">{!! trans('find_candidates.Appreciation') !!}</label>
                </div>

                <div class="separated"></div>

                <div class="description_appreciations">
                  <div class="status_appreciation">
                    <img src="{!! url('img/agency/icones_pages_agency/icon_up.svg') !!}" alt="">
                    <label for="" class="number">{{ $my_staff->staff->staffJobs->first()->experience_year }}</label>
                  </div>
                  <label for="" class="title_p_candidates">{!! trans('find_candidates.expertise') !!}</label>
                </div>
            </div>
            <div class="liste_buttons">
              <button class="btn_list_candidates color_proposed_jobs btn_action_candidates" data-staff_id="{{ $my_staff->staff->id }}" data-url="{{ route('job_staff_offer') }}" type="button">{!! trans('find_candidates.btn_send_job') !!}</button>
              <button class="btn_list_candidates btn_candidat_fiche color_candidat_fiche" data-staff_id="{{ $my_staff->staff->id }}" data-url="{{ route('candidate_form') }}" data-offer_job="1" type="button">
                <img class="loup" src="{!! url('img/agency/icones_pages_agency/loop.svg') !!}" alt="">
                {!! trans('find_candidates.candidate_sheet_find_candidates') !!}
              </button>
            </div>
      </div>
    </div>
    @endforeach
    @endif
  </div>
  <div class="listes_staff">
    <label for="" class="title_filter_candidates new_staff">{!! trans('find_candidates.NEW_STAFF') !!}
      <i class="icone_responsive_icons_play_two is_hidden fa fa-caret-right "></i>
    </label>
    @if(count($all_staffs)>0)
    <div class="search_candidates search_candidates_one">
      <div class="form_item_candidates_search">
        <input class="input_new_staff" id="staffMemberList" type="text" name="" value="" placeholder="{!! trans('find_candidates.text_search') !!}">
        <img class="loup_search" src="{!! url('img/input_icons/Search.svg') !!}" alt="">
      </div>
      <div class="checkox_filter">
        <div class="list_item_filter">
          <label for="" class="title_filter">{!! trans('find_candidates.text_candidates_new_staff') !!}</label>
          <label for="" class="checkbox_label clic_proposed_more_newstaff" data-url="{{ route('job_all_staff_offer') }}"></label>
        </div>
      </div>
    </div>
    @foreach($all_staffs as $staff)
    <div class="personnal_candidates responsive_liste_candidates_filter_one staffMemberList candidate_list{{ $staff->id }}">
      <div class="candidates">
            <div class="personnal_candidates_description">
              <div class="photo_candidates">
                <img src="{!! $staff->portrait_pic !='' ? $staff->getImagePortraitPath() : url('img/login/users_profil.JPG') !!}" alt="{{ fullName($staff->user->last_name, $staff->user->first_name) }}">
              </div>
              <div class="description_candidates">
                <label for="" class="name">{{ FirstAndInitialName($staff->user->first_name, $staff->user->last_name) }}</label>
                <label for="" class="ages">{{ $staff->ages }} {!! trans('find_candidates.years') !!}</label>
                <label for="" class="country">{{ $staff->city }}</label>
              </div>
            </div>
            <div class="evaluations_candidates">
                <div class="description_appreciations">
                  <div class="status_appreciation">
                    <img src="{!! url('img/agency/icones_pages_agency/star.svg') !!}" alt="" >
                    <label for="" class="number">{{getAppreciation($staff)}}</label>
                  </div>
                  <label for="" class="title_p_candidates">{!! trans('find_candidates.Appreciation') !!}</label>
                </div>

                <div class="separated"></div>

                <div class="description_appreciations">
                  <div class="status_appreciation">
                    <img src="{!! url('img/agency/icones_pages_agency/icon_up.svg') !!}" alt="">
                    <label for="" class="number">{{ $staff->staffJobs->first()->experience_year }}</label>
                  </div>
                  <label for="" class="title_p_candidates">{!! trans('find_candidates.expertise') !!}</label>
                </div>
            </div>
            <div class="liste_buttons">
              <button class="btn_list_candidates color_proposed_jobs btn_action_candidates" data-staff_id="{{ $staff->id }}" data-url="{{ route('job_staff_offer') }}" type="button">{!! trans('find_candidates.btn_send_job') !!}</button>
              <button class="btn_list_candidates btn_candidat_fiche color_candidat_fiche" data-staff_id="{{ $staff->id }}" data-url="{{ route('candidate_form') }}" data-offer_job="1" type="button">
                <img class="loup" src="{!! url('img/agency/icones_pages_agency/loop.svg') !!}" alt="">
                {!! trans('find_candidates.candidate_sheet_find_candidates') !!}
              </button>
            </div>
      </div>
    </div>
    @endforeach
    @endif
  </div>
</section>

@if(count($all_staffs)>0 || count($all_my_staffs)>0)
@if($all_staffs->total()>12 || $all_my_staffs->total()>12)
<section class="footer_candidates_filter">
  <div class="number_candidates">
    <?php
      $count_staff = count($all_staffs)?$all_staffs->lastItem():0;
      $count_my_staff = count($all_my_staffs)?$all_my_staffs->lastItem():0;
      $total_count = $count_staff+$count_my_staff;

      if ($all_staffs->total()>12) {
        $paginate = $all_staffs->lastItem()+12;
      }else if($all_my_staffs->total()>12){
        $paginate = $all_my_staffs->lastItem()+12;
      }

      $count_all_staff = count($all_staffs)?$all_staffs->total():0;
      $count_my_all_staff = count($all_my_staffs)?$all_my_staffs->total():0;
      $total_all = $count_all_staff+$count_my_all_staff;
    ?>
    <label class="label_number_candidates">{!! $total_count !!}</label>
    <label class="label_number_candidates">/</label>
    <label class="label_number_candidates" for="">{!! $total_all !!}</label>
  </div>
  <label for="" class="title_footer"> {!! trans('find_candidates.candidates_posted') !!}</label>
  <button class="see_more_agency" type="button" data-paginate="{!! $paginate !!}">{!! trans('find_candidates.SEE_MORE') !!}</button>
</section>
@endif
@endif
<!-- End Listes candidates filtrer -->
<!--END FILTRE DES CANDIDATES -->
