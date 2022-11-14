local windowX1 = 0;
local windowY1 = 0;
local windowX2 = 0;
local windowY2 = 0;
local shakevar = 0;
local modchartX1 = 0;
local modchartX2 = 0;
local modchartX3 = 0;
local modchartX4 = 0;
local modchartX5 = 0;
local modchartX6 = 0;
local modchartX7 = 0;
local modchartX8 = 0;
local modchartX9 = 0;
local modchartX10 = 0;
local modchartX11 = 0;
local modchartX12 = 0;
local modchartX13 = 0;
local modchartX14 = 0;
local modchartX15 = 0;
local modchartX16 = 0;
local modchartY1 = 0;
local modchartY2 = 0;
local modchartY3 = 0;
local modchartY4 = 0;
local modchartY5 = 0;
local modchartY6 = 0;
local modchartY7 = 0;
local modchartY8 = 0;
local modchartY9 = 0;
local modchartY10 = 0;
local modchartY11 = 0;
local modchartY12 = 0;
local modchartY13 = 0;
local modchartY14 = 0;
local modchartY15 = 0;
local modchartY16 = 0;
local beatnum = 0;
local windowspeed = 0.03

function onCreate()
  windowX2 = getPropertyFromClass('openfl.Lib', 'application.window.x')
  windowY2 = getPropertyFromClass('openfl.Lib', 'application.window.y')
end

