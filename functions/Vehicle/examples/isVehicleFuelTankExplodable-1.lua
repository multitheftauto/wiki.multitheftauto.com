newcar = createVehicle ( 520, 1024, 1024, 1024 )
if ( isVehicleFuelTankExplodable ( newcar ) ) then
    outputChatBox ( "Vehicle's tank is explodable" )
else
    outputChatBox ( "Vehicle's tank is not explodable" )
end