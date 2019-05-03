<!--   ***************************Créer Votre évènement*********************** - -->
<div class="create_event ">
    <input type="hidden"  value="true" class="boolean">
    <section class="create_event_title">
        <div class="header_create_event header_create_event_one">
            <div class="number_step_head">
                <label class="number_title police_number">1</label>
            </div>
            <div class="title_step">
                <label class="title_h2">{!! trans('create_event.title_create') !!}</label>
            </div>
            <div class="line_divider"></div>
        </div>
    </section>
    <!--  -*****************************End Créer Votre évènement****************************- -->
    <div class="content_create_event">
        <div class="photo_event_content">
            <div class="photo_creat_event">
                <label class="title_creat">{!! trans('create_event.add_picture') !!}</label>
                <div class="icon_creat_event">
                    <label class="icon_plus_creat_event" for="portrait">
                      <img class="" src="{!! url('img/icones_creations/create_event_green.svg') !!}">
                    </label>
                    <div class="icon_creat">
                       <img id="img_event" class="initial_image" src="{!! url('img/photo-camera.svg') !!}">
                    </div>
                </div>
                <small class="title_footer_creat_event">{!! trans('create_event.upload') !!}
                    <label class="file_link" for="portrait">{!! trans('create_event.file') !!}</label>
                    <input type="file" class="input_hidden" name="portrait" value="1" id="portrait" autocomplete="off">
                </small>
            </div>
        </div>

        <!-- <div class="empty_div"></div> -->
        <div class="content_form_creat_event">
            <div class="form_creat_event">
  			    <div class="form_item_create_event">
    			    <label for="name" class="label_create_event">{!! trans('create_event.name') !!}</label>
    			    <input class="input_create_event" type="text" name="name" id="name" value=""  autocomplete="off">
    			    <!-- <label  class="error is_hidden">{!! trans('create_event.field_text') !!}</label> -->
      	        </div>
    	        <div class="form_item_create_event">
        			<label for="customer" class="label_create_event">{!! trans('create_event.client') !!}</label>
        			<input class="input_create_event" type="text" name="customer" id="customer" value="" placeholder="" autocomplete="off"> </div>

                <div class="form_item_drop_user">
                    <label for="gestionary_event" class="label_drop_user">{!! trans('create_event.managed_by') !!}</label>
                    <input class="input_create_event input_drop_user" id="gestionary_event" name="gestionary_event" value="{{fullName(Auth::user()->last_name, Auth::user()->first_name)}}" placeholder="  ---  " readonly autocomplete="off">
                    <span class="icon_input_create_event">
                        <svg fill="#707070" height="24" viewBox="0 0 24 24" width="18">
                            <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z"></path>
                            <path d="M0-.75h24v24H0z" fill="none"></path>
                        </svg>
                    </span>
                    <input type="hidden" name="id_users" id="id_users" value="{{Auth::user()->id}}" class="input_id_user" autocomplete="off">
                    <ul class="dropdown_login dropdown_users dropdownScroll is_hidden" id="dropdown_users_manage">
                        @foreach(Auth::user()->agency->first()->users as $user)
                            <li>
                                <div class="icone_name_users">
                                    <div class="avatar border_first_letter">
                                        <!-- <img src="" alt=""> -->
                                        <div class="content_first_letter background_first_letter">
                                            <label for="" class="color_first_letter first_letter_small">{{$user->last_name[0]}}</label>
                                        </div>
                                    </div>
                                    <label for="name" data-id="{{$user->id}} " class="name_users">{{fullName($user->last_name, $user->first_name)}}</label>
                                </div>
                                <label class="checkbox_users {{ (Auth::user()->id == $user->id) ? 'active priory' : '' }}"></label>
                            </li>
                        @endforeach
                    </ul>

                    <!-- <label  class="error is_hidden error_gestionnary_event">{!! trans('create_event.field_text') !!}</label> -->
                </div>
    	        <div class="form_item_create_event">
          			<label for="location_event" class="label_create_event">{!! trans('create_event.location') !!}</label>
          			<input class="input_create_event" type="text" name="location_event" id="location_event" value="" placeholder="{!! trans('create_event.address') !!}" autocomplete="off">
    	            <!-- <label  class="error is_hidden">{!! trans('create_event.field_text') !!}</label> -->
    	        </div>

	            <div class="form_item_create_event_footer">
                    <div class="form_item_create_event">
                        <label for="zip_event" class="label_create_event code_postal_responsive">{!! trans('create_event.postal_code') !!}
                             <input class="input_code_postal" name="zip_event" value="" id="zip_event" maxlength="7" autocomplete="off">
                        </label>
                        <!-- <label  class="error is_hidden">{!! trans('create_event.field_text') !!}</label> -->
                    </div>
                    <!-- <div class="empty_div_dropdown_new"></div> -->
                    <div class="form_item dropdown_create_event">
                        <label for="country" class="label_create_event prv_postal_responsive">{!! trans('create_event.province') !!}</label>
                        <div class="dropdown-menu-event">
                            <span class="span_dropdown" >
                                <input class="input_dropdown_create_event svg_dropdown_create_event input_create_dropdwon_resp_one" id="country" name="country_event" value="" placeholder="  ---  " readonly autocomplete="off">
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
                        <input type="text" name="mobilityId" class="input_mobilityId is_hidden" autocomplete="off">
                        <!-- <label  class="error is_hidden">{!! trans('create_event.field_text') !!}</label> -->
            		</div>
    			</div>
            </div>
        </div>
        <!-- <div class="empty_div"></div> -->
        <!-- *****************start description event HelloStaff******************** -->
        <div class="content_form_description_event">
            <div class="content_description_event">
                 <!-- ************************start description_event_heading HelloStaff****************** -->
                <div class="heading_event">
                    <div class="heading_event_two">
                        <div class="form_item dropdown_cage dropdown_cage_heading">
                            <div class="dropdown-menu">
                                <img class="icones_dropdown_cage left_drop_cage" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdowne cage">
                                <input class="text_dropdown_cage" type="text" id="zone" name="zone_event" placeholder="{!! trans('create_event.choose_zone') !!}" readonly autocomplete="off">
                                <div class="line_separator_dropdown separate_icones line_separator_responsive_heading">
                                    <img class="image_dropdown_cage" src="{!! url('img/input_icons/down-arrow.png')!!}" alt="icone dropdowne cage">
                                </div>
                                <ul class="dropdown_large dropdown drop_creat_new post_staff dropdown_large_two dropdownScroll">
                                    @if(count($mobilities)>0)
                                        @foreach($mobilities as $mobility)
                                          <?php $translation = $mobility->getByLanguageId(getLanguageId()); ?>
                                            <li data-zoneIdStaff="{!! $translation->mobility_id !!}" class="zoneStaff">{!! $translation->name !!}</li>
                                        @endforeach
                                    @endif
                                </ul>
                            </div>
                            <input type="text" name="mobilityIdStaff[0]" class="input_mobilityIdStaff is_hidden" autocomplete="off">
                            <!-- <label  class="error is_hidden">This field is required.</label> -->
                        </div>
                        <div class="dropdown_cage dropdown_cage_heading">
                            <img class="icones_dropdown_cage left_drop_cage" src="{!! url('img/icones_creations/date.svg') !!}" alt="icone dropdowne cage">
                            <input class="text_dropdown_cage date_event" id="start_date" type="text" name="start_date" placeholder="Dates" readonly autocomplete="off">
                            <input type="hidden" name="start" id="start">
                            <input type="hidden" name="end" id="end">
                            <div class="line_separator_dropdown separate_icones date_icone_down line_responsive">
                                <img class="image_dropdown_cage" src="{!! url('img/input_icons/down-arrow.png') !!}" alt="icone dropdowne cage">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="description_event ">
                        <div class="text_description">
                            <img class="icones_agency" src="{!! url('img/icones_creations/descripion_text.svg') !!}" alt="icone dropdowne cage">
                            <span class="heading_text_description">{!! trans('create_event.description') !!}</span>
                        </div>
                        <div class="text_description_brief">
                            <textarea class="text_brief_new" name="event_description_fr" placeholder="{!! trans('create_event.description_text') !!}" id="event_description_fr" autocomplete="off"></textarea>
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
            <div id='calendar'></div>
        </div>
    </section>
    <!-- End Add Full Calendar HelloStaff -->

    <!-- Staff Necessaire -->
    <section class="staff_necessary">
        <div class="header_create_event header_create_event_two">
            <div class="number_step_head">
                <label class="number_title police_number">2</label>
            </div>
            <div class="title_step">
                <label class="title_h2">{!! trans('create_event.title_staff') !!}</label>
            </div>
            <div class="line_divider"></div>
        </div>
        <div class="content_staff_necessary">
            <div class="content_first_divider">

                <div class="form_item dropdown_cage separate_dropdown_cage">
                    <div class="dropdown-menu">
                        <div  class="drop">
                            <img class="icones_dropdown_cage" src=" {!! url('img/icones_creations/poste.svg') !!}" alt="icone dropdowne cage">
                            <input class="text_dropdown_cage post" type="text" name="post[0]" placeholder="{!! trans('create_event.post') !!}" data-previous_val="" readonly autocomplete="off">
                            <div class="separator_two separate_icones">
                                <img class="image_dropdown_cage" src=" {!! url('img/input_icons/down-arrow.png') !!}" alt="icone dropdowne cage">
                            </div>
                        </div>
                        <ul class="dropdown_large dropdown drop_creat_new post_staff dropdown_large_one dropdownScroll" data-input="post_staff">
                            @if(count($jobs)>0)
                                @foreach($jobs as $job)
                                    <?php $translation = $job->getByLanguageId(getLanguageId()); ?>
                                    <li data-jobIdStaff="{!! $translation->job_id !!}" class="postStaff">{!! $translation->name !!}</li>
                                @endforeach
                            @endif
                        </ul>
                    </div>
                    <input type="text" name="jobIdStaff[0]" class="input_jobIdStaff is_hidden" autocomplete="off">
                </div>

                <div class="form_item dropdown_cage separate_dropdown_cage form_necessary_responsive">
                    <div class="dropdown-menu">
                        <div class="drop">
                            <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/employed.svg') !!}" alt="icone dropdowne cage">
                            <input class="text_dropdown_cage necessary necessary_staff" type="number" name="necessary_staff[0]" placeholder="{!! trans('create_event.emploied') !!}" autocomplete="off">
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
                    <label class="label_create_event">{!! trans('create_event.location') !!}</label>
                    <input class="input_create_event emplacement emplacement_responsive" type="text" name="location_event_staff[0]" id="emplacement" value="" placeholder="{!! trans('create_event.address') !!}" autocomplete="off">
                    <!-- <label  class="error is_hidden">{!! trans('create_event.field_text') !!}</label> -->
                </div>
                <div class="form_item_create_event_footer">
                    <div class="form_item_create_event ">
                        <label class="label_create_event code_postal_responsive_two">{!! trans('create_event.postal_code') !!}
                            <input class="input_code_postal postal" name="zip_event_staff[0]" value="" placeholder="{!! trans('create_event.postal') !!}" maxlength="7" autocomplete="off">
                        </label>
                        <!-- <label  class="error is_hidden">{!! trans('create_event.field_text') !!}</label> -->
                    </div>
                    <!-- <div class="empty_div_dropdown"></div> -->
                    <div class="form_item dropdown_create_event ">
                        <label class="labedropdown_largel_create_event">{!! trans('create_event.province') !!}</label>
                        <div class="dropdown-menu-event">
    						<span class="drop_one" >
                                <input class="input_dropdown_create_event svg_dropdown_create_event province_staff province_staff_width prv_postal_responsive_two input_create_dropdwon_resp_two" name="country_event_staff[0]" value="" placeholder="  ---  " readonly>
                                <span class="icon_input_create_event_pro icon_input_creat_event_responsive">
                                    <svg fill="#707070" height="24" viewBox="0 0 24 24" width="18">
                                        <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z"></path>
                                        <path d="M0-.75h24v24H0z" fill="none"></path>
                                    </svg>
                                </span>
                            </span>

                            <ul class="dropdown_large dropdown drop_creat_two dropdownScroll province" data-input="province">
                                  <li>{!! trans('create_event.quebec') !!}</li>
                                  <li>{!! trans('create_event.ontario') !!}</li>
                                  <li>{!! trans('create_event.british_colombia') !!}</li>
                                  <li>{!! trans('create_event.alberta') !!}</li>
                                  <li>{!! trans('create_event.saskatchewan') !!}</li>
                                  <li>{!! trans('create_event.manitoba') !!}</li>
                                  <li>{!! trans('create_event.newfoundland_and_labrador') !!}</li>
                                  <li>{!! trans('create_event.new_brunswick') !!}</li>
                                  <li>{!! trans('create_event.nova_scotia') !!}</li>
                                  <li>{!! trans('create_event.prince_edward_island') !!}</li>
                                  <li>{!! trans('create_event.northwest_territories') !!}</li>
                                  <li>{!! trans('create_event.nuvanut') !!}</li>
                                  <li>{!! trans('create_event.yukon') !!}</li>
            				</ul>
            			</div>
                        <!-- <label  class="error is_hidden">{!! trans('create_event.field_text') !!}</label> -->
            		</div>
    			</div>
            </div>
            <div class="content_second_divider">
                <div class="first_content_description">
                    <div class="first_content_description_heading">
                        <!-- <div class="form_item dropdown_cage small_cage">
                            <div class="dropdown-menu">
                                <div class="center_staff">
                                    <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/taux_horaire.svg')!!}" alt="icone dropdowne cage">
                                    <input class="text_dropdown_cage hour_rate" type="text" name="hour_rate[0]" placeholder="{!! trans('create_event.rate_hourly') !!}" readonly>
                                    <div class="line_separator_dropdown_two separate_icones">
                                        <img class="image_dropdown_cage" src="{!! url('img/input_icons/down-arrow.png')!!}" alt="icone dropdowne cage">
                                    </div>
                                    <ul class="dropdown_large dropdown post_staff dropdownScroll hour_rate_dropdown dropdownScroll">
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
                        <div class="dropdown_cage small_cage_label">
                            <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/taux_horaire.svg') !!}" alt="icone dropdowne cage">
                            <label class="text_salaires text_brief">$/Hr</label>
                            <input class="text_drop_new hourly_rate" type="number" name="hour_rate[0]" placeholder="|" min="12" autocomplete="off">
                        </div>
                        <div class="dropdown_cage small_cage_label">
                            <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/$_km.svg') !!}" alt="icone dropdowne cage">
                            <label class="text_salaires text_brief">$/km</label>
                            <input class="text_drop_new distance" type="number" name="distance[0]" placeholder="|" step=".01" autocomplete="off">
                        </div>
                        <div class="dropdown_cage small_cage_label">
                            <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/per_diem.svg') !!}" alt="icone dropdowne cage">
                            <label class="text_salaires text_brief">Per Diem</label>
                            <input class="text_drop perdiem" type="number" name="perdiem[0]" placeholder="|" autocomplete="off">
                        </div>

                        <div class="form_item dropdown_cage small_cage">
                            <div class="dropdown-menu">
                                <div class="center_staff">
                                    <img class="icones_dropdown_cage" src="{!! url('img/icones_creations/choisir.svg') !!}" alt="icone dropdowne cage">
                                    <input class="text_dropdown_cage zone_event_staff" type="text" name="zone_event_staff[0]" placeholder="{!! trans('create_event.choose_zone') !!}" readonly autocomplete="off">
                                    <div class="line_separator_dropdown_two separate_icones ">
                                        <img class="image_dropdown_cage" src="{!! url('img/input_icons/down-arrow.png') !!}" alt="icone dropdowne cage">
                                    </div>
                                </div>
                                <ul class="dropdown_large dropdown hour_rate_dropdown province_staff dropdownScroll" data-input="province_staff">
                                    @if(count($mobilities)>0)
                                        @foreach($mobilities as $mobility)
                                          <?php $translation = $mobility->getByLanguageId(getLanguageId()); ?>
                                            <li data-zoneIdEventStaff="{!! $translation->mobility_id !!}" class="zoneEventStaff">{!! $translation->name !!}</li>
                                        @endforeach
                                    @endif
                                </ul>
                            </div>
                            <input type="text" name="mobilityIdEventStaff[0]" class="input_mobilityIdEventStaff is_hidden" autocomplete="off">
                        </div>
                    </div>
                </div>
                <div class="description_staff description_event description_responsive">
                    <div class="text_description">
                        <img class="icones_agency icon_agency" src="{!! url('img/icones_creations/descripion_text.svg') !!}" alt="icone dropdowne cage">
                        <span class="heading_text_description text_brief">{!! trans('create_event.job_description') !!}</span>
                    </div>
                    <div class="text_description_brief">
                        <textarea class="text_brief_new" name="description_fr_event_staff[0]" placeholder="{!! trans('create_event.job_description_text') !!}" autocomplete="off"></textarea>
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
                                        <label class="text_salaires text_brief">{!! trans('create_event.dates_hours') !!}</label>
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

                <div class="decription_table_create_event">
                    <table class="description_event_tab">

                    </table>
                </div>
            </div>
            <div class="content_color_bouton">
                <div class="content_color">
                    <label class="choose_label">{!! trans('create_event.choose_color') !!}</label>
                    <div class="color_choose">
                         <div class="choose_color purple" data-color="purple"></div>
                         <div class="choose_color blue_sky blue_sky-active" data-color="blue_sky"></div>
                         <div class="choose_color orange" data-color="orange"></div>
                         <div class="choose_color green" data-color="green"></div>
                         <div class="choose_color blue" data-color="blue"></div>
                         <input type="hidden" name="color_choose[0]" value="linear-gradient(239deg, #1DE9B6, #1DC4E9)" class="input_date choose_color input_color" autocomplete="off">
                    </div>
                </div>
                <div class="content_bouton">
                    <button type="button" class="add validate">{!! trans('create_event.validate') !!}</button>
                    <button type="button" class="add delete">{!! trans('create_event.delete_post') !!}</button>
                </div>
            </div>
            <div class="create_event_list_btn">
              <button type="button" class="addition">{!! trans('create_event.ajout_post') !!}</button>
              <!-- <button type="button" class="delete">{!! trans('create_event.delete_post') !!}</button> -->
            </div>
        </div>
    </section>
     <!-- End Staff Necessaire  -->
</div>
