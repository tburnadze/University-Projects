// Accordion- Darstellung für die Seite Menu.


jQuery(document).ready(function() {  


	jQuery(".menu-button").click(function(){ 
		jQuery(this).next(".dropdown-container").slideToggle(2000); // Hier wird beim Klick auf ".menu-button" die nächste ".dropdown-container" eingeblendet.
		jQuery(this).children(".dropdown-btn").toggleClass("closed open"); // wechselt beim Klick auf ".menu-button" " die Klasse des enthaltenen button-Tags von "closed" zu "open".
	});
   
});
 
