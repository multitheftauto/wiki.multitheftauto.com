function enterPlane(theVehicle, seat, jacked)
    if (getVehicleType(theVehicle) == "Plane") then
        outputChatBox("Welcome onboard!", source)
    end
end

addEventHandler("onPlayerVehicleEnter", root, enterPlane)