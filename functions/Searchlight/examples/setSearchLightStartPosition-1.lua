local searchLight = createSearchLight(0, 0, 0, 0, 0, 0, 0, 10)

if searchLight then
    local function updateSearchLight()
        -- Set its start position to the camera position
        setSearchLightStartPosition(searchLight, getCameraMatrix())
    end
    addEventHandler("onClientPreRender", root, updateSearchLight)
end