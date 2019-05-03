<section class="confirmed_staff_menus confirmated_staff_menus_future_event">
  <div class="listes_staff_confirmed">
@if($event)
  @foreach($event->eventStaffs as $eventStaff)
  <?php $translation = $eventStaff->eventStaffJobs->first()->getByLanguageId(getLanguageId()); ?>
    <div class="content_dropdown_jobs">
      <div class="listes_jobs" style="background-image:{{ $eventStaff->color_event_staff }};">
        <div class="description_item_jobs">
          <div class="icones_jobs">
            <img class="svg-inline" src="{!! $eventStaff->eventStaffJobs->first()->getImagePath() !!}" alt="" >
          </div>
          <label for="" class="name_jobs">{{ $translation->name }}</label>
        </div>

        <div class="status_item_jobs">
          <div class="listes_status">
            <label for="" class="status_item longueur">{{ count($eventStaff->eventStaffCandidateConfirmed) }}</label>
            <label for="" class="status_item">/</label>
            <label for="" class="status_item">{{ $eventStaff->necessary_staff }}</label>
          </div>
          <div class="icones_dropdown">
            <i class="icone_play fa fa-caret-right "></i>
          </div>
        </div>
      </div>
      <!-- Dropdown candidates -->
      <ul class="dropdown_liste_jobs is_hidden">
        @foreach($eventStaff->eventStaffCandidateConfirmed as $eventCandidate)
        <li class="box_shadow_filter" id="staff{{ $eventCandidate->id }}">
          <div class="content_liste_staff" data-id="{{ $eventCandidate->id }}">
              <div class="avatar_staff">
                <div class="avatar">
                  <img src="{!! $eventCandidate->staff->getImagePortraitPath() !!}" alt="">
                </div>
              </div>
              <div class="description_staffs">
                <label for="" class="name_staff">{{ $eventCandidate->staff->user->first_name }} {{ $eventCandidate->staff->user->last_name }}</label>
                <label for="" class="ages_staff">{{ $eventCandidate->staff->ages }} {!! trans('find_candidates.years') !!}</label>
                <label for="" class="country_staff">{{ $eventCandidate->staff->address }}</label>
              </div>
          </div>
          <div class="action_staff">
            <div class="icones_loupe" data-staff_id="{{ $eventCandidate->staff->id }}" data-url="{{ route('candidate_form') }}">
              <img src="{!! url('img/input_icons/Search.svg') !!}" alt="" >
            </div>
            <div class="separated_actions"></div>
            <span class="delete_staff">-</span>
          </div>
        </li>
        @endforeach
      </ul>
      <!-- End Dropdown candidates -->
    </div>
@endforeach
@endif

</section>


<section class="calendar_confirmed_staff">
  <div class="container_fullcalendar_staff_confirmed">
    <div id='calendar_confirmed'></div>
  </div>
</section>
