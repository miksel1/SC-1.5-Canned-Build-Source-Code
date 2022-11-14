local defaultNotePos = {};
local spin = true;
local modchartX = 0;
local modchartY = 0;
local startMod = false;
local increaseChartY = false;
local unfairnessChart = false;
local increaseChartX = false;
local a_bop = false;
local b_bop = false;
 local windowX = 0;
 local windowY = 0;
 local windowXPerm = 0;
 local windowYPerm = 0;
 local windowXscale
 local windowYscale
 local windowXscalePerm
 local windowYscalePerm

 local switch = false;
 local switchScale = false;
 local switchScaleY = false;
function onCreate()
  windowXPerm = getPropertyFromClass('openfl.Lib', 'application.window.x')
  windowYPerm = getPropertyFromClass('openfl.Lib', 'application.window.y')
  windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
  windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')


  windowXscalePerm = 1280
  windowYscalePerm = 720
  windowXscale = 1280
  windowYscale = 720


  setProperty('camGame.zoom', 2)
  doTweenZoom('BEGIN', 'camGame', '0.7', 3, 'quadOut')
  setProperty('camHUD.zoom', 3)
  doTweenZoom('BEGIN2', 'camHUD', '1', 7, 'quadOut')
  spin = false
end


function onSongStart()

   for i = 0,7 do

       x = getPropertyFromGroup('strumLineNotes', i, 'x')

       y = getPropertyFromGroup('strumLineNotes', i, 'y')

       table.insert(defaultNotePos, {x, y})

       --debugPrint("{" .. x .. "," .. y .. "}" .. "i:" .. i)
   end

end


function onUpdate(elapsed)
   songPos = getPropertyFromClass('Conductor', 'songPosition');

   currentBeat = (songPos / 1000) * (bpm / 100)

   if increaseChartY == true then
    modchartY = modchartY + 0.1
  end

  if increaseChartX == true then
    modchartX = modchartX + 0.5
  end
  if(getPropertyFromClass('ClientPrefs', 'windowMove')) then
  windowMove();
  windowZooming();
  end


   if spin == true then
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + modchartX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*0.25) * math.pi))

        end
    end

    if startMod == true then
      noteTweenX(defaultPlayerStrumX0, 4, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 0) * 300), 0.001)
      noteTweenX(defaultPlayerStrumX1, 5, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 1) * 300), 0.001)
      noteTweenX(defaultPlayerStrumX2, 6, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 2) * 300), 0.001)
      noteTweenX(defaultPlayerStrumX3, 7, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 3) * 300), 0.001)
      noteTweenY('defaultPlayerStrumY0', 4, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 0) * 300), 0.001)
      noteTweenY('defaultPlayerStrumY1', 5, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 1) * 300), 0.001)
      noteTweenY('defaultPlayerStrumY2', 6, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 2) * 300), 0.001)
      noteTweenY('defaultPlayerStrumY3', 7, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 3) * 300), 0.001)

      noteTweenX(defaultOpponentStrumX0, 4, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 0) * 300), 0.001)
      noteTweenX(defaultOpponentStrumX1, 5, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 1) * 300), 0.001)
      noteTweenX(defaultOpponentStrumX2, 6, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 2) * 300), 0.001)
      noteTweenX(defaultOpponentStrumX3, 7, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 3) * 300), 0.001)
      noteTweenY('defaultOpponentStrumY0', 4, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 0) * 300), 0.001)
      noteTweenY('defaultOpponentStrumY1', 5, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 1) * 300), 0.001)
      noteTweenY('defaultOpponentStrumY2', 6, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 2) * 300), 0.001)
      noteTweenY('defaultOpponentStrumY3', 7, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 3) * 300), 0.001)
    end


    if curBeat > 65 then
      spin = true
      doTweenZoom('BEGIN', 'camGame', '0.7', 0.1, 'quadOut')
      doTweenZoom('BEGIN2', 'camHUD', '1', 0.3, 'quadOut')
      startMod = true
      increaseChartY = true
      increaseChartX = true
  end

  if modchartY >= 150 then
      increaseChartY = false
  end

  if modchartX >= 100 then
    increaseChartX = false
end

  if curBeat >= 383 then
      a_bop = true
      spin = false
      startMod = true
  end

  if curBeat >= 576 then
      a_bop = false
      spin = true
      startMod = false
  end

  if curStep == 1545 then
    b_bop = true
   end

   if curStep == 2308 then
   if(getPropertyFromClass('ClientPrefs', 'windowMove')) then
    windowY = windowYPerm
    end
    b_bop = false
   end

    
end

function windowMove()
        if windowXPerm - 200 > windowX then
        switch = true
        end
        if windowXPerm + 200 < windowX then 
        switch = false
        end
        if switch == false then
        windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
        setPropertyFromClass('openfl.Lib','application.window.x',windowX - 4)
        end
        if switch == true then
        windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
        setPropertyFromClass('openfl.Lib','application.window.x',windowX + 4)
        end
        
end

function windowZooming()
    if windowXscalePerm - 300 > windowXscale then
        switchScale = true
        end
        if windowXscalePerm + 300 < windowXscale then 
        switchScale = false
        end
        if windowYscalePerm - 300 > windowYscale then
        switchScaleY = true
        end
        if windowYscalePerm + 300 < windowYscale then 
        switchScaleY = false
        end

        
        if switchScale == false then
        windowXscale = windowXscale - 3
        end
        if switchScale == true then
        windowXscale = windowXscale + 3
        end
        if switchScaleY == false then
        windowYscale = windowYscale - 3
        end
        if switchScaleY == true then
        windowYscale = windowYscale + 3
        end

        resizeWindow(windowXscale, windowYscale)
end

function windowShake()
  windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
  windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
  setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-5,5))
  setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.random(-5,5))
end

function opponentNoteHit()
  if a_bop == true then
      triggerEvent('Screen Shake', '0.1, 0.02', '0.1, 0.03');
  end
   if b_bop == true then
   if(getPropertyFromClass('ClientPrefs', 'windowMove')) then
      windowShake()
    end
  end
end


function onDestroy()
end
        function onBeatHit()
            
          if curBeat >= 63 then
            if startMod == false then
              spin = true
                
              setProperty('camGame.zoom', 1)
              setProperty('camHUD.zoom', 6)
            end            
          end

          if curBeat < 50000 then
          
            if curBeat % 2 == 0 then
                    
              setProperty('camHUD.angle',1*-5)
              brj = 1;
            else
              brj = -1;
                    
         
            end
         
                      
            setProperty('camHUD.angle',1*5)
          
            doTweenAngle('turn', 'camHUD', 1, stepCrochet*0.002, 'quadinOut')
            doTweenX('tuin', 'camHUD', -1*8, crochet*0.001, 'quadinOut')
        
            
          end
            
        end

        function noteMiss(direction)
          setProperty('health', getProperty('health') + 0.0025)
          end
          function noteMissPress(direction)
          setProperty('health', getProperty('health') + 0.0025)
          end


        