function consoleVehicleLights ( source )
 if isPedInVehicle(source) then -- checks is the player in vehicle if yes, then:
       playerVehicle = getPedOccupiedVehicle ( source )                 -- get the player's vehicle
       if ( playerVehicle ) then                                        -- if he was in one
           if ( getVehicleOverrideLights ( playerVehicle ) ~= 2 ) then  -- if the current state isn't 'force on'
               setVehicleOverrideLights ( playerVehicle, 2 )            -- force the lights on
           else
               setVehicleOverrideLights ( playerVehicle, 1 )            -- otherwise, force the lights off
           end
       end
   end
end
addCommandHandler ( "vehiclelights", consoleVehicleLights )