<div class="certifications_candidates">
  <!-- Modal content -->
  <div class="modal_content">
      <div class="content_head_exp">
        <div class="title-icon-modal">
            <img class="title-icon" src="{!! url('img/fiche_candidates/bottom/checked_vert.svg') !!}"/>
        </div>
        <p class="post">Certifications</p>
        <div class="separated_footer_exp"></div>
      </div>
      <!-- liste des certifications -->
      <div class="listes_certifications">
        <div class="item_certifications">
          @if($staff->staffCertification->actra == 1)
          <label for="" class="title_certifications">ACTRA</label>
          @endif
          @if($staff->staffCertification->food_handling == 1)
          <div class="separed_certifications"></div>
          <label for="" class="title_certifications">{!! trans('staff_register.handling_of_food') !!}</label>
          @endif
          @if($staff->staffCertification->uda == 1)
          <div class="separed_certifications"></div>
          <label for="" class="title_certifications">UDA</label>
          @endif
          @if($staff->staffCertification->smart_serve == 1)
          <div class="separed_certifications"></div>
          <label for="" class="title_certifications">Smart serve</label>
          @endif
        </div>
      </div>
      <!-- end liste des certifications -->
      <div class="footer_modals_exp">
        <div class="separated_footer_exp"></div>
        <div class="btn_close_modals">
          <span class="close_modal close">&times;</span>
        </div>
      </div>
  </div>
</div>
