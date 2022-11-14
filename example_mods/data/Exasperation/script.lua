local spin = true;
local defaultNotePos = {};
local modchartX = 120;
local modchartY = 60;
local angleshit = 3;
local anglevar = 3;

local lmaowindow = true;
local windowX = 100;
local windowY = 100;

function windowLoop(elapsed)
	setPropertyFromClass("openfl.Lib", "application.window.x", defaultWindowPos[1] + WinmovementAmount * math.sin(((getSongPosition() / 1000)*(bpm/100) * Windowspeed) * math.pi))
	setPropertyFromClass("openfl.Lib", "application.window.y", defaultWindowPos[2] + WinmovementAmount * math.cos(((getSongPosition() / 1000)*(bpm/100) * Windowspeed) * math.pi))
	setPropertyFromClass("flixel.FlxG", "fullscreen", false)
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
    
    if curStep >= 0 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
      doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
    end

    songPos = getPropertyFromClass('Conductor', 'songPosition');

       currentBeat = (songPos / 1000) * (bpm / 150)
         
         
        if spin == true then
         for i = 0,7 do 
          setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + modchartX * math.sin((currentBeat + i*3) * math.pi))
          setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*200) * math.pi))
        end
  end
  if lmaowindow == true then
    local currentBeat = (songPos/1000)*(bpm/314)
    setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.tan(-5,5,10) + math.tan(currentBeat*2)*90+ (math.sin(currentBeat)*-100))
    setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.sin(-5,5,5,-10) + math.sin(currentBeat*2)*100 + (math.sin(currentBeat)*-500) + math.sin(currentBeat*2)*100+ (math.sin(currentBeat)*-80))
  end
end


function onBeatHit()
    songPos = getSongPosition()
	local currentBeat = math.floor((songPos/1000)*(bpm/60))

    if curBeat > 0 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*10)
        setProperty('camGame.angle',angleshit*10)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*30, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*30, crochet*0.001, 'linear')
    

    noteTweenAngle('notey0', 0, -360, 1.3, 'quintOut');
    noteTweenAngle('notey1', 1, -360, 1.3, 'quintOut');
    noteTweenAngle('notey2', 2, -360, 1.3, 'quintOut');
    noteTweenAngle('notey3', 3, -360, 1.3, 'quintOut');
    
    noteTweenAngle('notey4', 4, -360, 1.3, 'quintOut');
    noteTweenAngle('notey5', 5, -360, 1.3, 'quintOut');
    noteTweenAngle('notey6', 6, -360, 1.3, 'quintOut');
    noteTweenAngle('notey7', 7, -360, 1.3, 'quintOut');
    
    noteTweenAngle('notey8', 0, 360, 1.3, 'quintOut');
    noteTweenAngle('notey9', 1, 360, 1.3, 'quintOut');
    noteTweenAngle('notey10', 2, 360, 1.3, 'quintOut');
    noteTweenAngle('notey11', 3, 360, 1.3, 'quintOut');
    
    noteTweenAngle('notey12', 4, 360, 1.3, 'quintOut');
    noteTweenAngle('notey13', 5, 360, 1.3, 'quintOut');
    noteTweenAngle('notey14', 6, 360, 1.3, 'quintOut');
    noteTweenAngle('notey15', 7, 360, 1.3, 'quintOut');

    end
end

function onStepHit()

    if curStep >= 1677 then
        lmaowindow = false
    end
end