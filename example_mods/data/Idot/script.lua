function opponentNoteHit()
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
	triggerEvent('Add Camera Zoom', '0.1, 0.01', '0, 0');
	health = getProperty('health')
	if health > 1 then
		setProperty('health', health - 0.01);	
	end
end

    
	function onUpdate(elapsed)

	  end
  local defaultNotePos = {};
local spin = true;
local arrowMoveX = 30;
local arrowMoveY = 90;

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

	currentBeat = (songPos / 1000) * (bpm / 120)

	if spin == true then
		for i = 0,7 do
			setPropertyFromGroup("strumLineNotes", i, "x", defaultNotePos[i + 1][1] + arrowMoveX * math.cos((currentBeat + i*5.00) * math.pi))
			setPropertyFromGroup("strumLineNotes", i, "y", defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*5.00) * math.pi))

			if curStep >= 0 then
				songPos = getSongPosition()
				local currentBeat = (songPos/1000)*(bpm/200)
				doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
			  end
		end
	end
end