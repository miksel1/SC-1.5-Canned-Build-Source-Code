local randomTXT = 8;


function onCreatePost()
    randomTXT = getPropertyFromClass('FlxG.random.int(1, 10)')
end

function onUpdate(elasped)
    if randomTXT == 1 then
        setProperty('botplayTxt.text', "You Bitch")
    elseif randomTXT == 2 then
        setProperty('botplayTxt.text', "Your Fucking Cheating")
    elseif randomTXT == 3 then
        setProperty('botplayTxt.text', "Motherfucker you pressed 7")
    elseif randomTXT == 4 then
        setProperty('botplayTxt.text', "Cope + Ratio")
    elseif randomTXT == 5 then
        setProperty('botplayTxt.text', "Bussy Sussy")
    elseif randomTXT == 6 then
        setProperty('botplayTxt.text', "deez nuts")
    elseif randomTXT == 7 then
        setProperty('botplayTxt.text', "OOF is Sussy")
    elseif randomTXT == 8 then
        setProperty('botplayTxt.text', "Bambi Say: GET THE FUCK OUT OF BOTPLAY")
        runTimer('get fucked bitch', 5, 1)
    elseif randomTXT == 9 then
        setProperty('botplayTxt.text', "yor treash ked")
    elseif randomTXT == 10 then
        setProperty('botplayTxt.text', "Point Made this Script + Watermark")
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'get fucked bitch' then 
        setProperty('botPlay', false)
    end
end



function onResume()
    randomTXT = getPropertyFromClass('FlxG.random.int(1, 10)')
end