-- define the handler function for our command
function consoleAddUpgrade ( thePlayer, commandName, id )
        -- make sure the player is in a vehicle
        if ( isPedInVehicle ( thePlayer ) ) then
            -- convert the given ID from a string to a number
            local id = tonumber ( id )
            -- get the player's vehicle
            local theVehicle = getPedOccupiedVehicle ( thePlayer )
            -- add the requested upgrade to the vehicle
            local success = addVehicleUpgrade ( theVehicle, id )
            -- inform the player of whether the upgrade was added successfully
            if ( success ) then
                outputConsole ( getVehicleUpgradeSlotName ( id ) .. " upgrade added.", thePlayer )
            else
                outputConsole ( "Failed to add upgrade.", thePlayer )
            end
        else
            outputConsole ( "You must be in a vehicle!", thePlayer )
        end
end
-- add the function as a handler for the "addupgrade" command
addCommandHandler ( "addupgrade", consoleAddUpgrade )