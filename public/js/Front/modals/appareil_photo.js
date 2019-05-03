
 $( document ).ready(function(){
     if(window.matchMedia("(min-width:480px)").matches) {
        $(".register_webcam").hide();
         Webcam.set({
        
                width: 490,
                height: 390,
                image_format: 'jpeg',
                jpeg_quality: 90
            });
            Webcam.attach( '#my_camera' );
     }
})

    function take_snapshot() {
        $(".register_webcam").show();
        
        Webcam.snap( function(data_uri) {
            $(".image-tag").val(data_uri);
            document.getElementById('results').innerHTML = '<img src="'+data_uri+'"/>';
            var image_capture= $("#results img").attr("src");
            $(".register_webcam").on("click", function() {
                // console.log("j ai clicker sur enregistrer");
                $("#imgPortrait").attr('src', image_capture);
                $(".close_modal").trigger("click");
                
            });

        } );

    }