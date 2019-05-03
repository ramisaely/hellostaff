<div class="staff_reg_step_nav">
    
    @include('notifications.alert')
    
    <div class="step_range">
        <input type="range" min="0" max="7" steps="1" value="0">
    </div>
    <ul class="step_range_labels">
        <li  class="active selected current" data-value="0">{!! trans('staff_register.coordinates') !!}</li>
        <li  data-value="1">{!! trans('staff_register.jobs') !!}</li>
        <li  data-value="2">{!! trans('staff_register.langue') !!}</li>
        <li  data-value="3">{!! trans('staff_register.certifications') !!}</li>
        <li  data-value="4">{!! trans('staff_register.attributes') !!}</li>
        <li  data-value="5">{!! trans('staff_register.remuneration') !!}</li>
        <li  data-value="6">{!! trans('staff_register.mobility') !!}</li>
        <li  data-value="7">{!! trans('staff_register.photo_cv') !!}</li>
    </ul>
</div>
