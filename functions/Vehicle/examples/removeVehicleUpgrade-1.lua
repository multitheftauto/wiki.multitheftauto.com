function addNOS ( sourcePlayer, command )
    theVehicle = getPlayerOccupiedVehicle ( sourcePlayer )
    if ( theVehicle ) then
        addVehicleUpgrade ( theVehicle, 1010 )     -- NOS 10x
    end
end
addCommandHandler ( "nos", addNOS )

function remNOS ( sourcePlayer, command )
    theVehicle = getPlayerOccupiedVehicle ( sourcePlayer )
    if ( theVehicle ) then
        removeVehicleUpgrade ( theVehicle, 1010 )
    end
end
addCommandHandler ( "removenos", remNOS )