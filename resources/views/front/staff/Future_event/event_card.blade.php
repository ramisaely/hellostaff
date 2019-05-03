@if($event)
<div class="event_card_container">
    <div class="section_title">
        <span>{!! trans('index_future_staff.Event_sheete') !!}</span>
    </div>

    <div class="event_card_content">
        <div class="event_card_top">
            <div class="left">
                <img src="{!!$event->getImageSliderEventPath()!!}">
            </div>
            <div class="right">
                <div class="item about">
                    <div class="form_item">
                        <label for="name" class="">{!! trans('index_future_staff.Name') !!}</label>
                        <input class="" id="name" type="text" name="name" value="{{ $event->name }}" placeholder="Nom " readonly>
                    </div>
                    <div class="form_item">
                        <label for="customer" class="">{!! trans('index_future_staff.customerStaff') !!}</label>
                        <input class="" type="text" id="customer" name="customer" value="{{ $event->customer }}" placeholder="Client" readonly>
                    </div>

                    <div class="form_item localization_info">
                        <label for="location" class="">{!! trans('index_future_staff.location') !!}</label>
                        <input class="" type="text" id="location" name="location_event" value="{{ $event->location_event }}" placeholder="Adresse " readonly>
                    </div>

                    <div class="form_item item_footer localization_info">
                        <div class="zip_item">
                            <label for="zip" class="label_create_event prv_postal_responsive">{!! trans('index_future_staff.Postal_code') !!}</label>
                            <input class="" id="country" name="zip" value="{{ $event->zip_event }}" placeholder="code Postal" readonly>
                        </div>

                        <div class="country_item">
                            <label for="country" class="label_create_event prv_postal_responsive">Province</label>
                            <input class="" id="country" name="country_event" value="{{ $event->country_event }}" placeholder="  ---  " readonly autocomplete="off">
                        </div>
                    </div>
                </div>

                <div class="item description">
                    <div class="description_heading">
                        <div class="item">
                            <img class="left_drop_cage" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdown cage">
                            <span class="text">{{ $event->zone_event }}</span>
                        </div>
                        <div class="item duration">
                            <img class="left_drop_cage" src="{!! url('img/icones_creations/date.svg') !!}" alt="icone dropdown cage">
                            <span class="text">From {{ $event->start_date }} - To {{ $event->end_date }}</span>
                        </div>
                    </div>
                    <div class="event_description">
                        <div class="description_head">
                            <img class="" src="{!! url('img/icones_creations/descripion_text.svg') !!}" alt="icone dropdown cage">
                            <span class="text">{!! trans('index_future_staff.event_description') !!}</span>
                        </div>
                        <div class="description_brief">
                            <p class="text_brief">{{ $event->description_fr_event }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="event_card_middle">
            <div class="section_title">
                <span>{!! trans('index_future_staff.Job_Board') !!}</span>
            </div>
            <div class="remuneration">
                <span>{!! trans('index_future_staff.jobRemuneration') !!}</span><span class="amount">&nbsp;{{ calculRemunerationEvent($event) }}$</span>
            </div>
        </div>
    @foreach($event->eventStaffs as $eventStaff)
        <div class="event_card_bottom">
            <div class="left_item">
                <div class="left">
                    <div class="item">
                        <img class="" src=" {!! url('img/icones_creations/poste.svg') !!}" alt="icone dropdowne cage">
                        <span class="text">{{ $eventStaff->post }}</span>
                    </div>
                    <div class="item">
                        <img class="" src="{!! url('img/icones_creations/employed.svg') !!}" alt="icone dropdowne cage">
                        <span class="text">{{ $eventStaff->necessary_staff }}</span>
                    </div>
                    <div class="form_item localization_info">
                        <label for="location" class="">{!! trans('index_future_staff.location') !!}</label>
                        <input class="" type="text" id="location" name="location_event" value="{{ $eventStaff->location_event_staff }}" placeholder="Adresse " readonly>
                    </div>

                    <div class="form_item item_footer localization_info">
                        <div class="zip_item">
                            <label for="zip" class="label_create_event prv_postal_responsive">{!! trans('index_future_staff.Postal_code') !!}</label>
                            <input class="" id="country" name="zip" value="{{ $eventStaff->zip_event_staff }}" placeholder="code Postal" readonly>
                        </div>

                        <div class="country_item">
                            <label for="country" class="label_create_event prv_postal_responsive">Province</label>
                            <input class="" id="country" name="country_event" value="{{ $eventStaff->country_event_staff }}" placeholder="  ---  " readonly autocomplete="off">
                        </div>
                    </div>
                </div>

                <div class="right">
                    <div class="description_heading">
                        <div class="item place_item">
                            <img class="" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdown cage">
                            <label class="place text">{{ $eventStaff->zone_event_staff }}</label>
                        </div>

                        <div class="item hourly_rate_item">
                            <img class="" src="{!! url('img/icones_creations/taux_horaire.svg') !!}" alt="icone dropdowne cage">
                            <label class="text">{{ $eventStaff->hour_rate }}$/h</label>
                        </div>
                        <div class="item deplacement_cost_item">
                            <img class="" src="{!! url('img/icones_creations/$_km.svg') !!}" alt="icone dropdown cage">
                            <label class="text">$/km</label>
                            <span class="value text">{{ $eventStaff->distance }}</span>
                        </div>
                        <div class="item per_diem_item">
                            <img class="" src="{!! url('img/icones_creations/per_diem.svg') !!}" alt="icone dropdown cage">
                            <label class="text">Per Diem</label>
                            <span class="value text">{{ $eventStaff->per_diem }}$</span>
                        </div>
                    </div>

                    <div class="post_description">
                        <div class="description_head">
                            <img class="" src="{!! url('img/icones_creations/descripion_text.svg') !!}" alt="icone dropdown cage">
                            <span class="text">{!! trans('index_future_staff.Job_specification') !!}</span>
                        </div>
                        <div class="description_brief">
                            <p class="text_brief">{{ $eventStaff->description_fr_event_staff }}</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="dates">
                <div class="header_dates">
                    <img class="" src="{!! url('img/icones_creations/date.svg') !!}" alt="icone dropdown cage">
                    <label class="text">Dates &amp; {!! trans('index_future_staff.schedule') !!}</label>
                </div>
                <div class="date_list">
                    @foreach($eventStaff->eventStaffDates as $eventStaffDate)
                        <div class="item">
                            <span class="puce"></span>
                            <div class="date_content">
                                <span class="day">{{showDateEventStaff($eventStaffDate->date_start)}}</span>
                                <span class="separator"></span>
                                <span class="time">{{showHoursEventStaff($eventStaffDate->start_hour_event_staff_date, $eventStaffDate->end_hour_event_staff_date)}}</span>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    @endforeach
    </div>
</div>
@endif
