local modelId = 1337

local function drawMyModel()
    dxDrawModel3D(modelId, 0, 0, 4, 0, 0, 0)
end

local function startDraw()
    engineStreamingRequestModel(modelId, true, true)
    addEventHandler("onClientPreRender", root, drawMyModel)
end

local function stopDraw()
    engineStreamingReleaseModel(modelId, true)
    removeEventHandler("onClientPreRender", root, drawMyModel)
end