
function onCreate()
	makeLuaSprite('bg','theorbg',-1000, -500)
	addLuaSprite('bg',false)
	setLuaSpriteScrollFactor('bg', 0, 0)
	scaleObject('bg', 1.5, 1.3)
	addWavyShader('bg', 2, 4)
end