function onUpdate(elapsed)
  songPos = getSongPosition()
  local currentBeat = (songPos/1000)*(bpm/60)
  if curStep >= 0 then
    doTweenY(dadTweenY, 'dad', 290-130*math.sin(currentBeat*0.3),0.01)
  end
  if curStep >= 64 and curStep <= 127 then
    if math.fmod(curStep,64) == 0 and beatnum == 0 then
      modchartX5 = -6
      modchartX6 = -2
      modchartX7 = 2
      modchartX8 = 6
      modchartX13 = -6
      modchartX14 = -2
      modchartX15 = 2
      modchartX16 = 6
      windowX2 = windowX2+2000
      beatnum = 1
    end
    if math.fmod(curStep,64) == 6 and beatnum == 1 then
      modchartX5 = 0
      modchartX6 = 0
      modchartX7 = 0
      modchartX8 = 0
      modchartX13 = 0
      modchartX14 = 0
      modchartX15 = 0
      modchartX16 = 0
      windowX2 = windowX2+2000
      beatnum = 2
    end
    if math.fmod(curStep,64) == 12 and beatnum == 2 then
      modchartX5 = -6
      modchartX6 = -2
      modchartX7 = 2
      modchartX8 = 6
      modchartX13 = -6
      modchartX14 = -2
      modchartX15 = 2
      modchartX16 = 6
      windowX2 = windowX2+2000
      beatnum = 3
    end
    if math.fmod(curStep,64) == 18 and beatnum == 3 then
      modchartX5 = 0
      modchartX6 = 0
      modchartX7 = 0
      modchartX8 = 0
      modchartX13 = 0
      modchartX14 = 0
      modchartX15 = 0
      modchartX16 = 0
      windowX2 = windowX2+2000
      beatnum = 4
    end
    if math.fmod(curStep,64) == 32 and beatnum == 4 then
      modchartX5 = -6
      modchartX6 = -2
      modchartX7 = 2
      modchartX8 = 6
      modchartX13 = -6
      modchartX14 = -2
      modchartX15 = 2
      modchartX16 = 6
      windowX2 = windowX2-2000
      beatnum = 5
    end
    if math.fmod(curStep,64) == 38 and beatnum == 5 then
      modchartX5 = 0
      modchartX6 = 0
      modchartX7 = 0
      modchartX8 = 0
      modchartX13 = 0
      modchartX14 = 0
      modchartX15 = 0
      modchartX16 = 0
      windowX2 = windowX2-2000
      beatnum = 6
    end
    if math.fmod(curStep,64) == 44 and beatnum == 6 then
      modchartX5 = -6
      modchartX6 = -2
      modchartX7 = 2
      modchartX8 = 6
      modchartX13 = -6
      modchartX14 = -2
      modchartX15 = 2
      modchartX16 = 6
      windowX2 = windowX2-2000
      beatnum = 0
    end
  end
  if curStep >= 128 and curStep <= 383 then
    if math.fmod(curStep,16) == 0 then
      modchartX5 = -6
      modchartX6 = -2
      modchartX7 = 2
      modchartX8 = 6
      modchartX13 = -6
      modchartX14 = -2
      modchartX15 = 2
      modchartX16 = 6
    end
    if math.fmod(curStep,16) == 10 then
      modchartX5 = 0
      modchartX6 = 0
      modchartX7 = 0
      modchartX8 = 0
      modchartX13 = 0
      modchartX14 = 0
      modchartX15 = 0
      modchartX16 = 0
      beatnum = 0
    end
  end
  if curStep >= 384 and curStep <= 639 then
    if math.fmod(curStep,64) == 0 and beatnum == 0 then
      modchartX5 = 100
      modchartX6 = 100
      modchartX7 = 100
      modchartX8 = 100
      modchartX13 = 32
      modchartX14 = 32
      modchartX15 = 32
      modchartX16 = 32
      modchartY13 = 10
      modchartY14 = 0
      modchartY15 = 10
      modchartY16 = 0
      shakevar = 60
      beatnum = 1
      windowspeed = 1
      windowX2 = windowX2 - 100
      windowY2 = windowY2 - 100
    end
    if math.fmod(curStep,64) == 6 and beatnum == 1 then
      modchartX13 = 65
      modchartX14 = 43
      modchartX15 = 21
      modchartX16 = -1
      shakevar = 60
      beatnum = 2
      windowX2 = windowX2 + 200
    end
    if math.fmod(curStep,64) == 12 and beatnum == 2 then
      modchartX13 = 32
      modchartX14 = 32
      modchartX15 = 32
      modchartX16 = 32
      shakevar = 60
      beatnum = 3
      windowX2 = windowX2 - 200
      windowY2 = windowY2 + 200
    end
    if math.fmod(curStep,64) == 18 and beatnum == 3 then
      modchartX13 = 65
      modchartX14 = 43
      modchartX15 = 21
      modchartX16 = -1
      shakevar = 60
      beatnum = 4
      windowspeed = 0.05
      windowX2 = windowX2 + 2100
      windowY2 = windowY2 - 100
    end
    if math.fmod(curStep,64) == 32 and beatnum == 4 then
      modchartX5 = -32
      modchartX6 = -32
      modchartX7 = -32
      modchartX8 = -32
      modchartX13 = -100
      modchartX14 = -100
      modchartX15 = -100
      modchartX16 = -100
      modchartY5 = 0
      modchartY6 = 10
      modchartY7 = 0
      modchartY8 = 10
      shakevar = 60
      beatnum = 5
      windowspeed = 1
      windowX2 = windowX2 - 300
    end
    if math.fmod(curStep,64) == 38 and beatnum == 5 then
      modchartY5 = 10
      modchartY6 = 0
      modchartY7 = 10
      modchartY8 = 0
      shakevar = 60
      beatnum = 6
      windowX2 = windowX2 + 600
    end
    if math.fmod(curStep,64) == 44 and beatnum == 6 then
      modchartY5 = 0
      modchartY6 = 10
      modchartY7 = 0
      modchartY8 = 10
      shakevar = 60
      beatnum = 0
      windowspeed = 0.05
      windowX2 = windowX2 - 2300
    end
  end
   if curStep >= 640 and curStep <= 1023 then
    if math.fmod(curStep,16) == 0 then
      modchartX5 = -32
      modchartX6 = -32
      modchartX7 = -32
      modchartX8 = -32
      modchartX13 = 65
      modchartX14 = 43
      modchartX15 = 21
      modchartX16 = -1
      modchartY5 = 10
      modchartY6 = 0
      modchartY7 = 10
      modchartY8 = 0
      modchartY13 = 0
      modchartY14 = 10
      modchartY15 = 0
      modchartY16 = 10
      noteTweenAlpha('gamer0',0,0.35,0.001,linear)
      noteTweenAlpha('gamer1',1,0.35,0.001,linear)
      noteTweenAlpha('gamer2',2,0.35,0.001,linear)
      noteTweenAlpha('gamer3',3,0.35,0.001,linear)
    end
    if math.fmod(curStep,16) == 10 then
      modchartY5 = 0
      modchartY6 = 10
      modchartY7 = 0
      modchartY8 = 10
      modchartY13 = 10
      modchartY14 = 0
      modchartY15 = 10
      modchartY16 = 0
    end
  end
  if curStep >= 1024 then
    modchartX5 = 68
    modchartX6 = 68
    modchartX7 = -132
    modchartX8 = -132
    modchartX13 = 165
    modchartX14 = 143
    modchartX15 = -79
    modchartX16 = -101
  end
  if shakevar >= 1 then
    shakevar = shakevar*0.95
  end
  windowX1 = windowX1+((windowX2-windowX1+1000)*windowspeed)
  windowY1 = windowY1+((windowY2-windowY1+1000)*windowspeed)
  modchartX1 = modchartX1+(modchartX5-modchartX1*0.1)
  modchartX2 = modchartX2+(modchartX6-modchartX2*0.1)
  modchartX3 = modchartX3+(modchartX7-modchartX3*0.1)
  modchartX4 = modchartX4+(modchartX8-modchartX4*0.1)
  modchartY1 = modchartY1+(modchartY5-modchartY1*0.1)
  modchartY2 = modchartY2+(modchartY6-modchartY2*0.1)
  modchartY3 = modchartY3+(modchartY7-modchartY3*0.1)
  modchartY4 = modchartY4+(modchartY8-modchartY4*0.1)
  modchartX9 = modchartX9+(modchartX13-modchartX9*0.1)
  modchartX10 = modchartX10+(modchartX14-modchartX10*0.1)
  modchartX11 = modchartX11+(modchartX15-modchartX11*0.1)
  modchartX12 = modchartX12+(modchartX16-modchartX12*0.1)
  modchartY9 = modchartY9+(modchartY13-modchartY9*0.1)
  modchartY10 = modchartY10+(modchartY14-modchartY10*0.1)
  modchartY11 = modchartY11+(modchartY15-modchartY11*0.1)
  modchartY12 = modchartY12+(modchartY16-modchartY12*0.1)
  noteTweenY('defaultOpponentStrumY0', 0, defaultOpponentStrumY0 + modchartY9, 0.001)
  noteTweenY('defaultOpponentStrumY1', 1, defaultOpponentStrumY1 + modchartY10, 0.001)
  noteTweenY('defaultOpponentStrumY2', 2, defaultOpponentStrumY2 + modchartY11, 0.001)
  noteTweenY('defaultOpponentStrumY3', 3, defaultOpponentStrumY3 + modchartY12, 0.001)
  noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + modchartY1, 0.001)
  noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + modchartY2, 0.001)
  noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + modchartY3, 0.001)
  noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + modchartY4, 0.001)
  noteTweenX('defaultOpponentStrumX0', 0, defaultOpponentStrumX0 + modchartX9, 0.001)
  noteTweenX('defaultOpponentStrumX1', 1, defaultOpponentStrumX1 + modchartX10, 0.001)
  noteTweenX('defaultOpponentStrumX2', 2, defaultOpponentStrumX2 + modchartX11, 0.001)
  noteTweenX('defaultOpponentStrumX3', 3, defaultOpponentStrumX3 + modchartX12, 0.001)
  noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 + modchartX1, 0.001)
  noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 + modchartX2, 0.001)
  noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 + modchartX3, 0.001)
  noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 + modchartX4, 0.001)
  setPropertyFromClass('openfl.Lib','application.window.x',math.fmod(windowX1,2000) - 1000 + math.random((shakevar*-1),shakevar))
  setPropertyFromClass('openfl.Lib','application.window.y',math.fmod(windowY1,2000) - 1000 + math.random((shakevar*-1),shakevar))
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
  cameraShake(game, 0.005, 0.1)
  cameraSetTarget('dad')
  health = getProperty('health')
	if health > 0.2 then
		setProperty('health', health - 0.0025);	
	end
end