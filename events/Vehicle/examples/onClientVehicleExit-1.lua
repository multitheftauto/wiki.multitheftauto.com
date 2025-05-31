lblVehicle = guiCreateLabel(10, 200, 150, 20, "Currently on foot", false)
addEventHandler("onClientVehicleEnter", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == localPlayer then
            guiSetText(lblVehicle, "Currently in a " .. getVehicleName(source))
        end
    end
)

addEventHandler("onClientVehicleExit", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == localPlayer then
            guiSetText(lblVehicle, "Currently on foot")
        end
    end
)