local sineTweenAngleFuckYou = false;
local beatsN_Stuff = false;

local okayFuckYouFr = false;


function onCreate()
	setProperty('camGame.zoom', 10)
	setProperty('camHUD.zoom', 10)

	local windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
	local windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')

	local windowScaleX = getPropertyFromClass('openfl.Lib', 'application.window.scale.x')
	local windowScaleY = getPropertyFromClass('openfl.Lib', 'application.window.scale.y')
	setProperty('dad.alpha', 0)
    setProperty('iconP2.alpha', 0);


end

function onSongStart()
	doTweenZoom('fuck', 'camGame', 0.7, crochet / 900, 'quadOut')
end

function onBeatHit()
	if curBeat == 29 then
		doTweenZoom('fuck2', 'camHUD', 1, crochet / 900, 'quadOut')
	end

	if curBeat == 32 then
		sineTweenAngleFuckYou = true
	end

	if sineTweenAngleFuckYou == true then
		if curBeat % 2 == 0 then
			doTweenAngle('AUHH', 'camHUD', 5, crochet / 1000, 'circInOut')
		else
			doTweenAngle('AUHH2', 'camHUD', -5, crochet / 1000, 'circInOut')
		end
	end

	if beatsN_Stuff == true then
		if curBeat % 2 == 0 then
			setProperty('camHUD.angle', 6)
			setProperty('camHUD.zoom', 0.9)
			doTweenAngle('AUHH', 'camHUD', 0, crochet / 1000, 'expoOut')
			doTweenZoom('69L', 'camHUD', 1, crochet / 1000, 'backOut')
		else
			setProperty('camHUD.angle', -6)
			setProperty('camHUD.zoom', 0.9)
			doTweenAngle('AUHH2', 'camHUD', 0, crochet / 1000, 'expoOut')
			doTweenZoom('69L2', 'camHUD', 1, crochet / 1000, 'backOut')
		end
	end

	if curBeat == 62 then
		sineTweenAngleFuckYou = false
		doTweenAngle('AUHH3', 'camHUD', 0, crochet / 1000, 'quadOut')
	end

	if curBeat == 64 then
		beatsN_Stuff = true
		doTweenAlpha('epitoes', 'dad', 1, 1, 'linear');
		doTweenAlpha('iconz', 'iconP2', 1, 1, 'linear');
		triggerEvent('Screen Shake', '1, 0.09', '1, 0.09');
	end

	if curBeat == 127 then
		for i = 0,3 do
			noteTweenX('fuckYou'..i, i, -2000, crochet / 1000, 'backIn')
		end

	

		--noteTweenX('assBreaker', 5, )
	end

	if curBeat == 128 then
		okayFuckYouFr = true;
	end

	if okayFuckYouFr == true then

	end
end

function onUpdatePost()
	--casually borrows code from gaming man
	if okayFuckYouFr == true then
		notesLength = getProperty('notes.length')
		songPos = getSongPosition()
		local currentBeat = (songPos/1500)*(bpm/60)
		for i1 = 0, notesLength, 1 do
			Thisnotex = getPropertyFromGroup('notes',i1,'x')
			Thisnotey = getPropertyFromGroup('notes',i1,'y')
			Thisnote = getPropertyFromGroup('notes',i1,'noteData')
			Thisnoteoriginx = getPropertyFromGroup('strumLineNotes',Thisnote,'x')
			Thisnoteoriginy = getPropertyFromGroup('strumLineNotes',Thisnote,'y')
			setPropertyFromGroup('notes',i1,'x',0+(Thisnoteoriginx*10)+math.fmod(math.tan((Thisnotey-Thisnoteoriginy+math.sin((currentBeat+(Thisnote/4))*math.pi/2)*500)*0.0006*math.pi)*50,1400))
			setPropertyFromGroup('notes',i1,'angle',math.tan((Thisnotey-Thisnoteoriginy)*0.0006*math.pi)*-40)
		end
	end
end

function onUpdate(elapsed)

	songPos2 = getSongPosition()
	local currentBeat2 = (songPos2/700)*(bpm/200)  

	if okayFuckYouFr == true then
		

		
	end

	if curStep >= 0 then
	  songPos = getSongPosition()
	  local currentBeat = (songPos/1000)*(bpm/200)
	  doTweenY(dadTweenY, 'dad', 100-200*math.sin((currentBeat*0.25)*math.pi),0.001)
	end
  end



  function opponentNoteHit()
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.02');



end