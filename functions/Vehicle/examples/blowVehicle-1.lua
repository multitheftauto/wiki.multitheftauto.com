vehicles = getElementsByType ( "vehicle" )
for vehicleKey, vehicleValue in ipairs(vehicles) do
	blowVehicle ( vehicleValue )
end