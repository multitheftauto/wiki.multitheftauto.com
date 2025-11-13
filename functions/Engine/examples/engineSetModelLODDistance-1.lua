-- Client-side
-- WARNING: Can cause significant lag.

-- Adjusts LOD for all objects.
function setAllObjectsLOD()

    -- Get all current objects.
    local objects = getElementsByType("object", root, false)

    for _, theObject in ipairs(objects) do

        local modelID = getElementModel(theObject)
        local lodLevel = 325 -- Distance value

        -- Set LOD for this model ID.
        -- The 'true' enables extended range.
        engineSetModelLODDistance(modelID, lodLevel, true)

    end
end

-- Command to run the function.
addCommandHandler("setAllObjectsLOD", setAllObjectsLOD)