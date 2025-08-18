-- Retrieve a table containing all the blips that exist
local blips = Element.getAllByType ( "blip" )
-- Loop through the list, storing the blip from the table in the variable blipValue
for blipKey, blipValue in ipairs(blips) do
	-- Retrieve the blip's size into the variable 'blipSize'
	local blipSize = blipValue.size
	-- If the blip's size wasn't 2 (the default size) already
	if ( blipSize ~= 2 ) then
		-- Set the blip's size to the default
		blipValue.size = 2
	end
end