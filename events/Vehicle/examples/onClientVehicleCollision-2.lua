-- This code works because onClientVehicleCollision is triggered before any SA reaction to the collision, therefore we can update the knocked off bike status just before the collision and stop the falling off effect happening :)
addEventHandler("onClientVehicleCollision", root,
    function ( hit ) 
        -- firstly did we trigger this event
        if ( source == getPedOccupiedVehicle(localPlayer) ) then
            -- knock off defaults to false
            local knockOff = false 
            -- if our hit element is nil (we just hit an SA map object)
            if ( hit == nil ) then 
                -- set knockOff to true 
                knockOff = true 
            end 
  
            -- update our can be knocked off bike status accordingly
            setPedCanBeKnockedOffBike(localPlayer, knockOff) 
        end
    end
)