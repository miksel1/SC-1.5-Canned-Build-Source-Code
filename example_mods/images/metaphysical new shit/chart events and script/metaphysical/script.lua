
function onUpdate(elapsed)
  if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/200)
    doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.50)*math.pi),0.01)
  end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
  cameraShake(game, 0.009, 0.1)
  cameraSetTarget('dad')
  health = getProperty('health')
	if health > 0.01 then
		setProperty('health', health - 0.001);	
	end
end