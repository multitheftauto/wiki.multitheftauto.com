function checkModules()
	local modules = getLoadedModules()
	
	if #modules == 0 then
		return outputServerLog("No modules are loaded!")
	end
	
	for k,v in ipairs(modules) do
	        outputServerLog( v )
	end
		
	outputServerLog("Loaded " .. #modules .. " modules in total.")
end
addCommandHandler("modules", checkModules)