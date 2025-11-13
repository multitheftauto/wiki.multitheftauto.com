function onVehicleEnter ( thePlayer, seat, jacked )
	--If the player entered a helicopter
	if ( getVehicleType ( source ) == "Helicopter" ) then
		--If the player entered as a driver
		if ( seat == 0 ) then
			-- Turn off collisions
			setHeliBladeCollisionsEnabled ( source, false )
		end
	end
end
addEventHandler ( "onClientVehicleEnter", root, onVehicleEnter )