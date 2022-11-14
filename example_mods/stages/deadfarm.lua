

function onCreate()

	makeLuaSprite('theBg','CloudySky',-680,-130)
	addLuaSprite('theBg',false)
	setLuaSpriteScrollFactor('theBg', 0.1, 0.1)

	makeLuaSprite('hills','tanish_hills', -380, 160)
	addLuaSprite('hills',false)
	setLuaSpriteScrollFactor('hills', 0.3, 0.3)

	makeAnimatedLuaSprite('farm','burningfarmhouse', -30,-20)addAnimationByPrefix('farm','burn','the Haha',24,true)
    objectPlayAnimation('farm','burn',false)
	addLuaSprite('farm',false)
    setScrollFactor('farm', 0.6, 0.6);

	makeLuaSprite('ground','dead_grass_lands', -480, 600)
	addLuaSprite('ground',false)
	setLuaSpriteScrollFactor('ground', 1, 1)

	makeAnimatedLuaSprite('corn1','DeadCornys', -345,395)addAnimationByPrefix('corn1','sway','swaying corn',24,true)
    objectPlayAnimation('corn1','sway',false)
	addLuaSprite('corn1',false)
    setScrollFactor('corn1', 1, 1);
	makeAnimatedLuaSprite('corne','DeadCornys', -445,395)addAnimationByPrefix('corne','sway','swaying corn',24,true)
    objectPlayAnimation('corne','sway',false)
	addLuaSprite('corne',false)
    setScrollFactor('corne', 1, 1);
	makeAnimatedLuaSprite('cornex','DeadCornys', -245,395)addAnimationByPrefix('cornex','sway','swaying corn',24,true)
    objectPlayAnimation('cornex','sway',false)
	addLuaSprite('cornex',false)
    setScrollFactor('cornex', 1, 1);

	makeAnimatedLuaSprite('corn2','DeadCornys', 1085, 395)addAnimationByPrefix('corn2','sway','swaying corn',24,true)
    objectPlayAnimation('corn2','sway',false)
	addLuaSprite('corn2',false)
    setScrollFactor('corn2', 1, 1);
	makeAnimatedLuaSprite('corn22','DeadCornys', 985, 395)addAnimationByPrefix('corn22','sway','swaying corn',24,true)
    objectPlayAnimation('corn22','sway',false)
	addLuaSprite('corn22',false)
    setScrollFactor('corn22', 1, 1);
	makeAnimatedLuaSprite('corn2','DeadCornys', 1085, 395)addAnimationByPrefix('corn2','sway','swaying corn',24,true)
    objectPlayAnimation('corn2','sway',false)
	addLuaSprite('corn2',false)
    setScrollFactor('corn2', 1, 1);
	makeAnimatedLuaSprite('corn222','DeadCornys', 1185, 395)addAnimationByPrefix('corn222','sway','swaying corn',24,true)
    objectPlayAnimation('corn222','sway',false)
	addLuaSprite('corn222',false)
    setScrollFactor('corn222', 1, 1);
	makeAnimatedLuaSprite('corn2222','DeadCornys', 1285, 395)addAnimationByPrefix('corn2222','sway','swaying corn',24,true)
    objectPlayAnimation('corn2222','sway',false)
	addLuaSprite('corn2222',false)
    setScrollFactor('corn2222', 1, 1);

	makeLuaSprite('fence','dead_crazy_fences', -575, 400)
	addLuaSprite('fence',false)
	setLuaSpriteScrollFactor('fence', 1, 1)


end

