function onPlayerResourceStart(startedResource)
	local resourceName = getResourceName(startedResource)
	local playerName = getPlayerName(source)
	local matchingResource = (startedResource == resource) -- 'resource' is predefined variable, see: https://wiki.multitheftauto.com/wiki/Predefined_variables_list#MTA_Predefined_variables
	local chatMessage = (resourceName.." has started for "..playerName)

	outputChatBox(chatMessage) -- display message when any resource starts for player

	if (not matchingResource) then -- check if startedResource matches current, if it doesn't do not trigger custom event
		return false
	end

	triggerClientEvent(source, "onClientCustomEvent", resourceRoot) -- send a custom clientside event defined in this resource, for specific player (source) only
end
addEventHandler("onPlayerResourceStart", root, onPlayerResourceStart)