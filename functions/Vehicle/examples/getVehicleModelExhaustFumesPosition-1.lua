local x, y, z = getVehicleModelExhaustFumesPosition( 411 ) -- Get its exhaust fumes position
setVehicleModelExhaustFumesPosition( 411, x, y, z + 1 ) -- Set its exhaust fumes position
local vehicle = createVehicle( 411, 0, 0, 3 ) -- Create a vehicle