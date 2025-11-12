local surfaceID = 5 -- the material ID to reset properties
local success = engineResetSurfaceProperties(surfaceID)

if success then
    outputChatBox("Surface properties reset successfully.")
else
    outputChatBox("Invalid surface ID or error occurred.")
end