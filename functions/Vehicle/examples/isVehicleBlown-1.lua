theTaxi = createVehicle ( 420, 1, 1, 17 ) -- Add a taxi in the middle of SA

function checkTaxi ( thePlayer, command )
	if ( isVehicleBlown ( theTaxi ) ) then -- Check whether it's blown or not
		outputChatBox ( "The taxi has blown up.", thePlayer, 255, 0, 0 ) -- If so, we'll output it
	else -- Anything else (if it's not)
		outputChatBox ( "The taxi has not blown.", thePlayer, 255, 0, 0 ) -- If not, we'll output that instead
	end
end
addCommandHandler ( "taxi", checkTaxi ) -- Make it check when somebody types "/taxi"