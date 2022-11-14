local spin = false;
local defaultNotePos = {};
local modchartX = 100;
local modchartY = 150;
local bop = 1;
local bop2 = 1;
local anglePlus = 1;



function onSongStart()

  for i = 0,7 do

      x = getPropertyFromGroup('strumLineNotes', i, 'x')

      y = getPropertyFromGroup('strumLineNotes', i, 'y')

      table.insert(defaultNotePos, {x, y})

      --debugPrint("{" .. x .. "," .. y .. "}" .. "i:" .. i)
  end

end
        function onUpdate(elapsed) 
            
            if curStep >= 0 then
                songPos = getSongPosition()
                local currentBeat = (songPos/400)*(bpm/100)
                doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.15)*math.pi),0.01)
            end
 
            songPos = getPropertyFromClass('Conductor', 'songPosition');

            currentBeat = (songPos / 1000) * (bpm / 150)
         
         
            if spin == true then
                 for i = 0,7 do 
                     setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + modchartX * math.sin((currentBeat + i*12.95) * math.pi))
                     setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*9.25) * math.pi))
                 end
            end
        end
        

        function onBeatHit()
          if curBeat % 2 == 0 then
            bop = -bop2;
          else
            bop = bop2;
          end
          
            anglePlus = bop*50.90;
        
          for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'angle', anglePlus)
          end

         if curBeat >= 127 then
        doTweenAlpha('nomorehpbar', 'healthBar', 0, 2, 'quadOut')
        doTweenAlpha('nomoreicons1', 'iconP1', 0, 2, 'quadOut')
        doTweenAlpha('nomoreicons2', 'iconP2', 0, 2, 'quadOut')
        spin = true
         end

         if curBeat >= 784 then
         spin = false
         bop = false
         bop2 = false
         doTweenAlpha('chapter3end', 'camHUD', 0, 2, 'quadOut')
         end
        
          end
            

