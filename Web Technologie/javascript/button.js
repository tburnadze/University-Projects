//3D Schaltflechen. 


// Diashow hat 4 Buttons Play, Stop, Vor und Zurück. 

// 1. Play Button

    Normal = new Image();
    Normal.src = "image/play.png";     
    Highlight = new Image();
    Highlight.src = "image/zu2.png"; 
    Down = new Image();
    Down.src = "image/open2.png"; 
   
   
    
    function Play(Bild) 
     {
      
      document.pbild.src = Bild.src;
     }
  

document.getElementById("play").addEventListener("mouseover",function() {Play(Highlight);});
document.getElementById("play").addEventListener("mousedown",function() {Play(Down);});
document.getElementById("play").addEventListener("mouseout", function() {Play(Normal);});


// 1. Stop Button

    Normal1 = new Image();
    Normal1.src = "image/stop1.png";     
    Highlight1 = new Image();
    Highlight1.src = "image/open.png"; 
    Down1 = new Image();
    Down1.src = "image/zu.png"; 
    
   
    function Stop(Bild) 
     {
      document.sbild.src = Bild.src;
    
     }


document.getElementById("stop").addEventListener("mouseover",function() {Stop(Highlight1);});
document.getElementById("stop").addEventListener("mousedown",function() {Stop(Down1);});
document.getElementById("stop").addEventListener("mouseout", function() {Stop(Normal1);});

// 1. Vor Button

    Normal2 = new Image();
    Normal2.src = "image/vorb.png";     
    Highlight2 = new Image();
    Highlight2.src = "image/vor.png"; 
    Down2 = new Image();
    Down2.src = "image/rotvor.png";
    
   
    function Vor(Bild) 
     {
      document.vbild.src = Bild.src;
    
     }


document.getElementById("vor").addEventListener("mouseover",function() {Vor(Highlight2);});
document.getElementById("vor").addEventListener("mousedown",function() {Vor(Down2);});
document.getElementById("vor").addEventListener("mouseout", function() {Vor(Normal2);});


// 1. Zurück Button


    Normal3 = new Image();
    Normal3.src = "image/zurückb.png";    
    Highlight3 = new Image();
    Highlight3.src = "image/zurück.png"; 
    Down3 = new Image();
    Down3.src = "image/rotzurück.png"; 
    
   
    function Back(Bild) 
     {
      document.zbild.src = Bild.src;
    
     }


document.getElementById("back").addEventListener("mouseover",function() {Back(Highlight3);});
document.getElementById("back").addEventListener("mousedown",function() {Back(Down3);});
document.getElementById("back").addEventListener("mouseout", function() {Back(Normal3);});
























