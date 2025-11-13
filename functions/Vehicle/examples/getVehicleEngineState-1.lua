function switchEngine ( playerSource )
    local theVehicle = getPedOccupiedVehicle ( playerSource )

    -- Check if the player is in any vehicle and if he is the driver
    if theVehicle and getVehicleController ( theVehicle ) == playerSource then
        local state = getVehicleEngineState ( theVehicle )
        setVehicleEngineState ( theVehicle, not state )
    end
end
addCommandHandler ( "switchengine", switchEngine )