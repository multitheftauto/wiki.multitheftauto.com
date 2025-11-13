thePed = getRandomPlayer()
theVehicle = getPedOccupiedVehicle ( thePed )
if ( theVehicle ) then
    outputChatBox ( getPlayerName(thePed).." is in a vehicle in seat number " .. getPedOccupiedVehicleSeat ( thePed ) .. "." )
else
    outputChatBox ( getPlayerName(thePed).." is not in a vehicle." )
end