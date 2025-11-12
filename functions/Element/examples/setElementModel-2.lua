local spam = {}

function changeMyVehicle(player, command, newModel)
	if spam[player] and getTickCount() - spam[player] < 2500 then
		return outputChatBox("Don't spam vehicle changes!", player, 255, 0, 0)
	end

	local theVehicle = getPedOccupiedVehicle(player)
	
	if not (theVehicle and getVehicleController(theVehicle) == player) then
		return outputChatBox("You must be driving a vehicle in order to change it!", player, 255, 0, 0)
	end

	if isValidModel(newModel) and isElement(theVehicle) then
		setElementModel(theVehicle, newModel)
		spam[player] = getTickCount()
	else
		outputChatBox("Invalid vehicle ID!", player, 255, 0, 0)
	end
end
addCommandHandler("changeveh", changeMyVehicle)

function isValidModel(modelID)
	modelID = tonumber(modelID)
	if modelID and modelID >= 400 and modelID <= 611 then
		return true
	end
	return false
end

function cleanUp()
	if spam[source] then
		spam[source] = nil
	end
end
addEventHandler("onPlayerQuit", root, cleanUp)