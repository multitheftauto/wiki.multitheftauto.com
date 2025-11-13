theVehicle = createVehicle ( 400, 1, 1, 1 )       -- create us a new vehicle
if ( theVehicle ) then
    toggleVehicleRespawn ( theVehicle, true ) -- enable vehicle respawn as it is necessary for the idle respawn to function
    setVehicleIdleRespawnDelay ( theVehicle, 20000 ) -- tell the server to respawn the vehicle 20 seconds after it's been left.
end