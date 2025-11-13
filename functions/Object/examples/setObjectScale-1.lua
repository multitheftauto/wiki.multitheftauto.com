-- Get the position of the player

local x, y, z = getElementPosition(localPlayer)

-- Create the object

local antennaObject = createObject(1595, x + 2, y, z)

if antennaObject then -- If it was created
	-- Set the scale to half the normal scale

	setObjectScale(antennaObject, 0.5)

	-- Remove the collision

	setElementCollisionsEnabled(antennaObject, false)
end