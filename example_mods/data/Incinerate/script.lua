local spin = true;
local defaultNotePos = {};
local modchartY = 70;
local allowCountdown = false;

function onStartCountdown()
	if not allowCountdown and IsStoryMode and not seenCutscene then --Block the first countdown
		startVideo('xcutscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

local blockEnd = true;
function onEndSong()
  if not allowEnd and IsStoryMode and not seenCutscene then
    startVideo('x2');
		allowEnd = true;		
    return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
    makeAnimatedLuaSprite('static','static', -2625,-2000)addAnimationByPrefix('static','aa','statica',24,true)
    objectPlayAnimation('static','aa',false);
    setScrollFactor('static', 0.9, 0.9);
	scaleObject('static', 10, 10);
    doTweenAlpha('alphastatic', 'static', 0.20, 2, 'quadOut')

    makeLuaSprite('blankbg','blankbg',-740,-380);
	setLuaSpriteScrollFactor('blankbg', 0, 0);
    addLuaSprite('blankbg', false);
	scaleObject('blankbg', 2, 2)
    doTweenAlpha('no', 'blankbg', 0, 0.000000000000000000001, 'quadOut')
end

easingstyle = "sineInOut"

function onTweenCompleted(tag)
  songPos = getSongPosition()
	currentBeat = (songPos/1000)*(bpm/60)
  
	notePosX0 = getPropertyFromGroup('opponentStrums', 0, 'x')
	notePosX1 = getPropertyFromGroup('opponentStrums', 1, 'x')
	notePosX2 = getPropertyFromGroup('opponentStrums', 2, 'x')
	notePosX3 = getPropertyFromGroup('opponentStrums', 3, 'x')
	notePosX4 = getPropertyFromGroup('playerStrums', 0, 'x')
	notePosX5 = getPropertyFromGroup('playerStrums', 1, 'x')
	notePosX6 = getPropertyFromGroup('playerStrums', 2, 'x')
	notePosX7 = getPropertyFromGroup('playerStrums', 3, 'x')

	if tag == "0" then
		noteTweenX("1", 0, (notePosX0 - 600), 2, easingstyle)
		noteTweenX("12", 1, (notePosX1 - 600), 2, easingstyle)
		noteTweenX("13", 2, (notePosX2 - 600), 2, easingstyle)
		noteTweenX("14", 3, (notePosX3 - 600), 2, easingstyle)

		noteTweenX("15", 4, (notePosX4 + 600), 2, easingstyle)
		noteTweenX("16", 5, (notePosX5 + 600), 2, easingstyle)
		noteTweenX("17", 6, (notePosX6 + 600), 2, easingstyle)
		noteTweenX("18", 7, (notePosX7 + 600), 2, easingstyle)
	end
	if tag == "1" then
		noteTweenX("0", 0, (notePosX0 + 600), 2, easingstyle)
		noteTweenX("02", 1, (notePosX1 + 600), 2, easingstyle)
		noteTweenX("03", 2, (notePosX2 + 600), 2, easingstyle)
		noteTweenX("04", 3, (notePosX3 + 600), 2, easingstyle)
		noteTweenX("05", 4, (notePosX4 - 600), 2, easingstyle)
		noteTweenX("06", 5, (notePosX5 - 600), 2, easingstyle)
		noteTweenX("07", 6, (notePosX6 - 600), 2, easingstyle)
		noteTweenX("08", 7, (notePosX7 - 600), 2, easingstyle)
	end
end


function onSongStart()
	doTweenZoom('intro','camGame',0.8,crochet*0.064,'sineInOut')

  songPos = getSongPosition()
	currentBeat = (songPos/1000)*(bpm/60)

    notePosX0 = getPropertyFromGroup('opponentStrums', 0, 'x')
	notePosX1 = getPropertyFromGroup('opponentStrums', 1, 'x')
	notePosX2 = getPropertyFromGroup('opponentStrums', 2, 'x')
	notePosX3 = getPropertyFromGroup('opponentStrums', 3, 'x')
	notePosX4 = getPropertyFromGroup('playerStrums', 0, 'x')
	notePosX5 = getPropertyFromGroup('playerStrums', 1, 'x')
	notePosX6 = getPropertyFromGroup('playerStrums', 2, 'x')
	notePosX7 = getPropertyFromGroup('playerStrums', 3, 'x')

	noteTweenX("0", 0, (notePosX0 + 600), 2, easingstyle)
	noteTweenX("02", 1, (notePosX1 + 600), 2, easingstyle)
	noteTweenX("03", 2, (notePosX2 + 600), 2, easingstyle)
	noteTweenX("04", 3, (notePosX3 + 600), 2, easingstyle)
	noteTweenX("05", 4, (notePosX4 - 600), 2, easingstyle)
	noteTweenX("06", 5, (notePosX5 - 600), 2, easingstyle)
	noteTweenX("07", 6, (notePosX6 - 600), 2, easingstyle)
	noteTweenX("08", 7, (notePosX7 - 600), 2, easingstyle)

    for i = 0,7 do

        x = getPropertyFromGroup('strumLineNotes', i, 'x')
  
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
  
        table.insert(defaultNotePos, {x, y})
  
        --debugPrint("{" .. x .. "," .. y .. "}" .. "i:" .. i)
    end
end

function onUpdate()
  doTweenAlpha('nomorehpbar', 'healthBar', 0, 0.000000000000000000001, 'quadOut')
    songPos = getSongPosition()
	currentBeat = (songPos/1000)*(bpm/60)
    setProperty("camHUD.angle",math.sin(currentBeat*math.pi/4)*2)

    if curStep >= 0 then
        songPos = getSongPosition()
        local currentBeat = (songPos/400)*(bpm/100)
        doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.15)*math.pi),0.01)
    end

    function onMoveCamera(focus)
        if focus == 'boyfriend' then
            -- called when the camera focus on boyfriend
        elseif focus == 'dad' then
            setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
        end
    end

    songPos = getPropertyFromClass('Conductor', 'songPosition');

    currentBeat = (songPos / 1000) * (bpm / 240)


    if spin == true then
         for i = 0,7 do 
             setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*2) * math.pi))
         end
    end
