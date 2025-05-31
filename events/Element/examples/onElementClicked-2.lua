function repairClickedVehicle( button, state, player ) -- Add the function
    if button == "left" and state == "down" then
        if getElementType( source ) == "vehicle" then -- If the clicked element is a vehicle...
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local distance = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 ) -- Some distance calculations
            if distance < 4 then -- Check if the player is near the vehicle
                if getElementHealth( source ) < 1000 then
                    fixVehicle( source )
                    outputChatBox( "You have repaired a "..getVehicleNameFromModel( getElementModel( source ) ), player, 0, 255, 0 )
                else
                    outputChatBox( "Vehicle is not damaged!", player, 255, 0, 0 )
                end
            end
        end
    end
end
addEventHandler( "onElementClicked", root, repairClickedVehicle ) -- Add the event handler