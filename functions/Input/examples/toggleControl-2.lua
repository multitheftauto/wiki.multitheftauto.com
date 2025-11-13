function disableFireForHydra ( theVehicle, seat )
    if ( getElementModel ( theVehicle ) == 520 ) then -- if they entered a hydra
        toggleControl ( "vehicle_secondary_fire", false ) -- disable their fire key
    else -- if they entered another vehicle
        toggleControl ( "vehicle_secondary_fire", true ) -- enable their fire key
    end
end
addEventHandler ( "onClientPlayerVehicleEnter", localPlayer, disableFireForHydra )