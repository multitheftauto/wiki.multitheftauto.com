addCommandHandler("scp", -- short for 'set component position'
    function()
        local theVeh = getPedOccupiedVehicle(localPlayer)
	local getComponent = getVehicleComponents(theVeh) -- returns table with all the components of the vehicle
        if (theVeh) then
            for k in pairs (getComponent) do
		local x, y, z = getVehicleComponentPosition(theVeh, k) --get the position of the component
                setVehicleComponentPosition(theVeh, k, x+1, y+1, z+1) -- increases by 1 unit
            end
        end
    end
)