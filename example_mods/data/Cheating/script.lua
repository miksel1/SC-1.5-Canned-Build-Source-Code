local shake = 0
local blink = 0.5
local sinmult = 0
local offset = 0
function onCreate()
	setProperty('skipCountdown',true)
    makeLuaSprite('hpnew1', '', 910, -120)
    makeLuaSprite('hpnew2', '', 615, -120)
    makeLuaSprite('hpnew3', '', 610, -273)
    setObjectCamera('hpnew1', 'HUD')
    setObjectCamera('hpnew2', 'HUD')
    setObjectCamera('hpnew3', 'HUD')
	setProperty('hpnew1.angle',-90)
	setProperty('hpnew2.angle',-90)
	setProperty('hpnew3.angle',90)
	makeGraphic('hpnew1', 40, 295, '00FFFF')
	makeGraphic('hpnew2', 40, 295, '00AA00')
	makeGraphic('hpnew3', 50, 600, '000000')
	addLuaSprite('hpnew3',true)
	addLuaSprite('hpnew1',true)
	addLuaSprite('hpnew2',true)
    setObjectOrder('hpnew1', 2)
    setObjectOrder('hpnew2', 2)
    setObjectOrder('hpnew3', 1)
    makeLuaSprite('epicflash','',0,0)
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    setObjectCamera('epicflash','other')
	addLuaSprite('epicflash',true)
	setProperty('epicflash.alpha',0)
end

function onSongStart()
	doTweenZoom('intro','camGame',0.8,crochet*0.064,'sineInOut')
end

function onBeatHit()
	local currentBeat = math.floor((songPos/1000)*(bpm/60))
	if currentBeat == 640 then
		doTweenY('finalehudy','camHUD',300,crochet*0.008,'sineIn')
		doTweenAngle('finalehudangle','camHUD',-40,crochet*0.008,'linear')
		doTweenAlpha('finalehudalpha','camHUD',0,crochet*0.008,'linear')
		doTweenZoom('finalegamezoom','camGame',1,33,'expoOut')
		for i = 4,7 do
			noteTweenY('finaleNotesY' .. i,i,600+(i*-60),crochet*0.008,'sineIn')
			noteTweenAngle('finaleSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+720,crochet*0.008-0.01,'expoOut')
		end
	end
	if currentBeat == 60 then
		for i = 0,7 do
			noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+360,crochet*0.004-0.01,'expoIn')
			if i < 4 then
				noteTweenX('dropX1' .. i,i,-130,crochet*0.004,'expoIn')
			else
				noteTweenX('dropX1' .. i,i,-20+(i*110),crochet*0.004,'expoIn')
			end
		end
	end
	if currentBeat == 64 then
		doFlash(1,1.5)
	end
	if (currentBeat >= 64 and currentBeat < 256) or (currentBeat >= 384 and currentBeat < 512) or (currentBeat >= 544 and currentBeat < 576) or (currentBeat >= 608 and currentBeat < 640) then
		if math.fmod(currentBeat,2) == 0 then
			for i = 0,7 do
				noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+90,crochet*0.002-0.01,'expoOut')
			end
		end
	end
end

