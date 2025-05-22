--
-- Instead of:
--
local matrix = getElementMatrix(vehicle)
local offX = 0 * matrix[1][1] + 0 * matrix[2][1] - 1 * matrix[3][1] + matrix[4][1]
local offY = 0 * matrix[1][2] + 0 * matrix[2][2] - 1 * matrix[3][2] + matrix[4][2]
local offZ = 0 * matrix[1][3] + 0 * matrix[2][3] - 1 * matrix[3][3] + matrix[4][3]

local pX, pY, pZ = getElementPosition(vehicle)
local positionBelow = {offX-pX, offY-pY, offZ-pZ}

--
-- You only have to do:
--
local positionBelow = vehicle.position - vehicle.matrix.up