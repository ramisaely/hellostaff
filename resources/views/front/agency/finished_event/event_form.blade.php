@if($event)
<div class="content_event_form">
    <div class="create_event">
        <input type="hidden"  value="true" class="boolean">
        <div class="content_pages_event_form">
            <section class="create_event_title">
                <div class="content_step_profil">
                    <div class="step_modify_profil">
                        <label class="modify">{!! trans('event_form.Event_sheet') !!}</label>
                    </div>
                </div>
            </section>

                <!--   ***************************Créer Votre évènement*********************** - -->
                <div class="content_create_event content_fiche_event">
                    <div class="photo_event_content">
                        <div class="photo_creat_event">
                            <!-- <label class="title_creat">{!! trans('event_form.Add_a_picture') !!}</label> -->
                            <div class="icon_creat_event">
                                <div class="icon_creat">
                                    <img id="img_event" class="final_image" src="{!! $event->getImageSliderEventPath() !!}"/>
                                </div>
                            </div>
                            <!-- <small class="title_footer_creat_event">{!! trans('event_form.Browse_your') !!}
                                <label class="file_link" for="portrait">{!! trans('event_form.files') !!}</label>
                                <input type="file" class="input_hidden" name="portrait" value="1" id="portrait" readonly/>
                            </small> -->
                        </div>
                    </div>

                    <!-- <div class="empty_div"></div> -->

                    <div class="content_form_creat_event">
                        <div class="form_creat_event">
                            <div class="form_item_create_event">
                                <label for="name" class="label_drop_user">{!! trans('event_form.Name') !!}</label>
                                <input class="input_create_event input_drop_user" id="name" type="text" name="name" value="{{$event->name}}" placeholder="Nom " readonly/>
                            </div>
                            <div class="form_item_create_event">
                                <label for="customer" class="label_drop_user">{!! trans('event_form.Customer') !!}</label>
                                <input class="input_create_event input_drop_user" type="text" id="customer" name="customer" value="{{$event->customer}}" placeholder="Client" readonly/>
                            </div>

                            <div class="form_item_drop_user">
                                <label for="gestionary_event" class="label_drop_user">{!! trans('event_form.Event_managed') !!}</label>
                                <input class="input_create_event input_drop_user input_drop_user_update" id="" name="gestionary_event" value="@foreach($event->managedBy as $manages){{fullName($manages->last_name, $manages->first_name)}}, @endforeach" placeholder="  ---  " readonly="" autocomplete="off"/>
                                <input type="hidden" name="id_users" id="id_users" class="input_id_user"/>
                            </div>

                            <div class="form_item_drop_user">
                                <label for="location_event" class="label_drop_user">{!! trans('event_form.location') !!}</label>
                                <input class="input_create_event input_drop_user"  type="text" id="location_event" name="location_event" value="{{$event->location_event}}" placeholder="Adresse " readonly/>
                            </div>

                            <div class="form_item_create_event_footer form_item_create_event_footer_responsive form_item_creat_event_footer_new">
                                <div class="form_item_create_event event_form_code_postal">
                                    <!-- <label for="zip_event" class="label_create_event">{!! trans('event_form.Postal_code') !!}</label>
                                    <div class="dropdown-menu-event">
                                        <span class="span_dropdown">
                                            <input class="input_dropdown_create_event svg_dropdown_create_event" id="" name="zip_event" value="{{$event->zip_event}}" placeholder="code Postal" id="zip_event" readonly/>
                                        </span>
                                    </div>
                                    <input type="text" name="mobilityId" class="input_mobilityId is_hidden"/>
                                    <label class="error is_hidden">{!! trans('event_form.field_text') !!}</label> -->

                                    <label for="zip_event" class="label_create_event ">{!! trans('event_form.Postal_code') !!}
                                         <input class="input_code_postal " name="zip_event" value="{{ $event->zip_event}}" placeholder="Code postal" id="zip_event" readonly>
                                    </label>
                                    <label  class="error is_hidden">{!! trans('event_form.field_text') !!}</label>
                                </div>

                                <!-- <div class="empty_div_dropdown_new"></div> -->
                                <div class="form_item dropdown_create_event event_form_province">
                                    <label for="country" class="label_create_event">Province</label>
                                    <div class="dropdown-menu">
                                        <span class="span_dropdown code_postal_drop">

                                            <input class="input_dropdown_create_event svg_dropdown_create_event" id="country" name="country_event" value="{{$event->country_event}}" placeholder="  ---  " readonly="" autocomplete="off"/>
                                        </span>
                                    </div>
                                    <input type="text" name="mobilityId" class="input_mobilityId is_hidden"/>
                                    <label class="error is_hidden">{!! trans('event_form.field_text') !!}</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- <div class="empty_div"></div> -->

                    <!-- *****************start description event HelloStaff******************** -->
                    <div class="content_form_description_event">
                        <div class="content_description_event">
                            <!-- ************************start description_event_heading HelloStaff****************** -->
                            <div class="heading_event dropdown_cage_responsive">
                                <div class="heading_event_two">
                                    <div class="form_item dropdown_cage dropdown_cage_heading">
                                        <div class="dropdown-menu">
                                            <img class="icones_dropdown_cage left_drop_cage" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdowne cage"/>
                                            <input class="text_dropdown_cage" value="{{$event->zone_event}}" type="text" id="zone" name="zone_event" placeholder="Choisir une zone" readonly/>
                                        </div>
                                        <!-- <label  class="error is_hidden">This field is required.</label> -->
                                    </div>
                                    <div class="dropdown_cage dropdown_cage_heading">
                                        <img class="icones_dropdown_cage left_drop_cage" src="{!! url('img/icones_creations/date.svg') !!}" alt="icone dropdowne cage">
                                        <input class="text_dropdown_cage date_event" value="{{showDateEvent($event->start_date, $event->end_date)}}" id="start_date" type="text" name="start_date" placeholder="Dates" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="description_event ">
                                    <div class="text_description">
                                        <img class="icones_agency" src="{!! url('img/icones_creations/descripion_text.svg') !!}" alt="icone dropdowne cage"/>
                                        <span class="heading_text_description">{!! trans('event_form.event_description') !!}</span>
                                    </div>
                                    <div class="text_description_brief">
                                        <textarea class="text_brief_new" name="event_description_fr" placeholder="Tapez votre message ici" id="event_description_fr"> {{$event->description_fr_event}}</textarea>
                                    </div>
                                </div>
                        </div>
                        <!-- *****************end description_event_text HelloStaff*********************** -->
                    </div>
                    <!-- *******************end description HelloStaff************************ -->
                </div>

                <!-- Add Full Calendar HelloStaff -->
                <section class="container_fullcalendar" data-all_events="{{ route('get_all_events') }}">
                    <div class="">
                        <div id='calendar' class="call"> </div>
                    </div>
                </section>
                <!-- End Add Full Calendar HelloStaff -->

                <div class="statement_event_form">
                    <div class="content_step_profil">
                        <div class="step_modify_profil">
                            <label class="modify">{!! trans('event_form.Staff_Required') !!} </label>
                        </div>
                    </div>
                </div>

                <!-- Staff Necessaire -->
                @foreach($event->eventStaffs as $key => $eventstaff)
                    <section class="staff_necessary_update">
                        <div class="content_staff_necessary content_staff_necessary_event_form">
                            <div class="content_first_divider">
                                <div class="form_item dropdown_cage separate_dropdown_cage dropdown_cage_finished dropdown_cage_responsive">
                                    <div class="dropdown-menu">
                                        <div  class="drop">
                                            <img class="icones_dropdown_cage" src=" {!! url('img/icones_creations/poste.svg') !!}" alt="icone dropdowne cage"/>
                                            <input class="text_dropdown_cage post" value="{{$eventstaff->post}}" type="text" name="post[{{$key}}]" placeholder="Postes" readonly/>
                                        </div>
                                        <ul class="dropdown_large dropdown drop_creat_new post_staff" data-input="post_staff"></ul>
                                    </div>
                                </div>
                                <div class="form_item dropdown_cage separate_dropdown_cage dropdown_cage_finished dropdown_cage_responsive">
                                    <div class="dropdown-menu">
                                        <div class="drop">
                                            <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/employed.svg') !!}" alt="icone dropdowne cage"/>
                                            <input class="text_dropdown_cage necessary event_form_input" value="{{$eventstaff->necessary_staff}}" type="text" name="necessary_staff[{{$key}}]" placeholder="Employés necessaires" readonly/>
                                            <!-- <div class="separator_two separate_icones">
                                                <img class="image_dropdown_cage" src="{!! url('img/input_icons/down-arrow.png')!!}" alt="icone dropdowne cage"/>
                                            </div>  -->
                                        </div>
                                    </div>
                                </div>
                                <div class="form_item_create_event separator_form ">
                                    <label class="label_create_event">{!! trans('event_form.location') !!}</label>
                                    <input class="input_create_event emplacement event_form_input_item" type="text" name="location_event_staff[{{$key}}]" id="emplacement" value="{{$eventstaff->location_event_staff}}" placeholder="Adresse" readonly/>
                                </div>
                                <div class="form_item_create_event_footer form_item_create_event_footer_responsive">
                                    <div class="form_item_create_event">
                                        <label class="labedropdown_largel_create_event">{!! trans('event_form.Postal_code') !!}
                                          <input class="input_code_postal postal" name="zip_event_staff[{{$key}}]" value="{{$eventstaff->zip_event_staff}}" placeholder="Code postal" readonly />
                                        </label>
                                    </div>
                                    <!-- <div class="empty_div_dropdown"></div> -->
                                    <div class="form_item dropdown_create_event">
                                        <label class="labedropdown_largel_create_event">Province</label>
                                        <div class="dropdown-menu">
                                            <span class="drop_one" >
                                                <input class="input_dropdown_create_event svg_dropdown_create_event province_staff province_staff_width prv_postal_responsive_two input_create_dropdwon_resp_two" name="country_event_staff[{{$key}}]" value="{{$eventstaff->country_event_staff}}" placeholder="  ---  " readonly id="input_finished"/>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content_second_divider">
                                <div class="first_content_description">
                                    <div class="first_content_description_heading">
                                        <div class="form_item dropdown_cage small_cage">
                                            <div class="dropdown-menu">
                                                <div class="center_staff">
                                                    <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/taux_horaire.svg')!!}" alt="icone dropdowne cage"/>
                                                    <input class="text_dropdown_cage hour_rate" type="text" name="hour_rate[{{$key}}]" value="{{$eventstaff->hour_rate}}" placeholder="Taux horaires" readonly/>
                                                    <label class="text_salaires text_brief">$/Hr</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dropdown_cage small_cage_label drop_responsive">
                                            <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/$_km.svg') !!}" alt="icone dropdowne cage"/>
                                            <label class="text_salaires text_brief">$/km</label>

                                            <input class="text_drop_new distance" value="{{$eventstaff->distance}}" type="text" name="distance[{{$key}}]" placeholder="|" readonly/>
                                        </div>
                                        <div class="dropdown_cage small_cage_label drop_responsive">
                                            <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/per_diem.svg') !!}" alt="icone dropdowne cage"/>
                                            <label class="text_salaires text_brief">Per Diem</label>
                                            <input class="text_drop text_drop_new perdiem" value="{{$eventstaff->per_diem}}" type="text" name="perdiem[{{$key}}]" placeholder="|" readonly/>
                                        </div>

                                        <div class="form_item dropdown_cage small_cage dropdown_cage_responsive">
                                            <div class="dropdown-menu">
                                                <div class="center_staff">
                                                    <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdowne cage"/>
                                                    <input class="text_dropdown_cage zone_event_staff" type="text" name="zone_event_staff[{{$key}}]" value="{{$eventstaff->zone_event_staff}}" placeholder="Choisir une zone" readonly/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="description_staff description_event description_event_responsive">
                                    <div class="text_description">
                                        <img class="icones_agency icon_agency" src="{!! url('img/icones_creations/descripion_text.svg') !!}" alt="icone dropdowne cage"/>
                                        <span class="heading_text_description text_brief">{!!trans('event_form.Job_specification')!!}</span>
                                    </div>
                                    <div class="text_description_brief">
                                        <textarea class="text_brief_new desciption_event_staff" name="description_fr_event_staff[{{$key}}]" placeholder="Tapez votre message ici" readonly>{{$eventstaff->description_fr_event_staff}}</textarea>
                                     </div>
                                 </div>
                            </div>
                            <div class="content_three_divider">
                                <div class="dropdown_cage dropdown_cage_finished_three_divider dropdown_cage_responsive">
                                    <div class="plus_moin">
                                        <table class="table_dates">
                                            <tr class="tr_dates">
                                                <td>
                                                    <img class="icones_dropdown_cage" src="{!!url('img/icones_creations/date.svg')!!}" alt="icone dropdowne cage"/>
                                                </td>
                                                <td class="td_dates">
                                                   <div class="left_staff">
                                                        <label class="text_salaires text_brief">Dates &amp;{!!trans('event_form.schedule')!!}</label>
                                                   </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <?php switch($eventstaff->color_event_staff){
                                    case "linear-gradient(231deg, #899ED4, #A389D4)":
                                        $color = "choose_color purple purple-active";
                                        $date_color = "circle_create_event_purple";
                                        break;
                                    case "linear-gradient(239deg, #1DE9B6, #1DC4E9)":
                                        $color = "choose_color blue_sky blue_sky-active";
                                        $date_color = "circle_create_event_blue";
                                        break;
                                    case "linear-gradient(60deg, #F44236, #F48F36)":
                                        $color = "choose_color orange orange-active";
                                        $date_color = "circle_create_event_red";
                                        break;
                                    case "linear-gradient(67deg, #1FA548, #21FFAA)":
                                        $color = "choose_color green green-active";
                                        $date_color = "circle_create_event_green";
                                        break;
                                    case "linear-gradient(237deg, #48C6EF, #337DE2)":
                                        $color = "choose_color blue blue-active";
                                        $date_color = "circle_create_event_blue_fonce";
                                        break;
                                    default :
                                        $color = "choose_color blue blue-active";
                                        $date_color = "circle_create_event_blue_fonce";
                                        break;
                                }
                                ?>

                                <div class="decription_table_create_event">
                                    <table class="description_event_tab description_event_tab_form">
                                        @foreach($eventstaff->eventStaffDates as $eventStaffDate)
                                            <tr class="date_horaire_create_event" style="display: flex; margin-top: 2rem;">
                                                <td>
                                                    <div data-attr="color" class="{{$date_color}}"></div>
                                                </td>
                                                <td>
                                                    <div class="date_create_event">
                                                        <label class="text_brief opacity_two">{{showDateEventStaff($eventStaffDate->date_start)}}</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="horaire_create_event">
                                                        <label class="text_brief opacity_two">{{showHoursEventStaff($eventStaffDate->start_hour_event_staff_date, $eventStaffDate->end_hour_event_staff_date)}}</label>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </table>
                                </div>
                            </div>
                        </div>
                    </section>
                @endforeach
                <!-- End Staff Necessaire  -->
        </div>
    </div>
</div>
@endif
