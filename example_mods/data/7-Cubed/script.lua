function onMoveCamera(focus)
    camfocus = (focus)

    if focus == 'boyfriend' then
        setProperty('defaultCamZoom',0.8)
    elseif focus == 'dad' then
        setProperty('defaultCamZoom',0.8)
    end
end

function onUpdate(elapsed)
    setProperty('camHUD.angle', getProperty('camHUD.angle') * 0.9)
    setProperty('camGame.angle', getProperty('camGame.angle') * 0.9)
    if curBeat > 0 and curBeat < 31 then
        setProperty('camHUD.zoom', 3);
    end
    if curBeat == 544 then
        setProperty('camHUD.visible', false);
    end
end
     
function onBeatHit()
    if curBeat > 31 then
        setProperty('camHUD.visible', true);
    end

    if curBeat > 158 then
        setProperty('defaultCamZoom',2)
    end

    if curBeat > 223 then
        setProperty('defaultCamZoom',0.8)
    end

    if curBeat > 31 and curBeat < 160 then
        if alt == false then
            setProperty('camHUD.angle', getProperty('camHUD.angle') + 2)
            setProperty('camGame.angle', getProperty('camGame.angle') - 2)
            alt = true
        else
            setProperty('camHUD.angle', getProperty('camHUD.angle') - 2)
            setProperty('camGame.angle', getProperty('camGame.angle') + 2)
            alt = false
        end
        setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.05)
    end

    if curBeat > 318 then
        setProperty('defaultCamZoom',2)
    end
    

    if curBeat > 223 and curBeat < 320 then
        if alt == false then
            setProperty('camHUD.angle', getProperty('camHUD.angle') + 2)
            setProperty('camGame.angle', getProperty('camGame.angle') - 2)
            alt = true
        else
            setProperty('camHUD.angle', getProperty('camHUD.angle') - 2)
            setProperty('camGame.angle', getProperty('camGame.angle') + 2)
            alt = false
        end
        setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.05)
    end

    
    if curBeat > 327 and curBeat < 480 then
        if alt == false then
            setProperty('camHUD.angle', getProperty('camHUD.angle') + 2)
            setProperty('camGame.angle', getProperty('camGame.angle') - 2)
            alt = true
        else
            setProperty('camHUD.angle', getProperty('camHUD.angle') - 2)
            setProperty('camGame.angle', getProperty('camGame.angle') + 2)
            alt = false
        end
        setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.05)
    end

    if curBeat > 328 then
        setProperty('defaultCamZoom',0.8)
    end
    

    if curBeat > 478 then
        setProperty('defaultCamZoom',2)
    end

    if curBeat > 544 then
        setProperty('defaultCamZoom',0.8)
        setProperty('camHUD.visible', false);
    end

end

function onSongStart()
    alt = false
    setProperty('camHUD.zoom', 3);
end

function onCreate()
    setProperty('camHUD.visible', false);
end
        