end

function onBeatHit()
    local currentBeat = math.floor((songPos/1000)*(bpm/60))
  if curBeat >= 64 then
    doTweenAlpha('gone', 'camHUD', '0', '1', 'quadOut')
  end

  if curBeat >= 71 then
    cancelTween('gone')
    doTweenAlpha('back', 'camHUD', '0.5', '1', 'quadOut')
  end

  if curBeat >= 79 then
    cancelTween('back')
    doTweenAlpha('gone2', 'camHUD', '0', '1', 'quadOut')
  end
  
  if curBeat >= 87 then
    cancelTween('gone2')
    doTweenAlpha('back2', 'camHUD', '0.5', '1', 'quadOut')
  end

  if curBeat >= 92 then
    cancelTween('back2')
    doTweenAlpha('yes', 'blankbg', 1, 0.000000000000000000001, 'quadOut')
    doTweenAlpha('gone3', 'camHUD', '0', '0.000000000000000000001', 'quadOut')
  end

  if curBeat >= 93 then
    cancelTween('gone3')
    doTweenAlpha('no2', 'blankbg', 0, 0.000000000000000000001, 'quadOut')
    doTweenAlpha('back3', 'camHUD', '1', '0.000000000000000000001', 'quadOut')
  end

  if curBeat >= 94 then
    cancelTween('back3')
    doTweenAlpha('yes2', 'blankbg', 1, 0.000000000000000000001, 'quadOut')
    doTweenAlpha('gone4', 'camHUD', '0', '0.000000000000000000001', 'quadOut')
  end
  
  if curBeat >= 95 then
    cancelTween('gone4')
    doTweenAlpha('no3', 'blankbg', 0, 0.000000000000000000001, 'quadOut')
    doTweenAlpha('back4', 'camHUD', '1', '0.000000000000000000001', 'quadOut')
  end

  if curBeat >= 96 then
    if curBeat %1 == 0 then
      doTweenY('ass', 'camHUD', -1*24, crochet*0.003, 'quadinOut')
    doTweenAngle('Asd', 'camHUD', -1*1.5, crochet*0.002, 'quadinOut')
    doTweenX('tuin', 'camHUD', -1*69, crochet*0.001, 'quadinOut')
   end	
    if curBeat %2 == 0 then
    doTweenY('ass', 'camHUD', 1*24, crochet*0.003, 'quadinOut')
   doTweenAngle('Asd', 'camHUD', 1*1.5, crochet*0.002, 'quadinOut')
    doTweenX('tuin', 'camHUD', 2*69, crochet*0.001, 'quadinOut')
   end
   for i = 0,7 do
    noteTweenAngle('spinnywoah' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+720,crochet*0.008-0.01,'expoOut')
   end 
  end
  
  if curBeat >= 464 then
    cancelTween('back4')
    doTweenAlpha('gone7', 'camHUD', '0', '1', 'quadOut')
  end

  if curBeat >= 471 then
    cancelTween('gone7')
    doTweenAlpha('back7', 'camHUD', '0.5', '1', 'quadOut')
  end

  if curBeat >= 479 then
    cancelTween('back7')
    doTweenAlpha('gone8', 'camHUD', '0', '1', 'quadOut')
  end
  
  if curBeat >= 487 then
    cancelTween('gone8')
    doTweenAlpha('back8', 'camHUD', '0.5', '1', 'quadOut')
  end

  if curBeat >= 492 then
    cancelTween('back8')
    cancelTween('back4')
    doTweenAlpha('gone5', 'camHUD', '0', '0.000000000000000000001', 'quadOut')
    doTweenAlpha('yes', 'blankbg', 1, 0.000000000000000000001, 'quadOut')
  end

  if curBeat >= 493 then
    cancelTween('gone5')
    doTweenAlpha('back5', 'camHUD', '1', '0.000000000000000000001', 'quadOut')
    doTweenAlpha('no2', 'blankbg', 0, 0.000000000000000000001, 'quadOut')
  end

  if curBeat >= 494 then
    cancelTween('back5')
    doTweenAlpha('gone6', 'camHUD', '0', '0.000000000000000000001', 'quadOut')
    doTweenAlpha('yes2', 'blankbg', 1, 0.000000000000000000001, 'quadOut')
  end
  
  if curBeat >= 495 then
    cancelTween('gone6')
    doTweenAlpha('back6', 'camHUD', '1', '0.000000000000000000001', 'quadOut')
    doTweenAlpha('no3', 'blankbg', 0, 0.000000000000000000001, 'quadOut')
  end

  if curBeat >= 720 then
    cancelTween('back6')
    doTweenColor("coloBF1", "boyfriend", "FF0000", 1, "linear")
    doTweenColor("colorBR", "dad", "FF0000", 1, "sineInOut")
    doTweenAlpha('gonefinal', 'camHUD', '0', '1', 'quadOut')
    doTweenAlpha('yesfinal', 'blankbg', 1, 1, 'quadOut')
  end
end


function opponentNoteHit()
      health = getProperty('health')
      if getProperty('health') > 0.05 then
          setProperty('health', health- 0.013);
      end
  end
