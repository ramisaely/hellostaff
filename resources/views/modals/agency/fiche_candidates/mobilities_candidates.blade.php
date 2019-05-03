<div class="mobilities_candidates">
  <!-- Modal content -->
  <div class="modal_content">
      <div class="content_head_exp">
        <div class="title-icon-modal">
            <img class="title-icon" src="{!! url('img/fiche_candidates/bottom/route_vert.svg') !!}"/>
        </div>
        <p class="post">{!! trans ('mobility_blade.mobility') !!}</p>
        <div class="separated_footer_exp"></div>
      </div>
      <!-- liste des mobilités candidates -->
      <div class="mobilities_listes">
        @foreach($staff->staffMobility as $staffMobility)
        <?php $translation = $staffMobility->mobility->getByLanguageId(getLanguageId()); ?>
        <div class="item_liste">
          <div class="icone_cible">
            <img src="{!! url('img/fiche_candidates/cible.JPG') !!}" alt="">
          </div>
          <label for="" class="title_mobilities">{{$translation->name}}</label>
        </div>
        @endforeach
      </div>
      <!-- End liste des mobilités candidates -->
      <div class="footer_modals_exp">
        <div class="separated_footer_exp"></div>
        <div class="btn_close_modals">
          <span class="close_modal close">&times;</span>
        </div>
      </div>
  </div>
</div>
