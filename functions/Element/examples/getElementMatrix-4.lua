local function findRotation(x1, y1, x2, y2)
    local t = -math.deg(math.atan2(x2 - x1, y2 - y1))
    return t < 0 and t + 360 or t
end

function startedThisResource(res)
    if getThisResource() == res then
        local thePed = createPed(287, 0, 0, 5, 0)
        local matrix = getElementMatrix(thePed)

        local nx = 0 * matrix[1][1] + 10 * matrix[2][1] + 0 * matrix[3][1] + 1 * matrix[4][1]
        local ny = 0 * matrix[1][2] + 10 * matrix[2][2] + 0 * matrix[3][2] + 1 * matrix[4][2]
        local nz = 0 * matrix[1][3] + 10 * matrix[2][3] + 0 * matrix[3][3] + 1 * matrix[4][3]

        for a, z in ipairs(getElementsByType("player")) do
            setElementPosition(z, nx, ny, nz)
            local playerX, playerY, playerZ = getElementPosition(z)
            local pedX, pedY, pedZ = getElementPosition(thePed)
            local rotZ = findRotation(playerX, playerY, pedX, pedY)
            setElementRotation(z, 0, 0, rotZ)
        end
    end
end
addEventHandler("onResourceStart", getRootElement(), startedThisResource)