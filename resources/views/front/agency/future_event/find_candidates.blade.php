<!-- VOIR LISTES DES CANDIDATES -->
<section class="find_candidates_form">
  <div class="slider_jobs box_shadow_filter">
        <!-- Slider -->
    <div class="container_slider_jobs is_hidden">
        <div class="post_slider">
          @if($event)
          @foreach($event->eventStaffs as $eventStaff)
          <?php $translation = $eventStaff->eventStaffJobs->first()->getByLanguageId(getLanguageId()); ?>
            <div class="description_jobs" data-event_staff_id="{!! $eventStaff->id !!}" data-job_id="{!! $eventStaff->eventStaffJobs->first()->id !!}" data-hourly_rate="{{ ($eventStaff->hour_rate > 20) ? '20' : $eventStaff->hour_rate }}">
              <div class="item_jobs_list">
                <div class="image_slider_jobs_slick">
                  <img class="logo_jobs svg-inline_jobs" src="{!! $eventStaff->eventStaffJobs->first()->getImagePath() !!}" alt="" />
                </div>
                <label for="" class="title_jobs">{{ $translation->name }}</label>
                <div class="status_jobs">
                  <label for="" class="number_jobs">{{ count($eventStaff->eventStaffCandidateConfirmed) }}</label>
                  <label for="" class="number_jobs">/</label>
                  <label for="" class="number_jobs">{{ $eventStaff->necessary_staff }}</label>
                </div>
              </div>
            </div>
          @endforeach
          @endif
        </div>
         <!-- control arrows -->
      </div>
      <div class="container_btn_slider">
        <div class="prev_post">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"><</span>
        </div>
        <div class="next_post">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">></span>
        </div>
      </div>
  </div>

  <div class="jobs_candidates">
    <div class="jobs_proposed">
      <div class="filtre_candidates color_filtre_candidates">
        <img src="{!! url('img/agency/icones_pages_agency/confirmer_job.svg') !!}" alt="">
        <label class="title_jobs_candidates">{!! trans('find_candidates.title_Submit_job') !!}</label>
        <button class="btn_find_candidates_white filter_candidate_event" type="button" name="button">{!! trans('find_candidates.Submit_job') !!}</button>
      </div>
    </div>
    <div class="presence_confirm">
      <div class="check_presence color_check_presence">
        <img src="{!! url('img/agency/icones_pages_agency/confirmer_job.svg') !!}" alt="">
        <label class="title_jobs_candidates">{!! trans('find_candidates.Confirm_presence') !!}</label>
        <button class="btn_find_candidates_white show_candidate_event" data-url="{{route('see_candidate')}}" type="button" name="button">{!! trans('find_candidates.See_candidates') !!}</button>
      </div>
    </div>
  </div>
</section>

<div class="candidate_event_all_lists is_hidden">
  @include('front.agency.future_event.components.candidate_list')
</div>

