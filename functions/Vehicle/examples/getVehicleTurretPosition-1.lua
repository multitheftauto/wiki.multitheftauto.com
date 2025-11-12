-- Find all the vehicles, and store them in a vehicles variable
local vehicles = getElementsByType ( "vehicle" )
-- Loop through the vehicle list
for vehicleKey, vehicleValue in ipairs(vehicles) do
	-- Get the vehicle's turret position
	local x, y = getVehicleTurretPosition ( vehicleValue ) 
	-- Convert the positions to degrees, as that's much more useful if you'd want to output it
	x = math.deg ( x )
	y = math.deg ( y )
	-- Get the vehicle's name
	local vehicleName = getVehicleName ( vehicleValue )
	-- Tell everyone in the F8 console the turret's position
	outputConsole ( vehicleName .. "'s turret rotation: " .. x .. ", " .. y .. "." )	
end