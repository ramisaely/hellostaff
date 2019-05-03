$( document ).ready(function(){
  // $(window).scrollTop(0);
  window.scrollTo(0,0);
  /** action des popups */
  /** Slider image staff */
  $(document).on('click' , '.btn_slider_profil_staff' , function () {
    var profil = $('.staff_img_back').attr('src');
    var profil_plein = $('.staff_img_plein').attr('src');
    var profilSplit = profil.split("/");
    var profil_pleinSplit = profil_plein.split("/");
    console.log(profil_plein);
    if (profilSplit[profilSplit.length-1] == "") {
      $('#slider_image_candidates').find('#profil').attr('src', profil_plein);
      $('#slider_image_candidates').find('#profil_plein').attr('src', profil_plein);
    }else if(profil_pleinSplit[profil_pleinSplit.length-1] == "") {
      $('#slider_image_candidates').find('#profil').attr('src', profil);
      $('#slider_image_candidates').find('#profil_plein').attr('src', profil);
    }else{
      $('#slider_image_candidates').find('#profil').attr('src', profil);
      $('#slider_image_candidates').find('#profil_plein').attr('src', profil_plein);
    }
    
    launch_modal('slider_image_candidates');

  });
  /** End Slider image staff */
  activate_inline_svg("img.svg-inline");

  $(document).on('click','.xp_candidates', function() {
    var name_candidates = $('.name_ages').find('.name').text();
    var slip_first_name = name_candidates.split(' ');
    console.log(slip_first_name[0]);

    var experience = $(this).data('experience');
    console.log(experience);
    var job_name = $(this).closest('.item_jobs_list_exp').find('.title_jobs_exp').text();

    var svg_jobs_svg = $(this).closest('.item_jobs_list_exp').find('.logo_jobs_exp svg').clone();

    $('#experience_candidat').find('.post').text(job_name);
    $('#experience_candidat').find('.experience').text(experience);
    switch(experience) {
        case 0:
          $('#experience_candidat').find('.experience_wrap_sup').css('background-color', '#ffffff');
          $('#experience_candidat').find('.experience_wrap').css('background-color', '#ffffff');
          break;
        case 1:
          $('#experience_candidat').find('.experience_wrap_sup').css('background-color', '#ffffff');
          $('#experience_candidat').find('.experience_wrap').css('background-color', '#ffffff');
          break;
        case 2:
          $('#experience_candidat').find('.experience_wrap_sup').css('background-color', '#ffffff');
          break;
    }
    $("#experience_candidat .title-icon-modal").html(svg_jobs_svg);

    // var svg_jobs = $(this).closest('.item_jobs_list_exp').find('.logo_jobs_exp img').attr('src');
    // $("#experience_candidat .title-icon-modal img").attr('src', svg_jobs);
    $('#experience_candidat').find('.first_name_candidates').text(slip_first_name[0]);
    activate_inline_svg("img.svg-inline");
    launch_modal('experience_candidat');
  });

  $(document).on('click', '.close', function(){
    $('#experience_candidat').find('.experience_wrap_sup').css('background-color', '#e0f7f3');
    $('#experience_candidat').find('.experience_wrap').css('background-color', '#c6f0e9');
  });

  $(document).on('click','#language_exp', function() {
    getStaffData(this);
  });
  $(document).on('click','#listes_attributs', function() {
    getStaffData(this);
  });
  $(document).on('click','#certifications_exp', function() {
    getStaffData(this);
  });
  $(document).on('click','#mobilities_exp', function() {
    getStaffData(this);
  });
  $(document).on('click','#view_cv', function() {
    var curriculum = $(this).data('curriculum');
    if (curriculum != "") {
      $iframe_url = $(this).data('iframe_url');
      $url = $(this).data('url');
      $(document).find('#view_cv_staff').attr('src', $iframe_url);
      $(document).find('#iframe_view_cv').find('.download_bill').attr('href', $url);
      launch_modal('iframe_view_cv');
    }
  });
  /** action des popups */

  $(document).on('click','.btn_presedent', function() {
    $('.content_candidate_card').addClass('is_hidden');
      $('#content_header_slider').removeClass('is_hidden');
      $('.content_future_event').removeClass('is_hidden');
      $('.content_finished').removeClass('is_hidden');
      var slick_active = $('.filter_candidates').find('.item_jobs_list.active').closest('.description_jobs').data('slick-index');
    $('.post_slider').slick('slickGoTo', parseInt(slick_active));
  });
});

function getStaffData(btn){
  var staff_id = $(btn).data('staff_id');
  var url = $(btn).data('url');
  var modal = $(btn).data('modal');
  $.ajax({
     type: "POST",
     url: url,
     data: {staff_id: staff_id, modal: modal},
     success: function(response)
     {
        $('#footer_card_candidates').html(response);
        launch_modal('footer_card_candidates');

        //for languages
        $(document).find('.item_slider_round').each(function(index,element) {
          var radius = $(element).find('.progress').attr('r');
          var circumference = 2 * Math.PI * radius;

          var progress_in_percent = $(element).find('.slider_language').val();
          var progress_in_pixels = circumference * (100-progress_in_percent)/100;
          $(element).find('.progress').css('strokeDashoffset' , progress_in_pixels+'px');
        });
     },
      error: function(error){
          toastr.error("error with: " + error);
     }
  });
}
function activate_inline_svg(string){
  $('img.svg-inline').each(function(){
    var $img = jQuery(this);
    var imgID = $img.attr('id');
    var imgClass = $img.attr('class');
    var imgURL = $img.attr('src');
    jQuery.get(imgURL, function(data) {
        /* Get the SVG tag, ignore the rest */
        var $svg = jQuery(data).find('svg');
        /* Add replaced image's ID to the new SVG */
        if(typeof imgID !== 'undefined') {
            $svg = $svg.attr('id', imgID);
        }
        /* Add replaced image's classes to the new SVG */
        if(typeof imgClass !== 'undefined') {
            $svg = $svg.attr('class', imgClass+' replaced-svg');
        }
        /* Remove any invalid XML tags as per http://validator.w3.org */
        $svg = $svg.removeAttr('xmlns:a');
        /* Replace image with new SVG */
        $img.replaceWith($svg);
    }, 'xml');
  });
}

/*Start Slider IMage*/
  var slideIndex = 1;
  showDivs(slideIndex);

  function plusDivs(n) {
    showDivs(slideIndex += n);
  }

  function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("image_staff");
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length}
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    $('.image_staff').eq(slideIndex-1).css({'display':'block'});
  }
/*End Slider Image*/
