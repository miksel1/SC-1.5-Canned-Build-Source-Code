function opponentNoteHit()
       health = getProperty('health')
    if getProperty('health') > 0.1 then
       setProperty('health', health- 0.009);
  end
end



function onUpdate(elapsed)
  songPos = getSongPosition()
  local currentBeat2 = (songPos/100)*(curBpm/300)
  local currentBeat = (songPos/5000)*(curBpm/60)
  local currentBeat3 = (songPos/1000)*(bpm/120)
  doTweenY('dad', 'dad', 290-130*math.sin((currentBeat3*0.25)*math.pi),0.001)

  noteTweenX(defaultPlayerStrumX0, 4, ((screenWidth / 2) - (78/ 2)) + (math.sin((currentBeat2) + 0) * 78), 0.001)
  noteTweenX(defaultPlayerStrumX1, 5, ((screenWidth / 2) - (78 / 2)) + (math.sin((currentBeat2) + 1) * 78), 0.001)
  noteTweenX(defaultPlayerStrumX2, 6, ((screenWidth / 2) - (78 / 2)) + (math.sin((currentBeat2) + 2) * 78), 0.001)
  noteTweenX(defaultPlayerStrumX3, 7, ((screenWidth / 2) - (78/ 2)) + (math.sin((currentBeat2) + 3) * 78), 0.001)
  noteTweenY('defaultPlayerStrumY0', 4, ((screenHeight / 2) - (157.5 / 2)) + (math.cos((currentBeat2) + 0) * 300), 0.001)
  noteTweenY('defaultPlayerStrumY1', 5, ((screenHeight / 2) - (157.5 / 2)) + (math.cos((currentBeat2) + 1) * 300), 0.001)
  noteTweenY('defaultPlayerStrumY2', 6, ((screenHeight / 2) - (157.5 / 2)) + (math.cos((currentBeat2) + 2) * 300), 0.001)
  noteTweenY('defaultPlayerStrumY3', 7, ((screenHeight / 2) - (157.5 / 2)) + (math.cos((currentBeat2) + 3) * 300), 0.001)
  noteTweenX('fake1', 0, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (4) * 2) * 300), 0.001)
  noteTweenX('fake2', 1, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (5) * 2) * 300), 0.001)
  noteTweenX('fake3', 2, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (6) * 2) * 300), 0.001)
  noteTweenX('fake4', 3, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (7) * 2) * 300), 0.001)
  noteTweenY('defaultFPlayerStrumY0', 0, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + (4) * 2) * 78), 0.001)
  noteTweenY('defaultFPlayerStrumY1', 1, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + (5) * 2) * 78), 0.001)
  noteTweenY('defaultFPlayerStrumY2', 2, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + (6) * 2) * 78), 0.001)
  noteTweenY('defaultFPlayerStrumY3', 3, ((screenHeight / 2) - (78 / 2)) + (math.cos((currentBeat) + (7) * 2) * 78), 0.001)
  function opponentNoteHit(id, direction, noteType, isSustainNote)
  cameraShake(game, 0.015, 0.2)
  cameraSetTarget('dad')
  characterPlayAnim('bf', 'scared', true)
  doTweenZoom('camerazoom','camGame',1.05,0.15,'quadInOut')
  setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
  end
  function goodNoteHit(id, direction, noteType, isSustainNote)
  cameraSetTarget('boyfriend')
  end
  function noteMiss(direction)
  setProperty('health', getProperty('health') + 0.325)
  end
  function noteMissPress(direction)
  setProperty('health', getProperty('health') + 0.025)
  end

  end
  function onBeatHit()
    if curBeat < 989898 then

        if curBeat %1 == 0 then
          doTweenAngle('awtastfraasfasfsafasfsafasfsafasfsaf', 'camGame', -1*153.5, crochet*0.005, 'quadinOut')
          doTweenX('barw', 'camGame', -1*100.5, crochet*0.004, 'quadinOut')
          doTweenY('asdasd', 'camHUD', -1*54, crochet*0.002, 'quadinOut')
        doTweenAngle('Asd', 'camHUD', -1*5.5, crochet*0.001, 'quadinOut')
      doTweenX('tuin', 'camHUD', -1*54, crochet*0.003, 'quadinOut')
    end	
    if curBeat %2 == 0 then
      
      doTweenAngle('awtastfraasfasfsafasfsafasfsafasfsaf', 'camGame', 1*153.5, crochet*0.005, 'quadinOut')
      doTweenX('barw', 'camGame', 1*100.5, crochet*0.004, 'quadinOut')
      doTweenY('asdasd', 'camHUD', 1*54, crochet*0.002, 'quadinOut')
    doTweenAngle('Asd', 'camHUD', 1*5.5, crochet*0.001, 'quadinOut')
    doTweenX('tuin', 'camHUD', 1*54, crochet*0.003, 'quadinOut')
  end	
  end
  end