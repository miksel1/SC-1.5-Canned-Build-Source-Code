local defaultNotePos = {};
local spin = false;
local modchartX = 100;
local modchartY = 100;
local bop = 1;
local bop2 = 1;
local anglePlus = 1;

function opponentNoteHit()
triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.02');
  health = getProperty('health')
if getProperty('health') > 0.80 then
  setProperty('health', health- 0.02);
end
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

    currentBeat = (songPos / 1000) * (bpm / 100)
 
 
    if spin == true then
         for i = 0,7 do 
             setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + modchartX * math.sin((currentBeat + i*0.75) * math.pi))
             setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*1) * math.pi))
         end
     end
end


function onCreate()
    setProperty("camHUD.alpha", 0)
end

function onBeatHit()
  if curBeat % 2 == 0 then
		bop = -bop2;
	else
		bop = bop2;
  end
  
    anglePlus = bop*79;

  for i = 0,7 do
    setPropertyFromGroup('strumLineNotes', i, 'angle', anglePlus)
  end

if curBeat >= 0 then
    setProperty("camHUD.alpha", 0)
  end

  if curBeat >= 62 then
    doTweenAlpha('higuys', 'camHUD', 1, 2, 'quadOut')
  end

  if curBeat >= 64 then
    setProperty("camHUD.alpha", 1)
    spin = true
  end
end