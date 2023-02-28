// Aufgabe 7: Darstellung komplexer Inhalte: Die einzelnen Textabschnitte des Impressums sollen als Tabs und die der Datenschutzerklärung als Akkordeon dargestellt werden.


//Impressum als Tabs
jQuery(document).ready(function() {  

  jQuery( function() {
  jQuery("#tabs").tabs({
    hide:{effect:"slide", direction:"left"}, //Der Text wird nach links verschoben 
    
});
});


//Datenschutz als Accordion
    
  jQuery( function() {
    jQuery( ".datenschutz" ).accordion({
      collapsible: true, // Es wird die collapsible-Option auf true gesetzt, damit alle Abschnitte zusammenklappbar sind.
     heightStyle: "content" //Durch die Einstellung heightStyle: "content" können die Akkordeonplatten ihre Höhe beibehalten.
    });
  } );
    
    
    
    
});
 
   
    
    