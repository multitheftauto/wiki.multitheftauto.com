-- Creates an 'object' or 'building' element based on certain parameters or one of the functions fails
-- This function will throw an error when unexpected arguments are used
-- TODO: Add LOD support
function createObjectOrBuilding(modelID, x, y, z, rx, ry, rz, interior, dimension)
    -- Validate the arguments passed
    assert(type(modelID)=="number", "invalid modelID passed: " .. tostring(modelID))
    assert(type(x)=="number" and type(y)== "number" and type(z)=="number", "invalid position passed: " .. tostring(x) .. ", " .. tostring(y) .. ", " .. tostring(z))
    if not rx then rx = 0 end
    if not ry then ry = 0 end
    if not rz then rz = 0 end
    assert(type(rx)=="number" and type(ry)== "number" and type(rz)=="number", "invalid rotation passed: " .. tostring(rx) .. ", " .. tostring(ry) .. ", " .. tostring(rz))
    if not interior then interior = 0 end
    if not dimension then dimension = 0 end
    assert(type(interior)=="number" and interior >= 0 and interior <= 255, "invalid interior (must be 0-255) passed: " .. tostring(interior))
    assert(type(dimension)=="number" and dimension >= -1 and dimension <= 65535, "invalid dimension passed (must be -1 65535): " .. tostring(dimension))

    -- Dynamic object models will always have a physical properties group different than -1.
    local isNonDynamic = engineGetModelPhysicalPropertiesGroup(modelID) == -1
    -- Buildings can't be affected by dimension
    local isNormalDimension = dimension == 0
    -- Buildings can't be placed outside regular map boundaries
    local isInsideMapLimits = x >= -3000 and x <= 3000 and y >= -3000 and y <= 3000

    local obj, bld
    if isNonDynamic and isNormalDimension and isInsideMapLimits then
        bld = createBuilding(modelID, x, y, z, rx, ry, rz, interior)
        assert(bld, ("Failed to create building with model ID %d at %f, %f, %f in interior %d"):format(modelID, x, y, z, interior))
    else
        obj = createObject(modelID, x, y, z, rx, ry, rz, false)
        assert(obj, ("Failed to create object with model ID %d at %f, %f, %f"):format(modelID, x, y, z))
        setElementInterior(obj, interior)
        setElementDimension(obj, dimension)
    end
    return obj or bld
end

-- Test this create object/building function
addCommandHandler("testobject", function()
    -- This would be your object's model ID
    local modelID = 3556
    -- This would be your object's position coordinates
    local x, y, z = 0, 0, 69
    -- This would be your object's rotation coordinates
    local rx, ry, rz = 0, 0, 90
    -- This would be your object's interior ID
    local interior = 0
    -- This would be your object's dimension ID
    local dimension = 0

    -- We use pcall to catch any errors that may be thrown
    local success, element = pcall(createObjectOrBuilding, modelID, x, y, z, rx, ry, rz, interior, dimension)
    if not success then
        outputDebugString(("Failed to create object or building: %s"):format(tostring(element)), 4, 255, 25, 25)
        return
    end

    -- OPTIONAL: Then you can apply additional properties, like so:
    if getElementType(element) == "object" then
        setObjectScale(element, 1.69)
        setObjectBreakable(element, false)
        setElementAlpha(element, 230)
    end
    setElementCollisionsEnabled(element, true)
    setElementFrozen(element, false)
end)
