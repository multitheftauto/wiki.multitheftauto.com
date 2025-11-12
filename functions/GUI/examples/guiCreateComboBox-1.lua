addEventHandler ("onClientResourceStart",resourceRoot,function()
	local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth, windowHeight = 200,100
	local left = screenWidth/2 - windowWidth/2
	local top = screenHeight/2 - windowHeight/2
	local vehiclesComboBox = guiCreateComboBox ( left, top, windowWidth,windowHeight, "Vehicle Names", false ) -- We create a combo box.
	for index, vehicle in ipairs ( getElementsByType ( "vehicle" ) ) do -- We loop through all vehicles.
		guiComboBoxAddItem ( vehiclesComboBox, getVehicleName ( vehicle ) ) -- We add the vehicle name to our combo box.
	end
end)