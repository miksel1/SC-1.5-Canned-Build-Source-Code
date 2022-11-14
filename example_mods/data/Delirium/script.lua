local windowX = 300;
local windowY = 200;
local var1234 = 5;
local introzoom = 0;
local increasevar = false

function onCreate()
    setProperty('camGame.zoom', 3)
    doTweenZoom('begin', 'camGame', '0.9', 5, 'quadOut')
end

function onUpdate(elapsed)
  songPos = getSongPosition()
  local currentBeat = (songPos/1000)*(bpm/60)
  if introzoom <= 399 then
    introzoom = introzoom + 1
  end
  if curStep >= 0 then
      doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
    end
    if math.fmod(curStep,128) == 0 and increasevar then
     noteTweenX("fake1",0,100*6+125,3,"expoOut")
     noteTweenX("fake2",1,100*5+125,3,"expoOut")
     noteTweenX("fake3",2,100*4+125,3,"expoOut")
     noteTweenX("fake4",3,100*3+125,3,"expoOut")
     noteTweenX('defaultPlayerStrumX0',4,100*3+125,3,"expoOut")
     noteTweenX("defaultPlayerStrumX1",5,100*4+125,3,"expoOut")
     noteTweenX("defaultPlayerStrumX2",6,100*5+125,3,"expoOut")
     noteTweenX("defaultPlayerStrumX3",7,100*6+125,3,"expoOut")
		 doTweenAngle("cameraA", "camHUD", 0+math.floor((curStep/128)+var1234)*360, 3, "expoOut")
     var1234 = var1234+5
     increasevar = false
    end
    if math.fmod(curStep,128) == 64 then
      noteTweenX("fake1",0,100*3+125,3,"expoOut")
      noteTweenX("fake2",1,100*4+125,3,"expoOut")
      noteTweenX("fake3",2,100*5+125,3,"expoOut")
      noteTweenX("fake4",3,100*6+125,3,"expoOut")
      noteTweenX('defaultPlayerStrumX0',4,100*6+125,3,"expoOut")
      noteTweenX("defaultPlayerStrumX1",5,100*5+125,3,"expoOut")
      noteTweenX("defaultPlayerStrumX2",6,100*4+125,3,"expoOut")
      noteTweenX("defaultPlayerStrumX3",7,100*3+125,3,"expoOut")
      doTweenAngle("cameraA", "camHUD", 90+math.floor((curStep/128)+var1234-5)*360, 1.5, "expoOut")
      increasevar = true
     end
     if math.fmod(curStep,128) == 96 then
      doTweenAngle("cameraA", "camHUD", 180+math.floor((curStep/128)+var1234-5)*360, 1.5, "expoOut")
     end
    local currentBeat = (songPos/1000)*(bpm/314)
    setPropertyFromClass('openfl.Lib','application.window.y',windowY + (math.sin(currentBeat)*-50) + math.tan(currentBeat)*50)
    setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-5,5) + math.sin(currentBeat*2)*100 + (math.sin(currentBeat)*-100))
    setPropertyFromClass('openfl.Lib','application.window.width',(introzoom*2) + (math.sin(currentBeat)*200))
    setPropertyFromClass('openfl.Lib','application.window.height',introzoom + (math.sin(currentBeat)*100))
  end

  function opponentNoteHit()
  end

 function onBeatHit()
  if curBeat >= 853 then
    introzoom = introzoom + 1
    windowShake = false
    windowX = false
    windowY = false
    var1234 = false
    increasevar = false
    doTweenAlpha('woah', 'camHUD', 0, 2, 'quadOut')
  end
 end

 function onSongStart()
   noteTweenX("fake1",0,100*6+125,3,"expoOut")
   noteTweenX("fake2",1,100*5+125,3,"expoOut")
   noteTweenX("fake3",2,100*4+125,3,"expoOut")
   noteTweenX("fake4",3,100*3+125,3,"expoOut")
   noteTweenX('defaultPlayerStrumX0',4,100*3+125,3,"expoOut")
   noteTweenX("defaultPlayerStrumX1",5,100*4+125,3,"expoOut")
   noteTweenX("defaultPlayerStrumX2",6,100*5+125,3,"expoOut")
   noteTweenX("defaultPlayerStrumX3",7,100*6+125,3,"expoOut")
 end