<!-- FILTRE DES CANDIDATES -->
<section class="filter_candidates is_hidden">
  <div class="slider_jobs box_shadow_filter">
    <div class="container_slider_jobs">
        <div class="post_slider">
            @if($event)
            @foreach($event->eventStaffs as $eventStaff)
              <?php $translation = $eventStaff->eventStaffJobs->first()->getByLanguageId(getLanguageId()); ?>
              <div class="description_jobs" data-event_staff_id="{!! $eventStaff->id !!}" data-job_id="{!! $eventStaff->eventStaffJobs->first()->id !!}" data-hourly_rate="{{ ($eventStaff->hour_rate > 20) ? '20' : $eventStaff->hour_rate }}">
                <div class="item_jobs_list">
                  <div class="image_slider_jobs_slick ">
                    <img class="logo_jobs" src="{!! $eventStaff->eventStaffJobs->first()->getImagePath() !!}" alt="" />
                  </div>
                  <label for="" class="title_jobs">{{ $translation->name }}</label>
                  <div class="status_jobs">
                    <label for="" class="number_jobs">{{ count($eventStaff->eventStaffCandidateConfirmed) }}</label>
                    <label for="" class="number_jobs">/</label>
                    <label for="" class="number_jobs">{{ $eventStaff->necessary_staff }}</label>
                  </div>
                </div>
              </div>
            @endforeach
            @endif
        </div>
         <!-- control arrows -->
      </div>
      <div class="container_btn_slider">
        <div class="prev_post">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"><</span>
        </div>
        <div class="next_post">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">></span>
        </div>
      </div>
  </div>
  <div class="configuration_filter">
    <!-- containeur des filtre -->
    <div class="content_filter marge_content_fliter">
      <div class="gender_item item_filter_form box_shadow_filter">
        <div class="gender">
          <label for="" class="title_item_filter">{!! trans('find_candidates.gender') !!}</label>
          <div class="separed_item"></div>
          <div class="container_gender">
            <div class="list_item_filter">
              <label for="" class="title_filter">{!! trans('find_candidates.Man') !!}</label>
              <label for="man" data-value="1" class="checkbox_label"></label>
            </div>
            <div class="list_item_filter">
              <label for="" class="title_filter">{!! trans('find_candidates.Women') !!}</label>
              <label for="woman" data-value="2" class="checkbox_label"></label>
            </div>
            <div class="list_item_filter">
              <label for="" class="title_filter">{!! trans('find_candidates.Indifferent') !!}</label>
              <label for="indifferent" data-value="0" class="checkbox_label active"></label>
            </div>
          </div>
        </div>
      </div>

      <div class="ages_item item_filter_form box_shadow_filter">
        <div class="ages">
          <label for="" class="title_item_filter">{!! trans('find_candidates.Age') !!}</label>
          <div class="separed_item"></div>
          <div class="value_ages">
            <label for="" class="title_filter_ages">{!! trans('find_candidates.between') !!} : <label class="age_start">20</label> - <label class="age_end">45</label></label>
          </div>
          <div class="range_ages">
            <label for="" class="number_ages">18</label>
            <label for="" class="number_ages">60+</label>
          </div>
          <input class="range-filter-cadidate" type="text" min="18" max="60" value="20,45" name="points" step="1" />
        </div>
      </div>

      <div class="certifications_item item_filter_form box_shadow_filter">
        <div class="certifications">
          <label for="" class="title_item_filter">Certifications</label>
          <div class="separed_item"></div>
          <div class="content_certifications">
            <div class="long_certifications">
              <div class="list_item_filter">
                <label for="" class="title_filter">{!! trans('find_candidates.Driver_license') !!}</label>
                <label for="driver_license" class="checkbox_label"></label>
              </div>
              <div class="list_item_filter">
                <label for="" class="title_filter">{!! trans('find_candidates.Vehicle_Required') !!}</label>
                <label for="have_car" class="checkbox_label "></label>
              </div>
              <div class="list_item_filter">
                <label for="" class="title_filter">{!! trans('find_candidates.Handling_food') !!}</label>
                <label for="food_handling" class="checkbox_label "></label>
              </div>
            </div>
            <div class="court_certifications">
              <div class="list_item_filter">
                <label for="" class="title_filter">UDA</label>
                <label for="uda" class="checkbox_label"></label>
              </div>
              <div class="list_item_filter">
                <label for="" class="title_filter">ACTRA</label>
                <label for="actra" class="checkbox_label "></label>
              </div>
              <div class="list_item_filter">
                <label for="" class="title_filter">Smart Serve</label>
                <label for="smart_serve" class="checkbox_label "></label>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="experiences_item item_filter_form box_shadow_filter">
        <div class="experiences">
          <label for="" class="title_item_filter">{!! trans('find_candidates.expertise') !!}</label>
          <div class="separed_item"></div>
          <div class="container_exp">
            <div class="list_item_filter">
              <label for="" class="title_filter">{!! trans('find_candidates.Yes') !!}</label>
              <label for="experience_yes" data-value="1" class="checkbox_label "></label>
            </div>
            <div class="list_item_filter">
              <label for="" class="title_filter">{!! trans('find_candidates.Indifferent') !!}</label>
              <label for="experience_indifferent" data-value="0" class="checkbox_label active"></label>
            </div>
          </div>
        </div>
      </div>

    </div>

    <div class="content_filter">
      <div class="languages_item item_filter_form box_shadow_filter">
        <div class="languages">
          <label for="" class="title_item_filter">{!! trans('find_candidates.languages') !!}</label>
          <div class="separed_item"></div>
          <div class="content_languages">
            @if(count($all_languages)>0)
              @foreach($all_languages as $language)
                <?php
                  $translation = $language->getByLanguageId(getLanguageId());
                  $fr_code = ($language->id == 1) ? 'fr' : ($language->id == 2 ? 'en' :'');
                ?>
                <label data-id="{{$language->id}}" class="cadres_langues">{!! $translation->name !!}</label>
              @endforeach
            @endif
          </div>
        </div>
      </div>

      <div class="attributs_item item_filter_form box_shadow_filter">
        <div class="attributs">
          <label for="" class="title_item_filter">{!! trans('find_candidates.attributes') !!}</label>
          <div class="separed_item"></div>
          <div class="liste_attributs">
            <div class="content_attributs piercing_attributs">
              <label for="" class="title_attributs">{!! trans('find_candidates.Piercing') !!}</label>
              <div class="list_item_filter">
                <label for="" class="title_filter">Visible</label>
                <label for="piercing_visible" data-value="1" class="checkbox_label"></label>
              </div>
              <div class="list_item_filter">

                <label for="" class="title_filter">{!! trans('find_candidates.not') !!} visible</label>
                <label for="piercing_not_visible" data-value="2" class="checkbox_label"></label>
              </div>
              <div class="list_item_filter">
                <label for="" class="title_filter">{!! trans('find_candidates.None') !!}</label>
                <label for="piercing_none" data-value="3" class="checkbox_label"></label>

              </div>
            </div>

            <div class="content_attributs tattoo_attributs">
              <label for="" class="title_attributs">{!! trans('find_candidates.Tattoo') !!}</label>
              <div class="list_item_filter">
                <label for="" class="title_filter">Visible</label>
                <label for="tattoo_visible" data-value="1" class="checkbox_label"></label>
              </div>
              <div class="list_item_filter">

                <label for="" class="title_filter">{!! trans('find_candidates.not') !!} visible</label>
                <label for="tattoo_not_visible" data-value="2" class="checkbox_label"></label>
              </div>
              <div class="list_item_filter">
                <label for="" class="title_filter">{!! trans('find_candidates.None') !!}</label>
                <label for="tattoo_none" data-value="3" class="checkbox_label"></label>

              </div>
            </div>
          </div>

        </div>
      </div>

      <div class="horaires_taux_item">
        <div class="horaires_taux">
          <div class="liste_salaires item_filter_form box_shadow_filter">
            <label for="" class="title_item_filter">{!! trans('find_candidates.Hourly_rate') !!}</label>
            <div class="separed_item"></div>
            <div class="liste_taux_horaires" data-url="{{ route('update_horary') }}">
              <label for="" class="value_horaires horary12">12$</label>
              <label for="" class="value_horaires horary13">13$</label>
              <label for="" class="value_horaires horary14">14$</label>
              <label for="" class="value_horaires horary15">15$</label>
              <label for="" class="value_horaires horary16">16$</label>
              <label for="" class="value_horaires horary17">17$</label>
              <label for="" class="value_horaires horary18">18$</label>
              <label for="" class="value_horaires horary19">19$</label>
              <label for="" class="value_horaires horary20">20+$</label>
            </div>
          </div>
          <div class="btn_filter_confirmed">
            <button type="button" name="button" data-url="{{route('find_candidate')}}" class="filter filter_staff">{!! trans('find_candidates.btn_FILTER') !!}</button>
            <button type="button" name="button" class="confirmed confirmed_staff">{!! trans('find_candidates.confirm') !!}</button>
          </div>
        </div>
      </div>
    </div>
    <!-- end container des filter -->
  </div>
</section>

<section class="filter_candidate_event_results is_hidden">
  @include('front.agency.future_event.components.filter_result')
</section>
