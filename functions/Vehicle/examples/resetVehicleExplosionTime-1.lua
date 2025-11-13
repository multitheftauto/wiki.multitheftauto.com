function resetVehiclesExplosionTime ()
	local vehicles = getElementsByType ( "vehicle" ) -- Return all the vehicles in a table
		for k, vehicle in ipairs ( vehicles ) do -- For every vehicle do the following...
			resetVehicleExplosionTime ( vehicle ) -- Reset the vehicle's explosion time
		end
end
-- When this resource is stopped, trigger the resetVehiclesExplosionTime function (above).
addEventHandler ( "onResourceStop", resourceRoot, resetVehiclesExplosionTime )