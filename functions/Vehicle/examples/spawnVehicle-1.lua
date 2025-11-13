function myCommandHandler(thePlayer, command)
	local x, y, z = getElementPosition(thePlayer)
	local RaceVehicle = createVehicle ( 411, 0, 0, 0 ) 
	local spawnVeh = spawnVehicle ( RaceVehicle, x+3, y+3, z )	
	if spawnVeh	then	outputChatBox("Vehicle was spawned", thePlayer)	else	outputChatBox("Error",thePlayer)	end
end

addCommandHandler("spawnvehicle", myCommandHandler)