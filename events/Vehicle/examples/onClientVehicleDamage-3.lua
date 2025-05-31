function fireproofvehicle(theAttacker, theWeapon)
	if(theWeapon == 37) then
		cancelEvent()
	end
end
addEventHandler("onClientVehicleDamage", getRootElement(), fireproofvehicle)