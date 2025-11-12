function getState( player, command, resourceName )
	if not resourceName then
		outputChatBox( "Syntax: " .. command .. " [resource name]", player, 255, 0, 0 )
		return
	end
	local resource = getResourceFromName( resourceName )
	if not resource then
		outputChatBox( "Error: No resource with name " .. resourceName .. " exists.", player, 255, 0, 0 )
		return
	end
	local state = getResourceState( resource )
	outputChatBox( "Resource " .. resourceName .. " is " .. state, player, 0, 0, 255 )
end

addCommandHandler( "state", getState )