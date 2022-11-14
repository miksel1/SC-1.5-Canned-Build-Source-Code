function onStartCountdown()
    setProperty('health', 2)
    end

    function opponentNoteHit(id, direction, noteType, isSustainNote)
        cameraShake(game, 0.015, 0.2)
        cameraSetTarget('dad')
        characterPlayAnim('gf', 'scared', true)
        doTweenZoom('camerazoom','camGame',1.05,0.15,'quadInOut')
        setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
        end
        function goodNoteHit(id, direction, noteType, isSustainNote)
        cameraSetTarget('boyfriend')
        end
        
        function noteMiss(direction)
        setProperty('health', getProperty('health') + 0.023)
        end
        function noteMissPress(direction)
        setProperty('health', getProperty('health') + 0.023)
        end
        
        function onCreate()
            setPropertyFromClass('ClientPrefs', 'middleScroll', false);
        end
        
    
    function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat2 = (songPos/1000)*(curBpm/50)
    local currentBeat = (songPos/5000)*(curBpm/60)
    setCharacterX('dad',getCharacterX('dad') + (math.sin(currentBeat2) * 1.4))
    setCharacterY('dad',getCharacterY('dad') + (math.cos(currentBeat2) * 1.4))
    function onMoveCamera(focus)
        if focus == 'boyfriend' then
            -- called when the camera focus on boyfriend
        elseif focus == 'dad' then
            setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
        end
    end
    setProperty('camHUD.angle',0 - 5 * math.cos((currentBeat2*0.25)*math.pi) )
    setProperty('camHUD.y',0 - 15 * math.cos((currentBeat2*0.25)*math.pi) )
    setProperty('camHUD.x',0 - 10 * math.sin((currentBeat2*0.25)*math.pi) )
    
    setProperty('camGame.angle',0 - 5 * math.cos((currentBeat2*0.25)*math.pi) )
    setProperty('camGame.y',0 - 15 * math.cos((currentBeat2*0.25)*math.pi) )
    setProperty('camGame.x',0 - 10 * math.sin((currentBeat2*0.25)*math.pi) )
    
    
    local shitStuffX = ((screenWidth - 850) - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * 500)
    local shitStuffY = ((screenHeight / 3.5) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * 150)
    
    noteTweenX('defaultPlayerStrumX0', 4, (shitStuffX - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * 100), 0.001)
    noteTweenX('defaultPlayerStrumX1', 5, (shitStuffX - (20 / 2)) + (math.sin((currentBeat * 3) + 1.5) * 100), 0.001)
    noteTweenX('defaultPlayerStrumX2', 6, (shitStuffX - (20 / 2)) + (math.sin((currentBeat * 3) + 3) * 100), 0.001)
    noteTweenX('defaultPlayerStrumX3', 7, (shitStuffX - (20 / 2)) + (math.sin((currentBeat * 3) + 4.5) * 100), 0.001)
    noteTweenY('defaultPlayerStrumY0', 4, (shitStuffY - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * 100), 0.001)
    noteTweenY('defaultPlayerStrumY1', 5, (shitStuffY - (20 / 2)) + (math.cos((currentBeat * 3) + 1.5) * 100), 0.001)
    noteTweenY('defaultPlayerStrumY2', 6, (shitStuffY - (20 / 2)) + (math.cos((currentBeat * 3) + 3) * 100), 0.001)
    noteTweenY('defaultPlayerStrumY3', 7, (shitStuffY - (20 / 2)) + (math.cos((currentBeat * 3) + 4.5) * 100), 0.001)
    
    
    noteTweenX('defaultoStrumX0', 0, (shitStuffX - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * 250), 0.001)
    noteTweenX('defaultoStrumX1', 1, (shitStuffX - (20 / 2)) + (math.cos((currentBeat * 3) + 1.5) * 250), 0.001)
    noteTweenX('defaultoStrumX2', 2, (shitStuffX - (20 / 2)) + (math.cos((currentBeat * 3) + 3) * 250), 0.001)
    noteTweenX('defaultoStrumX3', 3, (shitStuffX - (20 / 2)) + (math.cos((currentBeat * 3) + 4.5) * 250), 0.001)
    noteTweenY('defaultoStrumY0', 0, (shitStuffY - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * 250), 0.001)
    noteTweenY('defaultoStrumY1', 1, (shitStuffY - (20 / 2)) + (math.sin((currentBeat * 3) + 1.5) * 250), 0.001)
    noteTweenY('defaultoStrumY2', 2, (shitStuffY - (20 / 2)) + (math.sin((currentBeat * 3) + 3) * 250), 0.001)
    noteTweenY('defaultoStrumY3', 3, (shitStuffY - (20 / 2)) + (math.sin((currentBeat * 3) + 4.5) * 250), 0.001)
    end
    