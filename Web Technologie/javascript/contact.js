//Die Senden-Schaltfläche wird erst dann aktiviert, wenn alle Pflichtangaben vom Nutzer angegeben wurden.
// Wenn  alle Felder ausgefüllt, dann wird die Schaltfläche aktiviert.
jQuery(document).ready(function() {
jQuery( ".replay" ||"#firstname" || "#lastname" || "#betreff" || "#message").change(function() {
  jQuery("#contactbutton").removeAttr("disabled");
   
})

  
});


//jQuery Funktion für den Antwortkanal

jQuery(document).ready(function() {

    jQuery("#antwortkanal").change(function() {
        if (jQuery(this).val() == 'Email')
        {
           jQuery('input[name="email"]').show();

        } 
        else {
          jQuery('input[name="email"]').hide();
        }
        if (jQuery(this).val() == 'Mobilfunk')
        {
           jQuery('input[name="mobilfunk"]').show();

        } 
        else {
          jQuery('input[name="mobilfunk"]').hide(); }
        
                if (jQuery(this).val() == 'Festnetzanschluss')
        {
           jQuery('input[name="festnetz"]').show();

        } 
        else {
          jQuery('input[name="festnetz"]').hide(); }
        
        if (jQuery(this).val() == 'Facebook')
        {
           jQuery('input[name="facebook"]').show();

        } 
        else {
          jQuery('input[name="facebook"]').hide(); }

    });
    
});













 