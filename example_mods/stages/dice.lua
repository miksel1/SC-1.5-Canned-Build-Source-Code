function onCreate()
	makeLuaSprite('bg','diceworld',-740,-160);
	setLuaSpriteScrollFactor('bg', 0, 0);
	addLuaSprite('bg',false)
	scaleObject('bg', 2, 2)
	addWavyShader('bg', 2, 4)
end