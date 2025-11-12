addCommandHandler( 'random_color',
	function( uPlayer )
		if isPedInVehicle( uPlayer ) then
			local uVehicle = getPedOccupiedVehicle( uPlayer )
			if uVehicle then
				local r, g, b = math.random( 255 ), math.random( 255 ), math.random( 255 )
				setVehicleColor( uVehicle, r, g, b )
			end
		end
	end
)