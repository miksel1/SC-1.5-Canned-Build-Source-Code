
function onUpdate(elapsed)
  if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/200)
    doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
  end
end

local angleshit = 2;
local anglevar = 2;
function onBeatHit()
  if curBeat < 300 then
  
    if curBeat % 2 == 0 then
            
    noteTweenX("x1",0,25,1,"quadinOut");
   --("y1",0,25,1,"quadinOut");
 
    noteTweenX("x2",1,25,1,"quadinOut");
   --("y2",1,25,1,"quadinOut");
 
  
    noteTweenX("x3",2,25,1,"quadinOut");
   --("y3",2,25,1,"quadinOut");
   


    noteTweenX("x4",3,25,1,"quadinOut");
   --("y4",3,25,1,"quadinOut");
  
   

    noteTweenX("x5",4,25,1,"quadinOut");
   --("y5",4,25,1,"quadinOut");
  


    noteTweenX("x6",5,25,1,"quadinOut");
   --("y6",5,25,1,"quadinOut");
   

    noteTweenX("x7",6,25,1,"quadinOut");
   --("y7",6,25,1,"quadinOut");
 

    noteTweenX("x8",7,25,1,"quadinOut");
   --("y8",7,25,1,"quadinOut");
  
      angleshit = anglevar;
    else
      angleshit = -anglevar;
            
    noteTweenX("x1",0,25,1,"quadinOut");
   --("y1",0,25,1,"quadinOut");
 
    noteTweenX("x2",1,25,1,"quadinOut");
   --("y2",1,25,1,"quadinOut");
 
  
    noteTweenX("x3",2,25,1,"quadinOut");
   --("y3",2,25,1,"quadinOut");
   


    noteTweenX("x4",3,25,1,"quadinOut");
   --("y4",3,25,1,"quadinOut");
  
   

    noteTweenX("x5",4,25,1,"quadinOut");
   --("y5",4,25,1,"quadinOut");
  


    noteTweenX("x6",5,25,1,"quadinOut");
   --("y6",5,25,1,"quadinOut");
   

    noteTweenX("x7",6,25,1,"quadinOut");
   --("y7",6,25,1,"quadinOut");
 

    noteTweenX("x8",7,25,1,"quadinOut");
   --("y8",7,25,1,"quadinOut");
  
    end
      if curBeat %5 == 0 then
            noteTweenX("x1",0,100,1,"quadinOut");
            --("y1",0,25,1,"quadinOut");
          
             noteTweenX("x2",1,250,1,"quadinOut");
            --("y2",1,25,1,"quadinOut");
          
           
             noteTweenX("x3",2,350,1,"quadinOut");
            --("y3",2,25,1,"quadinOut");
            
         
         
             noteTweenX("x4",3,450,1,"quadinOut");
            --("y4",3,25,1,"quadinOut");
           
            
         
             noteTweenX("x5",4,1600,1,"quadinOut");
            --("y5",4,25,1,"quadinOut");
           
         
         
             noteTweenX("x6",5,1750,1,"quadinOut");
            --("y6",5,25,1,"quadinOut");
            
         
             noteTweenX("x7",6,1850,1,"quadinOut");
            --("y7",6,25,1,"quadinOut");
          
         
             noteTweenX("x8",7,1950,1,"quadinOut");
            --("y8",7,25,1,"quadinOut");
           
                     
             noteTweenX("x1",0,25,1,"quadinOut");
            --("y1",0,25,1,"quadinOut");
          
    
                 end    
              
    setProperty('camHUD.angle',angleshit*3)
  
    doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'quadinOut')
    doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'quadinOut')

    
  end
    
end
