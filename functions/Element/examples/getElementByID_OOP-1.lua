function showVipVehicle()
	local vipVehicle = Element.getByID("vipVehicle")
	outputChatBox("Vip Vehicle is a: "..vipVehicle.name)
end
addCommandHandler("vipVehicle",showVipVehicle)