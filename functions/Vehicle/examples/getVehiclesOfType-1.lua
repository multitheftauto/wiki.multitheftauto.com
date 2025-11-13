-- Find all the vehicles with the model 400 (landstalker)
vehicles = getVehiclesOfType ( 400 )
-- Loop through the vehicle list
for vehicleKey, vehicleValue in ipairs ( vehicles ) do
	-- Get the vehicle's position
        x, y, z = getElementPosition ( vehicleValue )
        -- Move the vehicle to the left
        setElementPosition ( vehicleValue, x - 5, y, z )
end