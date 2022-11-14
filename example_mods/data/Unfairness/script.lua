local thing = 1

function onStartCountdown()
	setProperty('health', 2)
end

function onUpdate()

	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	noteTweenX(defaultPlayerStrumX0, 4, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 0) * 300), 0.001)
	noteTweenX(defaultPlayerStrumX1, 5, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 1) * 300), 0.001)
	noteTweenX(defaultPlayerStrumX2, 6, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 2) * 300), 0.001)
	noteTweenX(defaultPlayerStrumX3, 7, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 3) * 300), 0.001)
	noteTweenY('defaultPlayerStrumY0', 4, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 0) * 300), 0.001)
	noteTweenY('defaultPlayerStrumY1', 5, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 1) * 300), 0.001)
	noteTweenY('defaultPlayerStrumY2', 6, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 2) * 300), 0.001)
	noteTweenY('defaultPlayerStrumY3', 7, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 3) * 300), 0.001)
	noteTweenX('fake1', 0, ((screenWidth / 2) - (157 / 2)) + (math.sin((songPos/500) + (4) * 2) * 300), 0.0000001)
	noteTweenX('fake2', 1, ((screenWidth / 2) - (157 / 2)) + (math.sin((songPos/500) + (5) * 2) * 300), 0.0000001)
	noteTweenX('fake3', 2, ((screenWidth / 2) - (157 / 2)) + (math.sin((songPos/500) + (6) * 2) * 300), 0.0000001)
	noteTweenX('fake4', 3, ((screenWidth / 2) - (157 / 2)) + (math.sin((songPos/500) + (7) * 2) * 300), 0.0000001)
	noteTweenY('defaultFPlayerStrumY0', 0, ((screenHeight / 2) - (157 / 2)) + (math.cos((songPos/500) + (4) * 2) * 300), 0.0000001)
	noteTweenY('defaultFPlayerStrumY1', 1, ((screenHeight / 2) - (157 / 2)) + (math.cos((songPos/500) + (5) * 2) * 300), 0.0000001)
	noteTweenY('defaultFPlayerStrumY2', 2, ((screenHeight / 2) - (157 / 2)) + (math.cos((songPos/500) + (6) * 2) * 300), 0.0000001)
	noteTweenY('defaultFPlayerStrumY3', 3, ((screenHeight / 2) - (157 / 2)) + (math.cos((songPos/500) + (7) * 2) * 300), 0.0000001)
	if curStep >= 0 then
	  songPos = getSongPosition()
	  local currentBeat = (songPos/1000)*(bpm/300)
	  doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
	end
	setProperty("dad.angle",10+math.cos(currentBeat*math.pi/-8)*7)

	setProperty("gf.x",-1500+math.fmod(currentBeat*100,3200))
	setProperty("gf.angle",currentBeat*10)
	setProperty("gf.scale.x",0.4)
	setProperty("gf.scale.y",0.4)
	setProperty("gf.y",150+math.sin(currentBeat*math.pi/16)*200)

	setProperty("boyfriend.y",400+math.sin(currentBeat*math.pi/32)*100)
end


 
function opponentNoteHit()
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
	health = getProperty('health')
	if health > 0.8 then
		setProperty('health', health - 0.02);	
	end
end



function onCreate()
	setProperty('camGame.zoom', 2)
	setProperty('camHUD.zoom', 4)
	setProperty('camHUD.alpha', 0)
	setPropertyFromClass('ClientPrefs', 'middleScroll', false);
end


function onBeatHit()
	if curBeat > 126 then 
		doTweenAlpha('DramaticEffect', 'camHUD', 1, 2, 'quadOut')
	end

	if curBeat > 127 then
		setProperty('camHUD.alpha', 1)
	end

	if curBeat > 128 then
		thing = thing * -1
		doTweenAngle('turn', 'camHUD', thing * 4, crochet / 1000, 'quadInOut')
	end
end
