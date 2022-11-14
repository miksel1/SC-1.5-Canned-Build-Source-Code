local funni = true;
local thing = 2
local bop = 1;
local bop2 = 1;
local anglePlus = 1;

function onUpdate(elapsed)
    if curStep >= 0 then
        songPos = getSongPosition()
        local currentBeat = (songPos/2000)*(bpm/90)
        doTweenY(dadTweenY, 'dad', 290-350*math.sin((currentBeat*0.25)*math.pi),0.01)
    end
    
    if funni == true then
    songPos = getSongPosition()
    local currentBeat = (songPos/500)*(curBpm/60)
    local currentBeat2 = (songPos/200)*(curBpm/100)
    setProperty('camFollowPos.x',getProperty('camFollowPos.x') + (math.sin(currentBeat2) * 0.2))
    setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.cos(currentBeat2) * 0.2))
    
    
    noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 550 *math.cos((currentBeat2*0.25)*math.pi),   0.5)
    noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 550 *math.cos((currentBeat2*0.25)*math.pi),    0.5)
    noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 550 *math.cos((currentBeat2*0.25)*math.pi),    0.5)
    noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 550 *math.cos((currentBeat2*0.25)*math.pi),    0.5)
    
    noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 550 *math.cos((currentBeat2*0.25)*math.pi),  0.5)
    noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 550 *math.cos((currentBeat2*0.25)*math.pi),  0.5)
    noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 550 *math.cos((currentBeat2*0.25)*math.pi),  0.5)
    noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 550 *math.cos((currentBeat2*0.25)*math.pi),  0.5)
end
end


function opponentNoteHit(id, direction, noteType, isSustainNote)
    cameraShake(game, 0.0015, 0.15)
    setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
    doTweenZoom('camerazoom','camGame',0.775,0.15,'quadInOut')
    cameraSetTarget('dad')
    end
    function goodNoteHit(id, direction, noteType, isSustainNote)
    cameraShake(game, 0.0015, 0.15)
    doTweenZoom('camerazoom','camGame',0.725,0.15,'quadInOut')
    cameraSetTarget('boyfriend')
    end
    
    function onBeatHit()
        if curBeat % 2 == 0 then
            bop = -bop2;
        else
            bop = bop2;
        end
    
        anglePlus = bop*9;
    
      for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'angle', anglePlus)
      end

     if curBeat >= 0 then
        thing = thing * -1
        doTweenAngle('rotate', 'camHUD', thing * 3, crochet / 1000, 'quadInOut')
        doTweenAngle('rotate2', 'camGame', thing * 3, crochet / 1000, 'quadInOut')
     end

     if curBeat >= 325 then
     doTweenAlpha('no', 'camHUD', 0, 2, 'quadOut')
     setProperty('camGame.zoom', 2)
      thing = thing * -1
      doTweenAngle('rotate', 'camHUD', thing * 0, crochet / 1000, 'quadInOut')
      doTweenAngle('rotate2', 'camGame', thing * 0, crochet / 1000, 'quadInOut')
      bop = false
      bop2 = false
      funni = false
     end
   end
