function playerTargetCheck ( )
    local target
    for i, thePlayer in ipairs ( getElementsByType("player") ) do  -- iterate over all players
        target = getPedTarget ( thePlayer )                        -- get the target of the current player
        if ( target ) then                                         -- if there was a target
            if ( getElementType ( target ) == "vehicle" ) then     -- and the target is a vehicle
                blowVehicle ( target )                             -- blow it up
            end
        end
    end
end
setTimer ( playerTargetCheck, 1000, 0 )                            -- call the check function every second