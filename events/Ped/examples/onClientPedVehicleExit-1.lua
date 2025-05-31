function deleteVehicleOnExit (theVehicle, seat)
    local vehHealth = getElementHealth (theVehicle)
    if vehHealth < 500 then
        destroyElement (theVehicle)
    end
end

addEventHandler ("onClientPedVehicleExit", root, deleteVehicleOnExit)