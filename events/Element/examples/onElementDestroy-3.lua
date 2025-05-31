function checkForNaughtyScriptsThatDeleteRandomElements()
	-- Ignore players
	if (getElementType(source) == "player") then
		return true
	end
	
	-- Get the resource that created the element
	local sourceResourceRoot = getElementParent(getElementParent(source))
	local theResource = false
	for ind, res in pairs(getResources()) do
		if (getResourceRootElement(res) == sourceResourceRoot) then
			theResource = res
			break
		end
	end
	
	-- Output info if the destroying resource isn't the same as the creator resource
	if (theResource and theResource ~= sourceResource) then
		local destroyerResource = tostring(getResourceName(theResource))
		local creatorResource = tostring(getResourceName(sourceResource))
		outputDebugString(destroyerResource.." destroyed a "..getElementType(source).." made by "..creatorResource)
	end
end
addEventHandler("onElementDestroy", root, checkForNaughtyScriptsThatDeleteRandomElements)