
function onCreate()
  setPropertyFromClass('ClientPrefs', 'middleScroll', false);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
  setProperty('health', getProperty('health') - 0.25 * ((getProperty('health')/22)))
  end
function onUpdate(elapsed)
    if curStep >= 0 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
      local shitStuffXP1 = ((screenWidth / 1.75) - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * 300)
      local shitStuffXP2 = ((screenWidth / 1.75) - (20 / 2)) - (math.sin((currentBeat * 3) + 0) * 300)
      doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
noteTweenX(defaultPlayerStrumX0, 4, ((shitStuffXP1 - 300) - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * -70), 0.001)
noteTweenY('defaultPlayerStrumY0', 4, ((defaultPlayerStrumY0 / 1.02) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * -30), 0.001)

noteTweenX(defaultPlayerStrumX1, 5, ((shitStuffXP1 - 200) - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * 70), 0.001)
noteTweenY('defaultPlayerStrumY1', 5, ((defaultPlayerStrumY1 / 1.02) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * 30), 0.001)

noteTweenX(defaultPlayerStrumX2, 6, ((shitStuffXP1 - 100) - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * -70), 0.001)
noteTweenY('defaultPlayerStrumY2', 6, ((defaultPlayerStrumY2 / 1.02) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * -30), 0.001)

noteTweenX(defaultPlayerStrumX3, 7, ((shitStuffXP1 - 0) - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * 70), 0.001)
noteTweenY('defaultPlayerStrumY3', 7, ((defaultPlayerStrumY3 / 1.02) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * 30), 0.001)


noteTweenX('x0', 0, ((shitStuffXP2 - 300) - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * -70), 0.001)
noteTweenY('y0', 0, ((defaultOpponentStrumY0 / 1.02) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * -30), 0.001)

noteTweenX('x1', 1, ((shitStuffXP2 - 200) - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * 70), 0.001)
noteTweenY('y1', 1, ((defaultOpponentStrumY1 / 1.02) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * 30), 0.001)

noteTweenX('x2', 2, ((shitStuffXP2 - 100) - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * -70), 0.001)
noteTweenY('y2', 2, ((defaultOpponentStrumY2 / 1.02) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * -30), 0.001)

noteTweenX('x3', 3, ((shitStuffXP2 - 0) - (20 / 2)) + (math.sin((currentBeat * 3) + 0) * 70), 0.001)
noteTweenY('y3', 3, ((defaultOpponentStrumY3 / 1.02) - (20 / 2)) + (math.cos((currentBeat * 3) + 0) * 30), 0.001)

noteTweenScaleX('ox1', 0, ((0.7 / 1) - (0.1 / 1)) + (math.sin((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleY('oy1', 0, ((0.7 / 1) - (0.1 / 1)) + (math.cos((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleX('ox2', 1, ((0.7 / 1) - (0.1 / 1)) + (math.sin((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleY('oy2', 1, ((0.7 / 1) - (0.1 / 1)) + (math.cos((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleX('ox3', 2, ((0.7 / 1) - (0.1 / 1)) + (math.sin((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleY('oy3', 2, ((0.7 / 1) - (0.1 / 1)) + (math.cos((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleX('ox4', 3, ((0.7 / 1) - (0.1 / 1)) + (math.sin((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleY('oy4', 3, ((0.7 / 1) - (0.1 / 1)) + (math.cos((currentBeat * 3) + 0) * 0.25), 0.001)

noteTweenScaleX('px1', 4, ((0.7 / 1) - (0.1 / 1)) + (math.sin((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleY('py1', 4, ((0.7 / 1) - (0.1 / 1)) + (math.cos((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleX('px2', 5, ((0.7 / 1) - (0.1 / 1)) + (math.sin((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleY('py2', 5, ((0.7 / 1) - (0.1 / 1)) + (math.cos((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleX('px3', 6, ((0.7 / 1) - (0.1 / 1)) + (math.sin((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleY('py3', 6, ((0.7 / 1) - (0.1 / 1)) + (math.cos((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleX('px4', 7, ((0.7 / 1) - (0.1 / 1)) + (math.sin((currentBeat * 3) + 0) * 0.25), 0.001)
noteTweenScaleY('py4', 7, ((0.7 / 1) - (0.1 / 1)) + (math.cos((currentBeat * 3) + 0) * 0.25), 0.001)
    end
  end
