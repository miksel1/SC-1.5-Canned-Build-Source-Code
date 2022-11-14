idot = false;
local defaultNotePos = {};
local idotmod = false;
local arrowMoveX = 30;
local arrowMoveY = 90;
local sevenbop = true;


function onSongStart()
	for i = 0,7 do
		x = getPropertyFromGroup("strumLineNotes", i, "x")

		y = getPropertyFromGroup("strumLineNotes", i, "y")

		table.insert(defaultNotePos, {x,y})

		--debugPrint("(" .. x .. "," .. y .. ")" .. "i: " .. i)
	end
end

local angle = 0

function onTweenCompleted(tag)
	if tag == 'svenx' then
		doTweenX('svenxa', 'sevenflyin', 300, 8)
	end
	if tag == 'svenxa' then
		runTimer('playanim', 9)
		doTweenX('svenx', 'sevenflyin', 1100, 8)
	end
	if tag == 'sveny' then
		doTweenY('davey2', 'sevenflyin', -100, 8)
	end
	if tag == 'svena' then
		doTweenY('sveny', 'sevenflyin', 500, 8)
	end
	if tag == 'sevenspin' then
		angle = angle + 360
		doTweenAngle('sevenspin', 'sevenflyin', 360 + angle, 20)
	end
end

function opponentNoteHit()
    if idot == true then
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
	triggerEvent('Add Camera Zoom', '0.1, 0.01', '0, 0');
	health = getProperty('health')
	if health > 1 then
		setProperty('health', health - 0.01);	
	end
end
end


function onCreate()
	makeAnimatedLuaSprite('sevenflyin', 'sevenfly', 300, 800)
	addAnimationByPrefix('sevenflyin', 'fly', 'fly', 24, false)
	scaleObject('sevenflyin', 0.7, 0.7)
	setProperty('sevenflyin.visible', false)
	addLuaSprite('sevenflyin', false)

	setObjectOrder('dadGroup', 10)
    setProperty('camHUD.zoom', 7)
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('sevenflyin', 'fly', false);
	end

    if curBeat >= 63 then
        doTweenZoom('sevenandidertsongbeliek', 'camHUD', '1', 3, 'quadOut')
    end
end

function onUpdate(elapsed)

	if curBeat == 323 then
        idot = true
        idotmod = true
		setProperty('sevenflyin.visible', true)
		doTweenY('sevenflyin', 'sevenflyin', -100, 0.3, 'cubeOut')
		doTweenAngle('sevenspin', 'sevenflyin', 360, 20)
		runTimer('playanim', 9)
		doTweenX('svenx', 'sevenflyin', 1100, 8)
		doTweenY('sveny', 'sevenflyin', 500, 8)
	end

    
	if idotmod == true then

        songPos = getPropertyFromClass("Conductor", "songPosition");

        currentBeat = (songPos / 1000) * (bpm / 120)

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

