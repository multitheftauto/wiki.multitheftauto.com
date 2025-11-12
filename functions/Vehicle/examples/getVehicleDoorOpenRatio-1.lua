addCommandHandler ( "carshowoff", function ( playerSource )
	local vehicle = getPedOccupiedVehicle ( playerSource )
	if vehicle then
		for i=0,5 do
			setVehicleDoorOpenRatio ( vehicle, i, 1 - getVehicleDoorOpenRatio ( vehicle, i ), 2500 )
		end
	end
end )