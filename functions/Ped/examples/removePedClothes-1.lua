function addHelmetOnEnter ( vehicleEntered, seat, jacked )
    if getElementModel ( vehicleEntered ) == 522 then      -- if it's a nrg
        addPedClothes ( source, "moto", "moto", 16 )       -- add the helmet
    end
end
addEventHandler ( "onPlayerVehicleEnter", root, addHelmetOnEnter )

function removeHelmetOnExit ( vehicleExited, seat, jacked )
    if getElementModel ( vehicleExited ) == 522 then       -- if it's a nrg
        removePedClothes ( source, 16, "moto", "moto" )    -- remove that helmet
    end
end
addEventHandler ( "onPlayerVehicleExit", root, removeHelmetOnExit )