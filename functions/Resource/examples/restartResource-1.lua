function restartAllResources()
	-- we store a table of resources
	local allResources = getResources()
	-- for each one of them,
	for index, res in ipairs(allResources) do
		-- if it's running,
		if getResourceState(res) == "running" then
			-- then restart it
			restartResource(res)
		end
	end
end