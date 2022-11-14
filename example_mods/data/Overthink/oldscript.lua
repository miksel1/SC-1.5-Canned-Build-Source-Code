function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/300)*(curBpm/100)
local currentBeat2 = (songPos/1234)*(curBpm/100)
setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 1.6))
noteTweenX(defaultPlayerStrumX0, 4, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 0) * 300), 0.001)
noteTweenX(defaultPlayerStrumX1, 5, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 1) * 300), 0.001)
noteTweenX(defaultPlayerStrumX2, 6, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 2) * 300), 0.001)
noteTweenX(defaultPlayerStrumX3, 7, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 3) * 300), 0.001)
noteTweenY('defaultPlayerStrumY0', 4, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + 0) * 150), 0.001)
noteTweenY('defaultPlayerStrumY1', 5, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + 1) * 150), 0.001)
noteTweenY('defaultPlayerStrumY2', 6, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + 2) * 150), 0.001)
noteTweenY('defaultPlayerStrumY3', 7, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + 3) * 150), 0.001)
noteTweenX('fake1', 0, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat2) + (4) * 2) * 300), 0.001)
noteTweenX('fake2', 1, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat2) + (5) * 2) * 300), 0.001)
noteTweenX('fake3', 2, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat2) + (6) * 2) * 300), 0.001)
noteTweenX('fake4', 3, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat2) + (7) * 2) * 300), 0.001)
noteTweenY('defaultFPlayerStrumY0', 0, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + (4) * 2) * 150), 0.001)
noteTweenY('defaultFPlayerStrumY1', 1, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + (5) * 2) * 150), 0.001)
noteTweenY('defaultFPlayerStrumY2', 2, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + (6) * 2) * 150), 0.001)
noteTweenY('defaultFPlayerStrumY3', 3, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + (7) * 2) * 150), 0.001)
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
