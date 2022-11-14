function onUpdate(elapsed)
	if curStep >= 0 then
	  songPos = getSongPosition()
	  local currentBeat = (songPos/1000)*(bpm/200)
	  doTweenY(dadTweenY, 'dad', 100-200*math.sin((currentBeat*0.25)*math.pi),0.001)
	end
  end


  function opponentNoteHit()
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.02');
end