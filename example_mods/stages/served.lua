function onCreate()
	makeLuaSprite('bg','BALLSGROUND',-160,-90);
	setLuaSpriteScrollFactor('bg', 0, 0);
	addLuaSprite('bg',false)
	scaleObject('bg', 1.3, 1.3)
	addWavyShader('bg', 2, 4)
end