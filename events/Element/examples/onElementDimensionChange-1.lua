local vehicle = createVehicle (411, 0, 0, 3) -- create a vehicle
setTimer (setElementDimension, 1000, 1, vehicle, 10) -- set a new dimension to the vehicle after 1 second

-- add an event handler to onElementDimensionChange attached to the vehicle
addEventHandler ("onElementDimensionChange", vehicle,
	function (oldDimension, newDimension)
		 -- print the old and the new vehicle's dimension
		outputChatBox (inspect (source) .. "'s dimension changed from " .. oldDimension .. " to " .. newDimension)
	end
)