<section class="liste_candidates"> 
  @if(count($all_staffs_to_see) > 0)
  @foreach($all_staffs_to_see as $candidates)
  <div class="personnal_candidates">
    <div class="candidates">

          <div class="personnal_candidates_description">
            <div class="photo_candidates">
              <img src="{!! $candidates->staff->portrait_pic !='' ? $candidates->staff->getImagePortraitPath() : url('img/login/users_profil.JPG') !!}" alt="">
              <label for="" class="status {{colorButtonStatus($candidates->status_event_id)}}"></label>
            </div>

            <div class="description_candidates">
              <label for="" class="name">{{FirstAndInitialName($candidates->staff->user->last_name,$candidates->staff->user->first_name)}}</label>
              <label for="" class="ages">{{$candidates->staff->ages}} {!! trans('find_candidates.years') !!}</label>
              <label for="" class="country">{{$candidates->staff->city}}</label>
            </div>
          </div>

          <div class="evaluations_candidates">

              <div class="description_appreciations">
                <div class="status_appreciation">
                  <img src="{!! url('img/agency/icones_pages_agency/star.svg') !!}" alt="">
                  <label for="" class="number">{{getAppreciation($candidates->staff)}}</label>
                </div>
                <label for="" class="title_p_candidates">{!! trans('find_candidates.Appreciation') !!}</label>
              </div>

              <div class="separated"></div>

              <div class="description_appreciations">
                <div class="status_appreciation">
                  <img src="{!! url('img/agency/icones_pages_agency/icon_up.svg') !!}" alt="">
                  <label for="" class="number">{{isset($candidates->staff->staffJobs->first()->experience_year)?$candidates->staff->staffJobs->first()->experience_year:'0'}}</label>
                </div>
                <label for="" class="title_p_candidates">{!! trans('find_candidates.expertise') !!}</label>
              </div>

          </div>

          <div class="liste_buttons">
            <button class="btn_list_candidates {{colorButtonStatus($candidates->status_event_id)}} btn_action_candidates" data-idEventCandidat="{{$candidates->id}}" data-url="{{route('confirm_candidate')}}" data-urlToReload="{{route('reload_staff_confirme')}}" type="button" name="button">{{statusButtonListOfCandidate(getLanguageId(), $candidates->status_event_id)}}</button>
            <button class="btn_list_candidates btn_candidat_fiche color_candidat_fiche" data-staff_id="{{ $candidates->staff->id }}" data-url="{{ route('candidate_form') }}" type="button" name="button">
              <img class="loup" src="{!! url('img/agency/icones_pages_agency/loop.svg') !!}" alt="">
              {!! trans('find_candidates.candidate_sheet') !!}
            </button>
          </div>

    </div>
    
  </div>
@endforeach
@endif
</section>  
<!-- END VOIR LISTES DES CANDIDATES -->
@if(count($all_staffs_to_see)>0)
@if($all_staffs_to_see->total()>24)
<section class="footer_candidates_filter">
  <div class="number_candidates">
    <label class="label_number_candidates" for="">{{$all_staffs_to_see->lastItem()}}</label>
    <label class="label_number_candidates" for="">/</label>
    <label class="label_number_candidates" for="">{{$all_staffs_to_see->total()}}</label>
  </div>
  <label for="" class="title_footer"> {!! trans('find_candidates.candidates_posted') !!}</label>
  <button class="see_more_agency see_more_candidate_staff" type="button" name="button" data-paginate="{{$all_staffs_to_see->total()>1 ? $all_staffs_to_see->lastItem()+24 : '24' }}">{!! trans('find_candidates.SEE_MORE') !!}</button>
</section>
@endif
@endif