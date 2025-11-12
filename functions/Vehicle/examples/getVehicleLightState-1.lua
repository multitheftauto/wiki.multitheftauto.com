newcar = createVehicle ( 520, 1024, 1024, 1024 )
state = getVehicleLightState ( newcar, 0 )
outputChatBox ( "The front-left light state on this car: " .. state )