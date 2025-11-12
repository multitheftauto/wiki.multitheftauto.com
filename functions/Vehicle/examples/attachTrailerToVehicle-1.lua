newvehicle = createVehicle ( 515, 0, 0, 4 ) -- create a trailer tower (roadtrain)
setTimer(
	function()
		trailer = createVehicle ( 435, 0, 0, 4 )    -- create a trailer
		attachTrailerToVehicle ( newvehicle, trailer )   -- attach them
	end, 50, 1)