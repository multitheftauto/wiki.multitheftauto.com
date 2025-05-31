local vehicle = createVehicle (411, 0, 0, 3)
setTimer (setElementDimension, 1000, 1, vehicle, 10)

addEventHandler ("onClientElementDimensionChange", vehicle,
	function (oldDimension, newDimension)
		outputChatBox (inspect (source) .. "'s dimension changed from " .. oldDimension .. " to " .. newDimension)
	end
)