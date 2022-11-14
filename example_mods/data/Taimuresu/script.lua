local noteDefaultXs = {}
local noteDefaultYs = {}
local noteXs = {}
local noteYs = {}
local windowthingy = true;
local windowX = 300;
local windowY = 200;
local windowscaleX1 = 0
local windowscaleY1 = 0
local windowscaleX2 = 0
local windowscaleY2 = 0
local windowscalemult = -1
local doFlash = true
local doFade = true

function opponentNoteHit(id, direction, noteType, isSustainNote)
	windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
  windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
  setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-25,25))
  setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.random(-10,10))

	cameraShake(game, 0.015, 0.2)
	cameraSetTarget('dad')
	characterPlayAnim('gf', 'scared', true)
	doTweenZoom('camerazoom','camGame',1.05,0.15,'quadInOut')
	setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
	end
	function goodNoteHit(id, direction, noteType, isSustainNote)
	cameraSetTarget('boyfriend')
	end
	
	function noteMiss(direction)
	setProperty('health', getProperty('health') + 0.023)
	end
	function noteMissPress(direction)
	setProperty('health', getProperty('health') + 0.023)
	end

function onCreate()
	makeLuaSprite('blackfade', '', -274, -154)
	makeLuaSprite('whitefade', '', -274, -154)
	makeGraphic('blackfade', 1828, 1028, '000000')
	setScrollFactor('blackfade', 0, 0)
	addLuaSprite('blackfade',true)
	setProperty('blackfade.alpha', 1)
end
function onSongStart()
	doTweenAlpha('fade1','blackfade',0,5,'linear')
	for i = 0,7 do
	  noteDefaultXs[i] = -25+i*110
	  noteDefaultYs[i] = 60
	  noteXs[i] = 0
	  noteYs[i] = 0
	end
	windowscaleX1 = 683
	windowscaleY1 = 384
	windowX = 341.5+windowscaleX1/2
	windowY = 192+windowscaleY1/2
end
function onUpdate()

	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
	setProperty('gf.y',-100+math.sin(currentBeat*math.pi/8)*100)
	setProperty('gf.angle',0+currentBeat*2)
	windowscaleX2 = getPropertyFromClass('openfl.Lib', 'application.window.width')
	windowscaleY2 = getPropertyFromClass('openfl.Lib', 'application.window.height')
	for i = 0,7 do
	  setPropertyFromGroup('strumLineNotes',i,'x',noteDefaultXs[i]+noteXs[i])
	  setPropertyFromGroup('strumLineNotes',i,'y',noteDefaultYs[i]+noteYs[i])
	end
	if currentBeat < 128 then
		for i = 0,7 do
			noteYs[i] = math.sin((currentBeat+(i*7))*math.pi*0.1875)*30
		end
	end
	if currentBeat > 128 and currentBeat < 256 then
		for i = 0,7 do
			noteXs[i] = noteXs[i]*0.95
			noteYs[i] = noteYs[i]*0.95
		end
	end
	if currentBeat > 256 then
		if doFlash then
			setProperty('whitefade.alpha', 1)
			doTweenAlpha('fade3','whitefade',0,1,'linear')
			doFlash = false
		end
		for i = 0,7 do
			noteXs[i] = (i*-110)+605+math.sin((currentBeat+(i))*math.pi/2)*math.sin(currentBeat*math.pi/8)*400
			noteYs[i] = 70+math.cos((currentBeat+(i))*math.pi/2)*math.sin(currentBeat*math.pi/8)*200
		end
	end
	if currentBeat > 0 then
		windowscalemult = windowscalemult*0.95
	end

	if currentBeat > 128 and doFlash and currentBeat < 14 then
		makeGraphic('whitefade', 1828, 1028, 'FFFFFF')
		setScrollFactor('whitefade', 0, 0)
		addLuaSprite('whitefade',true)
		setProperty('whitefade.alpha', 1)
		doTweenAlpha('fade2','whitefade',0.01,2,'linear')
		doFlash = false
	end

	if currentBeat > 220 then
		windowthingy = false
	end
	
	if windowthingy == true then
	local currentBeat = (songPos/1000)*(bpm/600)
	setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.tan(-2,10,10) + math.tan(currentBeat*2)*90+ (math.sin(currentBeat)*-100))
	setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.sin(-20,10,5,-10) + math.sin(currentBeat*2)*300 + (math.tan(currentBeat)*-200) + math.sin(currentBeat*2)*100+ (math.sin(currentBeat)*-80))
    setPropertyFromClass('openfl.Lib','application.window.width',(introzoom*2) + (math.sin(currentBeat)*200))
    setPropertyFromClass('openfl.Lib','application.window.height',introzoom + (math.sin(currentBeat)*100))
end
end

function onBeatHit()
  songPos = getSongPosition()
  local currentBeat = (songPos/1000)*(bpm/60)
  if currentBeat > 64 and currentBeat < 128 then
	if math.fmod(math.floor(currentBeat*2),2) == 0 then
		windowscalemult = 0.05
	end
  end
  if currentBeat > 160 and currentBeat < 256 then
	if math.fmod(math.floor(currentBeat*2)/4,4) == 0 then
		windowscalemult = 0.
		noteYs[0] = -30
		noteYs[1] = 30
		noteYs[2] = -30
		noteYs[3] = 30
		noteYs[4] = -30
		noteYs[5] = 30
		noteYs[6] = -30
		noteYs[7] = 30
		doFlash = true
	end
	if math.fmod(math.floor(currentBeat*2)/4,4) == 1 then
		windowscalemult = 0.03
		noteXs[0] = -45
		noteXs[1] = -15
		noteXs[2] = 15
		noteXs[3] = 45
		noteXs[4] = -45
		noteXs[5] = -15
		noteXs[6] = 15
		noteXs[7] = 45
	end
	if math.fmod(math.floor(currentBeat*2)/4,4) == 2 then
		windowscalemult = 0.12
		noteYs[0] = 50
		noteYs[1] = -50
		noteYs[2] = 50
		noteYs[3] = -50
		noteYs[4] = 50
		noteYs[5] = -50
		noteYs[6] = 50
		noteYs[7] = -50
	end
	if math.fmod(math.floor(currentBeat*2)/4,4) == 3 then
		windowscalemult = 0.03
		noteXs[0] = 330
		noteXs[1] = 110
		noteXs[2] = -110
		noteXs[3] = -330
		noteXs[4] = 330
		noteXs[5] = 110
		noteXs[6] = -110
		noteXs[7] = -330
	end
  end
end
