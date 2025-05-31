function addHelmetOnEnter ( vehicle, seat, jacked )
  if ( getVehicleID ( vehicle ) == 522 ) then -- if its a nrg
    addPedClothes ( source, "moto", "moto", 16 ) -- add the helmet
  end
end
addEventHandler ( "onPlayerVehicleEnter", root, addHelmetOnEnter )

function removeHelmetOnExit ( vehicle, seat, jacked )
  if ( getVehicleID ( vehicle ) == 522 ) then -- if its a nrg
    removePedClothes ( source, 16 ) -- remove the helmet
  end
end
addEventHandler ( "onPlayerVehicleExit", root, removeHelmetOnExit )