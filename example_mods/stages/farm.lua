

function onCreate()

	makeLuaSprite('theBg','sky',-680,-130)
	addLuaSprite('theBg',false)
	setLuaSpriteScrollFactor('theBg', 0.1, 0.1)

	makeLuaSprite('hills','orangey hills', -380, 160)
	addLuaSprite('hills',false)
	setLuaSpriteScrollFactor('hills', 0.3, 0.3)

	makeLuaSprite('farm','funfarmhouse', 80, 200)
	addLuaSprite('farm',false)
	setLuaSpriteScrollFactor('farm', 0.6, 0.6)

	makeLuaSprite('ground','grass lands', -480, 600)
	addLuaSprite('ground',false)
	setLuaSpriteScrollFactor('ground', 1, 1)

	makeLuaSprite('corn1','Cornys', -360, 325)
	addLuaSprite('corn1',false)
	setLuaSpriteScrollFactor('corn1', 1, 1)

	makeLuaSprite('corn2','Cornys', 1060, 325)
	addLuaSprite('corn2',false)
	setLuaSpriteScrollFactor('corn2', 1, 1)

	makeLuaSprite('fence','crazy fences', -350, 450)
	addLuaSprite('fence',false)
	setLuaSpriteScrollFactor('fence', 1, 1)

	makeLuaSprite('sign','Sign', 10, 495)
	addLuaSprite('sign',false)
	setLuaSpriteScrollFactor('sign', 1, 1)


end

