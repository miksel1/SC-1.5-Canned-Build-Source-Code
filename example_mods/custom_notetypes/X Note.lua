function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'X Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'XNOTE_asset'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-100000'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
local healthDrain = 0;
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'X Note' then
		playSound('XHIT', 2)
		healthDrain = healthDrain + 100000;
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen

function onUpdate(elapsed)
	if healthDrain > 0 then
		if getProperty('health') > 0.05 then
			healthDrain = healthDrain - 0.00002 * elapsed;
			setProperty('health', getProperty('health') - 0.0002 * elapsed);
			if healthDrain < 0 then
				healthDrain = 0;
			end
		end
		runTimer('wait', 5);
	end
end

function onTimerCompleted(tag)
	if tag == 'wait' then
		healthDrain = 0;
	end
end