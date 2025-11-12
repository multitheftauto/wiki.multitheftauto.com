function turnEngineOff ( theVehicle, leftSeat, jackerPlayer )
    -- if it's the driver who got out, and he was not jacked,
    if leftSeat == 0 and not jackerPlayer then
        -- turn off the engine
        setVehicleEngineState ( theVehicle, false )
    end
end
-- add 'turnEngineOff' as a handler for "onPlayerExitVehicle"
addEventHandler ( "onPlayerVehicleExit", root, turnEngineOff )