addCommandHandler("scs", -- short for 'set component scale'
    function()
        local theVeh = getPedOccupiedVehicle(localPlayer)
	local getComponent = getVehicleComponents(theVeh) -- returns table with all the components of the vehicle
        if (theVeh) then
            for k in pairs (getComponent) do
		local x, y, z = getVehicleComponentScale(theVeh, k) --get the scale of the component
                setVehicleComponentScale(theVeh, k, x*2, y*2, z*2) -- double the sizes
            end
        end
    end
)