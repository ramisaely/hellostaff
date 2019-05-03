@if($event)
    <div class="event_card_container">
        <div class="section_title">
            <span>{!! trans('event_form.Event_sheet') !!}</span>
        </div>

        <div class="event_card_content">
            <div class="event_card_top">
                <div class="left">
                    <img src="{!!$event->getImageSliderEventPath()!!}">
                </div>
                <div class="right">
                    <div class="item about">
                        <div class="form_item">
                            <label for="name" class="">{!! trans('event_form.Name') !!}</label>
                            <input class="" id="name" type="text" name="name" value="{{$event->name}}" placeholder="Nom " readonly>
                        </div>
                        <div class="form_item">
                            <label for="customer" class="">{!! trans('event_form.customerStaff') !!}</label>
                            <input class="" type="text" id="customer" name="customer" value="{{$event->customer}}" placeholder="Client" readonly>
                        </div>

                        <div class="form_item localization_info">
                            <label for="location" class="">{!! trans('event_form.location') !!}</label>
                            <input class="" type="text" id="location" name="location_event" value="{{$event->location_event}}" placeholder="Adresse " readonly>
                        </div>

                        <div class="form_item item_footer localization_info">
                            <div class="zip_item">
                                <label for="zip" class="label_create_event prv_postal_responsive">{!! trans('event_form.Postal_code') !!}</label>
                                <input class="" id="country" name="zip" value="{{ $event->zip_event}}" placeholder="code Postal" readonly>
                            </div>

                            <div class="country_item">
                                <label for="country" class="label_create_event prv_postal_responsive">Province</label>
                                <input class="" id="country" name="country_event" value="{{$event->country_event}}" placeholder="  ---  " readonly autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="item description">
                        <div class="description_heading">
                            <div class="item">
                                <img class="left_drop_cage" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdown cage">
                                <span class="text">{{$event->zone_event}}</span>
                            </div>
                            <div class="item duration">
                                <img class="left_drop_cage" src="{!! url('img/icones_creations/date.svg') !!}" alt="icone dropdown cage">
                                <span class="text">{{showDateEvent($event->start_date, $event->end_date)}}</span>
                            </div>
                        </div>
                        <div class="event_description">
                            <div class="description_head">
                                <img class="" src="{!! url('img/icones_creations/descripion_text.svg') !!}" alt="icone dropdown cage">
                                <span class="text">{!! trans('event_form.event_description') !!}</span>
                            </div>
                            <div class="description_brief">
                                <p class="text_brief">{{$event->description_fr_event}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="event_card_middle">
                <div class="section_title">
                    <span>{!! trans('event_form.jobOffer') !!}</span>
                </div>
                <div class="remuneration">
                    <span>{!! trans('event_form.jobRemuneration') !!}</span><span class="amount">&nbsp;{{ calculRemunerationEvent($event) }}$</span>
                </div>
            </div>
                @foreach($event->eventStaffs as $eventstaff)
                <div class="event_card_bottom">
                    <div class="left_item">
                        <div class="left">
                            <div class="item">
                                <img class="" src="{!!url('img/icones_creations/poste.svg')!!}" alt="icone dropdowne cage">
                                <span class="text">{{$eventstaff->post}}</span>
                            </div>
                            <div class="item">
                                <img class="" src="{!! url('img/icones_creations/employed.svg') !!}" alt="icone dropdowne cage">
                                <span class="text">{{$eventstaff->necessary_staff}}</span>
                            </div>
                            <div class="form_item localization_info">
                                <label for="location" class="">{!! trans('event_form.location') !!}</label>
                                <input class="" type="text" id="location" name="location_event" value="{{$eventstaff->location_event_staff}}" placeholder="Adresse " readonly>
                            </div>

                            <div class="form_item item_footer localization_info">
                                <div class="zip_item">
                                    <label for="zip" class="label_create_event prv_postal_responsive">{!! trans('event_form.Postal_code') !!}</label>
                                    <input class="" id="country" name="zip" value="{{$eventstaff->zip_event_staff}}" placeholder="code Postal" readonly>
                                </div>

                                <div class="country_item">
                                    <label for="country" class="label_create_event prv_postal_responsive">Province</label>
                                    <input class="" id="country" name="country_event" value="{{$eventstaff->country_event_staff}}" placeholder="  ---  " readonly autocomplete="off">
                                </div>
                            </div>
                        </div>

                        <div class="right">
                            <div class="description_heading">
                                <div class="item place_item">
                                    <img class="" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdown cage">
                                    <label class="place text">{{$eventstaff->zone_event_staff}}</label>
                                </div>
                                <div class="item hourly_rate_item">
                                    <img class="" src="{!!url('img/icones_creations/taux_horaire.svg')!!}" alt="icone dropdowne cage">
                                    <label class="text">{{showHourlyRate($eventstaff->hour_rate)}}</label>                                
                                </div>
                                <div class="item deplacement_cost_item">
                                    <img class="" src="{!! url('img/icones_creations/$_km.svg') !!}" alt="icone dropdown cage">
                                    <label class="text">$/km</label>
                                    <span class="value text">{{$eventstaff->distance}}</span>
                                </div>
                                <div class="item per_diem_item">
                                    <img class="" src="{!!url('img/icones_creations/per_diem.svg')!!}" alt="icone dropdown cage">
                                    <label class="text">Per Diem</label>
                                    <span class="value text">{{showPerDiem($eventstaff->per_diem)}}</span>
                                </div>
                            </div>

                            <div class="post_description">
                                <div class="description_head">
                                    <img class="" src="{!!url('img/icones_creations/descripion_text.svg')!!}" alt="icone dropdown cage">
                                    <span class="text">{!!trans('event_form.Job_specification')!!}</span>
                                </div>
                                <div class="description_brief">
                                    <p class="text_brief">{{$eventstaff->description_fr_event_staff}}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="dates">
                        <div class="header_dates">
                            <img class="" src="{!!url('img/icones_creations/date.svg')!!}" alt="icone dropdown cage">                
                            <label class="text">Dates &amp; {!!trans('event_form.schedule')!!}</label>
                        </div>                
                        <div class="date_list">
                            @if($eventstaff->eventStaffDates)
                                @foreach($eventstaff->eventStaffDates as $eventStaffDate)
                                    <div class="item">
                                        <span class="puce"></span>
                                        <div class="date_content">
                                            <span class="day">{{showDateEventStaff($eventStaffDate->date_start)}}</span>
                                            <span class="separator"></span>
                                            <span class="time">{{showHoursEventStaff($eventStaffDate->start_hour_event_staff_date, $eventStaffDate->end_hour_event_staff_date)}}</span>
                                        </div>
                                    </div>
                                @endforeach
                            @endif                          
                        </div>
                    </div>
                </div>
                @endforeach
        </div>
    </div>
@endif