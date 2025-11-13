local cam = getCamera()
setElementPosition( cam, 0,0,0 )  -- Clear camera target
local myVehicle = getPedOccupiedVehicle(localPlayer)
attachElements( cam, myVehicle, 0,-4,2, -20,0,0 )