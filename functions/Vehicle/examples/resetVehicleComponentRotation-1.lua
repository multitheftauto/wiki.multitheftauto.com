addEventHandler("onClientVehicleEnter", getRootElement(),
    function()
        local theVeh = getPedOccupiedVehicle(localPlayer)
        local getComponent = getVehicleComponents(theVeh) -- returns table with all the components of the vehicle
        if (theVeh) then
	    for k in pairs (getComponent) do
                local rx, ry, rz = getVehicleComponentRotation(theVeh, k) --get the rotation of the component
		setVehicleComponentRotation(theVeh, k, rx+10, ry+10, rz+10) -- increases by 10 unit
	    end
        end
    end
)

addCommandHandler("reset",
    function()
        local theVeh = getPedOccupiedVehicle(localPlayer)
        local getComponent = getVehicleComponents(theVeh) -- returns table with all the components of the vehicle
        if (theVeh) then
	    for k in pairs (getComponent) do
	       resetVehicleComponentRotation(theVeh, k) -- resets the rotation of the component
	    end
        end
    end
)