function onStepHit()
	local currentBeat = math.floor((songPos/1000)*(bpm/60))
		local currentStep = math.floor((songPos/1000)*(bpm/15))+offset
	blink = -blink
	if (currentBeat >= 64 and currentBeat < 256) or (currentBeat >= 384 and currentBeat < 512) or (currentBeat >= 544 and currentBeat < 576) or (currentBeat >= 608 and currentBeat < 640) then
		if math.fmod(currentStep,256) == 14 then
			for i = 4,7 do
				noteTweenX('X1-' .. i,i,1190-(i*110),crochet*0.001-0.01,'expoOut')
				noteTweenY('Y1-' .. i,i,60+((math.fmod(i,2)-0.5)*100),crochet*0.001-0.01,'expoOut')
			end
			doTweenX('CX1','camHUD',-80,crochet*0.001-0.01,'expoOut')
		end
		if math.fmod(currentStep,256) == 24 then
			for i = 5,6 do
				noteTweenX('X1-' .. i,i,-20+(i*110),crochet*0.001-0.01,'expoOut')
			end
			for i = 4,7 do
				noteTweenY('Y1-' .. i,i,60+((math.fmod(i,2)-0.5)*-100),crochet*0.001-0.01,'expoOut')
			end
			doTweenX('CX1','camHUD',80,crochet*0.001-0.01,'expoOut')
		end
		if math.fmod(currentStep,256) == 28 then
			noteTweenX('X1-4',4,-20+440,crochet*0.001-0.01,'expoOut')
			noteTweenX('X1-7',7,-20+770,crochet*0.001-0.01,'expoOut')
			for i = 4,7 do
				noteTweenY('Y1-' .. i,i,60,crochet*0.001-0.01,'expoOut')
			end
			doTweenX('CX1','camHUD',0,crochet*0.001-0.01,'expoOut')
		end
		if math.fmod(currentStep,256) == 46 then
			for i = 4,7 do
				noteTweenX('X1-' .. i,i,1190-(i*110),crochet*0.001-0.01,'expoOut')
				noteTweenY('Y1-' .. i,i,60+((math.fmod(i,2)-0.5)*100),crochet*0.001-0.01,'expoOut')
			end
			doTweenX('CX1','camHUD',-80,crochet*0.001-0.01,'expoOut')
		end
		if math.fmod(currentStep,256) == 56 then
			for i = 5,6 do
				noteTweenX('X1-' .. i,i,-20+(i*110),crochet*0.001-0.01,'expoOut')
			end
			for i = 4,7 do
				noteTweenY('Y1-' .. i,i,60+((math.fmod(i,2)-0.5)*-100),crochet*0.001-0.01,'expoOut')
			end
			doTweenX('CX1','camHUD',80,crochet*0.001-0.01,'expoOut')
		end
		if math.fmod(currentStep,256) == 60 then
			noteTweenX('X1-4',4,-20+440,crochet*0.002,'expoOut')
			noteTweenX('X1-7',7,-20+770,crochet*0.002,'expoOut')
			for i = 4,7 do
				noteTweenY('Y1-' .. i,i,60,crochet*0.001-0.01,'expoOut')
			end
			doTweenX('CX1','camHUD',0,crochet*0.001-0.01,'expoOut')
		end
		if math.fmod(currentStep,256) == 64 then
			sinmult = 90
			for i = 4,7 do
				noteTweenX('X1-' .. i,i,1190-(i*110),crochet*0.001-0.01,'expoOut')
			end
		end
		if math.fmod(currentStep,256) == 68 then
			sinmult = -90
			for i = 4,7 do
				noteTweenX('X1-' .. i,i,-20+(i*110),crochet*0.001-0.01,'expoOut')
			end
		end
		if math.fmod(currentStep,256) == 72 then
			sinmult = 90
			for i = 4,7 do
				noteTweenX('X1-' .. i,i,1190-(i*110),crochet*0.001-0.01,'expoOut')
			end
		end
		if math.fmod(currentStep,256) == 76 then
			sinmult = -90
			for i = 4,7 do
				noteTweenX('X1-' .. i,i,-20+(i*110),crochet*0.001-0.01,'expoOut')
			end
		end
		if math.fmod(currentStep,256) >= 80 and math.fmod(currentStep,256) < 96 then
			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes',i,'alpha',0.5+blink)
			end
		end
		if math.fmod(currentStep,256) == 96 then
			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes',i,'alpha',1)
				noteTweenX('X1-' .. i,i,1190-(i*110),crochet*0.001-0.01,'expoOut')
			end
			sinmult = 90
		end
		if math.fmod(currentStep,256) == 100 then
			sinmult = -90
			for i = 4,7 do
				noteTweenX('X1-' .. i,i,-20+(i*110),crochet*0.001-0.01,'expoOut')
			end
		end
		if math.fmod(currentStep,256) == 104 then
			sinmult = 90
			for i = 4,7 do
				noteTweenX('X1-' .. i,i,1190-(i*110),crochet*0.001-0.01,'expoOut')
			end
		end
		if math.fmod(currentStep,256) == 108 then
			sinmult = -90
			for i = 4,7 do
				noteTweenX('X1-' .. i,i,-20+(i*110),crochet*0.001-0.01,'expoOut')
			end
		end
		if math.fmod(currentStep,256) >= 112 and math.fmod(currentStep,256) < 128 then
			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes',i,'alpha',0.5+blink)
			end
		end
		for i2 = 0,15 do
			if math.fmod(currentStep,256) == 128+i2*8 then
				for i = 4,7 do
					setPropertyFromGroup('strumLineNotes',i,'alpha',1)
					noteTweenAlpha('A1-' .. i,i,0,crochet*0.002-0.1,'linear')
				end
			end
		end
		if (math.fmod(currentStep,256) >= 160 and math.fmod(currentStep,256) < 164) or (math.fmod(currentStep,256) >= 168 and math.fmod(currentStep,256) < 172) or (math.fmod(currentStep,256) >= 176 and math.fmod(currentStep,256) < 180) or (math.fmod(currentStep,256) >= 184 and math.fmod(currentStep,256) < 188) then
			for i = 4,7 do
				sinmult = 100
			end
		end
		for i2 = 0,3 do
			if math.fmod(currentStep,256) == 192+i2*8 then
				for i = 4,7 do
					setPropertyFromGroup('strumLineNotes',i,'alpha',1)
					noteTweenAlpha('A1-' .. i,i,0,crochet*0.002-0.03,'linear')
				end
			end
		end
		if (math.fmod(currentStep,256) >= 224 and math.fmod(currentStep,256) < 228) or (math.fmod(currentStep,256) >= 232 and math.fmod(currentStep,256) < 236) or (math.fmod(currentStep,256) >= 240 and math.fmod(currentStep,256) < 244) or (math.fmod(currentStep,256) >= 248 and math.fmod(currentStep,256) < 252) then
			for i = 4,7 do
				sinmult = 100
			end
		end
		if math.fmod(currentStep,256) == 0 then
			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes',i,'alpha',1)
			end
		end
	else
		for i = 4,7 do
			setPropertyFromGroup('strumLineNotes',i,'alpha',1)
		end
	end
