function lockcar ( thePlayer )
    playervehicle = getPlayerOccupiedVehicle ( thePlayer )   -- define 'playervehicle' as the vehicle the player is in
    if ( playervehicle ) then                                -- if a player is in a vehicle
        if isVehicleLocked ( playervehicle ) then            -- and if the vehicle is already locked
            setVehicleLocked ( playervehicle, false )        -- unlock it
        else                                                 -- otherwise (if it isn't locked) 
            setVehicleLocked ( playervehicle, true )         -- lock it
        end
    end
end

function bindLockOnSpawn ( theSpawnpoint )                     -- when a player spawns
    bindKey ( source, "l", "down", lockcar )                   -- bind the 'l' key to the 'lockcar' function
end
addEventHandler ( "onPlayerSpawn", root, bindLockOnSpawn )     -- add an event handler for onPlayerSpawn