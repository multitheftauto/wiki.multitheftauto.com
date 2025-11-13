addCommandHandler("grav",function()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if (vehicle) then
		local x,y,z = getVehicleGravity(vehicle)
		outputChatBox("Your vehicle's gravity is: "..x.." "..y.." "..z,0,255,0)
	end
end)