function vehicleLights ( source )
    local theVehicle = getPlayerOccupiedVehicle ( source )        -- get the player's vehicle
    if ( theVehicle ) then                                        -- if he was in one
        if ( getVehicleOverrideLights ( theVehicle ) ~= 2 ) then  -- if the current state isnt 'force on'
            setVehicleOverrideLights ( theVehicle, 2 )            -- force the lights on
        else
            setVehicleOverrideLights ( theVehicle, 1 )            -- otherwise, force the lights off
        end
    end
end
addCommandHandler ( "vehiclelights", vehicleLights )