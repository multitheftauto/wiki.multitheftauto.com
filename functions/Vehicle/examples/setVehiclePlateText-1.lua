function PlateText(thePlayer,commandName,text)
	local Vehicle = getPedOccupiedVehicle(thePlayer)
	if Vehicle then
		if text then
			setVehiclePlateText( Vehicle, text )
		else
			outputChatBox("You must enter a message or the plate is incorrect.",thePlayer)
		end
	else
		outputChatBox("You must be in a Vehicle.",thePlayer)
	end
end
addCommandHandler("setplate",PlateText)