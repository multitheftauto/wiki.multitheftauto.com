-- create a new vehicle
local newcar = createVehicle (420, 2472.5, -1688, 13.3)
-- break its front left door off
setVehicleDoorState (newcar, 2, 4)
-- make its hood disapear
setTimer (setVehicleDoorState, 100, 1, newcar, 0, 4, false)