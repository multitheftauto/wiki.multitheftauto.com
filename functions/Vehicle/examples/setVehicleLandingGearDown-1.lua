function checkGear( thePlayer )
    local theVehicle = getPedOccupiedVehicle( thePlayer )    --Get the players vehicle
    if ( getElementModel(theVehicle) == 520 and getVehicleLandingGearDown( theVehicle ) == true) then --if the vehicle is a hydra, and the landing gear is down
      setVehicleLandingGearDown(theVehicle,false) --Set the landing gear up
      outputChatBox( "Pull up!", thePlayer )    --and tell the player to pull up.
    end
end