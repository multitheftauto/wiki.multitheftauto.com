local picture = "test.png"
local worldRenderPositions = { -- create a table with all the world positions

    {2483, -1663, 12.4, 0, 0}, -- top left
    {2493, -1663, 12.4, 1, 0}, -- top right
    {2483, -1673, 12.4, 0, 1}, -- bottom left
    {2493, -1673, 12.4, 1, 1} -- bottom right

}

function renderPicture()
    dxDrawMaterialPrimitive3D("trianglestrip", picture, false, unpack(worldRenderPositions)) -- use unpack() to separate the points
end
addEventHandler("onClientRender", root, renderPicture)

function flipPicture()
    for index, point in ipairs(worldRenderPositions) do
        if point[4] == 1 then
            point[4] = 0
        else
            point[4] = 1
        end
        if point[5] == 1 then
            point[5] = 0
        else
            point[5] = 1
        end
    end
end
addCommandHandler("flip", flipPicture)
