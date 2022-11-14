local bitchAss = 1;
local bitchBitch = 1;
local modchartX = 0;
local modchartY = 0;
local beathaha = false;
local AlrightFillUp = true;
local AlrightFillUpX = true;

function onCreate()
    setProperty('camHUD.zoom', 6)
    doTweenZoom('begin', 'camHUD', 1, 3.5, 'cubeInOut')
    setPropertyFromClass('GameOverSubstate', 'characterName', 'oppobf'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'expunged_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end

function onUpdate(elasped)
    if curStep >= 0 then
        songPos = getSongPosition()
        local currentBeat = (songPos/2000)*(bpm/90)
        doTweenY('dadTweenY', 'dad', 290-350*math.sin((currentBeat*0.25)*math.pi),0.01)
        doTweenY('bfTweenY', 'boyfriend', 290-350*math.sin((currentBeat*0.25)*math.pi),0.01)
    end

   for i = 0,3
    do songPos = getSongPosition()
    local currentBeat = (songPos/100)/(curBpm/163)

    noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + modchartY * math.cos((currentBeat+1)+300), 0.001)
    noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + modchartY * math.cos((currentBeat+2)+300), 0.002)
    noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + modchartY * math.cos((currentBeat+3)+300), 0.003)
    noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + modchartY * math.cos((currentBeat+4)+300), 0.004)
    noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 + modchartX * math.sin((currentBeat+1)+300), 0.001)
    noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 + modchartX * math.sin((currentBeat+2)+300), 0.002)
    noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 + modchartX * math.sin((currentBeat+3)+300), 0.003)
    noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 + modchartX * math.sin((currentBeat+4)+300), 0.004)

    noteTweenY('defaultOpponentStrumY0', 0, defaultOpponentStrumY0 - modchartY * math.cos((currentBeat+1)+300), 0.001)
    noteTweenY('defaultOpponentStrumY1', 1, defaultOpponentStrumY1 - modchartY * math.cos((currentBeat+2)+300), 0.002)
    noteTweenY('defaultOpponentStrumY2', 2, defaultOpponentStrumY2 - modchartY * math.cos((currentBeat+3)+300), 0.003)
    noteTweenY('defaultOpponentStrumY3', 3, defaultOpponentStrumY3 - modchartY * math.cos((currentBeat+4)+300), 0.004)
    noteTweenX('defaultOpponentStrumX0', 0, defaultOpponentStrumX0 - modchartX * math.sin((currentBeat+1)+300), 0.001)
    noteTweenX('defaultOpponentStrumX1', 1, defaultOpponentStrumX1 - modchartX * math.sin((currentBeat+2)+300), 0.002)
    noteTweenX('defaultOpponentStrumX2', 2, defaultOpponentStrumX2 - modchartX * math.sin((currentBeat+3)+300), 0.003)
    noteTweenX('defaultOpponentStrumX3', 3, defaultOpponentStrumX3 - modchartX * math.sin((currentBeat+4)+300), 0.004)

    if AlrightFillUpX == true then
        modchartX = modchartX + 0.01
    end
    if AlrightFillUp == true then
        modchartY = modchartY + 0.05
    end

    if modchartX >= 10 then
        AlrightFillUpX = false
    end

    if modchartY >= 35 then
        AlrightFillUp = false
    end
  end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        bitchAss = -bitchBitch;
    else
        bitchAss = bitchBitch;
    end

    --setProperty('camHUD.angle', bitchAss);
    --doTweenAngle('ModchartGoWEEE', 'camHUD', bitchAss*4, stepCrochet*0.005, 'quadOut')

    if beathaha == true then
        setProperty('camHUD.angle', bitchAss);
        doTweenAngle('ModchartGoWEEE', 'camHUD', bitchAss*4, stepCrochet*0.005, 'quadOut')
        setProperty('camHUD.zoom', 1.06)
        doTweenZoom('Beat', 'camHUD', 0.9, 1, 'cubeOut')
        setProperty('camGame.zoom', 1.03)
        doTweenZoom('Beat2', 'camGame', 0.9, 1, 'cubeOut')
    end

    if curBeat >= 3 then
        beathaha = true
    end


    if curBeat >= 97 then
        beathaha = false
        doTweenAngle('ModchartGoWEEE2', 'camHUD', 0, 2, 'quadOut')
    end

    if curBeat >= 100 then
        doTweenZoom('dad?', 'camGame', 1.4, 1, 'cubeOut')
        doTweenAlpha('fuckyouhud', 'camHUD', 0.0001, 1, 'quadOut')
        --beathaha = false
    end

   if curBeat >= 105 then
       cancelTween('dad?')
       doTweenZoom('damn', 'camGame', 0.9, 1, 'quadOut')
       doTweenAlpha('fuckyouhud', 'camHUD', 1, 2, 'quadOut')
    end

    if curBeat >= 121 then
        doTweenZoom('dad?', 'camGame', 1.4, 1, 'cubeOut')
        doTweenAlpha('fuckyouhud', 'camHUD', 0.0001, 1, 'quadOut')
        --beathaha = false
    end

    if curBeat >= 130 then
        doTweenZoom('dad?', 'camGame', 0.9, 1, 'cubeOut')
        doTweenAlpha('fuckyouhud', 'camHUD', 1, 2, 'quadOut')
        --beathaha = false
    end

    if curBeat >= 131 then
        cancelTween('damn')
        cancelTween('fuckofflol')
        cancelTween('ModchartGoWEEE2')
    end

    if curBeat >= 132 then
        beathaha = true
    end

   
    if curBeat >= 228 then
        doTweenAlpha('fuckyouhud', 'camHUD', 0.0001, 1, 'quadOut')
        --beathaha = false
    end
end

function ZoomInBitch()
    doTweenZoom('dad?', 'camGame', 2, 'cubeOut')
end