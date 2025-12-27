-- Create a normal object
local objNormal = Object(3620, x, y, z, 0, 0, 0)

-- Create a low LOD object
local objLowLOD = Object(5154, x, y, z, 0, 0, 0, true)

-- Assign the LOD object with the Normal object
objNormal.lowLOD = objLowLOD
-- Set the LOD object's parent to the Normal object so it is destroyed together
objLowLOD.parent = objNormal

-- Set the draw distance for the model we are using for low LOD to maximum
Engine.setModelLODDistance(5154, 300)
