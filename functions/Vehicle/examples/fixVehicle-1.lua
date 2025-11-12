-- Retrieve a table containing all the vehicles that exist
local vehicles = getElementsByType("vehicle")

-- Loop through the table, storing the vehicle from the table in a variable called "vehicle"
for _, vehicle in pairs(vehicles) do
	-- Fix the vehicle
	fixVehicle(vehicle)
end