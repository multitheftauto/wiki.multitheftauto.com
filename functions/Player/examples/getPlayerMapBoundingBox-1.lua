local worldPos = Vector2(0, 0) -- Center of coordinates, which is somewhere in Blueberry Acres
local screenSize = Vector2(guiGetScreenSize())

local function drawWorldPosMapText()
    local mapMin, mapMax
    do
        -- We do these operations inside a block to delete intermediate variables automatically
        local mx, my, Mx, My = getPlayerMapBoundingBox()
        if mx then
            mapMin = Vector2(mx, my)
            mapMax = Vector2(Mx, My)
        else
            -- Do not continue if the screen coordinates could not be calculated (i.e. map is not showing)
            return
        end
    end

    -- Calculate a factor in range [0, 1] which represents the relative distance to the max world coords point from the min world coords point of the given coordinates (worldPos)
    -- 0 means that the given point is in mapMin in a certain direction
    -- 1 means that the given point is in mapMax in a certain direction
    -- Assumes the world map is a square whose side is 6000 units long
    local fMx, fMy = (worldPos.x + 3000) / 6000, -(worldPos.y - 3000) / 6000
    -- Do the opposite thing for the min coords point
    local fmx, fmy = 1 - fMx, 1 - fMy

    -- Use the factors and given screen points to calculate the final screen coords of our world position in the map
    local screenMapPos = Vector2((fmx * mapMin.x) + (fMx * mapMax.x), (fmy * mapMin.y) + (fMy * mapMax.y))

    -- Check whether our screen position is within the viewable screen area (this is not necessary when working with dxDrawText anyway)
    if screenMapPos.x >= 0 and screenMapPos.y >= 0 and screenMapPos.x <= screenSize.x and screenMapPos.y <= screenSize.y then
        -- Finally, draw our desired text
        local width = dxGetTextWidth("Center of SA map")
        dxDrawText("Center of SA map", screenMapPos.x - (width / 2), screenMapPos.y, screenMapPos.x + (width / 2), screenMapPos.y, tocolor(255, 255, 0), 1, "default", "center", "center")
    end
end
addEventHandler("onClientRender", root, drawWorldPosMapText)