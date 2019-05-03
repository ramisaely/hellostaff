
<div class="list_attributs grid">
  <div class="content_attribut_pronoced">
        <div class="content_item_attribut">
          <div class="item">
            <div class="form_item">
              <!--<div class="form_item form_item_attributs">-->
              <div class="checkbox_wrap attributs_wrap large_one">
                  <div class="dropdown_items checkbox attributs_items">
                    <input type="checkbox" name="attributs_name[]" id="tatou" autocomplete="off" value="tattoo">
                      <label class="tatou" for="tatou">{!! trans('staff_register.tattoo') !!}</label>
                  </div>
                  <div class="dropdown-menu large">
                    <label for="tatou" class="label_select labelplc" data-dropdown="tatou_drop">
                      <input class="select select_attributs margin_class_one" value="{!! trans('staff_register.none') !!}" id="tatouage" placeholder="{!! trans('staff_register.choice') !!}" autocomplete="off" readonly>
                    </label>
                  </div>
                  <input type="hidden" class="tattoo_value" name="attributs[]" value="3" >
                  <ul class="tatou_drop tatouage dropdown large drop_one" data-input="tatouage">
                      <li data-id="1">{!! trans('staff_register.visible') !!}</li>
                      <li data-id="2">{!! trans('staff_register.not_visible') !!}</li>
                      <li data-id="3">{!! trans('staff_register.none') !!}</li>
                  </ul>
              </div>
            </div>
          </div>


          <div class="item">
            <div class="form_item">
              <!--<div class="form_item form_item_attributs">-->
              <div class="checkbox_wrap attributs_wrap">
                  <div class="dropdown_items checkbox attributs_items">
                    <input type="checkbox" name="attributs_name[]" id="piercing_check" autocomplete="off" value="piecing">
                      <label class="percing" for="piercing_check">Piercings</label>
                  </div>
                  <div class="dropdown-menu large">
                    <label for="" class="label_select labelplc" data-dropdown="percing_drop">
                      <input class="select select_attributs marge_check margin_class_two" value="{!! trans('staff_register.none') !!}" id="piercing" placeholder="{!! trans('staff_register.choice') !!}" autocomplete="off" readonly>
                    </label>
                  </div>
                  <input type="hidden" class="piercing_value" name="attributs[]" value="3" >
                  <ul class="percing_drop dropdown large drop_two" data-input="piercing">
                      <li data-id="1">{!! trans('staff_register.visible') !!}</li>
                      <li data-id="2">{!! trans('staff_register.not_visible') !!}</li>
                      <li data-id="3">{!! trans('staff_register.none') !!}</li>
                  </ul>
              </div>
            </div>
          </div>

        </div>

        <div class="content_item_attribut">

          <!--<div class="item">-->
              <!--<div class="form_item">-->
                <!--<div class="form_item form_item_attributs">-->
              <!--  <div class="checkbox_wrap attributs_wrap">-->
              <!--      <div class="dropdown_items not_pronounced_item checkbox attributs_items">-->
              <!--        <input type="checkbox" name="not_pronounced" id="not_pronounced" autocomplete="off">-->
              <!--          <label class="checkbox_label not_pronounced" for="not_pronounced">{!! trans('staff_register.Is_not_pronounced') !!}</label>-->
              <!--      </div>-->
              <!--  </div>-->
              <!--</div>-->
          <!--  </div>-->

            <div class="item">
              <div class="form_item">
                <!--<div class="form_item form_item_attributs">-->
                <div class="checkbox_wrap attributs_wrap flex_checkbox column_class">
                    <div class="dropdown_items checkbox attributs_items">
                      <input type="checkbox" name="attributs_name[]" id="taille_check" autocomplete="off" value="taille">
                        <label class="taille" for="taille_check">{!! trans('staff_register.tall') !!}&nbsp;</label>
                    </div>
                    <div class="dropdown-menu large">
                      <label for="" class="label_select labelplc" data-dropdown="taille_drop">
                        <input class="select select_attributs select_large margin_class_three" value="<?php if(Session::has('staffData')) {
                            $staff_data = Session::get('staffData'); echo $staff_data['taille'];}?>"  id="taille" name="attributs[]" placeholder="{!! trans('staff_register.choice') !!}" autocomplete="off" readonly>
                      </label>
                    </div>
                    <ul class="taille_drop dropdown scrollbar large drop_three" data-input="taille">
                          <li>5'0" = 1.53m</li>
                          <li>5'1" = 1.55m</li>
                          <li>5'2" = 1.57m</li>
                          <li>5'3" = 1.60m</li>
                          <li>5'4" = 1.63m</li>
                          <li>5'5" = 1.65m</li>
                          <li>5'6" = 1.68m</li>
                          <li>5'7" = 1.70m</li>
                          <li>5'8" = 1.73m</li>
                          <li>5'9" = 1.75m</li>
                          <li>5'10" = 1.78m</li>
                          <li>5'11" = 1.80m</li>
                          <li>6'0" = 1.83m</li>
                          <li>6'1" = 1.85m</li>
                          <li>6'2" = 1.88m</li>
                          <li>6'3" = 1.90m</li>
                          <li>6'4" = 1.93m</li>
                          <li>6'5" = 1.96m</li>
                          <li>6'6" = 1.98m</li>
                          <li>6'7" = 2.00m</li>
                          <li>6'8" = 2.03m</li>
                          <li>6'9" = 2.06m</li>
                          <li>6'10" = 2.08m</li>
                    </ul>
                </div>
              </div>
            </div>


      </div>
      <!--<div class="content_attribut_pronoced">-->

      <!--</div>-->

  </div>



  <div class="item divider"></div>

<div class="item">
  @if(count($attributes)>0)
    @foreach($attributes as $attribute)
      <?php $translation = $attribute->getByLanguageId(getLanguageId()); ?>
      <div class="form_item">
        <div class="checkbox_wrap">
          <div class="dropdown_items attributs_items">
            <div class="checkbox checkbox_attributs">
              <input class="input_hidden" type="text" name="attribute[]" id="attribute{!! $attribute->id !!}" autocomplete="off" value="{!! $attribute->id !!}">
              <label class="caracters" for="attribute{!! $attribute->id !!}">{!! $translation->name !!}</label>
              <!--<small>Ces informations pourront être utilisées par les agences si elles ont besoin de vous fournir des tenues vestimentaires.</small>-->
            </div>
          </div>
          <div class="dropdown-menu">
            <label for="jacket_dropdown" class="label_select" data-dropdown="jacket_drop">
              <input class="select select_attributs" id="option{!! $translation->id !!}" name="attribute_option[]" placeholder="{!! trans('staff_register.choice') !!}" autocomplete="off" value="" readonly>
            </label>
            <input type="hidden" id="attribute_option_id{!! $attribute->id !!}" class="attribute_option_id" name="attribute_option_id[]" value="" >
            <ul class="jacket_drop dropdown scrollbar" data-input="option{!! $translation->id !!}">
                @foreach($attribute->options as $option)
                  <?php $option_translation = $option->getByLanguageId(getLanguageId()); $opt = $option->optionGender?>
                  <li data-id="{!!$option->id!!}" {!! ($opt) ? 'class="gender'.$opt->gender_id.'"' : '' !!}>{!! $option_translation->value !!}</li>
                @endforeach
            </ul>

          </div>
        </div>
        @if($translation->name == "Chaussures" || $translation->name =="Shoes")
        <div class="smile_message_attribut">
          <small>{!! trans('staff_register.lettre_vetement') !!}</small>
        </div>
        @endif
      </div>
    @endforeach
  @endif

  </div>

</div>
