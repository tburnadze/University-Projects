// Hier wird das Formular abgesendet, wenn alle Daten volständig sind.



document.getElementById("contactbutton").style.backgroundColor = "grey";
document.getElementById("contactbutton").style.outline = "none";



document.getElementById('myForm').addEventListener (
    "submit", 
    
    function (evt) {

    var submit=true;

    
  if (document.getElementById("firstname").value=="" || document.getElementById("lastname").value=="" || document.getElementById("betreff").value=="" || document.getElementById("message").value==""){
       
          submit=false;
  
  }
    if (document.getElementById("mobilfunk").value=="" && document.getElementById("festnetz").value=="" && document.getElementById("facebook").value=="" && document.getElementById("email").value==""){
         
          submit=false;
       
}
        if(submit==true)
        { 
           document.formarea.submit();
            
           
           document.getElementById("contactbutton").style.backgroundColor = "red";
           
           document.getElementById("contactbutton").style.outline = "auto";
            
           window.setTimeout(function(){location.reload()},5)
        }
      
     




evt.preventDefault();

});



















 