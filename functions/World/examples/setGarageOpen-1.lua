local GARAGE_ID = 25

-- create a collision shape and attach event handlers to it when the resource starts
addEventHandler("onResourceStart", resourceRoot, function (resource)
	local garageCube = createColCuboid(1337, 194, 28, 6, 10, 4)
	addEventHandler("onColShapeHit", garageCube, onGarageCubeHit)
	addEventHandler("onColShapeLeave", garageCube, onGarageCubeLeave)
end)

-- open the door when someone enters the garage's collision shape
function onGarageCubeHit(hitElement, matchingDimension)
	if getElementType(hitElement) ~= "player" then
		return
	end
	-- check to make sure the door is closed
	-- open if they are closed
	setGarageOpen(GARAGE_ID, not isGarageOpen(GARAGE_ID))
end

-- close the door when someone leaves the garage's collision shape
function onGarageCubeLeave(leaveElement, matchingDimension)
	if getElementType(leaveElement) ~= "player" then
		return
	end
	-- check to make sure the door is open
	-- close if they are opened
	setGarageOpen(GARAGE_ID, not isGarageOpen(GARAGE_ID))
end