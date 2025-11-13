addCommandHandler ( "gvc",
    function ( )
        local theVehicle = getPedOccupiedVehicle ( localPlayer )
        if ( theVehicle ) then
            for k in pairs ( getVehicleComponents ( theVehicle ) ) do
                outputChatBox ( k )
            end
        end
    end
)