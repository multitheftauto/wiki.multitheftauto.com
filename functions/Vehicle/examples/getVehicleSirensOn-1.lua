function example_onVehicleEnter ( thePlayer, seat )
	--If the player entered as a driver
	if ( seat == 0 ) then
		--If siren was off
		if not getVehicleSirensOn ( source ) then
			setVehicleSirensOn ( source, true ) --Turn it on
		else
			setVehicleSirensOn ( source, false ) --Turn it off
		end
	end
end
addEventHandler ( "onVehicleEnter", getRootElement(), example_onVehicleEnter )