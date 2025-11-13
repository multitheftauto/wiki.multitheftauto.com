function onEnterVehicle ( theVehicle, seat, jacked )
    if getElementModel ( theVehicle ) == 522 then         -- if it's an nrg
        addPedClothes ( source, "moto", "moto", 16 )   -- add the helmet
    end
end
addEventHandler ( "onPlayerVehicleEnter", root, onEnterVehicle )

function onExitVehicle ( theVehicle, seat, jacked )
    if getElementModel ( theVehicle ) == 522 then      -- if it's an nrg
        removePedClothes ( source, 16 )              -- remove the helmet
    end
end
addEventHandler ( "onPlayerVehicleExit", root, onExitVehicle )