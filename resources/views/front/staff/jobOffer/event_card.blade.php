<div class="event_card_container">
    <div class="section_title">
    	<button class="btn_back go_back_grey">
    	</button>
        <span>{!! trans('event_form.Event_sheet') !!}</span>
    </div>

    <div class="event_card_content">
        <div class="event_card_top">
            <div class="left">
                <img class="imgEvent" src="">
            </div>
            <div class="right">
                <div class="item about">
                    <div class="form_item">
                        <label for="name">{!! trans('event_form.Name') !!}</label>
                        <input class="name_event" id="name" type="text" name="name" value="" placeholder="Nom " readonly>
                    </div>
                    <div class="form_item">
                        <label for="customer" class="">{!! trans('event_form.customerStaff') !!}</label>
                        <input class="customer" type="text" id="customer" name="customer" value="{{-- {{ $event->customer }} --}}" placeholder="Client" readonly>
                    </div>

                    <div class="form_item localization_info">
                        <label for="location" class="">{!! trans('event_form.location') !!}</label>
                        <input class="location" type="text" id="location" name="location_event" value="{{-- {{ $event->location_event }} --}}" placeholder="Adresse " readonly>
                    </div>

                    <div class="form_item item_footer localization_info">
                        <div class="zip_item">
                            <label for="zip" class="label_create_event prv_postal_responsive">{!! trans('event_form.Postal_code') !!}</label>
                            <input class="zip" id="country" name="zip" value="" placeholder="code Postal" readonly>
                        </div>

                        <div class="country_item">
                            <label for="country" class="label_create_event prv_postal_responsive">{!! trans('event_form.province') !!}</label>
                            <input class="country" id="country" name="country_event" value="" placeholder="  ---  " readonly autocomplete="off">
                        </div>
                    </div>
                </div>

                <div class="item description">
                    <div class="description_heading">
                        <div class="item">
                            <img class="left_drop_cage" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdown cage">
                            <span class="zone">zone_event</span>
                        </div>
                        <div class="item duration">
                            <img class="left_drop_cage" src="{!! url('img/icones_creations/date.svg') !!}" alt="icone dropdown cage">
                            <span class="date">From 03/03 - To 03/09</span>
                        </div>
                    </div>
                    <div class="event_description">
                        <div class="description_head">
                            <img class="" src="{!! url('img/icones_creations/descripion_text.svg') !!}" alt="icone dropdown cage">
                            <span class="text">{!! trans('event_form.event_description') !!}</span>
                        </div>
                        <div class="description_brief">
                            <p class="text_brief">description_fr_event</p>
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
                <span>{!! trans('event_form.jobRemuneration') !!}</span><span class="amount">&nbsp;200$</span>
            </div>
        </div>

            <div class="event_card_bottom">
                <div class="left_item">
                    <div class="left">
                        <div class="item">
                            <img class="" src="{!!url('img/icones_creations/poste.svg')!!}" alt="icone dropdowne cage">
                            <span class="text post">post</span>
                        </div>
                        <div class="item">
                            <img class="" src="{!! url('img/icones_creations/employed.svg') !!}" alt="icone dropdowne cage">
                            <span class="text necessary_staff">necessary_staff</span>
                        </div>
                        <div class="form_item localization_info">
                            <label for="location" class="">{!! trans('event_form.location') !!}</label>
                            <input class="location_event_staff" type="text" id="location" name="location_event" value="" placeholder="Adresse " readonly>
                        </div>

                        <div class="form_item item_footer localization_info">
                            <div class="zip_item">
                                <label for="zip" class="label_create_event prv_postal_responsive">{!! trans('event_form.Postal_code') !!}</label>
                                <input class="zip_event_staff" id="country" name="zip" value="" placeholder="code Postal" readonly>
                            </div>

                            <div class="country_item">
                                <label for="country" class="label_create_event prv_postal_responsive">Province</label>
                                <input class="country_event_staff" id="country" name="country_event" value="" placeholder="  ---  " readonly autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="right">
                        <div class="description_heading">
                            <div class="item place_item">
                                <img class="" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdown cage">
                                <label class="place text zone_event_staff">zone_event_staff</label>
                            </div>
                            <div class="item hourly_rate_item">
                                <img class="" src="{!!url('img/icones_creations/taux_horaire.svg')!!}" alt="icone dropdowne cage">
                                <label class="text hourly_rate">0.96</label>
                            </div>
                            <div class="item deplacement_cost_item">
                                <img class="" src="{!!url('img/icones_creations/$_km.svg')!!}" alt="icone dropdown cage">
                                <label class="text">$/km</label>
                                <span class="value text distance">0.96</span>
                            </div>
                            <div class="item per_diem_item">
                                <img class="" src="{!!url('img/icones_creations/per_diem.svg')!!}" alt="icone dropdown cage">
                                <label class="text">Per Diem</label>
                                <span class="value text per_diem">0.96</span>
                            </div>
                        </div>

                        <div class="post_description">
                            <div class="description_head">
                                <img class="" src="{!!url('img/icones_creations/descripion_text.svg')!!}" alt="icone dropdown cage">
                                <span class="text">{!!trans('event_form.Job_specification')!!}</span>
                            </div>
                            <div class="description_brief">
                                <p class="text_brief description_fr_event_staff">description_fr_event_staff</p>
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
                        {{-- @forEach($event_staff->event_staff_dates as $event_staff_date)
                        <div class="item event_staff_date">
                            <span class="puce" style="background-image: {!! $event_staff_date->color_event_staff_date !!};"></span>
                            <div class="date_content">
                                <span class="text day">{!! shortDateFormat($event_staff_date->date_start) !!}</span>
                                <span class="text time"></span>
                            </div>
                        </div>
                        @end --}}
                    </div>
                </div>
            </div>

    </div>
    <div class="submit">
    	<button class="apply_for_job_event" data-index="">{!!trans('event_form.btn_apply')!!}</button>
    </div>
</div>
