function onStartCountdown()
	setProperty('health', 2)
end

function opponentNoteHit()
	health = getProperty('health')
	if getProperty('health') > 0.09 then
	   setProperty('health', health- 0.03);
	end
    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
end


	local defaultNotePos = {};
	local spin = true;
	local arrowMoveX = 300;
	local arrowMoveY = 20;

	function onSongStart()
		for i = 0,7 do
			x = getPropertyFromGroup("strumLineNotes", i, "x")
	
			y = getPropertyFromGroup("strumLineNotes", i, "y")
	
			table.insert(defaultNotePos, {x,y})
	
			--debugPrint("(" .. x .. "," .. y .. ")" .. "i: " .. i)
		end
	end

	function onUpdate(elapsed)

		songPos = getPropertyFromClass("Conductor", "songPosition");

		currentBeat = (songPos / 1000) * (bpm / 175)
	
		if spin == true then
			for i = 0,7 do
				setPropertyFromGroup("strumLineNotes", i, "x", defaultNotePos[i + 1][1] + arrowMoveX * math.cos((currentBeat + i*2.95) * math.pi))
				setPropertyFromGroup("strumLineNotes", i, "y", defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*4) * math.pi))
			end
		end

		if curStep >= 0 then
		  songPos = getSongPosition()
		  local currentBeat = (songPos/1000)*(bpm/110)
		  doTweenY(dadTweenY, 'dad', 50-1000*math.sin((currentBeat*0.25)*math.pi),0.01)
		end
	  end