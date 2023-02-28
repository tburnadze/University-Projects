// Diashow

//Diese Funktion ermöglicht  die Bilder vor- bzw. zurückzuschalten

var current=0;

 jQuery(document).ready(function() {
     jQuery("#vor").click(function() {

vor();
});
     jQuery("#back").click(function() {

back();
});

    jQuery("li.circle").click(function() {
       current = jQuery(".circle").index(this);

    });
});

// Bilder vorschalten

 function vor(){
 jQuery("#diashow").fadeOut("slow", function() {
       jQuery("#vor").show();
    var index2 = current;
     var index2 = index2+1;
     if(index2 >= Bilder.length-1){

    index2=Bilder.length-1
     }




     document.Galeriebilder.src = Bilder[index2];

       current=index2;
      var dot =index2 + 1

   jQuery( "ul .circle:nth-child(" + dot + ")").css("background", "red" );
      jQuery( "ul .circle:nth-child(" + dot + ")").siblings().css("background", "#AC8D00" );
});

jQuery("#diashow").fadeIn("slow");

}



   // Bilder zurückschalten


 function back(){
 jQuery("#diashow").fadeOut("slow", function() {
     var index = current;
     var index = index-1;
     if(index <=-1){
         index = 0;
     }
     document.Galeriebilder.src = Bilder[index];
    var dot = index + 1
     current = index;
   jQuery( "ul .circle:nth-child(" + dot + ")").css("background", "red" );
      jQuery( "ul .circle:nth-child(" + dot + ")").siblings().css("background", "#AC8D00" );
});

        jQuery("#diashow").fadeIn("slow");

}

// Hier werden die Kreise definiert. 
//Hier wird angezeigt wie viele Bilder indgesamt gibt. 
//Man kann hier jedes Bild anzeigen lassen. 

jQuery(document).ready(function() {
    jQuery("#diashow").fadeOut("slow", function() {

        jQuery("li.circle").click(function() {

            var index = jQuery(".circle").index(this);
            var actual = jQuery(this)
            actual.css("background-color", "red");
            jQuery(this).siblings().css("background-color", "#AC8D00");
            document.Galeriebilder.src = Bilder[index];


        });

        jQuery("#diashow").fadeIn("slow");

    });
});



// Bild animation, mit Play- und Stop-Steuerung.

jQuery(document).ready(function() {

    jQuery("#play").click(function() {

        var index = current;
        var number = (index + 1) % Bilder.length;

        (function animate() {
            jQuery("#diashow").fadeOut(1900, function() {


                document.Galeriebilder.src = Bilder[number];
                number++;
                var dot = number
   current = number-1;
   jQuery( "ul .circle:nth-child(" + dot + ")").css("background", "red" );
      jQuery( "ul .circle:nth-child(" + dot + ")").siblings().css("background", "#AC8D00" );

            }).fadeIn(1900, animate);

            jQuery("#stop").click(function() {
                jQuery("#diashow").stop();
                current=number-1;


            });

            jQuery(".circle").click(function() {
                jQuery("#diashow").stop();

            });

            if (number == Bilder.length) {
                jQuery("#diashow").stop(true, true).animate({
                    opacity: '100'});

            }

        })();

    });


});
