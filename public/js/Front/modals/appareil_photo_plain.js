
 $( document ).ready(function(){
     if(window.matchMedia("(min-width:480px)").matches) {
        $(".register_webcam_plain").hide();
         Webcam.set({
        
                width: 490,
                height: 390,
                image_format: 'jpeg',
                jpeg_quality: 90
            });
            Webcam.attach( '#my_camera_plain' );
     }
})

    function take_snapshot_plain() {
        $(".register_webcam_plain").show();
        
        Webcam.snap( function(data_uri) {
            $(".image-tag").val(data_uri);
            document.getElementById('results_plain').innerHTML = '<img src="'+data_uri+'"/>';
            var image_capture= $("#results_plain img").attr("src");
            $(".register_webcam_plain").on("click", function() {
                // console.log("j ai clicker sur enregistrer");
                $("#imgPortraitPlain").attr('src', image_capture);
                $(".close_modal").trigger("click");
                
            });

        } );

    }