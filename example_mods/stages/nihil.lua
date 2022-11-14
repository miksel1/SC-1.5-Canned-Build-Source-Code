function onCreate()

	makeLuaSprite('bg1','BBBG', -670,-1000)
	addLuaSprite('bg1',false)
	setLuaSpriteScrollFactor('bg1', 0, 0)
	addWavyShader('bg1', 1, 1)
	scaleObject('bg1', 0.9, 0.9)

	makeLuaSprite('bg2','BBG',-680,-500)
	addLuaSprite('bg2',false)
	setLuaSpriteScrollFactor('bg2', 0.1, 0.1)
	addWavyShader('bg2', 3, 3)
	scaleObject('bg2', 2, 2)


	makeLuaSprite('theSky','BG',-700,-600)
	addLuaSprite('theSky',false)
	setLuaSpriteScrollFactor('theSky', 0.3, 0.3)
	addWavyShader('theSky', 5, 5)
	scaleObject('theSky', 1.4, 1.4)

	makeLuaSprite('theGround','FG',-1300,-1200)
	addLuaSprite('theGround',false)
	setLuaSpriteScrollFactor('theGround', 1, 1)

	scaleObject('theGround', 1.5, 1.5)
	
end