function onEvent(name, value1, value2)
	makeLuaSprite('fade', '', -274, -154)
	makeGraphic('fade', 1828, 1028, tostring(value1))
	addLuaSprite('fade',true)
    setObjectCamera('fade', 'other');
	setScrollFactor('fade', 0, 0)
	setProperty('fade.alpha', 1)
    doTweenAlpha('byebye', 'fade', 0, value2, 'linear')
    end
    
    function onTweenCompleted(tag)
        if tag == 'byebye' then
            removeLuaSprite('fade', true);
        end
	end
