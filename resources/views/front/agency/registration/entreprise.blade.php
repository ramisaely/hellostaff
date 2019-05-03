<div class="entreprise">
  <div class="contact_user">
    <div class="personnal item item_company">
        <!--eto ilai php teo-->
        <?php 
          if(Session::has('agencyData')) {
              $agency_data = Session::get('agencyData');
          }
        ?>
  		<div class="form_item">
  			<label for="name_entreprise">{!! trans('agency_register.name_of_company') !!}*</label>
  			<input type="text" class="required entreprise_name" name="name_entreprise" id="name_entreprise" value="{{Session::has('agencyData') ? $agency_data['name_entreprise'] : ''}}" data-msg="{!! trans('staff_register.invalid_field') !!}" autocomplete="off">
  		</div>
  
  		<div class="form_item">
  			<label for="num_entreprise">{!! trans('agency_register.company_number') !!}</label>
  			<input type="number" class="" name="num_entreprise" id="num_entreprise" data-msg="{!! trans('staff_register.invalid_field') !!}" value="{{Session::has('agencyData') ? $agency_data['num_entreprise'] : ''}}" autocomplete="off">
  		</div>
  
    	<div class="form_item">
    			<label for="tps">TPS/TVH</label>
    			<input type="text" class="" name="tps" id="tps" data-msg="{!! trans('staff_register.tps_message') !!}" value="{{Session::has('agencyData') ? $agency_data['tps'] : ''}}" autocomplete="off" exactlength="15"> 
		  </div>
  		<div class="form_item">
  			<label for="tvq">TVQ</label>
  			<input type="text" class="" name="tvq" id="tvq" data-msg="{!! trans('staff_register.tvq_message') !!}" value="{{Session::has('agencyData') ? $agency_data['tvq'] : ''}}" autocomplete="off" exactlength="16">
  		</div>
		  <small class="popuptext tvq_tps " id="">{!! trans('agency_register.tvq_tps') !!}</small>
	  </div>
  </div>
    
	
	<div class="contact_user">
	  <div class="personnal item">

    		<div class="form_item">
    			<label for="address_entreprise">{!! trans('agency_register.company_address') !!}*</label>
    			<input type="text" class="required" name="address_entreprise" id="address_entreprise" data-msg="{!! trans('staff_register.invalid_field') !!}" value="{{Session::has('agencyData') ? $agency_data['address_entreprise'] : ''}}" autocomplete="off">
    		</div>
    
    		<div class="form_item">
    			<label for="city">{!! trans('agency_register.city') !!}</label>
    			<input type="text" class="required" name="city" id="city" data-msg="{!! trans('staff_register.invalid_field') !!}" value="{{Session::has('agencyData') ? $agency_data['city'] : ''}}" autocomplete="off">
    		</div>
    		<div class="form_item">
        		<label for="postal_code">{!! trans('agency_register.postal_code') !!}</label>
        		<input type="text" class="required zip_agency" name="postal_code" id="postal_code" data-msg="{!! trans('staff_register.invalid_field') !!}" value="{{Session::has('agencyData') ? $agency_data['postal_code'] : ''}}" autocomplete="off" maxlength="7">
    		</div>
    		<div class="form_item form_location">
    		    <div class="dropdown_city">
    		        <div>
    		            <label class="" for="province">{!! trans('agency_register.province') !!}</label>
        	            <div class="checkbox_wrap">
                            <div class="checkbox_items">
                                <div class="checkbox">
                                  <input type="checkbox" name="province" value="{{Session::has('agencyData') ? $agency_data['province']: ''}}" id="provinceID">
                                </div>
                            </div>
                            <div class="dropdown-menu">
                              <span class="label_select form_item disabled" for="province">
                                <input class="select location required" id="province" name="province" data-msg="{!! trans('staff_register.invalid_field') !!}" value="{{Session::has('agencyData') ? $agency_data['province'] : ''}}" placeholder="{!! trans('agency_register.choice') !!}" readonly autocomplete="off">
                              </span>
                    
                              <ul class="dropdown scrollbar drop_new_one" data-input="province">
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
                      </div>
    		        </div>
    		       
        			<div>
        			    <label class="" for="country">{!! trans('agency_register.country') !!}</label>
        	            <div class="checkbox_wrap">
                            <div class="checkbox_items">
                                <div class="checkbox">
                                  <input type="checkbox" name="country" id="countryID" value="{{Session::has('agencyData') ? $agency_data['country'] : ''}}">
                                </div>
                            </div>
                            <div class="dropdown-menu">
                              <span class="label_select form_item disabled" for="country">
                                <input class="select location required" id="country" name="country" data-msg="{!! trans('staff_register.invalid_field') !!}" value="{{Session::has('agencyData') ? $agency_data['country'] : ''}}" placeholder="{!! trans('agency_register.choice') !!}" readonly autocomplete="off">
                              </span>
                    
                              <ul class="dropdown decoration_scrollbar drop_new_two" data-input="country">
                                  <li>Canada</li>
                              </ul>
                    
                            </div>
                      </div>
        			</div>
    		    </div>
    		</div>
	  </div>
	</div>
</div>
