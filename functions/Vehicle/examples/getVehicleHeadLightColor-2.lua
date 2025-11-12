function getHeadLightsColor(thePlayer)
	local vehicle = getPedOccupiedVehicle(thePlayer) -- We get the player vehicle..
	if (vehicle) then -- We check if he's on a vehicle...
		local r, g, b = getVehicleHeadLightColor(vehicle) -- We get the vehicle head lights color..
		outputChatBox("Your vehicle lights color are: ".. r ..", ".. g ..", ".. b, thePlayer) -- We output them to the chatbox.
	end
end
addCommandHandler("lightscolor",getHeadLightsColor) -- Add the command handler attached to the function "getHeadLightsColor".