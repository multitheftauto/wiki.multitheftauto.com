newcar = createVehicle ( 520, 1024, 1024, 1024 ) -- create a vehicle
numseats = getVehicleMaxPassengers ( newcar ) -- get the passenger seat count
outputChatBox ( "This vehicle supports " .. numseats .. " passengers." ) -- show it in the chat