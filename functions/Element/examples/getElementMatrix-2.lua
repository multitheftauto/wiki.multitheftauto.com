function getMatrixLeft(m)
    return m[1][1], m[1][2], m[1][3]
end

function getMatrixForward(m)
    return m[2][1], m[2][2], m[2][3]
end

function getMatrixUp(m)
    return m[3][1], m[3][2], m[3][3]
end

function getMatrixPosition(m)
    return m[4][1], m[4][2], m[4][3]
end

local mat = getElementMatrix(element)  -- Get the matrix
local x,y,z = getMatrixLeft(mat)     -- Get the matrix left direction
local x,y,z = getMatrixForward(mat)  -- Get the matrix forward direction
local x,y,z = getMatrixUp(mat)       -- Get the matrix up direction