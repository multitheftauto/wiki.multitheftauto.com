function detectVehicleEnterByPed (theVehicle, seat)
    if (getVehicleType (theVehicle) == "Bike" and seat == 0) then
        outputChatBox ("A ped has entered a bike as a driver!", 0, 255, 0)
    end
end

addEventHandler ("onClientPedVehicleEnter", root, detectVehicleEnterByPed)