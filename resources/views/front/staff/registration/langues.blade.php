
<div class="list_language grid">
  <!-- first column -->

  <!-- <div class="item"> -->
  @if(count($all_languages)>0)  
    @foreach($all_languages as $language)
    <?php $translation = $language->getByLanguageId(getLanguageId()); ?>
    <div class="form_item">
      <div class="checkbox_wrap">
        <div class="dropdown_items checkbox_items">
            <div class="checkbox">
              <input type="checkbox" class="with_check" name="language[]" id="language_check{{$language->id}}" value="{{$language->id}}">
              <label class="checkbox_label languages_choice" for="language_check{{$language->id}}">{!! $translation->name !!}</label>
              <p><small>{!! isset($translation->decription) ? $translation->decription : '' !!}</small></p>
            </div>
        </div>
        <div class="dropdown-menu">
          <label class="label_select" for="language{{$language->id}}">
            <input class="select" id="language{{$language->id}}" value="" name="language_level[]" autocomplete="off" placeholder="{!! trans('staff_register.choice') !!}" readonly>
          </label>
          <input type="hidden" class="all_language_choice_id" name="all_language_choice_id[]" value="" >
          <ul class="dropdown language_choice" data-input="language{{$language->id}}">
              <!-- <li data-id="">{!!trans('staff_register.choice')!!}</li> -->
            @foreach($all_language_choices as $choice)
              <?php $translation_choice = $choice->getByLanguageId(getLanguageId()); ?>
              <li data-id="{{$choice->id}}">{!! $translation_choice->name !!}</li>
            @endforeach  
          </ul>
        </div>
      </div>
    </div>
    @endforeach
  @endif  
  <!-- </div> -->

</div>

