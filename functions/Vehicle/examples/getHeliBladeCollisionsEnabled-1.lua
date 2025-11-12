function onVehicleEnter ( seat, jacked )
	--If the player entered a helicopter
	if ( getVehicleType ( source ) == "Helicopter" ) then
		local state = getHeliBladeCollisionsEnabled‎(source )
		outputChatBox("Helicopter blades collisions are turned ".. (state and "on" or "off") )
	end
end
addEventHandler ( "onClientVehicleEnter", localPlayer, onVehicleEnter )