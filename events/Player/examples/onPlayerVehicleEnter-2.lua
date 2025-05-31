function addHelmetOnEnter ( theVehicle, seat, jacked )
    if ( getElementModel ( theVehicle ) == 522 ) then -- if its a nrg
        addPedClothes ( source, "moto", "moto", 16 ) -- add the helmet
    end
end
addEventHandler ( "onPlayerVehicleEnter", root, addHelmetOnEnter )

function removeHelmetOnExit ( theVehicle, seat, jacked )
    if ( getElementModel ( theVehicle ) == 522 ) then -- if its a nrg
        removePedClothes ( source, 16 ) -- remove the helmet
    end
end
addEventHandler ( "onPlayerVehicleExit", root, removeHelmetOnExit )