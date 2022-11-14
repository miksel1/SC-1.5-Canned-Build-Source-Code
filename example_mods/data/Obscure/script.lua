
function onUpdate(elapsed)
    songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
local currentBeat2 = (songPos/200)*(curBpm/200)
setProperty('camFollowPos.x',getProperty('camFollowPos.x') + (math.sin(currentBeat2) * 0.2))
setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.cos(currentBeat2) * 0.2))


noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)

noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 250 *math.cos((currentBeat2  *0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)



end

function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.0015, 0.15)
setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
doTweenZoom('camerazoom','camGame',0.775,0.15,'quadInOut')
cameraSetTarget('dad')
end
function goodNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.0015, 0.15)
doTweenZoom('camerazoom','camGame',0.725,0.15,'quadInOut')
cameraSetTarget('boyfriend')
end
function onBeatHit()
	if curBeat < 989898 then

    	if curBeat %1 == 0 then
            doTweenY('ass', 'camHUD', -1*24, crochet*0.003, 'quadinOut')
			doTweenAngle('Asd', 'camHUD', -1*1.5, crochet*0.002, 'quadinOut')
		doTweenX('tuin', 'camHUD', -1*69, crochet*0.001, 'quadinOut')
  end	
  if curBeat %2 == 0 then
    doTweenY('ass', 'camHUD', 1*24, crochet*0.003, 'quadinOut')
	doTweenAngle('Asd', 'camHUD', 1*1.5, crochet*0.002, 'quadinOut')
	doTweenX('tuin', 'camHUD', 1*69, crochet*0.001, 'quadinOut')
end	
end
end