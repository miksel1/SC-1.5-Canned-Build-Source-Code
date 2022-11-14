local defaultNotePos = {};
local modchartX = 90;
local modchartY = 300;

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.80 then
       setProperty('health', health- 0.03);
    end
    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.05');
  end


function noteMiss(direction)
    setProperty('health', getProperty('health') + 0.0025)
    end
    function noteMissPress(direction)
    setProperty('health', getProperty('health') + 0.0025)
end

function onStartCountdown()
    setProperty('health', 2)
end

function onSongStart()

    for i = 0,7 do
 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x, y})
 
    end
 
 end

function onUpdate(elapsed)
    if curStep >= 0 then
        songPos = getSongPosition()
        local currentBeat = (songPos/600)*(bpm/90)
        doTweenY(dadTweenY, 'dad', 100-1000*math.sin((currentBeat*0.25)*math.pi),0.00001)
    end

    songPos = getPropertyFromClass('Conductor', 'songPosition');

    currentBeat = (songPos / 1000) * (bpm / 50)
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
 
         for i = 0,7 do 
             setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + modchartX * math.sin((currentBeat + i*0.90) * math.pi))
             setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*3) * math.pi))
         end
     end
 