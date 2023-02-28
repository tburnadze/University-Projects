//8) Interaktives User Interface: An den Stellen an denen die Website Eingaben von dem Nutzer erwartet, sollen moderne Eingabeformen zum Einsatz kommen. Auf der Website ist dabei mindestens eine Elementanimation, ein Drag & Drop-Element sowie ein modaler Dialog zu realisieren.

// In dieser Funktion werden Die Daten der Reservierungsformulars auf Vollständigkeit und Plausibilität überprüft.

 jQuery(".contactdetails2").hide();


document.getElementById('bookingform').addEventListener (
    "submit", 
    function (evt) {

    var check=true;
    var check2=true;
  
    if (document.getElementById("Pnumber").value >10) {
      
      document.getElementById("Pnumber").style.borderColor="red";
         alert("Bitte buchen Sie einen Tisch für bis zu 10 Personen!");
    
      jQuery( "#raw2" ).effect( "shake" );
        
    
        check = false;

      }
        if (document.getElementById("Pnumber").value <=0) {
        alert("Geben Sie bitte eine gültige Zahl ein!");
        check = false;
  
  }

       if (document.getElementById("uhr").value=="uhr0") {
        alert("Bitte wählen Sie eine Uhrzeit aus!");
        check = false;  
        
       }
        
        if(check==true)
        {
           
           
            jQuery(".contactdetails1").hide();
            jQuery(".contactdetails2").show();
            jQuery("#scroll").hide();

        }
          if (document.getElementById("email2").value=="" && document.getElementById("telefon").value==""){
           
            check2=false;
            
          }
           if (document.getElementById("fname").value=="" || document.getElementById("lname").value==""){
          
           check2=false;
            
          }
        
        
        if(check2==true)
        {  jQuery("#dialog").dialog("open");
           
        }


evt.preventDefault();

});




window.onload = function() {
  
      jQuery( ".reservtext" ).effect( "slide",1000 );
};









 














 