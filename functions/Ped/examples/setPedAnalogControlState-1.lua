function createAnalogControlTest( )
    local playerPosition = Vector3( getElementPosition( localPlayer ) )
    local theVehicle = createVehicle( 522, playerPosition )
    local thePed = createPed( 0, playerPosition )

    warpPedIntoVehicle( thePed, theVehicle )

    setPedAnalogControlState( thePed, "accelerate", 0.05 )
    setPedAnalogControlState( thePed, "vehicle_left", 1 )
end
addCommandHandler( "analogcontroltest", createAnalogControlTest )