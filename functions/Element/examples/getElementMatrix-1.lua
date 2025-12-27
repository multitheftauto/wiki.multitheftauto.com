function getPositionFromElementOffset(element, offX, offY, offZ)
    local m = getElementMatrix(element) -- Get the matrix
    if (not m) then
        return 0, 0, 0
    end

    local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1] -- Apply transform
    local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2]
    local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3]
    return x, y, z -- Return the transformed point
end

-- Get the position of a point 3 units to the right of the element:
local x, y, z = getPositionFromElementOffset(element, 3, 0, 0)

-- Get the position of a point 2 units in front of the element:
local x, y, z = getPositionFromElementOffset(element, 0, 2, 0)

-- Get the position of a point 1 unit above the element:
local x, y, z = getPositionFromElementOffset(element, 0, 0, 1)
