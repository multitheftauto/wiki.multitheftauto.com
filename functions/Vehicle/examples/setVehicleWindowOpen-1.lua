local seatWindows = {
	[0] = 4,
	[1] = 2,
	[2] = 5,
	[3] = 3
}

addCommandHandler("window",
	function()
		local veh = getPedOccupiedVehicle( localPlayer )
		if veh then
			local seat = getPedOccupiedVehicleSeat( localPlayer )
			if seatWindows[seat] and setVehicleWindowOpen( veh, seatWindows[seat], not isVehicleWindowOpen( veh, seatWindows[seat] ) ) then
				outputChatBox( "Window switched!" )
			else
				outputChatBox( "You don't have window!" )
			end
		else
			outputChatBox( "You must be in vehicle!" )
		end
	end
)