local defaultNotePos = {};
local spin = true;
local modchartX = 120;
local modchartY = 50;
local thing = 1

local lmaowindow = true;
local windowX = 200;
local windowY = 100;

function windowLoop(elapsed)
	setPropertyFromClass("openfl.Lib", "application.window.x", defaultWindowPos[1] + WinmovementAmount * math.sin(((getSongPosition() / 1000)*(bpm/100) * Windowspeed) * math.pi))
	setPropertyFromClass("openfl.Lib", "application.window.y", defaultWindowPos[2] + WinmovementAmount * math.cos(((getSongPosition() / 1000)*(bpm/100) * Windowspeed) * math.pi))
	setPropertyFromClass("flixel.FlxG", "fullscreen", false)
end


function opponentNoteHit()
  health = getProperty('health')
  if getProperty('health') > 0.80 then
     setProperty('health', health- 0.03);
  end
  triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.02');
end

function onBeatHit()
    if curBeat >= 60 then
        doTweenZoom('HEHEHARHAR', 'camHUD', '1', 3, 'quadOut')
    end
    
      if curBeat >= 62 then
        thing = thing * -1
        doTweenAngle('turn', 'camHUD', thing * 4, crochet / 1000, 'quadInOut')
      end
end



        function noteMiss(direction)
          setProperty('health', getProperty('health') + 0.0025)
          end
          function noteMissPress(direction)
          setProperty('health', getProperty('health') + 0.0025)
          end

function onCreate()

    setProperty('camGame.zoom', 4)
    doTweenZoom('GRRR', 'camGame', '0.7', 3, 'quadOut')
    setProperty('camHUD.zoom', 7)

end


 function onStartCountdown()
  setProperty('health', 2)
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
  setPropertyFromClass("flixel.FlxG", "fullscreen", false)

  if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/200)
    doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
  end

   songPos = getPropertyFromClass('Conductor', 'songPosition');

   currentBeat = (songPos / 1000) * (bpm / 100)


   if spin == true then
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + modchartX * math.sin((currentBeat + i*1.50) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*2) * math.pi))
        end
    end
  if lmaowindow == true then
    local currentBeat = (songPos/1000)*(bpm/314)
    setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.random(-5,5) + math.sin(currentBeat*2)*40+ (math.sin(currentBeat)*-70))
    setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-5,5,-5,10) + math.sin(currentBeat*2)*300 + (math.sin(currentBeat)*-100) + math.sin(currentBeat*2)*90+ (math.sin(currentBeat)*-30))
  end
end

local blockEnd = true;
function onEndSong()
  if not allowEnd and isStoryMode and not isStoryMode then
    lmaowindow = false;
		allowEnd = true;
  end
end

    


        