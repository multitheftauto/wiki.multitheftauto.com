addEventHandler("onClientVehicleStartEnter", root, function(player,seat,door)
	if (player == localPlayer and seat == 0)then
		outputChatBox("You are going to sit in the drivers seat.")
	end
end)