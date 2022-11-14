local defaultNotePos = {};
local spin = true;
local modchartX = 50;
local modchartY = 30;

function noteMiss(direction)
  setProperty('health', getProperty('health') + 0.025);
  end
  function noteMissPress(direction)
  setProperty('health', getProperty('health') + 0.025);
  end

   local switched = false
function onTimerCompleted()
  if tag == 'heexists' then
		setProperty('dad.alpha', 1);
    setProperty('iconP2.alpha', 1);
    doTweenZoom('hegone', 'camGame', 1.4, 1, 'cubeOut')
    doTweenAlpha('nomorehud', 'camHUD', 0, 2, 'quadOut')
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
function onCreate()
  makeLuaSprite('blankbg','blank2',-400, -400);
	setLuaSpriteScrollFactor('blankbg', 0, 0);
    addLuaSprite('blankbg', true);
    doTweenAlpha('no', 'blankbg', 0, 0.000000000000000000001, 'quadOut')

  setProperty('dad.alpha', 0);
  setProperty('iconP2.alpha', 0);
  doTweenZoom('hegone', 'camGame', 1.4, 1, 'cubeOut')
  setProperty('camHUD.alpha', 0);
  setPropertyFromClass('ClientPrefs', 'middleScroll', false);
end

function onUpdate(elapsed)

  if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/50)
    doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
 end

 songPos = getPropertyFromClass('Conductor', 'songPosition');

 currentBeat = (songPos / 1000) * (bpm / 100)


 if spin == true then
      for i = 0,7 do 
          setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + modchartX * math.sin((currentBeat + i*1.10) * math.pi))
          setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*1.40) * math.pi))
      end
  end

end
function onBeatHit()
  if curBeat >= 64 then
      doTweenZoom('westarting', 'camGame', 0.7, 1, 'quadOut')
      doTweenAlpha('itsback', 'camHUD', 1, 2, 'quadOut')
  end

  if curBeat >= 192 then
    cancelTween('westarting')
    doTweenZoom('spam', 'camGame', 0.6, 1, 'quadOut')
    doTweenAlpha('dontleavehud', 'camHUD', 1, 2, 'quadOut')
  end

  if curBeat >= 319 then
    doTweenZoom('hegone', 'camHUD', 10, 3, 'cubeOut');
      doTweenAlpha('yes', 'blankbg', 1, 3, 'quadOut')
      doTweenAlpha('yes2', 'blankbg2', 1, 3, 'quadOut')
  end
end

function opponentNoteHit()
  health = getProperty('health')
  if getProperty('health') > 0.80 then
     setProperty('health', health- 0.03);
  end
  triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.02');
end

