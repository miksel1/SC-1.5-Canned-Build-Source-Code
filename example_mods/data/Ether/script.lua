local angleshit = 0;
local anglevar = 0;

local increaseShit = false;
local increaseShit2 = false;
local increaseShi123t = false;

function onUpdate(elapsed)
  if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/130)
    doTweenY(dadTweenY, 'dad', 10*10*math.sin((currentBeat*0.35)*math.pi),0.01)
  end

  if increaseShi123t == true then
    windowX = windowX + 0.50
  end

  if increaseShit == true then
    angleshit = angleshit + 0.05
  end

  if increaseShit2 == true then
    anglevar = anglevar + 0.05
  end
end
function onCreate()
  makeLuaSprite('blackbar', 'blackbar', -400, -400)
setLuaSpriteScrollFactor('blackbar', 0.9, 0.9); 
scaleObject('blackbar', 1, 1);
setObjectCamera('blackbar', 'camHUD')

makeLuaSprite('blackbar2', 'blackbar', -400, 790)
setLuaSpriteScrollFactor('blackbar2', 0.9, 0.9); 
setObjectCamera('blackbar2', 'camHUD')
addLuaSprite('blackbar', true);
addLuaSprite('blackbar2', true);

scaleObject('blackbar2', 1, 1);

  doTweenColor("coloBF1", "boyfriend", "000000", 1, "linear")
  doTweenColor("colorBR", "dad", "000000", 1, "sineInOut")
  doTweenColor("colorGthe", "gf", "000000", 1, "sineInOut")

  makeLuaSprite('white','whiteshit',-740,-380);
	setLuaSpriteScrollFactor('white', 0, 0);
    addLuaSprite('white', false);
	scaleObject('white', 2, 2)
end

function onBeatHit()
  if curBeat >= 0 then
    doTweenY('lolo', 'blackbar', '-200', '1', 'quadOut')
    doTweenY('lolo2', 'blackbar2', '550', '1', 'quadOut')
   
    noteTweenY('strumLineNotes', 0, '150', '1', 'quadOut')
    noteTweenY('strumLineNotes2', 1, '150', '1', 'quadOut')
    noteTweenY('strumLineNotes3', 2, '150', '1', 'quadOut')
    noteTweenY('strumLineNotes4', 3, '150', '1', 'quadOut')
    noteTweenY('strumLineNotes5', 4, '150', '1', 'quadOut')
    noteTweenY('strumLineNotes6', 5, '150', '1', 'quadOut')
    noteTweenY('strumLineNotes7', 6, '150', '1', 'quadOut')
    noteTweenY('strumLineNotes8', 7, '150', '1', 'quadOut')
  end
  if curBeat >= 64 then
    doTweenY('lolo', 'blackbar', '-900', '1', 'quadOut')
    doTweenY('lolo2', 'blackbar2', '950', '1', 'quadOut')

    cancelTween('strumLineNotes')
    cancelTween('strumLineNotes2')
    cancelTween('strumLineNotes3')
    cancelTween('strumLineNotes4')
    cancelTween('strumLineNotes5')
    cancelTween('strumLineNotes6')
    cancelTween('strumLineNotes7')
    cancelTween('strumLineNotes8')

    noteTweenY('strudf', 0, 50, 1, 'quadOut')	
    noteTweenY('dfghu890', 1, 50, 1, 'quadOut')
    noteTweenY('htfhdg', 2, 50, 1, 'quadOut')
    noteTweenY('htdfg', 3, 50, 1, 'quadOut')
    noteTweenY('sdhgdzhfd', 4, 50, 1, 'quadOut')
    noteTweenY('dxhgffgd', 5, 50, 1, 'quadOut')
    noteTweenY('dfhdghdsfhg', 6, 50, 1, 'quadOut')
    noteTweenY('dfgfdgsdfsg', 7, 50, 1, 'quadOut')

    doTweenColor("coloBF1", "boyfriend", "FFFFFF", 1, "linear")
    doTweenColor("colorBR", "dad", "FFFFFF", 1, "sineInOut")
    doTweenColor("colorGthe", "gf", "FFFFFF", 1, "sineInOut")
    doTweenAlpha('no', 'white', 0, 0.000000000000000000001, 'quadOut')

    increaseShit = true
    increaseShit2 = true
end
if curBeat >= 65 then
  increaseShit = false
  increaseShit2 = false
  cancelTween('coloBF1')
  cancelTween('colorBR')
  cancelTween('colorGthe')
  cancelTween('coloBF1')
  cancelTween('colorBR')
  cancelTween('colorGthe')
end

  if curBeat > 0 then
    if curBeat % 2 == 0 then
        angleshit = anglevar;
    else
        angleshit = -anglevar;
    end
    setProperty('camHUD.angle',angleshit*3)
    doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
    doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')

  end
end