end

function onUpdate()
	songPos = getSongPosition()
	currentBeat = (songPos/1000)*(bpm/60)
	shake = shake*0.83
	sinmult = sinmult*0.7
	setProperty("timeBar.alpha",0)
	setProperty("timeTxt.alpha",0)
	setProperty("gf.scale.x",0.4)
	setProperty("gf.scale.y",0.4)
	setProperty("gf.y",150+math.sin(currentBeat*math.pi/16)*200)
	setProperty("dad.y",130+math.sin(currentBeat*math.pi/8)*100)
	setProperty("boyfriend.y",400+math.sin(currentBeat*math.pi/32)*100)
	setProperty("dad.angle",10+math.cos(currentBeat*math.pi/-8)*7)
	setProperty("gf.x",-1500+math.fmod(currentBeat*100,3200))
	setProperty("gf.angle",currentBeat*10)
	setProperty("scoreTxt.alpha",0)
	setProperty("healthBar.alpha", 0)
	setProperty("iconP2.alpha", 0)
	setProperty("iconP1.alpha", 0)
	setProperty("background.scale.x",4+math.sin(currentBeat*math.pi/4)*0.4)
	setProperty("background.scale.y",4+math.cos(currentBeat*math.pi/4)*0.4)
	setProperty("background.x",-900)
	setProperty("background.y",-700+math.sin(currentBeat*math.pi/16)*200)
	if currentBeat < 68 then
		setProperty("background.alpha",(currentBeat-64)/4)
	end
	setProperty("camHUD.angle",math.sin(currentBeat*math.pi/4)*2)
	if currentBeat > 64 then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes',i,'alpha',0.3)
			setPropertyFromGroup('strumLineNotes',i,'x',-75+(6*110)+math.sin((currentBeat+i*4)*math.pi/8)*500)
			setPropertyFromGroup('strumLineNotes',i,'y',60+math.cos((currentBeat+i*4)*math.pi/8)*100)
		end
	end
	if sinmult > 1 or sinmult < -1 then
		for i = 4,7 do
			setPropertyFromGroup('strumLineNotes',i,'y',60+math.sin((currentBeat+i/8)*math.pi*4)*sinmult)
		end
	end
	if (currentBeat > 64 and currentBeat < 256) or (currentBeat > 384 and currentBeat < 512) or (currentBeat > 544 and currentBeat < 576) or (currentBeat > 608 and currentBeat < 640) then
		setProperty("camGame.zoom",(1/((currentBeat/2+0.5)-math.floor(currentBeat/2))*0.1+0.6))
	
		setProperty("camHUD.zoom",(1/((currentBeat/2+0.5)-math.floor(currentBeat/2))*0.1+0.9))
	end
	if currentBeat >= 544 then
		offset = -128
	end
    setProperty('hpnew1.y',-120+math.sin(currentBeat*math.pi*2)*shake)
    setProperty('hpnew2.y',-120+math.sin(currentBeat*math.pi*2)*-shake)
    setProperty('hpnew3.y',-273+math.sin(currentBeat*math.pi*4)*shake)
	hp = getProperty('health')
	setProperty('health',hp+0.002)
    setProperty('hpnew1.scale.y',hp)
    setProperty('hpnew2.scale.y',(1-hp/2)*2)
    setProperty('hpnew1.x',910-(hp*147.5))
    setProperty('hpnew2.x',615-(hp*147.5))
end

function doFlash(brightness,length) --self explanatory
    setProperty('epicflash.alpha',brightness)
    doTweenAlpha('epicparts','epicflash',0,length,'sineOut')
end

function opponentNoteHit()
	setProperty('health',hp-0.016)
end
function goodNoteHit()
	hp = getProperty('health')
	setProperty('health',hp-0.004)
end
function noteMiss()
	setProperty('health',hp-0.5)
	shake = shake+80
end