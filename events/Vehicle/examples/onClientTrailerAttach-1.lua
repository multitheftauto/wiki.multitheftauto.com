function onAttach(vehicle)
	local name = getVehicleName(vehicle)
	outputChatBox("You were attach the trailer by "..name)
end
addEventHandler("onClientTrailerAttach", getRootElement(), onAttach)