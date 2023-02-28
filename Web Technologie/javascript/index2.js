//Zeitabhängiger Inhalt
// Der Text und das Bild wird von 22.02 bis 27.07 jeden Tag geändert.


window.addEventListener ('load', time, false);
    
    function time(){

  
        var jetzt = new Date(),
        
        tag = jetzt.getDate(),
        
        monatZahl = jetzt.getMonth(),

	   text,
       image;
  

    if (monatZahl==1 && tag==22) {
       text = document.getElementById('text2').innerHTML; 
       image = document.getElementById("food-img2").innerHTML; 
     } 
      
    else if (monatZahl==1 && tag==23) {
           text = document.getElementById('text3').innerHTML;
           image = document.getElementById("food-img3").innerHTML;
    } 
      
    else if (monatZahl==1 && tag==24) {
        text = document.getElementById('text4').innerHTML;
        image = document.getElementById("food-img4").innerHTML; 
    
    } 
      
    else if (monatZahl==1 && tag==25) {
       text = document.getElementById('text5').innerHTML;
        image = document.getElementById("food-img5").innerHTML; 
         
    }
    else if (monatZahl==1 && tag==26) {
       text = document.getElementById('text6').innerHTML;
       image = document.getElementById("food-img6").innerHTML; 
         
    }
    else if (monatZahl==1 && tag==27) {
       text = document.getElementById('text6').innerHTML;
       image = document.getElementById("food-img6").innerHTML; 
         
    }
    else {
        text = document.getElementById('text1').innerHTML;
        image = document.getElementById("food-img").innerHTML; 
    }
   document.getElementById("text1").innerHTML = text;
   document.getElementById("food-img").innerHTML = image;
  


}






























