
function onCreate()
	makeLuaSprite('bg','tribulation_backround',-300, -200)
	addLuaSprite('bg',false)
	setLuaSpriteScrollFactor('bg', 0, 0)
	scaleObject('bg', 1.3, 1.3)
	addWavyShader('bg', 2, 4)
end
