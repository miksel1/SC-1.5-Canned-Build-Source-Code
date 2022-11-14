function opponentNoteHit(id, direction, noteType, isSustainNote)
  cameraShake(game, 0.015, 0.2)
  cameraSetTarget('dad')
  characterPlayAnim('gf', 'scared', true)
end

function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/50)

    noteTweenX('defaultPlayerStrumX0', 4, ((screenWidth - 850) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * 500), 0.001)
    noteTweenX('defaultPlayerStrumX1', 5, ((screenWidth - 750) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * 500), 0.001)
    noteTweenX('defaultPlayerStrumX2', 6, ((screenWidth - 650) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * 500), 0.001)
    noteTweenX('defaultPlayerStrumX3', 7, ((screenWidth - 550) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * 500), 0.001)
    noteTweenY('defaultPlayerStrumY0', 4, ((screenHeight / 4.2) - (20 / 3)) + (math.cos((currentBeat * 3) + 0) * 180), 0.001)
    noteTweenY('defaultPlayerStrumY1', 5, ((screenHeight / 3.5) - (20 / 2)) + (math.cos((currentBeat * 3) + 0.2) * 150), 0.001)
    noteTweenY('defaultPlayerStrumY2', 6, ((screenHeight / 4.2) - (20 / 3)) + (math.cos((currentBeat * 3) + 0.4) * 180), 0.001)
    noteTweenY('defaultPlayerStrumY3', 7, ((screenHeight / 3.5) - (20 / 2)) + (math.cos((currentBeat * 3) + 0.6) * 150), 0.001)
    
    noteTweenX('defaultoStrumX0', 0, ((getPropertyFromGroup('playerStrums', 2, 'x') - 60) + (20 / 2)) - (math.sin((currentBeat * 3) + 0) * 250), 0.001)
    noteTweenX('defaultoStrumX1', 1, ((getPropertyFromGroup('playerStrums', 2, 'x') - 60) + (20 / 2)) - (math.sin((currentBeat * 3) + 1.5) * 250), 0.001)
    noteTweenX('defaultoStrumX2', 2, ((getPropertyFromGroup('playerStrums', 2, 'x') - 60) + (20 / 2)) - (math.sin((currentBeat * 3) + 3) * 250), 0.001)
    noteTweenX('defaultoStrumX3', 3, ((getPropertyFromGroup('playerStrums', 2, 'x') - 60) + (20 / 2)) - (math.sin((currentBeat * 3) + 4.5) * 250), 0.001)
    noteTweenY('defaultoStrumY0', 0, ((getPropertyFromGroup('playerStrums', 2, 'y') - 0) + (20 / 2)) - (math.sin((currentBeat * 3) + 0) * 250), 0.001)
    noteTweenY('defaultoStrumY1', 1, ((getPropertyFromGroup('playerStrums', 2, 'y') - 0) + (20 / 2)) - (math.sin((currentBeat * 3) + 1.5) * 250), 0.001)
    noteTweenY('defaultoStrumY2', 2, ((getPropertyFromGroup('playerStrums', 2, 'y') - 0) + (20 / 2)) - (math.sin((currentBeat * 3) + 3) * 250), 0.001)
    noteTweenY('defaultoStrumY3', 3, ((getPropertyFromGroup('playerStrums', 2, 'y') - 0) + (20 / 2)) - (math.sin((currentBeat * 3) + 4.5) * 250), 0.001)
    

  if curStep >= 0 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/160)
      doTweenY(dadTweenY, 'dad', 200-700*math.sin((currentBeat*0.70)*math.pi),0.9)
  end
end
