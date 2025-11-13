function addNOS ( command )
    theVehicle = getPlayerOccupiedVehicle ( getLocalPlayer() )
    if ( theVehicle ) then
        addVehicleUpgrade ( theVehicle, 1010 )     -- NOS 10x
    end
end
addCommandHandler ( "nos", addNOS )

function remNOS ( command )
    theVehicle = getPlayerOccupiedVehicle ( getLocalPlayer() )
    if ( theVehicle ) then
        removeVehicleUpgrade ( theVehicle, 1010 )
    end
end
addCommandHandler ( "removenos", remNOS )