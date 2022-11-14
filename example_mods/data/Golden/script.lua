

function onCreate()
    doTweenAlpha('camhudvisible', 'camHUD', 0, 0.0000001)
    doTweenAlpha('dadvisible', 'dad', 0, 0.0000001)
    doTweenAlpha('bfvisible', 'boyfriend', 0, 0.0000001)

end

function opponentNoteHit()
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
	health = getProperty('health')
	songPos = getSongPosition()
	local currentBeat = (songPos/300)*(curBpm/100)

 

	if health > 0.01 then
		setProperty('health', health - 0.00001);	
    end
end
function onUpdate()
    local currentBeat = (songPos/5000)*(curBpm/60)
	


	doTweenY(dadTweenY, 'dad', 250*math.sin((currentBeat*0.25)*math.pi),0.001)
    if curBeat >= 1 then
    songPos = getSongPosition()
    local currentBeat2 = (songPos/2500)*(bpm/300)
      local currentBeat = (songPos/1000)*(bpm/300)
      doTweenAngle('a', 'dad', 50*math.cos((currentBeat2*0.25)*math.pi),0.001)
      doTweenY(dadTweenY, 'dad', 250*math.cos((currentBeat*0.25)*math.pi),0.001)
    end
    if curBeat >= 10 then
        doTweenAlpha('camhudvisible', 'camHUD', 1, 3)   
        doTweenAlpha('dadvisible', 'dad', 1, 3)
        doTweenAlpha('bfvisible', 'boyfriend', 1, 3)
    end
    if curBeat >= 31 then
        noteTweenX('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + 300 * math.cos((currentBeat+4 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + 500 * math.cos((currentBeat+5 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + 500 * math.cos((currentBeat+6 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + 300 * math.cos((currentBeat+7 *0.25) * math.pi), 0.01)
    
        noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 + 300 * math.sin((currentBeat+4 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 + 500 * math.sin((currentBeat+5 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 + 500* math.sin((currentBeat+6 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 + 300 * math.sin((currentBeat+7 *0.25) * math.pi), 0.01)
        
        noteTweenX('defaultPlayerSRtrumX0', 0, 'defaultPlayerSStrumX0' + 300 * math.sin((currentBeat+4 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerSRtrumX1', 1, 'defaultPlayerSStrumX1' + 500 * math.sin((currentBeat+5 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerSRtrumX2', 2, 'defaultPlayerSStrumX2' + 500 * math.sin((currentBeat+6 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerSRtrumX3', 3, 'defaultPlayerSStrumX3' + 300 * math.sin((currentBeat+7 *0.25) * math.pi), 0.01)

        noteTweenX('defaultPlayerRStrumY0', 0, 'defaultPlayerSStrumY0' - 300 * math.cos((currentBeat+4 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerRStrumY1', 1, 'defaultPlayerSStrumY1' - 500 * math.cos((currentBeat+5 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerRStrumY2', 2, 'defaultPlayerSStrumY2' - 500 * math.cos((currentBeat+6 *0.25) * math.pi), 0.01)
        noteTweenX('defaultPlayerRStrumY3', 3, 'defaultPlayerSStrumY3' - 300 * math.cos((currentBeat+7 *0.25) * math.pi), 0.01)
    
	noteTweenAngle('defaultPlayerStrum0', 4, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
    noteTweenAngle('defaultPlayerStrum1', 5, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
    noteTweenAngle('defaultPlayerStrum2', 6, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
    noteTweenAngle('defaultPlayerStrum3', 7, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
        
    
	noteTweenAngle('defaultPlayerAStrum0', 0, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
    noteTweenAngle('defaultPlayerAStrum1', 1, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
    noteTweenAngle('defaultPlayerAStrum2', 2, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
    noteTweenAngle('defaultPlayerAStrum3', 3, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
    end
       
end


function goodNoteHit()


    if health > 0.01 then
		setProperty('health', health + 0.025);	
	end
end
