//8) Interaktives User Interface: An den Stellen an denen die Website Eingaben von dem Nutzer erwartet, sollen moderne Eingabeformen zum Einsatz kommen. Auf der Website ist dabei mindestens eine Elementanimation, ein Drag & Drop-Element sowie ein modaler Dialog zu realisieren.




// In dieser Funktion werden Die Daten der Reservierungsformulars auf Vollständigkeit und Plausibilität überprüft.

jQuery(document).ready(function() {
test=true;
        jQuery( "#bookingbutton" ).click(function() {
    if (document.getElementById("email2").value=="" && document.getElementById("telefon").value==""){
              alert("Bitte wählen Sie einen Aitwortkanal aus!");
                 jQuery( "#bookingbutton" ).effect( "shake" );
            test=false;
            
          }
           if (document.getElementById("fname").value=="" || document.getElementById("lname").value==""){
                      document.getElementById("fname").style.borderColor="red"
             document.getElementById("lname").style.borderColor="red"
               jQuery( "#bookingbutton" ).effect( "shake" );
          test=false;
            
          }
            
});
});


// Aud der Rerevrvierungsseite haben alle Bilder eigenes Dialogfeld. 

// Das Dialogfeld fur erstes Bild(mit id="dialog1")
 jQuery(document).ready(function() {
   jQuery(function() {
    jQuery("#dialog1").dialog({
        autoOpen: false,
        width: 650,
        maxHeight: 600

    });  
  jQuery("#largerimage1").on("click", function() {
        jQuery("#dialog1").dialog("open");
        
    });     
     
 
}); 


}); 

// Das Dialogfeld fur zweites Bild (mit id="dialog2")
 jQuery(document).ready(function() {
   jQuery(function() {
    jQuery("#dialog2").dialog({
        autoOpen: false,
        width: 650,
        maxHeight: 600

    });  
  jQuery("#largerimage2").on("click", function() {
        jQuery("#dialog2").dialog("open");
    });     
     
 
}); 


}); 


// Das Dialogfeld für das Bild mit (id="dialog3")
 jQuery(document).ready(function() {
   jQuery(function() {
    jQuery("#dialog3").dialog({
        autoOpen: false,
        width: 650,
        maxHeight: 600

    });  
  jQuery("#largerimage3").on("click", function() {
        jQuery("#dialog3").dialog("open");
    });     
     
 
}); 


}); 

// Das Dialogfeld für das Bild mit (id="dialog4")
 jQuery(document).ready(function() {
   jQuery(function() {
    jQuery("#dialog4").dialog({
        autoOpen: false,
        width: 650,
        maxHeight: 600

    });  
  jQuery("#largerimage4").on("click", function() {
        jQuery("#dialog4").dialog("open");
    });     
     
 
}); 


}); 
// Das Dialogfeld für das Bild mit (id="dialog5")
 jQuery(document).ready(function() {
   jQuery(function() {
    jQuery("#dialog5").dialog({
        autoOpen: false,
        width: 650,
        maxHeight: 600

    });  
  jQuery("#largerimage5").on("click", function() {
        jQuery("#dialog5").dialog("open");
    });     
     
 
}); 
}); 





// Drag and Drop function

jQuery(document).ready(function() {
jQuery(function() {    
jQuery("#brunogiacosa").draggable({
  containment : "window",
   
    helper:"clone",
    revert: "invalid",
    cursor: "move",
    accept: "#drop",
    
     
});
      
// Rechteck als Dropbereich, hier werden die droppable Elemente als Text platziert.
jQuery("#drop").droppable({
  drop: function(event, ui) {
    jQuery(this).val(jQuery(this).val()+ui.draggable.text());
  }
});



}); });

   
//Die Bilder mit der Überschrift als daraggable Element. 


jQuery(document).ready(function() {
jQuery(function() {    
jQuery("#chianti").draggable({
  containment : "window",
   
    helper:"clone",
    revert: "invalid",
    cursor: "move",
    accept: "#drop",
    
     
});
      

}); });

 
jQuery(document).ready(function() {
jQuery(function() {    
jQuery("#rosso").draggable({
  containment : "window",
   
    helper:"clone",
    revert: "invalid",
    cursor: "move",
    accept: "#drop",
    
     
});




}); });

 
jQuery(document).ready(function() {
jQuery(function() {    
jQuery("#rose").draggable({
  containment : "window",
   
    helper:"clone",
    revert: "invalid",
    cursor: "move",
    accept: "#drop",
    
     
});



}); });
 
jQuery(document).ready(function() {
jQuery(function() {    
jQuery("#pinotgrigio").draggable({
  containment : "window",
   
    helper:"clone",
    revert: "invalid",
    cursor: "move",
    accept: "#drop"
    
    
});

}); });


 
//Ganz am Ende wird Dialogfenster für Newsletter geöffnet.  

jQuery(document).ready(function() {

jQuery("#dialog").dialog({
        autoOpen: false,
    dialogClass: "no-close",
        

    });
    
    jQuery('input[type="checkbox"]').click(function() {
        if (jQuery(this).prop("checked") == true) {          
            jQuery("#dialog").dialog("close");
            document.booking.submit(); 
         
        }
    });
//Nach dem Absenden, wird die Seite neu geladen.
    jQuery("#dialog").dialog({
        beforeClose: function(event, ui) {
          
                 window.setTimeout(function(){location.reload()},5) 
                event.preventDefault();               
            
        }
    });
      

});

//Reservierungsformular hat 2 Seite, man kann, falls es gewünscht ist, zurückgehen.
 jQuery(document).ready(function() {

  
  jQuery("#raw3").on("click", function() {
        jQuery(".contactdetails2").hide();
            jQuery(".contactdetails1").show();
       jQuery("#scroll").show();
        document.getElementById("raw3").disabled = true;
    });     
     


}); 



