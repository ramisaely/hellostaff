<div class="language_experience">
  <!-- Modal content -->
  <div class="modal_content">
      <div class="content_head_exp">
        <div class="title-icon-modal">
            <img class="title-icon" src="{!! url('img/fiche_candidates/bottom/langues_vert.svg') !!}"/>
        </div>
        <p class="post">{!! trans ('langage_expertise.Spoken_languages') !!}</p>
        <div class="separated_footer_exp"></div>
      </div>
      <!-- evenement slider language -->
      <div class="slider_round_language">
        @foreach($staff->staffLanguages as $staffLanguage)
        <?php
          $translation_language = $staffLanguage->allLanguage->getByLanguageId(getLanguageId());
          $translation_language_choice = $staffLanguage->allLanguageChoice->getByLanguageId(getLanguageId());
        ?>
        <div class="item_slider_round">
          <div class="cssprogresscontainer">
            <div class="svgcontainer">
            	<svg height="145" width="145" class="svg">
                <defs>
                  <linearGradient id="gradient" x1="0%" y1="0%" x2="0%" y2="100%">
                    <stop offset="0%" stop-color="#1de9b6" />
                    <stop offset="100%" stop-color="#1dc4e9" />
                  </linearGradient>
                </defs>
            		<circle class="progressbg" cx="70" cy="70" r="55" stroke="#E3E3E3" stroke-width="1" fill="transparent" stroke-dasharray="345.5751918948" />
            		<circle class="progress" cx="70" cy="70" r="55" stroke="url(#gradient)" stroke-width="3" fill="transparent" stroke-dasharray="345.5751918948" />
            	</svg>
            </div>
            <div class="item_language">
              <label for="" class="title_language">{!! $translation_language->name !!}</label>
              <label for="" class="status_language">{!! $translation_language_choice->name !!}</label>
            </div>
            <input type="range" class="slider_language" min="0" max="100" value="{{getLanguageValue($staffLanguage->all_language_choice_id)}}" style="display: none;">
          </div>
        </div>
        @endforeach

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
