@if($event)
<div class="content_event_form content">
    <div class="create_event">
        <input type="hidden"  value="true" class="boolean">
        <input type="hidden" class="trueOrFalse" value="0">
        <form  id="regFormUpdateEvent" method="post"  enctype="multipart/form-data">
        <input type="hidden" name="id_event" class="id_event" value="{{ $event->id }}"/>
        <div class="content_event_form_future_event">
            <div class="content_event_form">
                <input type="hidden"  value="true" class="boolean">
                <div class="content_pages_event_form">
                    <section class="create_event_title">
                        <div class="content_step_profil">
                            <div class="step_modify_profil">
                                <label class="modify">{!! trans('event_form_future.Event_sheet') !!}</label>
                                <img src=" {!! url('img/input_icons/roue.svg') !!}" class="img_roue">
                            </div>
                        </div>
                    </section>
                    <!--  -*****************************Créer Votre évènement****************************- -->
                    <div class="content_create_event">
                        <div class="photo_event_content">
                            <div class="photo_creat_event">
                                <label class="title_creat">{!! trans('event_form_future.Add_a_picture') !!}</label>
                                <div class="icon_creat_event">
                                    <label class="icon_plus_event_form icone_modify_photo" for="portrait">
                                      <img class="" src="{!! url('img/input_icons/refrech.svg') !!}">
                                    </label>
                                    <div class="icon_creat">
                                        <img id="img_event" class="final_image img_event" src="{!! $event->getImageSliderEventPath() !!}">
                                    </div>
                                </div>
                                <small class="title_footer_creat_event">{!! trans('event_form_future.Browse_your') !!}
                                    <label class="file_link" for="portrait">{!! trans('event_form_future.files') !!}</label>
                                    <input type="file" class="input_hidden" name="portrait" value="{{ $event->picture_event }}" id="portrait">
                                </small>
                            </div>
                        </div>
                        <!-- <div class="empty_div"></div> -->
                        <div class="content_form_creat_event">
                            <div class="form_creat_event">
                                <div class="form_item_create_event">
                                    <label for="name" class="label_create_event">{!! trans('event_form_future.Name') !!}</label>
                                    <input class="input_create_event" type="text" name="name_event" id="name" value="{{ $event->name }}" placeholder="Nom">
                                    <!-- <label  class="error is_hidden">{!! trans('event_form_future.field_text') !!}</label> -->
                                </div>
                                <div class="form_item_create_event">
                                    <label for="customer" class="label_create_event">{!! trans('event_form_future.Customer') !!}</label>
                                    <input class="input_create_event" type="text" name="customer" id="customer" value="{{ $event->customer }}" placeholder="Nom Client">
                                </div>

                                <div class="form_item_drop_user">
                                    <label for="gestionary_event" class="label_drop_user">{!! trans('event_form_future.Event_managed') !!}</label>
                                    <input class="input_create_event input_drop_user input_drop_user_update" id="gestionary_event" name="gestionary_event" value="@foreach($event->managedBy as $manages){{fullName($manages->last_name, $manages->first_name)}}, @endforeach" placeholder="  ---  " readonly autocomplete="off">
                                    <span class="icon_input_create_event">
                                        <svg fill="#707070" height="24" viewBox="0 0 24 24" width="18">
                                            <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z"></path>
                                            <path d="M0-.75h24v24H0z" fill="none"></path>
                                        </svg>
                                    </span>
                                    <input type="hidden" name="id_users" id="" class="input_id_user input_id_user_update" value="@foreach($event->managedBy as $manageds){{$manageds->id}},@endforeach">
                                    <ul class="dropdown_login dropdown_users dropdownScroll is_hidden" id="dropdown_users_manage">
                                        @foreach(Auth::user()->agency->first()->users as $user)
                                        <li>
                                            <div class="icone_name_users">
                                                <div class="avatar">
                                                    <!-- <img src="{!! Auth::user()->agency->first()->getImageProfilPath() !!}" alt=""> -->
                                                    <div class="content_first_letter background_first_letter">
                                                        <label for="" class="color_first_letter first_letter_small">{{$user->first_name[0]}}</label>
                                                    </div>

                                                </div>
                                                <label for="name" data-id="{{$user->id}}" class="name_users_update">{{fullName($user->last_name, $user->first_name)}}</label>
                                            </div>
                                            <label class="checkbox_users_update {{ (Auth::user()->id == $user->id) ? 'active priory' : '' }}"></label>
                                        </li>
                                        @endforeach
                                    </ul>

                                    <!-- <label  class="error is_hidden error_gestionnary_event">{!! trans('event_form_future.field_text') !!}</label> -->
                                </div>
                                <div class="form_item_create_event">
                                    <label for="location_event" class="label_create_event emplacement">{!! trans('event_form_future.location') !!}</label>
                                    <input class="input_create_event" type="text" name="location_event" id="location_event" value="{{ $event->location_event }}" placeholder="Rue Adresse">
                                    <!-- <label  class="error is_hidden">{!! trans('event_form_future.field_text') !!}</label> -->
                                </div>

                                <div class="form_item_create_event_footer form_item_create_event_footer_responsive form_item_creat_event_footer_new">
                                    <div class="form_item_create_event event_form_code_postal">
                                        <label for="zip_event" class="label_create_event ">{!! trans('event_form_future.Postal_code') !!}
                                             <input class="input_code_postal " name="zip_event" value="{{ $event->zip_event}}" placeholder="Code postal" id="zip_event" maxlength="7">
                                        </label>
                                        <!-- <label  class="error is_hidden">{!! trans('event_form_future.field_text') !!}</label> -->
                                    </div>
                                    <!-- <div class="empty_div_dropdown_new"></div> -->
                                    <div class="form_item dropdown_create_event event_form_province">
                                        <label for="country" class="label_create_event ">{!! trans('event_form_future.province') !!}</label>
                                        <div class="dropdown-menu">
                                            <span class="span_dropdown code_postal_drop" >

                                                <input class="input_dropdown_create_event svg_dropdown_create_event" id="country" name="country_event" value="{{ $event->country_event }}" placeholder="  ---  " readonly autocomplete="off">

                                                <span class="icon_input_create_event_pro">
                                                    <svg fill="#707070" height="24" viewBox="0 0 24 24" width="18">
                                                        <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z"></path>
                                                        <path d="M0-.75h24v24H0z" fill="none"></path>
                                                    </svg>
                                                </span>
                                            </span>
                                            <ul class="dropdown_large dropdown drop_creat_two dropdownScroll province_agency" data-input="province_agency">
                                                <li>{!! trans('province.quebec') !!}</li>
                                                <li>{!! trans('province.ontario') !!}</li>
                                                <li>{!! trans('province.british_colombia') !!}</li>
                                                <li>{!! trans('province.alberta') !!}</li>
                                                <li>{!! trans('province.saskatchewan') !!}</li>
                                                <li>{!! trans('province.manitoba') !!}</li>
                                                <li>{!! trans('province.newfoundland_and_labrador') !!}</li>
                                                <li>{!! trans('province.new_brunswick') !!}</li>
                                                <li>{!! trans('province.nova_scotia') !!}</li>
                                                <li>{!! trans('province.prince_edward_island') !!}</li>
                                                <li>{!! trans('province.northwest_territories') !!}</li>
                                                <li>{!! trans('province.nuvanut') !!}</li>
                                                <li>{!! trans('province.yukon') !!}</li>
                                            </ul>
                                        </div>
                                        <!-- <label  class="error is_hidden">{!! trans('event_form_future.field_text') !!}</label> -->
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
                                                <img class="icones_dropdown_cage left_drop_cage" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdowne cage">
                                                <input class="text_dropdown_cage " type="text" id="zone" name="zone_event" placeholder="Choisir une zone" readonly value="{{ $event->zone_event }}">
                                                <div class="line_separator_dropdown separate_icones line_separator_responsive_two">
                                                    <img class="image_dropdown_cage" src="{!! url('img/input_icons/down-arrow.png')!!}" alt="icone dropdowne cage">
                                                </div>
                                                <ul class="dropdown_large dropdown drop_creat_new post_staff dropdownScroll">
                                                    @if(count($mobilities)>0)
                                                        @foreach($mobilities as $mobility)
                                                          <?php $translation = $mobility->getByLanguageId(getLanguageId()); ?>
                                                            <li data-zoneIdStaff="{!! $translation->mobility_id !!}" class="zoneStaff">{!! $translation->name !!}</li>
                                                        @endforeach
                                                    @endif
                                                </ul>
                                            </div>
                                            <input type="text" name="mobilityIdStaff" class="input_mobilityIdStaff is_hidden" value="{{ $event->eventMobility->first()->id }}">
                                        </div>
                                        <div class="dropdown_cage dropdown_cage_heading">
                                            <img class="icones_dropdown_cage left_drop_cage" src="{!! url('img/icones_creations/date.svg') !!}" alt="icone dropdowne cage">
                                            <input class="text_dropdown_cage date_event" id="start_date" type="text" name="start_date" placeholder="Dates" readonly value="{{showDateEvent($event->start_date, $event->end_date)}}">
                                            <input type="hidden" name="start" id="start" value="{{ $event->start_date }}">
                                            <input type="hidden" name="end" id="end" value="{{ $event->end_date }}">
                                            <div class="line_separator_dropdown separate_icones date_icone_down">
                                                <img class="image_dropdown_cage" src="{!! url('img/input_icons/down-arrow.png') !!}" alt="icone dropdowne cage">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="description_event">
                                    <div class="text_description">
                                        <img class="icones_agency" src="{!! url('img/icones_creations/descripion_text.svg') !!}" alt="icone dropdowne cage">
                                        <span class="heading_text_description">{!! trans('event_form_future.event_description') !!}</span>
                                    </div>
                                    <div class="text_description_brief">
                                        <textarea class="text_brief_new" name="event_description_fr" placeholder="Tapez votre message ici" id="event_description_fr">{{ $event->description_fr_event }}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- *****************end description_event_text HelloStaff*********************** -->
                    </div>

                    <!-- *******************end description HelloStaff************************ -->
                    <!-- Add Full Calendar HelloStaff -->
                    <section class="container_fullcalendar" data-all_events="{{ route('get_all_events') }}">
                        <div class="">
                            <div id='calendar'> </div>
                        </div>
                    </section>
                    <!-- End Add Full Calendar HelloStaff -->
                    <!-- Staff Necessaire -->
                    @foreach($event->eventStaffs as $key => $eventStaff)
                    <section class="staff_necessary_update" data-indice="{{$key+1}}" >
                        <section class="create_event_title">
                            <input type="hidden" name="idEventStaff[{{$key}}]" value="{{ $eventStaff->id }}">
                            <div class="content_step_profil">
                                <div class="step_modify_profil">
                                    <label class="modify">{!! trans('event_form_future.Staff_Required') !!}</label>
                                    <img src=" {!! url('img/input_icons/roue.svg') !!}" class="img_roue">
                                </div>
                            </div>
                        </section>
                        <div class="content_staff_necessary content_staff_necessary_event_form">
                            <div class="content_first_divider">
                               <div class="form_item dropdown_cage separate_dropdown_cage dropdown_cage_responsive">
                                    <div class="dropdown-menu">
                                        <div  class="drop">
                                            <img class="icones_dropdown_cage" src=" {!! url('img/icones_creations/poste.svg') !!}" alt="icone dropdowne cage">
                                            <input class="text_dropdown_cage post" type="text" name="post[{{$key}}]" placeholder="Postes" readonly value="{{ $eventStaff->post }}">
                                            <div class="separator_two separate_icones">
                                                <img class="image_dropdown_cage" src=" {!! url('img/input_icons/down-arrow.png') !!}" alt="icone dropdowne cage">
                                            </div>
                                        </div>
                                        <ul class="dropdown_large dropdown drop_creat_new post_staff dropdownScroll" data-input="post_staff">
                                        @if(count($jobs)>0)
                                            @foreach($jobs as $job)
                                                <?php $translation = $job->getByLanguageId(getLanguageId()); ?>
                                                <li data-jobIdStaff="{!! $translation->job_id !!}" class="postStaff">{{ $translation->name }}</li>
                                            @endforeach
                                        @endif
                                        </ul>
                                    </div>
                                    <input type="text" name="jobIdStaff[{{$key}}]" class="input_jobIdStaff is_hidden" value="{{ $eventStaff->eventStaffJobs->first()->id }}">
                                </div>

                                <div class="form_item dropdown_cage separate_dropdown_cage dropdown_cage_responsive">
                                    <div class="dropdown-menu">
                                        <div class="drop">
                                            <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/employed.svg') !!}" alt="icone dropdowne cage">
                                            <input class="text_dropdown_cage necessary staff_needed necessary_staff" type="text" name="necessary_staff[{{$key}}]" placeholder="Employés necessaires" value="{{ $eventStaff->necessary_staff }}">
                                            <div class="separator_two separate_icones">
                                                <img class="image_dropdown_cage" src="{!! url('img/input_icons/down-arrow.png')!!}" alt="icone dropdowne cage">
                                            </div>
                                        </div>
                                        <ul class="dropdown_large dropdown drop_creat_new necessary" data-input="necessary" >
                                            <li>1</li>
                                            <li>2</li>
                                            <li>3</li>
                                            <li>4</li>
                                            <li>5</li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="form_item_create_event separator_form">
                                    <label class="label_create_event">{!! trans('event_form_future.location') !!}</label>
                                    <input class="input_create_event emplacement" type="text" name="location_event_staff[{{$key}}]" id="emplacement" value="{{ $eventStaff->location_event_staff }}" placeholder="Adresse">
                                    <!-- <label  class="error is_hidden">{!! trans('event_form_future.field_text') !!}</label> -->
                                </div>
                                <div class="form_item_create_event_footer form_item_create_event_footer_responsive">

                                    <div class="form_item_create_event">
                                        <label class="label_create_event ">{!! trans('event_form_future.Postal_code') !!}

                                            <input class="input_code_postal postal" name="zip_event_staff[{{$key}}]" value="{{ $eventStaff->zip_event_staff }}" placeholder="Code postal">
                                        </label>
                                        <!-- <label  class="error is_hidden">{!! trans('event_form_future.field_text') !!}</label> -->
                                    </div>
                                    <!-- <div class="empty_div_dropdown"></div> -->
                                    <div class="form_item dropdown_create_event">
                                        <label class="labedropdown_largel_create_event">{!! trans('event_form_future.province') !!}</label>
                                        <div class="dropdown-menu">
                                            <span class="drop_one" >
                                              <!-- class a input:input_dropdown_create_event svg_dropdown_create_event province_staff province_staff_width country_staff -->
                                                <input class="input_dropdown_create_event svg_dropdown_create_event province_staff province_staff_width prv_postal_responsive_two input_create_dropdwon_resp_two" name="country_event_staff[{{$key}}]" value="{{ $eventStaff->country_event_staff }}" placeholder="  ---  " readonly>
                                                <span class="icon_input_create_event_pro icon_input_creat_event_responsive">
                                                    <svg fill="#707070" height="24" viewBox="0 0 24 24" width="18">
                                                        <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z"></path>
                                                        <path d="M0-.75h24v24H0z" fill="none"></path>
                                                    </svg>
                                                </span>
                                            </span>

                                            <ul class="dropdown_large dropdown specify_modif_drop_province drop_creat_two dropdownScroll province dropdownScroll" data-input="province">
                                                <li>{!! trans('province.quebec') !!}</li>
                                                <li>{!! trans('province.ontario') !!}</li>
                                                <li>{!! trans('province.british_colombia') !!}</li>
                                                <li>{!! trans('province.alberta') !!}</li>
                                                <li>{!! trans('province.saskatchewan') !!}</li>
                                                <li>{!! trans('province.manitoba') !!}</li>
                                                <li>{!! trans('province.newfoundland_and_labrador') !!}</li>
                                                <li>{!! trans('province.new_brunswick') !!}</li>
                                                <li>{!! trans('province.nova_scotia') !!}</li>
                                                <li>{!! trans('province.prince_edward_island') !!}</li>
                                                <li>{!! trans('province.northwest_territories') !!}</li>
                                                <li>{!! trans('province.nuvanut') !!}</li>
                                                <li>{!! trans('province.yukon') !!}</li>
                                            </ul>
                                        </div>
                                        <!-- <label  class="error is_hidden">{!! trans('event_form_future.field_text') !!}</label> -->
                                    </div>
                                </div>
                            </div>
                            <div class="content_second_divider">
                                <div class="first_content_description">
                                    <div class="first_content_description_heading">
                                        <!-- <div class="form_item dropdown_cage small_cage dropdown_cage_responsive">
                                            <div class="dropdown-menu">
                                                <div class="center_staff">
                                                    <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/taux_horaire.svg')!!}" alt="icone dropdowne cage">
                                                    <input class="text_dropdown_cage hour_rate" type="text" name="hour_rate[{{$key}}]" placeholder="Taux horaires" readonly value="{{ $eventStaff->hour_rate }}">
                                                    <div class="line_separator_dropdown_two separate_icones line_separator_responsive_one">
                                                        <img class="image_dropdown_cage img_two" src="{!! url('img/input_icons/down-arrow.png')!!}" alt="icone dropdowne cage">
                                                    </div>
                                                    <ul class="dropdown_large dropdown post_staff dropdownScroll hour_rate_dropdown ">
                                                        <li>12$/Hr</li>
                                                        <li>13$/Hr</li>
                                                        <li>14$/Hr</li>
                                                        <li>15$/Hr</li>
                                                        <li>16$/Hr</li>
                                                        <li>17$/Hr</li>
                                                        <li>18$/Hr</li>
                                                        <li>19$/Hr</li>
                                                        <li>20+$/Hr</li>
                                                   </ul>
                                                </div>
                                            </div>
                                        </div> -->
                                        <div class="dropdown_cage small_cage_label dropdown_cage_responsive">
                                            <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/$_km.svg') !!}" alt="icone dropdowne cage">
                                            <label class="text_salaires text_brief">$/Hr</label>
                                            <input class="text_drop_new hour_rate" type="number" name="hour_rate[{{$key}}]" placeholder="|" value="{{ $eventStaff->hour_rate }}">
                                        </div>
                                        <div class="dropdown_cage small_cage_label dropdown_cage_responsive">
                                            <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/$_km.svg') !!}" alt="icone dropdowne cage">
                                            <label class="text_salaires text_brief">$/km</label>
                                            <input class="text_drop_new distance" type="number" name="distance[{{$key}}]" placeholder="|" value="{{ $eventStaff->distance }}">
                                        </div>
                                        <div class="dropdown_cage small_cage_label dropdown_cage_responsive">
                                            <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/per_diem.svg') !!}" alt="icone dropdowne cage">
                                            <label class="text_salaires text_brief">Per Diem</label>
                                            <input class="text_drop_new perdiem" type="number" name="perdiem[{{$key}}]" placeholder="|" value="{{ $eventStaff->per_diem }}">
                                        </div>

                                        <div class="form_item dropdown_cage small_cage dropdown_cage_responsive">
                                            <div class="dropdown-menu">
                                                <div class="center_staff">
                                                    <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdowne cage">
                                                    <input class="text_dropdown_cage zone_event_staff" type="text" name="zone_event_staff[{{$key}}]" placeholder="Choisir une zone" readonly value="{{ $eventStaff->zone_event_staff }}">
                                                    <div class="line_separator_dropdown_two separate_icones">
                                                        <img class="image_dropdown_cage" src="{!! url('img/input_icons/down-arrow.png') !!}" alt="icone dropdowne cage">
                                                    </div>
                                                </div>
                                                <ul class="dropdown_large dropdown drop_creat_two specify_modif_drop_city province_staff dropdownScroll" data-input="province_staff">
                                                    @if(count($mobilities)>0)
                                                        @foreach($mobilities as $mobility)
                                                          <?php $translation = $mobility->getByLanguageId(getLanguageId()); ?>
                                                            <li data-zoneIdEventStaff="{!! $translation->mobility_id !!}" class="zoneEventStaff">{!! $translation->name !!}</li>
                                                        @endforeach
                                                    @endif
                                                </ul>
                                            </div>
                                            <input type="text" name="mobilityIdEventStaff[{{$key}}]" class="input_mobilityIdEventStaff is_hidden" value="{{ $eventStaff->eventStaffMobility->first()->id }}">
                                        </div>
                                    </div>
                                </div>
                                <div class="description_staff description_event description_event_staff_responsive">
                                    <div class="text_description">
                                        <img class="icones_agency icon_agency" src="{!! url('img/icones_creations/descripion_text.svg') !!}" alt="icone dropdowne cage">
                                        <span class="heading_text_description text_brief">{!! trans('event_form_future.Job_specification') !!}</span>
                                    </div>
                                    <div class="text_description_brief">
                                        <textarea class="text_brief_new desciption_event_staff" name="description_fr_event_staff[{{$key}}]" placeholder="Tapez votre message ici">{{ $eventStaff->description_fr_event_staff }}</textarea>
                                     </div>
                                 </div>
                            </div>
                            <div class="content_three_divider">
                                <div class="dropdown_cage dropdown_cage_responsive">
                                    <div class="plus_moin">
                                        <table class="table_dates">
                                            <tr class="tr_dates">
                                                <td>
                                                    <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/date.svg') !!}" alt="icone dropdowne cage">
                                                </td>
                                                <td class="td_dates">
                                                   <div class="left_staff">
                                                        <label class="text_salaires text_brief">Dates &amp;{!! trans('event_form_future.schedule') !!}</label>
                                                   </div>
                                                </td>
                                                <td class="padding_plus">
                                                    <div class="">
                                                      <img class="img_plus" src="{!! url('img/input_icons/plus.svg') !!}">
                                                    </div>
                                                </td>
                                                <td class="padding_separator">
                                                    <div class="">|</div>
                                                </td>
                                                <td class="padding_moins">
                                                    <div class="">
                                                        <img  class="show_btn_delete" src="{!! url('img/input_icons/moins.svg') !!}">
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <?php switch($eventStaff->color_event_staff){
                                        case"linear-gradient(231deg, #899ED4, #A389D4)":
                                            $color = "choose_color purple purple-active";
                                            $colorClass = "circle_create_event_purple";
                                            break;
                                        case"linear-gradient(239deg, #1DE9B6, #1DC4E9)":
                                            $color = "choose_color blue_sky blue_sky-active";
                                            $colorClass = "circle_create_event_blue";
                                            break;
                                        case"linear-gradient(60deg, #F44236, #F48F36)":
                                            $color = "choose_color orange orange-active";
                                            $colorClass = "circle_create_event_red";
                                            break;
                                        case"linear-gradient(67deg, #1FA548, #21FFAA)":
                                            $color = "choose_color green green-active";
                                            $colorClass = "circle_create_event_green";
                                            break;
                                        case"linear-gradient(237deg, #48C6EF, #337DE2)":
                                            $color = "choose_color blue blue-active";
                                            $colorClass = "circle_create_event_blue_fonce";
                                            break;
                                        default:
                                            $color = "choose_color blue blue-active";
                                            $colorClass = "circle_create_event_blue_fonce";
                                            break;
                                }?>
                                <div class="decription_table_event_form">
                                    <table class="description_event_tab">
                                        @foreach($eventStaff->eventStaffDates as $keyStaffDate => $eventStaffDate)
                                        <tr class="date_horaire_create_event" style="display: flex; margin-top: 2rem;">
                                            <td>
                                                <div data-attr="color" class="{{$colorClass}}">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="date_create_event">
                                                    <input type="hidden" name="idEventStaffDate[{{$key}}][]" value="{{ $eventStaffDate->id }}" class="idEventStaffDate">
                                                    <label class="text_brief opacity_two date_staff">{{showDateEventStaff($eventStaffDate->date_start)}}</label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="horaire_create_event">
                                                    <label class="text_brief opacity_two hour_staff">
                                                        {{showHoursEventStaff($eventStaffDate->start_hour_event_staff_date, $eventStaffDate->end_hour_event_staff_date)}}
                                                    </label>
                                                    <input type="hidden" name="startDaily[{{$key}}][]" class="startDaily" value="{{ $eventStaffDate->date_start }}">
                                                    <input type="hidden" name="endDaily[{{$key}}][]" class="endDaily" value="{{ $eventStaffDate->date_end }}">
                                                    <input type="hidden" name="startHourDaily[{{$key}}][]" class="startHourDaily" value="{{convertToTwelveHour($eventStaffDate->start_hour_event_staff_date)}}">
                                                    <input type="hidden" name="endHourDaily[{{$key}}][]" class="endHourDaily" value="{{convertToTwelveHour($eventStaffDate->end_hour_event_staff_date)}}">
                                                    <input type="hidden" name="color_tab[{{$key}}][]" class="color_tab" value="{{ $eventStaffDate->color_event_staff_date }}">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="delete_date_hours is_hidden"><i class="fa fa-times"></i></div>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </table>
                                </div>
                            </div>
                            <div class="content_color_bouton content_foot">
                                <div class="content_color">
                                    <label class="choose_label">{!! trans('event_form_future.Choose_color') !!}</label>
                                    <div class="color_choose">
                                         <div class="{{ ($color == "choose_color purple purple-active")? $color : "choose_color purple"}}" data-color="purple"></div>
                                         <div class="{{ ($color == "choose_color blue_sky blue_sky-active")? $color : "choose_color blue_sky" }}" data-color="blue_sky"></div>
                                         <div class="{{ ($color == "choose_color orange orange-active")? $color : "choose_color orange" }}" data-color="orange"></div>
                                         <div class="{{ ($color == "choose_color green green-active")? $color : "choose_color green" }}" data-color="green"></div>
                                         <div class="{{ ($color == "choose_color blue blue-active")? $color : "choose_color blue" }}" data-color="blue"></div>
                                         <input type="hidden" name="color_choose[{{$key}}]" value="{{$eventStaff->color_event_staff}}" class="input_date choose_color input_color">
                                    </div>
                                </div>
                                <div class="content_bouton">
                                    <button type="button" class="add validate isValid">{!! trans('event_form_future.validate') !!}</button>
                                    <button type="button" class="add delete">{!! trans('event_form_future.delete_post') !!}</button>
                                </div>
                            </div>
                            <div class="create_event_list_btn">
                              <button type="button" class="addition">{!! trans('event_form_future.add_post') !!}</button>
                              <!-- <button type="button" class="delete">{!! trans('event_form_future.delete_post') !!}</button>
                                                          </div> -->
                                <!-- </div>
                                                            </div> -->
                        </div>
                    </section>
                    @endforeach
                    <!-- End Staff Necessaire  -->
                </div>
                <div class="content_bouton_finish">
                    <button type="submit" id="click_me" class="is_hidden">{!! trans('event_form_future.btn_click') !!}</button>
                    <button type="button" class="apply">{!! trans('event_form_future.btn_apply') !!}</button>
                    <button type="button" class="erase">{!! trans('event_form_future.btn_delete') !!}</button>
                </div>
            </div>
        </div>
     </form>
   </div>
</div>
@section('modal')
        @include('modals.agency.create_event.popup_dates')
        @include('modals.agency.create_event.popup_dates_2')
        @include('modals.agency.create_event.modal_event_users')
        @include('modals.agency.staff_confirmed.removing_staff_confirmed')
        @include('modals.agency.create_event.modal_confirm_removing_post')
        @include('modals.agency.future_event.confirm_updating_event')
        @include('modals.agency.future_event.confirm_removing_event')
        @include('modals.agency.future_event.modal_change_future_event')
    @endsection
@endif

