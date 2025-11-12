riggedVehicle = createVehicle(445, 0, 0, 5)
function blowVehicleEnter ( thePlayer, seat, jacked )
	--ENGINE START BOMB. 
	if seat == 0 then --check if the seat the player got into was id 0 - i.e. driver seat
		blowVehicle ( source ) --if it was, toast him
	end
end
addEventHandler ( "onVehicleEnter", riggedVehicle, blowVehicleEnter ) --trigger the function when a certain vehicle is entered