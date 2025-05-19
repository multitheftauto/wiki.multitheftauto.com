local vehicle = createVehicle (411, 0, 0, 3)
setTimer (setElementInterior, 1000, 1, vehicle, 10)

addEventHandler ("onClientElementInteriorChange", vehicle, function (oldInterior, newInterior)
    outputChatBox (inspect (source).."'s interior changed from "..oldInterior.." to "..newInterior)
end)