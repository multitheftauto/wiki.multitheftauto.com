function setupForRace ( )
    local RacerPed = createPed ( 252, 0, 0, 3 )
    local RaceVehicle = createVehicle ( 411, 4, 0, 3 )            -- create a vehicle.
    warpPedIntoVehicle ( RacerPed, RaceVehicle )                  -- warp the ped straight into the vehicle
end
addCommandHandler ( "startrace", setupForRace )                   -- add a command to start race