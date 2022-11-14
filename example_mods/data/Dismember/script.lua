local bop = 1;
local bop2 = 1;

local modchartX = 100;
local modchartY = 90;
local woah = false;
local defaultNotePos = {};

local starting = true;
local starting2 = false;

local firstMod = true;
local secondMod = false;

local anglePlus = 1;

function onCreate()
	setProperty('camHUD.zoom', 10)
end

function onSongStart()
	doTweenZoom('begin', 'camHUD', 1, 0.5, 'quadIn')
	
	for i = 0,7 do 
		x = getPropertyFromGroup('strumLineNotes', i, 'x')
  
		y = getPropertyFromGroup('strumLineNotes', i, 'y')
  
		table.insert(defaultNotePos, {x,y})
	end
end



function onUpdate(elasped)
	anglePlus = anglePlus + 9;
	if secondMod == true then
		for i = 0,7 do
			setPropertyFromGroup('strumLineNotes', i, 'angle', anglePlus)
		end
	end

	songPos = getPropertyFromClass('Conductor', 'songPosition');
 
	currentBeat = (songPos / 1000) * (bpm / 60)
  
	if woah == true then 
		for i = 0,7 do 
			setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + modchartX * math.sin((currentBeat + i*0.25) * math.pi))
			setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.cos((currentBeat + i*2) * math.pi))
		end
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		bop = -bop2;
	else
		bop = bop2;
	end

	if starting == true then
		if curBeat % 4 == 0 then
			setProperty('camHUD.y', -40)
			doTweenY('boop', 'camHUD', camHUD, 0.7, 'quadOut')
			setProperty('camHUD.angle', bop*5.5)
			doTweenAngle('angledGame2', 'camHUD', 0, 0.5, 'quadOut')

			if firstMod == true then
				for i = 0,7 do
					setPropertyFromGroup('strumLineNotes', i, 'angle', anglePlus)
				end
			end

			setProperty('camHUD.zoom', 1.1)
			doTweenZoom('zoomed', 'camHUD', 1, 0.6, 'quadOut')
		end
	else
		if curBeat % 2 == 0 then
			setProperty('camHUD.y', -40)
			doTweenY('boop', 'camHUD', camHUD, 0.7, 'quadOut')

			--for i = 0,7 do
				--setPropertyFromGroup('strumLineNotes', i, 'angle', anglePlus)
			--end
		end
	end

	if starting2 == true then
		if curBeat % 1 == 0 then
			setProperty('camGame.zoom', 1.06)
			doTweenZoom('boop2', 'camGame', 0.9, 0.5, 'quadOut')
			setProperty('camGame.angle', bop*5)
			doTweenAngle('angledGame', 'camGame', 0, 0.5, 'quadOut')
			setProperty('camHUD.angle', bop*5.5)
			doTweenAngle('angledGame2', 'camHUD', 0, 0.6, 'quadOut')
			setProperty('camHUD.zoom', 1.1)
			doTweenZoom('zoomed', 'camHUD', 1, 0.6, 'quadOut')
		end
	end


	if curBeat == 31 then
		woah = true;
		starting = false;
		starting2 = true;
		firstMod = false;
		secondMod = true;
	end
end

function opponentNoteHit()
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
	health = getProperty('health')
	if health > 0.01 then
		setProperty('health', health - 0.01);	
	end
end