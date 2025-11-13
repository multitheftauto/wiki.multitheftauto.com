local surfaceID = 5 -- the material ID
local property = "audio" -- the property name
local propertyValue = engineGetSurfaceProperties(surfaceID, property)
if propertyValue then
    outputChatBox("Surface property '" .. property .. "' value: " .. tostring(propertyValue))
	-- returns : Surface property 'audio' value: concrete
else
    outputChatBox("Invalid surface ID or property name.")
end