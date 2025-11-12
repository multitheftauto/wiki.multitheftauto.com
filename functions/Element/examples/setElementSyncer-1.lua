addCommandHandler ( "createMyVehicle", function ( player, command )
    local x, y, z = getElementPosition ( player )
    local myVehicle = createVehicle ( 411, x, y, z )
    setElementSyncer ( myVehicle, player )
end
)