-- Retrieve a table containing all the blips that exist
local blips = Element.getAllByType ( "blip" )
-- Loop through the list, storing the blip from the table in the variable blipValue
for blipKey, blipValue in ipairs(blips) do
	-- Retrieve the blip's icon into the variable 'blipIcon'
	local blipIcon = blipValue.icon
	-- If the blip's icon wasn't the default already
	if ( blipIcon ~= 0 ) then
		-- Set the blip's icon to the default
		blipValue.icon = 0
	end
end