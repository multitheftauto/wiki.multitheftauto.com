function doesVehicleHaveDoorOpen(vehicle)
	local isDoorAjar = false
	for i=0,5 do
		local doorState = getVehicleDoorState(vehicle, i)
		if doorState == 1 or doorState == 3 or doorState == 4 then
			isDoorAjar = true
		end
	end
	
	return isDoorAjar
end