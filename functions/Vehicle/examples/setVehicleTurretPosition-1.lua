-- Find all the vehicles, and store them in a vehicles variable
local vehicles = getElementsByType ( "vehicle" )
-- Loop through the vehicle list
for vehicleKey, vehicleValue in ipairs(vehicles) do
	-- Set the turret to aim straight forwards
	setVehicleTurretPosition ( vehicleValue, 0, 0 )
end