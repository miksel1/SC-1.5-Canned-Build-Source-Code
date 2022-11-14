function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)

setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 3.6))

function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.015, 0.15)
cameraSetTarget('dad')
end
function goodNoteHit(id, direction, noteType, isSustainNote)
    cameraSetTarget('bf')
cameraShake(game, 0.0015, 0.15)

function noteMiss(direction)
    setProperty('health', getProperty('health') + 0.0025)
    end
    function noteMissPress(direction)
    setProperty('health', getProperty('health') + 0.0025)
    end
end
end

function onBeatHit()
	if curBeat < 989898 then

    	if curBeat %1 == 0 then
            doTweenY('yeayh', 'camHUD', -1*25, crochet*0.003, 'quadinOut')
			doTweenAngle('yeahh', 'camHUD', -1*3, crochet*0.002, 'quadinOut')
		doTweenX('yeay', 'camHUD', -1*25, crochet*0.001, 'quadinOut')
  end	
  if curBeat %2 == 0 then
    doTweenY('yeayh', 'camHUD', 1*25, crochet*0.003, 'quadinOut')
	doTweenAngle('yeahh', 'camHUD', 1*3, crochet*0.002, 'quadinOut')
	doTweenX('yeay', 'camHUD', 1*25, crochet*0.001, 'quadinOut')
end	
end
end
