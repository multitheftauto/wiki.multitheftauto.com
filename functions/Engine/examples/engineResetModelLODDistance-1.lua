function resetLODs()
    local count = 0 -- We add a counter for debug message
    for ind, obj in ipairs(getElementsByType("object")) do
        -- Get model, and reset it's LOD distance
        local model = getElementModel(obj)
        engineResetModelLODDistance(model)
        -- Add one to counter
        count = count + 1
    end
    outputDebugString("Reset LOD model distance for "..count.." objects", 3)
end
addEventHandler("onClientResourceStart", resourceRoot, resetLODs) -- We run this only when this resource (re)starts