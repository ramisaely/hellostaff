<div class="certification grid">
  <?php 
            if(Session::has('staffData')) {
                $staff_data = Session::get('staffData');
            }else
                $staff_data = [
                  "actra" => 0, "smart_serve" => 0, "foods" => 0, "uda" => 0, "car_yes" => 0, "car_no" => 0, "drive_yes" => 0, "drive_no" => 0, "truck_yes" => 0, "truck_no" => 0
                ];
        ?>
	<div class="item">
		<div class="form_item">
          	<div class="checkbox">
            	<input type="checkbox" name="actra" value="{{ $staff_data['actra']!= 0 ? $staff_data['actra'] : '0'}}" id="actra" autocomplete="off" {{$staff_data['actra']!= 0 ? 'checked': ''}}>
            	<label class="checkbox_label actra {{$staff_data['actra']!= 0 ? 'active': ''}}" for="actra">ACTRA</label>
          	</div>
        </div>
        <div class="form_item">
          	<div class="checkbox">
            	<input type="checkbox" name="smart_serve" value="{{$staff_data['smart_serve']!= 0? $staff_data['smart_serve']: '0'}}" id="smart_serve" autocomplete="off" {{$staff_data['smart_serve']!= 0 ? 'checked': ''}}>
            	<label class="checkbox_label smart_serve {{$staff_data['smart_serve']!= 0 ? 'active': ''}}" for="smart_serve">Smart serve</label>
          	</div>
        </div>
	</div>
	<div class="item">
		<div class="form_item">
          	<div class="checkbox">
            	<input type="checkbox" name="foods" id="foods" value="{{$staff_data['foods']!= 0? $staff_data['foods']: ''}}" autocomplete="off" {{$staff_data['foods']!= 0 ? 'checked': ''}}>
            	<label class="checkbox_label foods {{$staff_data['foods']!= 0 ? 'active': ''}}" for="foods">{!! trans('staff_register.handling_of_food') !!}</label>
          	</div>
        </div>
        <div class="form_item">
          	<div class="checkbox">
            	<input type="checkbox" name="uda" value="{{$staff_data['uda']!= 0? $staff_data['uda']: '0'}}" id="uda" autocomplete="off" {{$staff_data['uda']!= 0 ? 'checked': ''}}>
            	<label class="checkbox_label uda {{$staff_data['uda']!= 0 ? 'active': ''}}" for="uda">UDA</label>
          	</div>
        </div>
	</div>
	<div class="item divider"></div>
	<div class="item skill">
		<div class="space_responsive">
			<div class="">{!! trans('staff_register.have_car') !!}</div>
			<div class="form_item">
              	<div class="checkbox">
                	<input type="radio" name="car[]" id="car_yes" class="" autocomplete="off" value="1" {{$staff_data['car_yes']!= 0 ? 'checked': ''}}>
                	<label class="checkbox_label {{$staff_data['car_yes']!= 0 ? 'active': ''}}" for="car_yes">{!! trans('staff_register.yes') !!}</label>
              	</div>
              	<div class="checkbox">
                	<input type="radio" name="car[]"  id="car_no" class="" autocomplete="off" value="0" {{$staff_data['car_no']!= 0 ? 'checked': ''}}>
                	<label class="checkbox_label {{$staff_data['car_no']!= 0 ? 'active': ''}}" for="car_no">{!! trans('staff_register.no') !!}</label>
              	</div>
	        </div>
		</div>
		<div class="space_responsive">
			<div class="">{!! trans('staff_register.auto_license') !!}</div>
			<div class="form_item">
              	<div class="checkbox">
                	<input type="radio" name="drive[]" id="drive_yes" class="" autocomplete="off" value="1" {{$staff_data['drive_yes']!= 0 ? 'checked': ''}}>
                	<label class="checkbox_label {{$staff_data['drive_yes']!= 0 ? 'active': ''}}" for="drive_yes">{!! trans('staff_register.yes') !!}</label>
              	</div>
              	<div class="checkbox">
                	<input type="radio" name="drive[]" id="drive_no" class="" autocomplete="off" value="0" {{$staff_data['drive_no']!= 0 ? 'checked': ''}}>
                	<label class="checkbox_label {{$staff_data['drive_no']!= 0 ? 'active': ''}}" for="drive_no">{!! trans('staff_register.no') !!}</label>
              	</div>
	        </div>
		</div>
		<div class="space_responsive">
			<div class="">{!! trans('staff_register.truck_license') !!}</div>
			<div class="form_item">
              	<div class="checkbox">
                	<input type="radio" name="truck[]" id="truck_yes" class="" autocomplete="off" value="1" {{$staff_data['truck_yes']!= 0 ? 'checked': ''}}>
                	<label class="checkbox_label {{$staff_data['truck_yes']!= 0? 'active': ''}}" for="truck_yes">{!! trans('staff_register.yes') !!}</label> 
              	</div>
              	<div class="checkbox">
                	<input type="radio" name="truck[]" id="truck_no" class="" autocomplete="off" value="0" {{$staff_data['truck_no']!= 0 ? 'checked': ''}}>
                	<label class="checkbox_label {{$staff_data['truck_no']!= 0 ? 'active': ''}}" for="truck_no">{!! trans('staff_register.no') !!}</label>
              	</div>
	        </div>
		</div>		
	</div>
</div>