function respawnExplodedVehicle()
	setTimer(respawnVehicle, 5000, 1, source)
end
addEventHandler("onVehicleExplode", root, respawnExplodedVehicle)