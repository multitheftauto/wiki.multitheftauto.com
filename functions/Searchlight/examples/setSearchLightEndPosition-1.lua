local searchLight = createSearchLight(0, 0, 0, 0, 0, 0, 0, 10)

if searchLight then
    local function updateSearchLight()
        -- Get camera position and look at point
        local sx, sy, sz, ex, ey, ez = getCameraMatrix()
        -- Set searchlight's start position to the camera position, and end position to the look at point
        setSearchLightStartPosition(searchLight, sx, sy, sz)
        setSearchLightEndPosition(searchLight, ex, ey, ez)
    end
    addEventHandler("onClientPreRender", root, updateSearchLight)
end