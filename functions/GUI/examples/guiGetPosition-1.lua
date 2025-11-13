function positionCheck ( guiElement )
	local x,y = guiGetPosition ( guiElement, true ) --get the position
	local position --define the position
	if ( x == 0.5 ) and ( y == 0.5 ) then --if its bang in the middle
		position = "middle" --set position to middle
	elseif ( x > 0.5 ) and ( y > 0.5 ) then --if its in the right bottom
		position = "right-bottom" 
	elseif ( x < 0.5 ) and ( y < 0.5 ) then --if its in the left top
		position = "left-top"
	elseif ( x < 0.5 ) and ( y > 0.5 ) then --if its in the left bottom
		position = "left-bottom"
	elseif ( x > 0.5 ) and ( y < 0.5 ) then --if its in the right top
		position = "right-top" 
	else --if it couldnt be retrieved
		position = "unknown"
	end
	--announce this into the chatbox
	outputChatBox ( "The gui element's position is "..position.."!" )
end