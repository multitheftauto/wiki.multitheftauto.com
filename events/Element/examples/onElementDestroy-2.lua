function getSourceResourceOfElementDestruction()
	-- Players aren't destroyed by any resource
	if (getElementType(source) == "player") then
		outputChatBox("Player "..getPlayerName(source).." destroyed")
		return true
	end
	
	local sourceResourceRoot = getElementParent(getElementParent(source)) -- Get the resource root element of the element
	-- Now to get the resource from the resource root element
	local theResource = false
	for ind, res in pairs(getResources()) do -- Loop all resources
		if (getResourceRootElement(res) == sourceResourceRoot) then -- Compare each resources root element to what we've got
			theResource = res -- We've found the source
			break -- End the loop
		end
	end
	if (theResource) then -- Did we find it?
		local resourceName = getResourceName(theResource) -- Get the resources name
		outputChatBox(resourceName.." destroyed a "..getElementType(source)) -- Output the resource name along with element type
	end
end
addEventHandler("onElementDestroy", root, getSourceResourceOfElementDestruction) -- All elements