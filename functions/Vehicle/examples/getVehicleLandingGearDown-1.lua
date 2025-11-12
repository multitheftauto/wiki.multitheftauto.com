function checkGear( thePlayer )
    local theVehicle = getPedOccupiedVehicle( thePlayer )    --Get the players vehicle
    if ( getElementModel(theVehicle) == 520 and getVehicleLandingGearDown( theVehicle ) == false ) then    --if the vehicle is a hydra, and the landing gear is up
        outputChatBox( "Pull up!", thePlayer )    --tell the player to pull up.
    end
end