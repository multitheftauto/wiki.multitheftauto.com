function trainDir(thePlayer,command)
	if (isPedInVehicle(thePlayer)) then -- Check if they're even in a vehicle.
		if (getVehicleType(getPedOccupiedVehicle(thePlayer)) == "Train") then -- Check if they're in a train.
			local direction = getTrainDirection(getPedOccupiedVehicle(thePlayer)) -- Get the train's direction.
				if (direction) then
					outputChatBox("You're driving clockwise.",thePlayer,255,255,0) -- Output that they're driving clockwise.
				else
					outputChatBox("You're driving anti-clockwise.",thePlayer,255,255,0) -- Output that they're driving anti-clockwise.
				end
		else
			outputChatBox("You must be in a train to use this command.",thePlayer,255,0,0) -- Output that they're not in a train.
		end
	else
		outputChatBox("You must be in a train to use this command.",thePlayer,255,0,0) -- Output that they're not in a vehicle.
	end
end
addCommandHandler("direction",trainDir)