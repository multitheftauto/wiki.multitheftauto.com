function setupForRace( )
	RacerPed = createPed( 252, 0, 0, 3 ) -- create a ped into the variable "RacerPed"
	local RaceVehicle = createVehicle( 411, 4, 0, 3 ) -- create a vehicle.
	warpPedIntoVehicle( RacerPed, RaceVehicle ) -- warp the ped straight into the vehicle
	setTimer( removeThePed, 5000, 1 ) -- Setup a timer which will remove the ped from the vehicle after 5 seconds.
end
addCommandHandler( "startrace", setupForRace ) -- add a command to start race

function removeThePed( )
	removePedFromVehicle( RacerPed ) -- Removes the ped from any vehicle. 
end