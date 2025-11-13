function checkIfClose(p, cmd)
    -- player x, y, z
    local x1, y1, z1 = getElementPosition(p)
    -- location x, y, z (to check if player is close enough to)
    local x2, y2, z2 = -2629.79248, 1370.82996, 7.10079

    if getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2) <= 5 then
        return outputChatBox("You are close enough (within 5 meters)!")
    else
        return outputChatBox("You are NOT close enough!")
    end
end
addCommandHandler("closeornot", checkIfClose)

--[REWRITE BY ANDREI]
local half = 1 / 2
function getDistanceFromPoints(x1, y1, z1, x2, y2, z2)
    return ((x2 - x1) * (x2 - x1) ^ 2 + (y2 - y1) * (y2 - y1) ^ 2 + (z2 - z1) * (z2 - z1)) ^ half
end