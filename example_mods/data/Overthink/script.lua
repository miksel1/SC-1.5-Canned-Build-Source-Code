function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/300)*(curBpm/100)
local currentBeat2 = (songPos/1234)*(curBpm/100)
setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 1.6))

function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.015, 0.15)

end
function goodNoteHit(id, direction, noteType, isSustainNote)

cameraShake(game, 0.0015, 0.15)

function noteMiss(direction)
    setProperty('health', getProperty('health') + 0)
    end
    function noteMissPress(direction)
    setProperty('health', getProperty('health') + 0)
    end
end
end
local angleshit = 2;
local anglevar = 2;

local spin = true;
local defaultNotePos = {};
local modchartY = 70;

function onUpdate()
    songPos = getSongPosition()
	currentBeat = (songPos/1000)*(bpm/60)

    if curStep >= 0 then
        songPos = getSongPosition()
        local currentBeat = (songPos/400)*(bpm/100)
        doTweenY(dadTweenY, 'dad', 30-50*math.sin((currentBeat*0.15)*math.pi),0.01)
    end

    songPos = getPropertyFromClass('Conductor', 'songPosition');

    currentBeat = (songPos / 1000) * (bpm / 240)


    if spin == true then
         for i = 0,7 do 
             setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*1.25) * math.pi))
         end
    end
end

function onSongStart()
    for i = 0,7 do

        y = getPropertyFromGroup('strumLineNotes', i, 'y')
  
        table.insert(defaultNotePos, {x, y})
  
        --debugPrint("{" .. x .. "," .. y .. "}" .. "i:" .. i)
    end
end


function onBeatHit()
	if curBeat < 989898 then

    	if curBeat %1 == 0 then
            doTweenY('ass', 'camHUD', -angleshit*48, crochet*0.003, 'quadinOut')
			doTweenAngle('Asd', 'camHUD', -angleshit*3, crochet*0.002, 'quadinOut')
		doTweenX('tuin', 'camHUD', -angleshit*96, crochet*0.001, 'quadinOut')
  end	
  if curBeat %2 == 0 then
    doTweenY('ass', 'camHUD', angleshit*48, crochet*0.003, 'quadinOut')
	doTweenAngle('Asd', 'camHUD', angleshit*3, crochet*0.002, 'quadinOut')
	doTweenX('tuin', 'camHUD', angleshit*96, crochet*0.001, 'quadinOut')
end	
end
end
