-- Retrieve a table containing all the blips that exist
local blips = getElementsByType ( "blip" )
-- Loop through the list, storing the blip from the table in the variable blipValue
for blipKey, blipValue in ipairs ( blips ) do
	-- Retrieve the blip's colors into the variables red, green, blue and alpha
	local red, green, blue, alpha = getBlipColor ( blipValue )
	-- If the blip's icon isn't white already
	if ( red ~= 255 or green ~= 255 or blue ~= 255 or alpha ~= 255 ) then
		-- Set the blip's color to white
		setBlipColor ( blipValue, 255, 255, 255, 255 )
	end
end