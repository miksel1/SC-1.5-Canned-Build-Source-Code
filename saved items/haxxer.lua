function onCreate()

makeLuaSprite('thing','ornerybg',-714,-354)
	addLuaSprite('thing',false)
	setLuaSpriteScrollFactor('thing', 0.1, 0.1)

close(true)




	makeAnimatedLuaSprite('theBg','Cubespin',-500,-284)
	addAnimationByPrefix('theBg','move','Speen',30,true)
	addLuaSprite('theBg',false)
	objectPlayAnimation('theBg','move',true)
	setLuaSpriteScrollFactor('theBg', 0.5, 0.5)

	close(true)

end
