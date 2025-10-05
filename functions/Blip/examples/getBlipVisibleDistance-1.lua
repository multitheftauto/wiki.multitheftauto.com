-- Retrieve a table containing all the blips that exist
local blips = getElementsByType("blip")
local distance = 0
-- Loop through the list, storing the blips visible distance with the rest.
for index, blip in ipairs(blips) do
	-- Retrieve the blip's visible distance
	distance = distance + getBlipVisibleDistance(blip) or 0 -- "or 0" just incase its false ;)
end
outputDebugString("Combined total of all blips visible distances: "..distance)