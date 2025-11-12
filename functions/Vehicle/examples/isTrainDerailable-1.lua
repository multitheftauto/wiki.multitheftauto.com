local function playerVehicleEnter()
	local localVehicle = getPedOccupiedVehicle(localPlayer)
	if not isElement(localVehicle) then return end -- In case getPedOccupiedVehicle() does not return a valid vehicle, for whatever reason
	
	if getVehicleType(localVehicle) == "Train" then
		if isTrainDerailable(localVehicle) then
			outputChatBox("* Warning: this train could derail!", 255, 0, 0)
		end
	end
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, playerVehicleEnter)