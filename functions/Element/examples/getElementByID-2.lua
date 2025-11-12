function showVipVehicle()
	local vipVehicle = getElementByID("vipVehicle")
	outputChatBox("Vip Vehicle is a: "..getVehicleName(vipVehicle))
end
addCommandHandler("vipVehicle",showVipVehicle)