-- Event notes hooks

local receptorsToggled = nil

function onEvent(name, value1, value2)	--assume value1 is 00001110 for now
	if name == 'Scroll Switch' then
		
		--firstrun
		if receptorsToggled == nil then
			local n = downscroll and 1 or 0
			receptorsToggled = {n,n,n,n,n,n,n,n}
		end
		
		local receptorsToFlip = tostring(value1);
		for i = 1,8 do
			if string.sub(receptorsToFlip, i,i) == '1' then
			
				local _Dest = (receptorsToggled[i] == 1) and 50 or (screenHeight-150)
				noteTweenY('bullshitmechanicalwayskillsme'..(i-1), (i-1), _Dest, 0.3, 'quadInOut')
				
				local directionDest = (receptorsToggled[i] == 1) and 90 or 270
				
				if downscroll then
					directionDest = (directionDest + 180) % 360
				end
	
				local strums = (i >=5) and 'playerStrums' or 'opponentStrums'
				setPropertyFromGroup(strums, (i-1)%4, 'direction', directionDest);
				
				receptorsToggled[i] = 1 - receptorsToggled[i]
			end
		end 
	end
end