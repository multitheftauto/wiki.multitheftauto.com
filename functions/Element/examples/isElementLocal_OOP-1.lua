function destroyAllLocalBlips()
	-- Get a table containing all blips
	local allBlips = Element.getAllByType("blip")
	-- For each blip in this table

	for blipID = 1, #allBlips do
		local blipElement = allBlips[blipID]
		-- Check if it's a blip that only exists locally

		if blipElement.localElement then
			-- And destroy it in that case
			blipElement:destroy()
		end
	end
end