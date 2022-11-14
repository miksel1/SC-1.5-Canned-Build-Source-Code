function onCreate()
	makeLuaSprite('bg','dortas',-290,-200);
	setLuaSpriteScrollFactor('bg', 0, 0);
	addLuaSprite('bg',false)
	scaleObject('bg', 1.3, 1.3)
	addWavyShader('bg', 7, 1)
end