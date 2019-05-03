<div class="remuneration">
    <?php 
        if(Session::has('staffData')) {
            $staff_data = Session::get('staffData');
        }else
            $staff_data = [
              "price_remuneration" => 15, "nas" => ''
            ];
    ?>
    <ul class="remuneration_range_labels">
        <li  data-value="12">12$ /Hr</li>
        <li  data-value="13">13$ /Hr</li>
        <li  data-value="14">14$ /Hr</li>
        <li class="active selected" data-value="15">15$ /Hr</li>
        <li  data-value="16">16$ /Hr</li>
        <li  data-value="17">17$ /Hr</li>
        <li  data-value="18">18$ /Hr</li>
        <li  data-value="19">19$ /Hr</li>
        <li  data-value="20">{!! trans('staff_register.hours') !!}</li>
    </ul>
    <div class="remuneration_range">
        <input name="price_remuneration" type="range" min="12" max="20" steps="1" value="{{$staff_data['price_remuneration']!= 15 ? $staff_data['price_remuneration']: '15'}}" autocomplete="off">
    </div>

    <div class="remuneration_inputs">
        <div class="form_item message_nas">
            <label for="nas">{!! trans('staff_register.numero_nas') !!}</label><br>
            <input type="text" value="{{$staff_data['nas']!= '' ? $staff_data['nas']: ''}}" name="nas" id="nas" data-msg="{!! trans('staff_register.number_nas') !!}" autocomplete="off" exactlength="9"><br>
            <small>{!! trans('staff_register.num_nas') !!}</small>
        </div>
        <div class="form_item message_remuneration">
            <small>{!! trans('staff_register.alert_remuneration') !!}</small>
        </div>
    </div>
            
</div>
