function startRaining()
         setRainLevel(5)
end
addEventHandler("onClientVehicleEnter", root, startRaining)

function stopRaining()
         resetRainLevel()
end
addEventHandler("onClientVehicleExit", root, stopRaining)