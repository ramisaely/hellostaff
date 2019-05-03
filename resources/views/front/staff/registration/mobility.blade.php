<div class="mobility grid">
  <?php
    if(Session::has('staffData')) {
        $staff_data = Session::get('staffData');
    }else
        $staff_data = [
              'mobility41'=>'','mobility42'=>'','mobility43'=>'','mobility44'=>'','mobility45'=>'','mobility46'=>'','mobility47'=>'','mobility48'=>'','mobility49'=>'','mobility50'=>'','mobility51'=>''
              ];
  ?>
  @if(count($mobilities)>0)
    @foreach($mobilities as $mobility)
      <?php $translation = $mobility->getByLanguageId(getLanguageId()); $mob =$mobility->id; ?>
      <div class="form_item">
        	<div class="checkbox">
          	<input type="checkbox" name="mobility[]" id="mobility{!! $mobility->id !!}" value="{!! $mobility->id !!}" {{$staff_data['mobility'.$mob] != '' ? 'checked': ''}}>
            <label class="checkbox_label {{$staff_data['mobility'.$mobility->id] !='' ? 'active': ''}}" for="mobility{!! $mobility->id !!}">{!! $translation->name !!}</label>
        	</div>
      </div>
    @endforeach
  @endif
</div>
<div class="small_mobilities_registration">
  <small>{!! trans('staff_register.msg_mobilities') !!}</small>
</div>
