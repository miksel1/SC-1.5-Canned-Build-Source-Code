function onCreate()
	makeLuaSprite('bg','fakerbg',-740,-380);
	setLuaSpriteScrollFactor('bg', 0, 0);
	addLuaSprite('bg',false)
	scaleObject('bg', 2, 2)
	addWavyShader('bg', 2, 4)
end

function onUpdate()
	songPos = getSongPosition()
	currentBeat = (songPos/1000)*(bpm/60)
	setProperty("gf.scale.x",0.4)
	setProperty("gf.scale.y",0.4)
	setProperty("gf.y",150+math.sin(currentBeat*math.pi/16)*200)
	setProperty("gf.x",-1500+math.fmod(currentBeat*100,3200))
	setProperty("gf.angle",currentBeat*10)
end