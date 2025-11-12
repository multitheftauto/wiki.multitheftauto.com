local vehicle = createVehicle ( 400, 1, 1, 1 )       -- create us a new vehicle
if vehicle then
    toggleVehicleRespawn ( vehicle, true )     -- enable vehicle respawn
    setVehicleRespawnDelay ( vehicle, 20000 )  -- tell the server to respawn the vehicle 20 seconds after it's blown
end