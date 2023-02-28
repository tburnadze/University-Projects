//Dialogfeld auf der Startseite. Die Wochenempfehlungen für die Gäste.



jQuery(document).ready(function() {
   jQuery(function() {
    jQuery("#dialog7").dialog({
        autoOpen: false,
        width: 750,
        maxHeight: 600

    });  
  jQuery("#empfehlung").on("click", function() {
        jQuery("#dialog7").dialog("open");
     
        
    });     
     
 
}); 


}); 


