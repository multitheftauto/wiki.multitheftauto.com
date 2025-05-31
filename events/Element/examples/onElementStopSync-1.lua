function onResourceStart()
	local vehicleElement = createVehicle(434, 0, 0, 3) -- Create vehicle

	addEventHandler("onElementStopSync", vehicleElement, onElementStopSync) -- Bind handler specifically to it
end
addEventHandler("onResourceStart", resourceRoot, onResourceStart)

function onElementStopSync(oldSyncer)
	outputChatBox("The vehicle is not being synced by you anymore.", oldSyncer) -- Tell player (oldSyncer) that he's not syncing vehicle
end