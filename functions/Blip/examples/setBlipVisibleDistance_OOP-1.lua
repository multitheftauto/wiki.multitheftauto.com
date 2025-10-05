-- Retrieve a table containing all the blips that exist
local blips = Element.getAllByType("blip")
-- Loop through the list, storing the blips visible distance with the rest.
for index, blip in ipairs(blips) do
	-- Retrieve the blip's visible distance and divide by 2
	blip.visibleDistance = blip.visibleDistance / 2
end