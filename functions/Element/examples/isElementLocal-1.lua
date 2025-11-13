function destroyAllLocalBlips()
	-- Get a table containing all blips
	local allBlips = getElementsByType("blip")
	-- For each blip in this table

	for blipID = 1, #allBlips do
		local blipElement = allBlips[blipID]
		-- Check if it's a blip that only exists locally

		if isElementLocal(blipElement) then
			-- And destroy it in that case
			destroyElement(blipElement)
		end
	end
end