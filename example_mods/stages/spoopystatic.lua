function onCreate()
	makeAnimatedLuaSprite('bg','epitomebg',-300,-300)
	addAnimationByPrefix('bg','staic','static',10,true)
	addLuaSprite('bg',false)
	setLuaSpriteScrollFactor('bg', 0, 0)
end