function createMyPyramid()
    local pos = Vector3(0, 0, 3)
    local rot = Vector3(0, 0, 0)
    
    local modelHi = 8395  -- This model has a lot of polygons
    local modelLow = 8701 -- This model is optimized for drawing at a long distance

    -- Always call this function if you don't like default draw distance
    -- or you allocated the model with using engineRequestModel
    engineSetModelLODDistance(modelHi, 100, true)
    engineSetModelLODDistance(modelLow, 500, true)

    local lod = createBuilding(modelLow, pos, rot)
    local building = createBuilding(modelHi, pos, rot)

    setLowLODElement(building,lod)
end