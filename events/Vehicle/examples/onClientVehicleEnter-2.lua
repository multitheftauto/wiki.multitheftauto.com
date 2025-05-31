function onHeliEnter()
   if getVehicleType(source) == "Helicopter" then
           setHeliBladeCollisionsEnabled (source, false)
    end
end
addEventHandler ("onClientVehicleEnter", root, onHeliEnter)