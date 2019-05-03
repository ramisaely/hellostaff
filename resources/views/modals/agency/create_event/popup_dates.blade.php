@section('additional-css')

@endSection
<div id="popup_dates" class="modal is_hidden is_visually_hidden">
    <!-- Modal content -->
    <div class="modal_content">
      	<div class="modal_head">
        		<div class=header_popup>
        		    <div class="plage_dates">
        		        <div class="icon_hours">
        		            <img class="times" src="{{ url('/img/icones_creations/times.svg') }}" alt="">
        		        </div>
        		        <div class="title_hours">
        		            {!! trans('create_event.date_events') !!}
        		        </div>
        		    </div>
        		    <div class="liste_dates ">
        		        <div class="first_dates align_dates_popup">
        		            <label class="date_letter" for="day1"></label>
        		            <label class="date_number" for="date1"></label>
        		            <label class="month_letter" for="moth1"></label>
        		        </div>
        		        <div class="icon_next">
        		            >
        		        </div>
        		        <!--color: #60e5d0-->
        		        <div class="second_dates align_dates_popup">
        	              <label class="date_letter" for="day2"></label>
        		            <label class="date_number" for="date2"></label>
        		            <label class="month_letter" for="moth2"></label>
        		        </div>
        		    </div>
        		</div>
        		
        		<div class=content_popup>
        		    <!-- <div class="plage_hours">
                    <div class="liste_hours liste_first_hours">
                        <img class="img_hours" src="{{ url('/img/icones_creations/times_blue.svg') }}" alt="">
                        <div class="times_with_cursor">
                                            <input class="input_hours hours_input" type="number" name="hours1" min="1" max="12" value="01" maxlength="2"/>
                                            <span><i class='fas fa-caret-up up_hour up'></i></span>
                                            <span><i class='fas fa-caret-down down_hour down'></i></span>  
                        </div>
                                         &nbsp; : &nbsp;
                                        <div class="times_with_cursor">
                                            <input class="input_hours minute_input" type="number" name="minutes1" min="00" max="59" value="00" maxlength="2" /> 
                                            <span><i class='fas fa-caret-up up_minute up'></i></span>
                                            <span><i class='fas fa-caret-down down_minute down'></i></span>  
                        </div>
                                         &nbsp;
                                        <div class="times_with_cursor">
                                            <input class="input_hours am_pm_input" type="text" name="am_pm1" value="AM" readonly />
                                            <span><i class='fas fa-caret-up  up_am_pm up'></i></span>
                                            <span><i class='fas fa-caret-down down_am_pm down'></i></span>  
                                        </div>  
                    </div>
                    <div class="liste_hours liste_second_hours">
                        <img class="img_hours" src="{{ url('/img/icones_creations/times_blue.svg') }}" alt="">
                        <div class="times_with_cursor">
                                            <input class="input_hours second_hours" type="number" name="hours2" min="1" max="12" value="01" /> 
                                            <span><i class='fas fa-caret-up up_second_hour up'></i></span>
                                            <span><i class='fas fa-caret-down down_second_hour down'></i></span>
                                        </div>   
                         &nbsp; : &nbsp;
                                        <div class="times_with_cursor">
                                            <input class="input_hours second_minute" type="number" name="minutes2" min="00" max="59" value="00" />
                                            <span><i class='fas fa-caret-up up_second_minute up'></i></span>
                                            <span><i class='fas fa-caret-down down_second_minute down'></i></span> 
                                         </div>
                                         &nbsp;
                                         <div class="times_with_cursor">  
                                            <input class="input_hours second_am_pm" type="text" name="am_pm2" value="AM" readonly />
                                            <span><i class='fas fa-caret-up up_second_am_pm up'></i></span>
                                            <span><i class='fas fa-caret-down down_second_am_pm down'></i></span>
                                        </div>   
                    </div>
                </div> -->
        		    
        		    <div class="choice_dates"> 
          		      <section>
                      	<article>
                            <!--io leri io e-->
                          	<!--<p id="daterangepicker-result">Selected date range:</p>-->
                            <input id="daterangepicker1" type="hidden">
                            <div id="daterangepicker1-container" class="embedded-daterangepicker"></div>
                      	</article>
                    </section>
        		    </div>
        		    
        		    <div class="boutton_popup_dates">
        		        <button class="btn_apply get_btn" data-position="">{!! trans('create_event.save') !!}</button>
        		        <button class="btn_cancel close_modal">{!! trans('create_event.Cancel') !!}</button>
        		    </div>
        		</div>
      	</div>
    </div>
</div>
