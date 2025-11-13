function resetVehiclesIdleTime ()
	local vehicles = getElementsByType ( "vehicle" ) -- Return all the vehicles in a table
		for k, vehicle in ipairs ( vehicles ) do -- For every vehicle do the following...
			resetVehicleIdleTime ( vehicle ) -- Reset the vehicle's idle time
		end
end
-- When this resource is stopped, trigger the resetVehiclesIdleTime function (above).
addEventHandler ( "onResourceStop", resourceRoot, resetVehiclesIdleTime )