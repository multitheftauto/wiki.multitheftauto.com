-- Create a maker
local newMarker = createMarker ( 0, 0, 2, "cylinder", 2, 255, 0, 0, 255 )
-- If the marker was created successfully then...
if isElement ( newMarker ) then
    -- Tell everyone about it
    outputChatBox ( "Current marker size: " .. getMarkerSize ( newMarker ) )
end