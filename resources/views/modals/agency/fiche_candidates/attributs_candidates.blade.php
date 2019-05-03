<div class="attributs_candidates">
  <!-- Modal content -->
  <div class="modal_content">
      <div class="content_head_exp_attr">
        <div class="title-icon-modal">
            <img class="title-icon" src="{!! url('img/fiche_candidates/bottom/info_vert.svg') !!}"/>
        </div>
        <p class="post">{!! trans ('modal_candidates.attribute') !!}</p>
        <div class="separated_footer_exp"></div>
      </div>
      <!-- evenement slider language -->
      <div class="attributs_candidates_listes">
        @foreach($attributes as $attribute)
        <?php $translation = $attribute->getByLanguageId(getLanguageId()); ?>
        <div class="list_item_attributs">
          <div class="image_attributs">
            <img src="{!! $attribute->getImagePath() !!}" alt="">
          </div>
          <label for="" class="name_attributs">{!! $translation->name !!}</label>
          <div class="value_item_attributs">
            <label for="">(</label>
            <label for="">

              @foreach($attribute->options as $option)
                <?php $option_translation = $option->getByLanguageId(getLanguageId()); ?>

                @foreach($staff->staffAttribut->StaffAttributeOption as $attr_option)
                  @if($attribute->id == $attr_option->attribute_id)
                    {{ $attr_option->attribute_option_id == $option_translation->attribute_option_id ? $option_translation->value : '' }}
                  @endif
                @endforeach

              @endforeach
            </label>
            <label for="">)</label>
          </div>
        </div>
        @endforeach
        <div class="list_item_attributs">
          <div class="image_attributs">
            <img src="{!! url('img/liste_attributs/tatouage.JPG') !!}" alt="">
          </div>
          <label for="" class="name_attributs">{!! trans ('modal_candidates.tattoo') !!}</label>
          <div class="value_item_attributs">
            <label for="">(</label>
            <label for="">{{ showTattooPiercing($staff->staffAttribut->tattoo) }}</label>
            <label for="">)</label>
          </div>
        </div>
        <div class="list_item_attributs">
          <div class="image_attributs">
            <img src="{!! url('img/liste_attributs/piercing.JPG') !!}" alt="">
          </div>
          <label for="" class="name_attributs">{!! trans ('modal_candidates.Piercing') !!}</label>
          <div class="value_item_attributs">
            <label for="">(</label>
            <label for="">{{ showTattooPiercing($staff->staffAttribut->piercing) }}</label>
            <label for="">)</label>
          </div>
        </div>
        <div class="list_item_attributs">
          <div class="image_attributs">
            <img src="{!! url('img/liste_attributs/taille.JPG') !!}" alt="">
          </div>
          <label for="" class="name_attributs">{!! trans ('modal_candidates.Size') !!}</label>
          <div class="value_item_attributs">
            <label for="">(</label>
            <label for="">{{ $staff->staffAttribut->height }}</label>
            <label for="">)</label>
          </div>
        </div>
      </div>
      <!-- End evenement slider language -->

      <div class="footer_modals_exp">
        <div class="separated_footer_exp"></div>
        <div class="btn_close_modals">
          <span class="close_modal close">&times;</span>
        </div>
      </div>
  </div>
</div>
