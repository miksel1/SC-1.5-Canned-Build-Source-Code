function onCreate()
	makeLuaSprite('bg','sevenbgdark',-160,-90);
	setLuaSpriteScrollFactor('bg', 0, 0);
	addLuaSprite('bg',false)
	scaleObject('bg', 1.3, 1.3)
	addWavyShader('bg', 5, 9)
end