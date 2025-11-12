function position(player)
  if player and isElement(player) then 
     if isPedInVehicle(player) then -- make sure we're actually in a vehicle
        local vehicle = getPedOccupiedVehicle(player)
	  if vehicle then 
	   local vehType = getVehicleType (vehicle) 
	      if vehType == "Train" then -- make sure we're in a train
		 local position = getTrainPosition (vehicle)
		 outputChatBox("The Train position is: "..position)
	      else
		 outputChatBox("You are not in a train!")
	      end
	   end
	else
	  outputChatBox("You are not in a vehicle!")
	end 
    end 
end
addCommandHandler("getpos",position)