function changeCarLightsColor ( thePlayer, command, red, green, blue )
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if ( not theVehicle ) then
		return outputChatBox( "You don't have vehicle!" )
	end
	red = tonumber ( red )
	green = tonumber ( green )
	blue = tonumber ( blue )
	-- check if the colour values for red, green and blue are valid
	if red and green and blue then
		local color = setVehicleHeadLightColor ( theVehicle, red, green, blue )
		if(not color) then
			outputChatBox( "Failed to change vehicle lights color" )
		else
			outputChatBox ( "Vehicle lights color changed sucessfully" )
		end
	else
		outputChatBox( "Failed to change vehicle lights color" )
	end
end
addCommandHandler ( "carlights", changeCarLightsColor )