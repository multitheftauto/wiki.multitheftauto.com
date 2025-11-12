function loadMapFile(fileName)
	local xmlNode = getResourceConfig(fileName)

	if (xmlNode) then -- check if the file was loaded ok
	    nodeElement = loadMapData(xmlNode, root) -- load the loaded xml file into the element tree
		xmlUnloadFile(xmlNode) -- Unload the xml file
	end
end

setTimer(function() 
    destroyElement(nodeElement)
end,30000,1)