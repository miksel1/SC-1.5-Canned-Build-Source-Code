local spin = true;
local defaultNotePos = {};
local modchartY = 70;
local modchartX = 140;
local allowCountdown = false



function onCreate()
    setProperty('dad.alpha', 0)
    setProperty('iconP2.alpha', 0);
    setProperty('camGame.zoom', 2)
    setProperty('camHUD.zoom', 3)
    
        makeAnimatedLuaSprite('static','static', -2625,-2000)addAnimationByPrefix('static','aa','statica',24,true)
        objectPlayAnimation('static','aa',false)
        setScrollFactor('static', 0.9, 0.9);
        scaleObject('static', 10, 10);
        doTweenAlpha('alphastatic', 'static', 0.20, 2, 'quadOut')
    
        makeLuaSprite('blankbg','blankbg',-740,-380);
        setLuaSpriteScrollFactor('blankbg', 0, 0);
        addLuaSprite('blankbg', false);
        scaleObject('blankbg', 2, 2)
 
end

function onSongStart()

    for i = 0,7 do
  
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
  
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
  
        table.insert(defaultNotePos, {x, y})
  
        --debugPrint("{" .. x .. "," .. y .. "}" .. "i:" .. i)
    end
  
  end

  function onUpdate()
      songPos = getSongPosition()
      currentBeat = (songPos/1000)*(bpm/60)
      setProperty("camHUD.angle",math.sin(currentBeat*math.pi/4)*2)

      if curBeat >= 124 then
        if curStep >= 0 then
            songPos = getSongPosition()
            local currentBeat = (songPos/400)*(bpm/100)
            doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.15)*math.pi),0.01)
        end
      end

      if currentBeat >= 187 then
        doTweenZoom('SCAWY', 'camGame', '1', 3, 'quadOut')
        doTweenZoom('SCAWY2', 'camHUD', '2', 7, 'quadOut')
        addLuaSprite('static', true);
     end
  
      function onMoveCamera(focus)
          if focus == 'boyfriend' then
              -- called when the camera focus on boyfriend
          elseif focus == 'dad' then
              setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
          end
      end
  
      songPos = getPropertyFromClass('Conductor', 'songPosition');
  
      currentBeat = (songPos / 1000) * (bpm / 240)
  
  
      if spin == true then
           for i = 0,7 do 
               setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + modchartX * math.sin((currentBeat + i*2) * math.pi))
               setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*0.5) * math.pi))
           end
      end
  end
  


function onBeatHit()
    if curBeat %1 == 0 then
        doTweenY('ass', 'camHUD', -1*44, crochet*0.003, 'quadinOut')
      doTweenAngle('Asd', 'camHUD', -1*2.5, crochet*0.002, 'quadinOut')
      doTweenX('tuin', 'camHUD', -1*70, crochet*0.001, 'quadinOut')
     end	
      if curBeat %2 == 0 then
      doTweenY('ass', 'camHUD', 1*24, crochet*0.004, 'quadinOut')
     doTweenAngle('Asd', 'camHUD', 1*1.5, crochet*0.003, 'quadinOut')
      doTweenX('tuin', 'camHUD', 2*69, crochet*0.002, 'quadinOut')
      end

    if curBeat >= 60 then
        doTweenZoom('BEGIN', 'camGame', '0.7', 3, 'quadOut')
        doTweenZoom('BEGIN2', 'camHUD', '1', 7, 'quadOut')
    end

    if curBeat >= 124 then
        doTweenAlpha('no', 'blankbg', 0, 0.5, 'quadOut')
    end

    if curBeat >= 192 then
        cancelTween('SCAWY')
        cancelTween('SCAWY2')
        doTweenAlpha('alphastatic', 'static', 0, 0.000000000000000000001, 'quadOut')
    end
end
        