function garageCheck ( command, garageID )
	if not garageID then
		return
	end
	
	local west, east, south, north = getGarageBoundingBox ( garageID ) --get the bounding box of the specified garage
	local x, y, z = getElementPosition ( getLocalPlayer ( ) ) --get the position of the player
	
	if x > west and x < east and y > south and y < north then --check if the player is inside the bounding box
		outputChatBox ( "You are inside the garage" )
	else
		outputChatBox ( "You are outside the garage" )
	end
end

addCommandHandler ( "garagecheck", garageCheck )