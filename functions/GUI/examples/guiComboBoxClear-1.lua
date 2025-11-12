addEventHandler ( "onClientResourceStart", resourceRoot,
	function ( )
		vehiclesComboBox = guiCreateComboBox ( 400, 100, 200, 5 * #getElementsByType ( "vehicle" ), "", false ) -- We create a combo box.
		for index, vehicle in ipairs ( getElementsByType ( "vehicle" ) ) do -- We loop through all vehicles.
			guiComboBoxAddItem ( vehiclesComboBox, getVehicleName ( vehicle ) ) -- We add the vehicle name to our combo box.
		end
	end
)

addCommandHandler ( "clear",
	function ( )
		guiComboBoxClear ( vehiclesComboBox ) -- We clear our combo box removing all vehicles.
	end
)